#!/usr/bin/env bash

pacman --noconfirm -Sy ansible git

# create a new machine id, required due to cloned AMI
rm /etc/machine-id
systemd-machine-id-setup

UUID=$(uuidgen)
IFS='-' read ID EXTRA <<< "$${UUID}"

cat <<EOF >> /etc/environment
UUID=$${UUID}
ID=$${ID}

ANSIBLE_REPO="${ansible_repo}"

HOSTNAME=${name}-$${ID}
REGION=${region}
TAGS=${tags}
DEPLOY=${deploy}
EOF

cat <<EOF > /root/.ssh/github
${ansible_key}
EOF

cat <<EOF > /root/.ssh/config
Host github.com
  StrictHostKeyChecking no
  IdentityFile /root/.ssh/github
EOF

cat <<EOF > /etc/systemd/system/bootstrap.service
[Unit]
Description=Ansible Bootstrap
Requires=network-online.target
After=network-online.target

[Service]
EnvironmentFile=/etc/environment

ExecStartPre=-/usr/bin/git clone \$${ANSIBLE_REPO} /root/ansible
ExecStartPre=/usr/bin/git -C /root/ansible pull

ExecStart=/usr/bin/ansible-playbook -i /root/ansible/inventory /root/ansible/archlinux/bootstrap.yml -e "ansible_python_interpreter=/usr/bin/python2"
EOF

chmod 655 /etc/environment

chmod 700 /root/.ssh
chmod 600 /root/.ssh/github
chmod 600 /root/.ssh/config

systemctl start bootstrap.service

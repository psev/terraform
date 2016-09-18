# Terraform Infrastructure

## Remote config

```
terraform remote config -backend="s3" -backend-config="bucket=sugarush-global-terraform-state" -backend-config="key=<replace me>" -backend-config="region=us-west-2"
```

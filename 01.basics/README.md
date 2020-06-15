# 01 - Basics

## Requirements

1. shell with Google Cloud SDK installed, authenticated
1. a GCP project with a valid Billing Account, a network called `default` and permissions to create GCE instances and firewall rules
1. shell with Terraform available (ver >= 0.12.x)

## What we're going to do

This lab will provision:

* a Google Compute Engine instance with a Web Server installed
* a firewall rule to allow HTTP traffic from Internet

## Steps

Enter the lab folder (where this file is located) and run:

```
terraform init

terraform plan -out "test.plan" -var gcp_project=<your-project-id>

terraform apply
```

As the instance has been created the last command will output its external IP address. Try it:

```
curl http://<external-ip>
```

## Clean up

To clean up run:

```
terraform destroy
```

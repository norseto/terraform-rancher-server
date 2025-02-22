# Rancher server Terraform module

Terraform module which creates servers to host Rancher and installs Rancher on them.

To use this module, you must [install the RKE provider](https://github.com/yamamoto-febc/terraform-provider-rke#installation).

## Terraform versions

Terraform 0.12

## Usage

```hcl
module "rancher_server" {
  rancher_password           = var.rancher_password
  use_default_vpc            = false
  vpc_id                     = "vpc-foobar"
  aws_region                 = "us-east-1"
  aws_profile                = null
  aws_elb_subnet_ids         = ["subnet-1", "subnet-2"]
  domain                     = "foo.domain"
  r53_domain                 = "rancher.foo.domain"
  rancher2_master_subnet_ids = ["subnet-1", "subnet-2"]
  rancher2_worker_subnet_ids = ["subnet-1", "subnet-2"]

  providers = {
    aws     = "aws"
    aws.r53 = "aws.r53"
  }
}
```

## Requirement
You should install helm, kubectl locally and helm repos are added.
```
helm add repo jetstack https://charts.jetstack.io                       
helm add repo rancher-stable https://releases.rancher.com/server-charts/stable
helm repo update
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_elb\_subnet\_ids | List of subnet ids in which to place the AWS ELB | list | `[]` | no |
| aws\_profile |  | string | `"rancher-eng"` | no |
| aws\_region |  | string | `"us-west-2"` | no |
| certmanager\_chart | Helm chart to use for cert-manager install | string | `"jetstack/cert-manager"` | no |
| certmanager\_version | Version of cert-manager to install | string | `"0.10.0"` | no |
| creds\_output\_path | Where to save the id_rsa config file. Should end in a forward slash `/` . | string | `"./"` | no |
| domain |  | string | `"eng.rancher.space"` | no |
| extra\_ssh\_keys | Extra ssh keys to inject into Rancher instances | list | `[]` | no |
| github\_client\_id | GitHub client ID for Rancher to use, if using GH auth | string | `""` | no |
| github\_client\_secret | GitHub client secret for Rancher to use, if using GH auth | string | `""` | no |
| instance\_ssh\_user | Username for sshing into instances | string | `"ubuntu"` | no |
| instance\_type |  | string | `"t3.large"` | no |
| le\_email | LetsEncrypt email address to use | string | `"none@none.com"` | no |
| master\_node\_count | Number of master nodes to launch | number | `"3"` | no |
| name | Name for deployment | string | `"rancher-demo"` | no |
| r53\_domain | DNS domain for Route53 zone (defaults to domain if unset) | string | `""` | no |
| rancher2\_custom\_tags | Custom tags for Rancher resources | map | `{ "DoNotDelete": "true", "Owner": "EIO_Demo" }` | no |
| rancher2\_extra\_allowed\_gh\_principals | List of principals in form github_user://IDNUM to be given Rancher access | list | `[]` | no |
| rancher2\_github\_auth\_enabled | Whether to use GitHub authentication for Rancher | bool | `"false"` | no |
| rancher2\_github\_auth\_org | GitHub numerical ID of organization to grant Rancher access to | string | `"53273206"` | no |
| rancher2\_github\_auth\_team | GitHub numerical ID of team to grant Rancher access to | string | `"3414845"` | no |
| rancher2\_github\_auth\_user | GitHub numerical ID of user to grant Rancher access to | string | `"3430214"` | no |
| rancher2\_master\_custom\_tags | Custom tags for Rancher master nodes | map | `{}` | no |
| rancher2\_master\_subnet\_ids | List of subnet ids for Rancher master nodes | list | `[]` | no |
| rancher2\_worker\_custom\_tags | Custom tags for Rancher worker nodes | map | `{}` | no |
| rancher2\_worker\_subnet\_ids | List of subnet ids for Rancher worker nodes | list | `[]` | no |
| rancher\_chart | Helm chart to use for Rancher install | string | `"rancher-stable/rancher"` | no |
| rancher\_current\_password | Rancher admin user current password | string | `"null"` | no |
| rancher\_nodes\_in\_asgs | Control whether to put Rancher nodes in ASGs | bool | `"true"` | no |
| rancher\_password | Password to set for Rancher root user | string | n/a | yes |
| rancher\_version | Version of Rancher to install | string | `"2.2.9"` | no |
| rke\_backups\_region | Region to perform backups to S3 in. Defaults to aws_region | string | `""` | no |
| rke\_backups\_s3\_endpoint | Override for S3 endpoint to use for backups | string | `""` | no |
| use\_default\_vpc | Should the default VPC for the region selected be used for Rancher | bool | `"true"` | no |
| vpc\_id | If use_default_vpc is false, the vpc id that Rancher should use | string | `"null"` | no |
| worker\_node\_count | Number of worker nodes to launch | number | `"3"` | no |

## Outputs

| Name | Description |
|------|-------------|
| etcd\_backup\_s3\_bucket\_id | S3 bucket ID for etcd backups |
| etcd\_backup\_user\_key | AWS IAM access key id for etcd backup user |
| etcd\_backup\_user\_secret | AWS IAM secret access key for etcd backup user |
| master\_addresses | IP addresses of Rancher master nodes |
| rancher\_admin\_password | Password set for Rancher local admin user |
| rancher\_api\_url | FQDN of Rancher's Kubernetes API endpoint |
| rancher\_token | Admin token for Rancher cluster use |
| rancher\_url | URL at which to reach Rancher |
| worker\_addresses | IP addresses of Rancher worker nodes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# License

Copyright (c) 2014-2019 [Rancher Labs, Inc.](http://rancher.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

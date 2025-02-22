variable "rancher_password" {
  type        = string
  description = "Password to set for Rancher root user"
}

variable "rancher_current_password" {
  type        = string
  default     = null
  description = "Rancher admin user current password"
}

variable "rancher_version" {
  type        = string
  default     = "2.6.6"
  description = "Version of Rancher to install"
}

variable "rancher2_master_custom_tags" {
  type        = map
  default     = {}
  description = "Custom tags for Rancher master nodes"
}

variable "rancher2_worker_custom_tags" {
  type        = map
  default     = {}
  description = "Custom tags for Rancher worker nodes"
}

variable "rancher2_custom_tags" {
  type = map
  default = {
  }
  description = "Custom tags for Rancher resources"
}

variable "extra_ssh_keys" {
  type        = list
  default     = []
  description = "Extra ssh keys to inject into Rancher instances"
}

variable "rancher_chart" {
  type        = string
  default     = "rancher-stable/rancher"
  description = "Helm chart to use for Rancher install"
}

variable "certmanager_chart" {
  type        = string
  default     = "jetstack/cert-manager"
  description = "Helm chart to use for cert-manager install"
}

variable "name" {
  type        = string
  default     = "rancher-demo"
  description = "Name for deployment"
}

variable "github_client_id" {
  type        = string
  default     = ""
  description = "GitHub client ID for Rancher to use, if using GH auth"
}

variable "github_client_secret" {
  type        = string
  default     = ""
  description = "GitHub client secret for Rancher to use, if using GH auth"
}

variable "le_email" {
  type        = string
  default     = "none@none.com"
  description = "LetsEncrypt email address to use"
}

variable "domain" {
  type    = string
  default = "eng.rancher.space"
}

variable "r53_domain" {
  type        = string
  default     = ""
  description = "DNS domain for Route53 zone (defaults to domain if unset)"
}

variable "instance_type" {
  type        = string
  default     = "t3.large"
  description = "default instance type"
}

variable "master_instance_type" {
  type        = string
  default     = ""
  description = "master node instance type"
}

variable "worker_instance_type" {
  type        = string
  default     = ""
  description = "worker node instance type"
}

variable "master_node_count" {
  type        = number
  default     = 3
  description = "Number of master nodes to launch"
}

variable "worker_node_count" {
  type        = number
  default     = 3
  description = "Number of worker nodes to launch"
}

variable "rancher_nodes_in_asgs" {
  type        = bool
  default     = true
  description = "Control whether to put Rancher nodes in ASGs"
}

variable "instance_ssh_user" {
  type        = string
  default     = "ubuntu"
  description = "Username for sshing into instances"
}

variable "certmanager_version" {
  type        = string
  default     = "1.8.2"
  description = "Version of cert-manager to install"
}

variable "rancher2_github_auth_enabled" {
  type        = bool
  default     = false
  description = "Whether to use GitHub authentication for Rancher"
}

variable "rancher2_github_auth_user" {
  type        = string
  default     = "3430214"
  description = "GitHub numerical ID of user to grant Rancher access to"
}

variable "rancher2_github_auth_org" {
  type        = string
  default     = "53273206"
  description = "GitHub numerical ID of organization to grant Rancher access to"
}

variable "rancher2_github_auth_team" {
  type        = string
  default     = "3414845"
  description = "GitHub numerical ID of team to grant Rancher access to"
}

variable "rancher2_extra_allowed_gh_principals" {
  type        = list
  default     = []
  description = "List of principals in form github_user://IDNUM to be given Rancher access"
}

variable "rancher2_master_subnet_ids" {
  type        = list
  default     = []
  description = "List of subnet ids for Rancher master nodes"
}

variable "rancher2_worker_subnet_ids" {
  type        = list
  default     = []
  description = "List of subnet ids for Rancher worker nodes"
}

variable "use_default_vpc" {
  type        = bool
  default     = true
  description = "Should the default VPC for the region selected be used for Rancher"
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "If use_default_vpc is false, the vpc id that Rancher should use"
}

variable "aws_elb_subnet_ids" {
  type        = list
  default     = []
  description = "List of subnet ids in which to place the AWS ELB"
}

variable "rke_backups_region" {
  type        = string
  default     = ""
  description = "Region to perform backups to S3 in. Defaults to aws_region"
}

variable "rke_backups_s3_endpoint" {
  type        = string
  default     = ""
  description = "Override for S3 endpoint to use for backups"
}

variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "aws_profile" {
  type    = string
  default = "rancher-eng"
}

variable "creds_output_path" {
  description = "Where to save the id_rsa config file. Should end in a forward slash `/` ."
  type        = string
  default     = "./"
}

variable "backup_bucket_suffix" {
  type        = string
  default     = ""
  description = "etcd backup S3 bucket name suffix"
}

variable "bootstrap_password" {
  type        = string
  default     = "nkxq2shl6d92bvlztqpts8bt582gts8bt582grgppx888dbxkkw5sczk7cc7m24"
  description = "bootstrap password"
}

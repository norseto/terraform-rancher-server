data "aws_vpc" "default" {
  default = var.vpc_id == null ? true : false
  id      = var.vpc_id
}

data "aws_subnets" "available" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_route53_zone" "dns_zone" {
  provider = aws.r53
  name     = local.r53_domain
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/*/ubuntu-bionic-18.04-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "helm_template" "rancher_stable" {
  name       = "rancher-stable"
  repository = "https://releases.rancher.com/server-charts/stable"
  chart      = "rancher"
}

data "helm_template" "jetstack" {
  name       = "jetstack"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
}

data "rancher2_user" "admin" {
  username   = "admin"
  depends_on = [rancher2_bootstrap.admin]
}

data "aws_instances" "rancher_master" {
  filter {
    name   = "tag:aws:autoscaling:groupName"
    values = [aws_autoscaling_group.rancher_master.0.name]
  }
}

data "aws_instances" "rancher_worker" {
  filter {
    name   = "tag:aws:autoscaling:groupName"
    values = [aws_autoscaling_group.rancher_worker.0.name]
  }
}

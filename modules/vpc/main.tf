
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.64.0"

  name = var.org_name

  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_ipv6          = true
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  # https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html
  # TODO: how to decouple EKS? Created subnets after VPC/during EKS module?
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }

  tags = {
    Environment = var.workspace
  }

  vpc_tags = {
    Name = var.org_name
  }
}

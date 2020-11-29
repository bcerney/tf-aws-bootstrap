
module "state-backend" {
  source = "./modules/state-backend"
  providers = {
    aws = aws
  }

  org_name  = var.org_name
  workspace = var.workspace
}

module "vpc" {
  source = "./modules/vpc"
  providers = {
    aws = aws
  }

  org_name     = var.org_name
  workspace    = var.workspace
  cluster_name = var.cluster_name
}

# EKS



module "eks" {
  source = "./modules/eks"
  providers = {
    aws        = aws
    kubernetes = kubernetes
  }

  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.private_subnets
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

# CodePipeline

module "codepipeline" {
  source = "./modules/codepipeline"
  providers = {
    aws = aws
  }

  repo_name  = var.repo_name
  repo_owner = var.repo_owner
}
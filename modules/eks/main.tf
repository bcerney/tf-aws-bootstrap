
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "13.2.1"

  cluster_name    = var.cluster_name
  cluster_version = "1.18"
  subnets         = var.subnets
  vpc_id          = var.vpc_id


  worker_groups = [
    {
      instance_type = "t3.micro"
      asg_max_size  = 5
    }
  ]

  write_kubeconfig   = true
  config_output_path = "./"
}

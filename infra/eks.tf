
resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks_cluster-${terraform.workspace}"
  role_arn = var.role_arn
  version = "1.22"

  vpc_config {
    subnet_ids = [aws_subnet.vpc-eks-private-subnet-1.id, aws_subnet.vpc-eks-private-subnet-2.id]
  }
}

resource "aws_eks_node_group" "node_group_eks_cluster" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "node_group_eks_cluster-${terraform.workspace}"
  node_role_arn   = var.role_arn
  subnet_ids      = [aws_subnet.vpc-eks-private-subnet-1.id, aws_subnet.vpc-eks-private-subnet-2.id]

  scaling_config {
    desired_size = 4
    max_size     = 5
    min_size     = 1
  }
  # Nota 1

  ami_type       = "AL2_x86_64"
  instance_types = ["t3.small"]
  capacity_type  = "ON_DEMAND"
  disk_size      = 20

}

 
# Nota 1: 
#En un caso practico real podriamos referenciar el workspace 
#para obtener ciertos comportamientos dependiendo el ambiente
#Ej: -> 
/*
scaling_config {
    desired_size = terraform.workspace == "prod" ? 4 : 2  
    max_size     = terraform.workspace == "prod" ? 5 : 3  
    min_size     = 1
  }
  */
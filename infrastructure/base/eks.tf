
resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks_cluster"
  role_arn = var.role_arn
  version = "1.22"

  vpc_config {
    subnet_ids = [aws_subnet.vpc-eks-private-subnet-1.id, aws_subnet.vpc-eks-private-subnet-2.id]
  }

  #No creo que necsitemos estos con una cuenta academy
  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  # depends_on = [
  # aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
  #aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  #] 
}

resource "aws_eks_node_group" "node_group_eks_cluster" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "node_group_eks_cluster"
  node_role_arn   = var.role_arn
  subnet_ids      = [aws_subnet.vpc-eks-private-subnet-1.id, aws_subnet.vpc-eks-private-subnet-2.id]

  #capacity_type = "SPOT"
  #instance_types = [t2.nano]

  scaling_config {
    desired_size = 4
    max_size     = 5
    min_size     = 1
  }

  ami_type       = "AL2_x86_64"
  instance_types = ["t3.small"]
  capacity_type  = "ON_DEMAND"
  disk_size      = 20

 



  
}

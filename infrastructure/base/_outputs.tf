
#Cluster OutPuts
output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}


#No creo que necsitemos estos con una cuenta academy
/* output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.example.certificate_authority[0].data
} */
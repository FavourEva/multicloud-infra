output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.shopedge.repository_url
}

output "ecr_repository_name" {
  description = "Name of the ECR repository"
  value       = aws_ecr_repository.shopedge.name
}

# -- Outputs --
output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}

output "cluster_arn" {
  value = aws_eks_cluster.this.arn
}

output "node_group_name" {
  value = aws_eks_node_group.managed_nodes.node_group_name
}

# Expose the module-created security groups so root can reference them if needed
output "eks_cluster_sg_id" {
  value = aws_security_group.eks_cluster_sg.id
}

output "eks_node_sg_id" {
  value = aws_security_group.eks_node_sg.id
}
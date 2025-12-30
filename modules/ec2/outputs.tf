output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.app.id
}

output "instance_arn" {
  description = "The ARN of the EC2 instance"
  value       = aws_instance.app.arn
}

output "primary_network_interface_id" {
  description = "The ID of the primary network interface"
  value       = aws_instance.app.primary_network_interface_id
}

output "private_ip" {
  description = "The private IP address of the instance"
  value       = aws_instance.app.private_ip
}

output "public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.app.public_ip
}

output "public_dns" {
  description = "The public DNS name of the instance"
  value       = aws_instance.app.public_dns
}

output "security_groups" {
  description = "The security groups associated with the instance"
  value       = aws_instance.app.security_groups
}

output "subnet_id" {
  description = "The subnet ID of the instance"
  value       = aws_instance.app.subnet_id
}

output "tags" {
  description = "The tags of the instance"
  value       = aws_instance.app.tags
}

# =============================================================================
# ELASTIC CLOUD COMPUTER EC2
# =============================================================================
resource "aws_instance" "main" {
  count                       = var.instance_count
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.main.key_name
  vpc_security_group_ids      = [data.terraform_remote_state.network.outputs.sg-ec2-id]
  subnet_id                   = data.terraform_remote_state.network.outputs.public_subnet_ids[count.index]


  root_block_device {
    volume_size = var.volume_size
  }

  tags = { Name = "${var.project_name}-${count.index + 1}" }
}

# =============================================================================
# ATTACHED ELASTIC IP IN INSTANCE EC2
# =============================================================================
resource "aws_eip_association" "main" {
  allocation_id = data.terraform_remote_state.network.outputs.eip-ec2-id
  instance_id   = aws_instance.main[0].id
}

# =============================================================================
# GENERATION INVENTARY ANSIBLE
# =============================================================================
resource "local_file" "ansible_inventory" {
  filename = "../../../deployment/inventory.ini"
  content  = <<-EOF
[server_web]
  %{ for idx, instance in aws_instance.main ~}
  server_${idx + 1} ansible_host=${instance.public_ip}
  %{ endfor ~}

[compute:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/id_ed25519
ansible_python_interpreter=/usr/bin/python3
  EOF
}

# =============================================================================
# SSH-KEY TO CONNECT IN INSTANCE EC2
# =============================================================================
resource "aws_key_pair" "main" {
  key_name   = "${var.project_name}-key-laptop-server_web"
  public_key = file(var.ssh_key_path)
}

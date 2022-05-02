locals {
  project_id = "terraform-gcp-343611"
  network = "default"
  image = "debian-cloud/debian-9"
  ssh_user = "ansible"
  private_key_path = "~/.ssh/ansible_ed25519"
  # labels="knoldus-snapshot"
}
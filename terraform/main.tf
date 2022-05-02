resource "null_resource" "knolx" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "remote-exec" {
    inline = ["sudo apt-get install ansible -y"]

    connection {
      type = "ssh"
      user = local.ssh_user
      private_key = file(local.private_key_path)
      host = google_compute_instance.nginx.network_interface.0.access_config.0.nat_ip
    }
  }
  
  provisioner "local-exec" {
    command = "ansible-playbook ../ansible/main.yml"
  }
}
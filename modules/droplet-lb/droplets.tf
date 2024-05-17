resource "digitalocean_droplet" "droplets" {
  count = var.droplet_count
  name  = "${var.group_name}-svr${count.index}-${terraform.workspace}"

  image  = "ubuntu-20-04-x64"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    var.ssh_key_droplet
  ]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}

resource "digitalocean_loadbalancer" "www-lb" {
  name   = "lb-${var.group_name}-${terraform.workspace}"
  region = "nyc1"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [
    for droplet in digitalocean_droplet.droplets :
    droplet.id
  ]
}

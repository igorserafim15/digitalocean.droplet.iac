module "groups" {
  source = "./modules/droplet-lb"

  droplet_count   = var.droplet_count
  group_name      = "api-gestao-de-barbearia"
  ssh_key_droplet = data.digitalocean_ssh_key.key_droplet.id
  pvt_key         = var.pvt_key
}

output "loadbalancer-ip" {
  value = module.groups.lp_ip
}

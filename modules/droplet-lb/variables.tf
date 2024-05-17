variable "droplet_count" {
  type = number
}

variable "group_name" {
  type = string
}

variable "ssh_key_droplet" {
  type = string
}

variable "pvt_key" {
  type        = string
  description = "Path private key"
}

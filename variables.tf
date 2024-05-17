variable "do_token" {
  type        = string
  description = "Digital Ocean Token"
  sensitive   = true
}

variable "pvt_key" {
  type        = string
  default     = "~/.ssh/key_droplet"
  description = "Path Private Key"
}

variable "droplet_count" {
  type        = number
  default     = 2
  description = "Droplet Count"
}

variable "state_bucket" {
  type    = string
  default = "gestao-de-barbearia-state-bucket-tf"
}

variable "vpn_instance_ip" {
  type        = string
  default     = "10.17.9.100"
  description = "The IP of the VPN instance"
}

variable "gitlab_instance_ip" {
  type        = string
  default     = "10.17.8.100"
  description = "The IP of the Gitlab instance"
}
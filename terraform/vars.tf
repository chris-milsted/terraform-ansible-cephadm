variable "host_count" {
  type = number
  default = 3
}

variable "host_type" {
  description = "Linode plan type"
  type = string
  default = "g6-standard-2"
}

variable "linode_prefix" {
  type=string
  default = "ceph-host"
}

variable "ssh_key" {
  type = string
  default = "<redacted>"
}

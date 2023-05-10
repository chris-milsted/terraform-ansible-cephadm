provider "linode" {
  token = "<redacted>"
}

data "linode_instance_type" "ceph_host" {
  id = var.host_type
}

resource "linode_instance" "ceph-hosts" {
        count = var.host_count
        label = "${var.linode_prefix}-${count.index + 1}"
        region = "eu-west"
        type = "g6-standard-2"
        private_ip = false

    disk {
        label = "boot"
        size = 10240
        image = "linode/ubuntu20.04"
        root_pass = "<redacted>"
        authorized_keys = [var.ssh_key]
    }

    disk {
        label = "ceph"
        size = 10240
    }

    config {
        label = "boot_config"
        kernel = "linode/grub2"
        devices {
            sda {
                disk_label = "boot"
            }
            sdb {
                disk_label = "ceph"
            }
        }
        root_device = "/dev/sda"
    }

    boot_config_label = "boot_config"
}

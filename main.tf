terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_instance_group" "nodepool" {
  folder_id          = var.folder_id
  name               = var.name
  service_account_id = var.sa

  instance_template {
    name               = "${var.name}-{instance.index}"
    hostname           = "${var.name}-{instance.index}"
    platform_id        = var.platform_id
    service_account_id = var.sa

    resources {
      cores         = var.cores
      memory        = var.memory
      core_fraction = var.core_fraction
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = var.image_id
        size     = var.boot_disk_size
        type     = var.boot_disk_type
      }
    }

    secondary_disk {
      mode        = "READ_WRITE"
      device_name = "data"
      initialize_params {
        size = var.data_disk_size
        type = var.data_disk_type
      }
    }

    network_interface {
      subnet_ids = var.subnet_ids
    }

    metadata = {
      ssh-keys           = join("\n", var.ssh_keys)
      serial-port-enable = var.enable_serial_port ? 1 : 0

      user-data = templatefile("${path.module}/userdata.yml", {
        control_plane_endpoint = var.control_plane_endpoint
        private_key            = indent(4, var.control_plane_private_key)
        public_key             = var.control_plane_public_key
        folder                 = var.folder_id
        group                  = var.control_plane_group_name
        labels                 = join(",", [for k, v in var.labels : format("%s=%s", k, v)])
        pod_cidr               = var.pod_cidr
        pod_gateway            = var.pod_gateway
        cluster_dns            = var.cluster_dns
      })
    }

    network_settings {
      type = "STANDARD"
    }

    scheduling_policy {
      preemptible = var.preemptible
    }
  }

  allocation_policy {
    zones = var.zones
  }

  scale_policy {
    fixed_scale {
      size = var.size
    }
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 1
  }
}

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">=0.141.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">=2.5.2"
    }
  }
  required_version = ">= 0.14"
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
  service_account_key_file = var.service_account_key_file
}

resource "yandex_vpc_network" "lab_net" { name = "lab_net" }

resource "yandex_vpc_subnet" "lab_subnet" {
  v4_cidr_blocks = ["192.168.0.0/24"]
  zone           = var.zone
  network_id     = yandex_vpc_network.lab_net.id
}

resource "yandex_compute_instance" "master" {
  name = "master"
  labels = {
    tags = "master"
  }
  hostname = "master"

  resources {
    cores  = 2
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.lab_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "debian:${file(var.public_key)}"
  }
}

resource "yandex_compute_instance" "nodes" {
  count = 3
  name = "node-${count.index}"
  labels = {
    tags = "node-${count.index}"
  }
  hostname = "node-${count.index}"

  resources {
    cores  = 2
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.lab_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "debian:${file(var.public_key)}"
  }
}
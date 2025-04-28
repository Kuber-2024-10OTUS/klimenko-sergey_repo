terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">=0.140.0"
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

resource "yandex_kubernetes_cluster" "hw11-cluster" {
  name       = "hw11-cluster"
  network_id = yandex_vpc_network.lab_net.id
  master {
    version = "1.31"
    master_location {
      zone      = yandex_vpc_subnet.lab_subnet.zone
      subnet_id = yandex_vpc_subnet.lab_subnet.id
    }
    public_ip = true
  }
  service_account_id      = var.sa_id
  node_service_account_id = var.sa_id
  depends_on = [
    yandex_resourcemanager_folder_iam_member.k8s-clusters-agent,
    yandex_resourcemanager_folder_iam_member.vpc-public-admin,
    yandex_resourcemanager_folder_iam_member.images-puller
  ]

  labels = {
    lab = "hw11"
  }

  release_channel         = "REGULAR"
  network_policy_provider = "CALICO"
}

resource "yandex_kubernetes_node_group" "hw11-workernode" {
  cluster_id  = yandex_kubernetes_cluster.hw11-cluster.id
  name        = "workernode-0"
  description = "Kubernetes workernode for homework #11"
  version     = "1.31"

  labels = {
    lab       = "hw11",
    node-role = "worker"
  }

  node_labels = {
    lab       = "hw11",
    node-role = "worker"
    homework  = "true"
  }

  instance_template {
    platform_id = "standard-v2"

    network_interface {
      nat        = true
      subnet_ids = ["${yandex_vpc_subnet.lab_subnet.id}"]
    }

    metadata = {
      ssh-keys = "    - debian:${file(var.public_key)}"
    }

    resources {
      memory = 8
      cores  = 2
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    scheduling_policy {
      preemptible = true
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    location {
      zone = var.zone
    }
  }

  maintenance_policy {
    auto_upgrade = true
    auto_repair  = true

    maintenance_window {
      day        = "monday"
      start_time = "15:00"
      duration   = "3h"
    }

    maintenance_window {
      day        = "friday"
      start_time = "10:00"
      duration   = "4h30m"
    }
  }
}

resource "yandex_vpc_network" "lab_net" { name = "lab_net" }

resource "yandex_vpc_subnet" "lab_subnet" {
  v4_cidr_blocks = ["192.168.0.0/24"]
  zone           = var.zone
  network_id     = yandex_vpc_network.lab_net.id
}

# resource "yandex_iam_service_account" "labsa" {
#  name        = "labsa"
#  description = "Service Account for homework #9"
# }

resource "yandex_resourcemanager_folder_iam_member" "k8s-clusters-agent" {
  # Сервисному аккаунту назначается роль "k8s.clusters.agent".
  folder_id = var.folder_id
  role      = "k8s.clusters.agent"
  member    = "serviceAccount:${var.sa_id}"
}

resource "yandex_resourcemanager_folder_iam_member" "vpc-public-admin" {
  # Сервисному аккаунту назначается роль "vpc.publicAdmin".
  folder_id = var.folder_id
  role      = "vpc.publicAdmin"
  member    = "serviceAccount:${var.sa_id}"
}

resource "yandex_resourcemanager_folder_iam_member" "images-puller" {
  # Сервисному аккаунту назначается роль "container-registry.images.puller".
  folder_id = var.folder_id
  role      = "container-registry.images.puller"
  member    = "serviceAccount:${var.sa_id}"
}
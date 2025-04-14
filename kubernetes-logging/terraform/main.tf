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

resource "yandex_kubernetes_cluster" "hw9-cluster" {
  name       = "hw9-cluster"
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
    lab = "hw9"
  }

  release_channel         = "REGULAR"
  network_policy_provider = "CALICO"
}

resource "yandex_kubernetes_node_group" "hw9-workernode" {
  cluster_id  = yandex_kubernetes_cluster.hw9-cluster.id
  name        = "workernode-0"
  description = "Kubernetes workernode for homework #9"
  version     = "1.31"

  labels = {
    lab       = "hw9",
    node-role = "worker"
  }

  node_labels = {
    lab       = "hw9",
    node-role = "worker"
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
      memory = 4
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
      size = 1
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

resource "yandex_kubernetes_node_group" "hw9-infranode" {
  cluster_id  = yandex_kubernetes_cluster.hw9-cluster.id
  name        = "infranode-0"
  description = "Kubernetes infranode for homework #9"
  version     = "1.31"

  labels = {
    lab       = "hw9",
    node-role = "infra"
  }

  node_labels = {
    lab       = "hw9",
    node-role = "infra"
  }

  node_taints = ["node-role=infra:NoSchedule"]

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
      memory = 20
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
      size = 1
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



resource "yandex_storage_bucket" "logs_bucket" {
  bucket = "loki-logs-bucket"

  lifecycle_rule {
    id      = "cleanupoldlogs"
    enabled = true
    expiration {
      days = 365
    }
  }
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = var.sa_id
  description        = "this key is for loki-logs-bucket"
}

# resource "yandex_kms_symmetric_key" "key-a" {
#   name              = "example-symetric-key"
#   description       = "description for key"
#   default_algorithm = "AES_128"
#   rotation_period   = "8760h" // equal to 1 year
# }

# resource "yandex_storage_bucket" "all_settings" {
#   bucket = "example-tf-settings-bucket"
#   website {
#     index_document = "index.html"
#     error_document = "error.html"
#   }

#   lifecycle_rule {
#     id      = "test"
#     enabled = true
#     prefix  = "prefix/"
#     expiration {
#       days = 30
#     }
#   }
#   lifecycle_rule {
#     id      = "log"
#     enabled = true

#     prefix = "log/"

#     transition {
#       days          = 30
#       storage_class = "COLD"
#     }

#     expiration {
#       days = 90
#     }
#   }

#   lifecycle_rule {
#     id      = "everything180"
#     prefix  = ""
#     enabled = true

#     expiration {
#       days = 180
#     }
#   }
#   lifecycle_rule {
#     id      = "cleanupoldversions"
#     prefix  = "config/"
#     enabled = true

#     noncurrent_version_transition {
#       days          = 30
#       storage_class = "COLD"
#     }

#     noncurrent_version_expiration {
#       days = 90
#     }
#   }
#   lifecycle_rule {
#     id                                     = "abortmultiparts"
#     prefix                                 = ""
#     enabled                                = true
#     abort_incomplete_multipart_upload_days = 7
#   }

#   cors_rule {
#     allowed_headers = ["*"]
#     allowed_methods = ["GET", "PUT"]
#     allowed_origins = ["https://storage-cloud.example.com"]
#     expose_headers  = ["ETag"]
#     max_age_seconds = 3000
#   }

#   versioning {
#     enabled = true
#   }

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         kms_master_key_id = yandex_kms_symmetric_key.key-a.id
#         sse_algorithm     = "aws:kms"
#       }
#     }
#   }

#   logging {
#     target_bucket = yandex_storage_bucket.log_bucket.id
#     target_prefix = "tf-logs/"
#   }

#   max_size = 1024

#   folder_id = var.folder_id

#   default_storage_class = "COLD"

#   anonymous_access_flags {
#     read = true
#     list = true
#   }

#   https = {
#     certificate_id = "<certificate_id>"
#   }

#   tags = {
#     some_key = "some_value"
#   }
# }



# resource "yandex_storage_object" "logs" {
#   bucket = "loki-logs-bucket"
#   key    = "logs"
#   source = "/images/cats/cute-cat.jpg"
#   tags = {
#     loki = "logs"
#   }
# }
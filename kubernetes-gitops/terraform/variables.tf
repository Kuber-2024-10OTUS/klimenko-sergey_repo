variable "cloud_id" {
  type        = string
  description = "Cloud that the resource belongs to. If value is omitted, the default provider cloud is used"
}
variable "folder_id" {
  type        = string
  description = "The ID of the folder that the resource belongs to. If it is not provided, the default provider folder is used"
}
variable "zone" {
  type        = string
  description = "The availability zone where the virtual machine will be created. If it is not provided, the default provider folder is used"
  default     = "ru-central1-a"
}
variable "service_account_key_file" {
  type        = string
  description = "Contains either a path to or the contents of the Service Account file in JSON format"
  default     = "./key.json"
}
variable "public_key" {
  type        = string
  description = "Path to the public key used for ssh access"
}
variable "sa_id" {
  type = string
}
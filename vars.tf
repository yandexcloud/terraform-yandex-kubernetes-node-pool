variable "folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID where to create resources."
}

variable "name" {
  type        = string
  description = "Node Pool name."
}

variable "image_id" {
  type        = string
  description = "ID of a LinuxKit based image build from github.com/yandexcloud/kubernetes."
}

variable "platform_id" {
  default     = "standard-v2"
  description = "Platform ID of the pool's nodes."
}

variable "sa" {
  type        = string
  description = "Service account ID used for pool's nodes."
}

variable "cores" {
  default     = 2
  description = "Number of CPU cores in pool's nodes."
}

variable "core_fraction" {
  default     = 50
  description = "CPU core fraction (%) of pool's nodes."
}

variable "memory" {
  default     = 2
  description = "Memory size (GB) of pool's nodes."
}

variable "boot_disk_size" {
  default     = 1
  description = "Bootd disk size of pool's nodes."
}

variable "boot_disk_type" {
  default     = "network-ssd"
  description = "Boot disk type of pool's nodes."
}

variable "data_disk_size" {
  default     = 10
  description = "Data disk size of pool's nodes."
}

variable "data_disk_type" {
  default     = "network-ssd"
  description = "Data disk type of pool's nodes."
}

variable "raw_disk_size" {
  default     = 10
  description = "Raw disk size of pool's nodes."
}

variable "raw_disk_type" {
  default     = "network-ssd"
  description = "Raw disk type of pool's nodes."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet ids to attach pool's nodes to."
}

variable "enable_serial_port" {
  default     = true
  description = "Enable serial port in pool's nodes."
}

variable "size" {
  default     = 1
  description = "Number of pools' nodes."
}

variable "zones" {
  type        = list(string)
  description = "List of Yandex Cloud zones where pool's nodes can be placed."
}

variable "preemptible" {
  default     = true
  description = "Use preemptible pool's nodes."
}

variable "labels" {
  type        = map
  default     = {}
  description = "Node labels."
}

variable "ssh_keys" {
  type        = list(string)
  description = "Authorized keys for control plane VMs."
}

variable "control_plane_endpoint" {
  type        = string
  description = "Control Plane endpoint."
}

variable "control_plane_group_name" {
  type        = string
  description = "Control Plane group name."
}

variable "control_plane_public_key" {
  type        = string
  description = "Open SSH formatted public key authorized to connect control plane nodes."
}

variable "control_plane_private_key" {
  type        = string
  description = "SSH private key authorized to connect control plance nodes."
}

variable "pod_cidr" {
  type        = string
  description = "Pod subnet CIDR."
}

variable "pod_gateway" {
  type        = string
  description = "Pod gateway IP."
}

variable "cluster_dns" {
  type        = string
  description = "Cluster DNS IP."
}

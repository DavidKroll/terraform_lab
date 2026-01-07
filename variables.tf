variable "ami_id" {
  type        = string
  description = "store aws AMI ID"
  default     = "ami-068c0051b15cdb816"

}
variable "vm-size" {
  type        = string
  description = "store aws vm size template"
  #default     = "t3.micro"
}
variable "vm-name" {
  type        = string
  description = "store aws vm name"
  #default     = "dkroll-vm1"
}
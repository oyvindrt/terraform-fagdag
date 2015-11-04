variable "docker_registry_url" {
    default = "https://index.docker.io/v1/"
}

#located in secrets.tfvars
variable "aws_access_key" {}
variable "aws_secret_key" {}
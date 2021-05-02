variable "aws_access_key" {
    type = string
    default = env("AWS_ACCESS_KEY_ID")
}
variable "aws_secret_key" {
    type = string
    default = env("AWS_SECRET_ACCESS_KEY")
}

source "amazon-ebs" "wordpress" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = "us-west-1"
    source_ami = "ami-031b673f443c2172c"
    instance_type = "t2.micro"
    ssh_username = "ubuntu"
    ami_name = "hovo-wordpress"

}
build {
    sources = [
        "source.amazon-ebs.wordpress"
    ]

    provisioner "ansible" {
        playbook_file = "../playbook.yaml"
    }
}
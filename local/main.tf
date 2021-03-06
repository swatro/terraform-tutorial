variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type        = "list"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

resource "aws_instance" "example" {
  count             = 3
  ami               = "ami-2d39803a"
  instance_type     = "t2.micro"
  availability_zone = "${element(var.azs, count.index)}"

  tags {
    Name = "example-${count.index}"
  }
}

output "public_ips" {
  value = ["${aws_instance.example.*.public_ip}"]
}

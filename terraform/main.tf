# Deliberately insecure Terraform for scanner testing. Never apply this.

resource "aws_s3_bucket" "test" {
  bucket = "forticnapp-scan-test-bucket"
}

resource "aws_s3_bucket_acl" "test" {
  bucket = aws_s3_bucket.test.id
  acl    = "public-read"
}

resource "aws_security_group" "ssh_open" {
  name        = "ssh-open-to-world"
  description = "Deliberately insecure"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

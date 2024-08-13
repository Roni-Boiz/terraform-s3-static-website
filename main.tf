# Create S3 Bucket
resource "aws_s3_bucket" "serverbucket" {
  bucket = var.bucketname
  force_destroy = true

  tags = {
    Name        = "server bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.serverbucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.serverbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example
  ]

  bucket = aws_s3_bucket.serverbucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "skills" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "skills.html"
  source = "skills.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "projects" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "projects.html"
  source = "projects.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "experience" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "experience.html"
  source = "experience.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "education" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "education.html"
  source = "education.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "scripts" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "scripts.js"
  source = "scripts.js"
  acl = "public-read"
  content_type = "application/javascript"
}

resource "aws_s3_object" "css" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "styles.css"
  source = "styles.css"
  acl = "public-read"
  content_type = "text/css"
}

resource "aws_s3_object" "profile" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "images/profile.jpg"
  source = "images/profile.jpg"
  acl = "public-read"
  content_type = "image/jpeg"
}

resource "aws_s3_object" "project1" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "images/project1.png"
  source = "images/project1.png"
  acl = "public-read"
  content_type = "image/png"
}

resource "aws_s3_object" "project2" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "images/project2.png"
  source = "images/project2.png"
  acl = "public-read"
  content_type = "image/png"
}

resource "aws_s3_object" "project3" {
  bucket = aws_s3_bucket.serverbucket.id
  key    = "images/project3.png"
  source = "images/project3.png"
  acl = "public-read"
  content_type = "image/png"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.serverbucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [ aws_s3_bucket_acl.example ]
}
# Create a bucket
resource "aws_s3_bucket" "blog_playtechnique_io" {

  bucket = "blog.playtechnique.io"
  acl    = "public-read"

  tags = {
    Name = "blog"
  }


  website {
    index_document = "index.html"
    error_document = "index.html"
  }

}

locals {
  mime_types = {
    "css"   = "text/css"
    "eot"   = "application/vnd.ms-fontobject"
    "html"  = "text/html"
    "ico"   = "image/vnd.microsoft.icon"
    "js"    = "application/javascript"
    "json"  = "application/json"
    "map"   = "application/json"
    "png"   = "image/png"
    "svg"   = "image/svg+xml"
    "txt"   = "text/plain"
    "ttf"   = "application/font-sfnt" 
    "woff"  = "font/woff"
    "woff2" = "font/woff2"
  }
}

# Upload an object
resource "aws_s3_bucket_object" "object" {

  # Note that this explicit path reference restricts your pwd when executing the terraform.
  # Best to execute the terraform command from within the same directory as the output dir.
  for_each = fileset("${path.module}", "output/**")

  bucket       = aws_s3_bucket.blog_playtechnique_io.id
  content_type = lookup(tomap(local.mime_types), element(split(".", each.key), length(split(".", each.key)) - 1))

  source = each.value
  acl    = "public-read" # or can be "public-read"

  etag = filemd5(each.value)

  # replace(string, substring, replacement)
  key = replace(each.value, "output/", "")

}

output "bucket_hostname" {
  value = aws_s3_bucket.blog_playtechnique_io.bucket_domain_name
}
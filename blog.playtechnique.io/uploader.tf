# Create a bucket
resource "aws_s3_bucket" "bloggo_not_doggo" {

  bucket = "bloggo-not-doggo"
  acl    = "public-read"

  tags = {
    Name = "blog"
  }


  website {
    index_document = "index.html"
    error_document = "index.html"
  }

}


# Upload an object
resource "aws_s3_bucket_object" "object" {

  # Note that this explicit path reference restricts your pwd when executing the terraform.
  # Best to execute the terraform command from within the same directory as the output dir.
  for_each = fileset("${path.module}", "output/**")

  bucket   = aws_s3_bucket.bloggo_not_doggo.id
  content_type = "text/html"

  source   = each.value
  acl      = "public-read" # or can be "public-read"

  # replace(string, substring, replacement)
  key      = replace(each.value, "output/", "")

}
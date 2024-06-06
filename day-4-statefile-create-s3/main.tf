#S3 bucket creation to store the state file 
resource "aws_s3_bucket" "remote" {
    bucket = "akdjasgsafkljksgtgfghf"
  
}

#versioning enabled
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.remote.id
  versioning_configuration {
    status = "Enabled"
  }
}
#DynamoDB creation for locking process
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo-srinivas"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}
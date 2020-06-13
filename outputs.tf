output "this_s3_bucket_object_ids" {
  description = "The list of id of objects."
  value       = [for obj in aws_s3_bucket_object.this : obj.id]
}

output "this_s3_bucket_object_etags" {
  description = "The list of etag of objects."
  value       = [for obj in aws_s3_bucket_object.this : obj.etag]
}

output "this_s3_bucket_object_version_ids" {
  description = "The list of version_id of objects."
  value       = [for obj in aws_s3_bucket_object.this : obj.version_id]
}

output "this_s3_bucket_object_keys_ids" {
  description = "The list of map containing id and aws s3 key of objects."
  value = [for obj in aws_s3_bucket_object.this : {
    id  = obj.id
    key = obj.key
  }]
}

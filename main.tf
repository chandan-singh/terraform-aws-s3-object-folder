resource "aws_s3_bucket_object" "this" {
  for_each = fileset(var.base_folder_path, var.file_glob_pattern)


  bucket                        = var.bucket
  acl                           = var.acl
  cache_control                 = var.cache_control
  content_disposition           = var.content_disposition
  content_encoding              = var.content_encoding
  content_language              = var.content_language
  website_redirect              = var.website_redirect
  storage_class                 = var.storage_class
  server_side_encryption        = var.server_side_encryption
  kms_key_id                    = var.kms_key_id
  metadata                      = var.metadata
  tags                          = var.tags
  force_destroy                 = var.force_destroy
  object_lock_legal_hold_status = var.object_lock_legal_hold_status
  object_lock_mode              = var.object_lock_mode
  object_lock_retain_until_date = var.object_lock_retain_until_date

  # The following attribute info depends on file to be uploaded
  key          = "${var.path_prefix.add}${trimprefix(each.value, var.path_prefix.remove)}"
  source       = "${var.source_prefix}/${each.value}"
  etag         = var.kms_key_id != "" && var.server_side_encryption != "" ? filemd5("${var.base_folder_path}/${each.value}") : null
  content_type = var.set_auto_content_type ? length(regexall("^.*\\.(.*)", each.value)) > 0 ? lookup(local.extension_to_mime, element(regex("^.*\\.(.*)", each.value), 0), null) : null : var.content_type

}



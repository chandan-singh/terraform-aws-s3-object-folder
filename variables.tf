
variable "bucket" {
  description = "(Required) The name of the bucket"
  type        = string
}

variable "base_folder_path" {
  description = "(Required) Local folder path that to be scanned for uploading objects to bucket"
  type        = string
}

variable "file_glob_pattern" {
  type        = string
  default     = "**"
  description = "(Optional) Glob pattern for selecting the files"
  # Example:
  #   Supported pattern matches:

  #         `*` - matches any sequence of non-separator characters
  #         `**` - matches any sequence of characters, including separator characters
  #         `?` - matches any single non-separator character
  #         `{alternative1,...}` - matches a sequence of characters if one of the comma-separated alternatives matches
  #         `[CLASS]` - matches any single non-separator character inside a class of characters (see below)
  #         `[^CLASS]` - matches any single non-separator character outside a class of characters (see below)
  #         Character classes support the following:

  #         `[abc]` - matches any single character within the set
  #         `[a-z]` - matches any single character within the range

  # > file_glob_pattern: "files/*.txt"
  # [
  # "files/hello.txt",
  # "files/world.txt",
  # ]

  # > file_glob_pattern: "files/{hello,world}.txt"
  # [
  # "files/hello.txt",
  # "files/world.txt",
  # ]

  # > file_glob_pattern: "*" - Under folder `files/`
  # [
  # "hello.txt",
  # "world.txt",
  # ]

  # >  file_glob_pattern: "**" - Under folder `files/`
  # [
  # "hello.txt",
  # "world.txt",
  # "subdirectory/anotherfile.txt",
  # ]

}

variable "path_prefix" {
  type = map(string)
  default = {
    remove = ""
    add    = ""
  }
  description = "(Optional) A Map - value of `remove` key will remove the prefix from the paths identified after applying `file_glob_pattern` on `base_folder_path`. Value of `add` key will be added as prefix to paths which will act as object key"
  # Example:
  # > file_glob_pattern: "files/{hello,world}.txt" and path_prefix = {remove="folder_a/"  add="myfolder-"} 
  # [
  # "folder_a/hello.txt",  # key will be "myfolder-hello.txt"
  # "folder_a/world.txt",  # key will be "myfolder-hello.txt"
  # "hello.txt",           # key will be "hello.txt" 
  # "folder_c/world.txt",  # key will be "folder_c/world.txt"
  # ]
}

variable "source_prefix" {
  type        = string
  default     = ""
  description = "(Optional) Prefix to add before items found after applying glob pattern on `base_folder_path`. It will help terraform find location of `base_folder_path` for upload."
}

variable "acl" {
  description = "(Optional) The canned ACL to apply. Defaults to private."
  type        = string
  default     = "private"
}

variable "content_disposition" {
  description = "(Optional) Specifies presentational information for the object. Read w3c content_disposition for further information."
  type        = string
  default     = null
}

variable "content_encoding" {
  description = "(Optional) Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field. "
  type        = string
  default     = null
}

variable "content_language" {
  description = "(Optional) The language the content is in e.g. en-US or en-GB."
  type        = string
  default     = null
}

variable "content_type" {
  description = "(Optional) A standard MIME type describing the format of the object data, e.g. application/octet-stream. All Valid MIME Types are valid for this input."
  type        = string
  default     = null
}

variable "cache_control" {
  description = "(Optional) Specifies caching behavior along the request/reply chain Read w3c cache_control for further details."
  type        = string
  default     = null
}

variable "set_auto_content_type" {
  description = "(Optional) If set to true, it will override content_type variable and set content-type based on file extensions."
  type        = bool
  default     = true
}

variable "storage_class" {
  description = "(Optional) Specifies the desired Storage Class for the object. Can be either STANDARD, REDUCED_REDUNDANCY, ONEZONE_IA, INTELLIGENT_TIERING, GLACIER, DEEP_ARCHIVE, or STANDARD_IA"
  type        = string
  default     = "STANDARD"
}

variable "server_side_encryption" {
  description = " (Optional) Specifies server-side encryption of the object in S3. "
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "(Optional) Specifies the AWS KMS Key ARN to use for object encryption. This value is a fully qualified ARN of the KMS Key"
  type        = string
  default     = null
}

variable "metadata" {
  description = "(Optional) A map of keys/values to provision metadata (will be automatically prefixed by x-amz-meta-"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the object."
  type        = map(string)
  default     = {}
}

variable "website_redirect" {
  description = "(Optional) Specifies a target URL for website redirect."
  type        = any
  default     = null
}

variable "force_destroy" {
  description = "(Optional) Allow the object to be deleted by removing any legal hold on any object version. Default is false. This value should be set to true only if the bucket has S3 object lock enabled"
  type        = bool
  default     = false
}

variable "object_lock_legal_hold_status" {
  description = "(Optional) The legal hold status that you want to apply to the specified object. Valid values are ON and OFF."
  type        = string
  default     = null
}

variable "object_lock_mode" {
  description = "(Optional) The object lock retention mode that you want to apply to this object. Valid values are GOVERNANCE and COMPLIANCE"
  type        = string
  default     = null
}

variable "object_lock_retain_until_date" {
  description = "(Optional) The date and time, in RFC3339 format, when this object's object lock will expire."
  type        = string
  default     = null
}



module "test_aws_s3_folder_1" {
  source = "../../"

  bucket                = "test_bucket"
  base_folder_path      = path.module # Or, something like "~/abc/xyz/build"
  file_glob_pattern     = "**"
  set_auto_content_type = true
  content_type          = "plain/text"

  path_prefix = {
    remove = "folder_a/"
    add    = ""
  }
}

module "test_aws_s3_folder_2" {
  source = "../../"

  bucket                = "test_bucket"
  base_folder_path      = path.module # Or, something like "~/abc/xyz/build"
  file_glob_pattern     = "**/*.zip"
  set_auto_content_type = true
  content_type          = "plain/text"
  cache_control         = "max-age=86400, stale-while-revalidate=3600"

  path_prefix = {
    remove = "folder_a/"
    add    = "folder_c/folder_d/"
  }
}

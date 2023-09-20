# Change Log

All notable changes will be documented in this file.

<a name="v0.0.5"></a>

## v0.0.1 - 2020-06-12 :baby:

- Updated readme
- Initial commit

## v0.0.5 - 2023-06-12

- Fixed __file not found__ errors by omitting `source` attribute when
  `var.source_prefix` is not set
- Replaced deprecated `aws_s3_bucket_object` with `aws_s3_object`
- Replaced `etag` with `source_hash` as it has wider support
# SCP to S3 Uploader

[![Build Status](https://travis-ci.com/lovelysystems/scp2s3.svg?branch=master)](https://travis-ci.com/lovelysystems/scp2s3)

Docker Image which allows for uploading files to S3 via scp.

## How it works

When a file is uploaded via SCP an incron job starts an upload to S3 using s3cmd. 
The target url of the file is determined by a configurable regex pattern.

### Reasoning

- The target bucket is protected from the uploader, it is not possible the see the
  existing content, it is "write-only"
- No s3 filesystem abstraction is used, so no performance impact if you have 
  a huge amount of files in your bucket.
- The target bucket is fully dynamic per uploaded file via regex

See the `localdev` directory for example usage.


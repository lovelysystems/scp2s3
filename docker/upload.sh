#!/usr/bin/env ash
set -e

name=$1
target_path=$(echo $name |sed -nE ${PATH_PATTERN})

if [[ -n "$target_path" ]]
then
    target_url=s3:/$target_path
    echo uploading: $name to $target_url
    s3cmd sync --no-progress --no-check-md5 --skip-existing /home/upload/$1 "$target_url" \
        && rm /home/upload/$1
else
    echo ignoring file: $name
fi








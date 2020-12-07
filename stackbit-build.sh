#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://stg-api.stackbit.com/project/5fcd7d582db6c70015ecf52c/webhook/build/pull > /dev/null
curl -s -X POST https://stg-api.stackbit.com/project/5fcd7d582db6c70015ecf52c/webhook/build/ssgbuild > /dev/null
make prepare && hugo --source demo --baseURL "/"
curl -s -X POST https://stg-api.stackbit.com/project/5fcd7d582db6c70015ecf52c/webhook/build/publish > /dev/null

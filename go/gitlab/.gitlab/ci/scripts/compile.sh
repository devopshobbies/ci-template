#!/bin/sh

mkdir -p .cache

go env -w GOPATH="$CI_PROJECT_DIR/.cache"

ldflags="-X main.CommitRefName=${CI_COMMIT_REF_SLUG} -X main.CommitSHA=${CI_COMMIT_SHA:0:8} -X main.BuildDate=$(TZ=Asia/Tehran date '+%FT%T') -linkmode external -extldflags '-static'"

go build --ldflags "${ldflags}" -o your-app-name ./main.go

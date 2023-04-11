#!/bin/sh

go env -w GOPATH="$CI_PROJECT_DIR/.cache"

go test --race -gcflags=-l -v -coverprofile .coverage.out ./...
go tool cover -func .coverage.out

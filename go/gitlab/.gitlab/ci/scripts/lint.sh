#!/bin/sh

go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

go mod download

golangci-lint version

golangci-lint run

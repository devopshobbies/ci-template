# Start from the latest golang base image
FROM golang:alpine AS builder

# Install git command required for building with go
RUN apk add git

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
RUN go build -o /your-app-name

FROM alpine:latest AS runtime

# Add Maintainer Info
LABEL maintainer="Mohammad Nasr <mohammadne.dev@gmail.com>"

WORKDIR /app/

COPY --from=builder /your-app-name .

ENTRYPOINT ["./your-app-name"]

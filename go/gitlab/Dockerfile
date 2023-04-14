FROM alpine:3.17

RUN apk --no-cache --update add ca-certificates tzdata

COPY ./your-app-name /bin

ENTRYPOINT ["/bin/your-app-name"]

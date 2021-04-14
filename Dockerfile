# Base image
FROM alpine:latest

# installes required packages for our script
RUN apk add --no-cache bash ca-certificates curl jq

# file to execute when the docker container starts up
ENTRYPOINT ["/entrypoint.sh"]
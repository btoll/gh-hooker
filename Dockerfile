FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y \
        git

WORKDIR /root

COPY . ./

ENTRYPOINT ["./gh-hooker"]


FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /etc/apt/lists/*

WORKDIR /app

COPY bin/ ./bin/
COPY share/bootstrap/ ./share/bootstrap/
COPY share/colors.sh ./share/
COPY hooks/ ./hooks/
COPY man/ ./man/
COPY git-hooks-and-extensions ./

ENTRYPOINT ["./git-hooks-and-extensions"]


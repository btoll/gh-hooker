FROM golang:1.25.11-trixie

RUN go install github.com/cpuguy83/go-md2man/v2@latest

WORKDIR /app
COPY bin/ ./bin/
COPY share/bootstrap/ ./share/bootstrap/
COPY share/colors.sh ./share/
COPY hooks/ ./hooks/
COPY man/ ./man/
COPY git-hooks-and-extensions ./

ENTRYPOINT ["./git-hooks-and-extensions"]


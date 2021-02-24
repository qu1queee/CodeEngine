FROM golang:alpine
RUN mkdir -p /go/src/github.com/IBM/CodeEngine
COPY codeengine.go /go/src/github.com/IBM/CodeEngine/codeengine.go
RUN cd /go/src/github.com/IBM/CodeEngine/ && \
    go mod init github.com/IBM/CodeEngine && \
    go build -o /codeengine ./...

# Copy the exe into a smaller base image
FROM alpine
COPY --from=0 /codeengine /codeengine
CMD /codeengine

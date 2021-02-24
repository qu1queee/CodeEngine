FROM golang:alpine
RUN mkdir -p /go/src/github.com/IBM/CodeEngine
COPY codeengine.go /go/src/github.com/IBM/CodeEngine/codeengine.go
ENV GO111MODULE=auto
RUN go build -o /codeengine github.com/IBM/CodeEngine

# Copy the exe into a smaller base image
FROM alpine
COPY --from=0 /codeengine /codeengine
CMD /codeengine

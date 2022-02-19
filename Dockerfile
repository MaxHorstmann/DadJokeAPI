FROM golang:1.17

WORKDIR /usr/src/dadjokesapi

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
#COPY go.mod go.sum ./
COPY go.mod ./

RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /usr/local/bin/dadjokesapi ./...

EXPOSE 8080
CMD ["dadjokesapi"]

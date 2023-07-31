# Carrega imagem base Go
FROM golang:alpine AS builder

# Variavel de ambiente
ENV GO111MODULE=off

# Cria diretorio
WORKDIR /app

# Copia arquivos
COPY . .

# Compila
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Carrega imagem base 2Mb
FROM scratch

# Copia do executavel
COPY --from=builder /app/main .

# Executa
CMD ["./main"]
#!/bin/bash

# Entrando na pasta src e compilando
echo "Entrando na pasta src e compilando"
cd src

# Compilação do código Go para Linux
GOOS=linux GOARCH=amd64 go build -o bootstrap main.go

# Empacotando o binário compilado em um arquivo zip
zip -j bootstrap.zip bootstrap

# Movendo o arquivo para a pasta bin no nível correto
echo "Movendo o arquivo para a pasta bin no nível correto"
mkdir -p ../bin
mv bootstrap.zip ../bin/

# Confirmar que o arquivo foi movido
echo "Arquivo bootstrap.zip movido para a pasta bin/"

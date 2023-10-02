#!/bin/bash

PW=changeit

echo "*********"
echo "RootCA"
echo "*********"
openssl req -x509  -passin pass:$PW -sha256 -days 3650 -newkey rsa:4096 -keyout rootCA.key -out rootCA.crt 

echo "*********"
echo "Host certificate csr"
echo "*********"
openssl req -new -newkey rsa:4096  -passin pass:$PW -keyout localhost.key -out localhost.csr -nodes 

echo "*********"
echo "Sign host csr with rootCA (see below for file localhost.ext):"
echo "*********"
openssl x509 -req  -passin pass:$PW -CA rootCA.crt -CAkey rootCA.key -in localhost.csr -out localhost.crt -days 365 -CAcreateserial -extfile localhost.ext

echo "*********"
echo "Client (user) certificate"
echo "*********"
openssl req -new -newkey rsa:4096 -nodes -keyout fredFlintstone.key -out fredFlintstone.csr

echo "*********"
echo "Sign client csr with rootCA:"
echo "*********"
openssl x509 -req -CA rootCA.crt -CAkey rootCA.key -in fredFlintstone.csr -out fredFlintstone.crt -days 365 -CAcreateserial


mkdir ../genCerts
cp *.{crt,key} ../genCerts

#!/usr/bin/env bash

source shared.sh

# Directory where we will output the resulting certificate.
assert_directory_exists $CA_ROOT_CERTS_DIR

openssl req \
  -config $ROOT_CONFIGURATION_FILE \
  -key "$CA_ROOT_PRIVATE_DIR/ca.key.pem" \
  -new \
  -x509 \
  -days 7300 \
  -out "$CA_ROOT_CERTS_DIR/ca.cert.pem"

chmod 444 "$CA_ROOT_CERTS_DIR/ca.cert.pem"

openssl x509 -noout -text -in "$CA_ROOT_CERTS_DIR/ca.cert.pem"

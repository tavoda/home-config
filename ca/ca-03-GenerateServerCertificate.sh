#!/bin/bash
if [[ $# -ne 1 ]]; then
	echo "Usage: `basename $0` serverName"
	echo -e "\tserverName - Name of server for which to generated certificate"
	exit 3
fi

function printHead() {
	echo -e "\n################################################################################"
	echo "# $1"
	echo "################################################################################"
}

DIRNAME=`dirname $0`
source $DIRNAME/ca-config.properties
cd $CA_ROOT

printHead "Generate keys for server $1"
openssl genrsa -aes256 -out "intermediate/private/$1.key.pem" 2048
chmod 400 "intermediate/private/$1.key.pem"

printHead "Create CSR for server $1"
sed -i -e "s/commonName_default.*/commonName_default              = $1/" -e "s/DNS\.1.*/DNS.1 = $1/" intermediate/openssl.cnf
openssl req -config intermediate/openssl.cnf -key "intermediate/private/$1.key.pem" -new -sha256 -out "intermediate/csr/$1.csr.pem"

printHead "Sign with intermediate CA"
openssl ca -config intermediate/openssl.cnf -extensions server_cert -notext -md sha256 -in "intermediate/csr/$1.csr.pem" -out "intermediate/certs/$1.cert.pem"
chmod 444 "intermediate/certs/$1.cert.pem"
openssl x509 -noout -text -in "intermediate/certs/$1.cert.pem"

printHead "Verify $1 certificate agaist intermediate"
openssl verify -CAfile intermediate/certs/ca-chain.cert.pem "intermediate/certs/$1.cert.pem"

echo "Certificate file generated to $CA_ROOT/intermediate/certs/$1.cert.pem"


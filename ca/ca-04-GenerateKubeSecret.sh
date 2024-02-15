#!/bin/bash
if [[ $# -ne 2 ]]; then
	echo "Specify namespace and server hostname (e.g. passbolt passbolt.kuku.eu)"
	exit 3
fi

function printHead() {
	echo -e "\n################################################################################"
	echo "# $1"
	echo "################################################################################"
}

DIRNAME=`dirname $0`
source $DIRNAME/ca-config.properties

if [[ ! -f "$CA_ROOT/intermediate/private/$2.key.pem" ]]; then
	echo "Missing private key for $2 ($CA_ROOT/intermediate/private/$2.key.pem)"
	exit 3
fi
if [[ ! -f "$CA_ROOT/intermediate/certs/$2.cert.pem" ]]; then
	echo "Missing public certificate for $2 ($CA_ROOT/intermediate/certs/$2.cert.pem)"
	exit 3
fi
if [[ ! -f "$CA_ROOT/intermediate/certs/intermediate.cert.pem" ]]; then
	echo "Missing intermediate certificate ($CA_ROOT/intermediate/certs/intermediate.cert.pem)"
	exit 3
fi
if [[ ! -f "$CA_ROOT/certs/ca.cert.pem" ]]; then
	echo "Missing root certificate ($CA_ROOT/certs/ca.cert.pem)"
	exit 3
fi

printHead "Decrypt key"
openssl rsa -in "$CA_ROOT/intermediate/private/$2.key.pem"  -out "$HOME/$2.key.pem"
if [[ $? == 0 ]]; then
	chmod 400 "$HOME/$2.key.pem"
	TLS_NAME=`echo $2 | sed 's/\./-/g'`-tls
	cat $CA_ROOT/intermediate/certs/$2.cert.pem $CA_ROOT/intermediate/certs/intermediate.cert.pem $CA_ROOT/certs/ca.cert.pem > "$CA_ROOT/intermediate/certs/$2.fullcert.pem"
	kubectl create secret tls -n "$1" "$TLS_NAME" --key="$HOME/$2.key.pem" --cert="$CA_ROOT/intermediate/certs/$2.fullcert.pem"
	# scp "$HOME/$2.key.pem" "$CA_ROOT/intermediate/certs/$2.fullcert.pem" root@kube:/etc/kuku
	rm -rf "$HOME/$2.key.pem"
else
	echo -e "\n!!!Wrong password!!!"
fi

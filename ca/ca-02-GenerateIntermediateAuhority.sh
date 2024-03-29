#!/bin/bash
function printHead() {
	echo -e "\n################################################################################"
	echo "# $1"
	echo "################################################################################"
}

DIRNAME=`dirname $0`
source $DIRNAME/ca-config.properties
cd $CA_ROOT
mkdir intermediate

cd intermediate
mkdir certs crl csr newcerts private
chmod 700 private
touch index.txt
echo 1000 > serial
echo 1000 > crlnumber

cat > openssl.cnf <<-EOF
	# OpenSSL intermediate CA configuration file.

	[ ca ]
	# 'man ca'
	default_ca = CA_default

	[ CA_default ]
	# Directory and file locations.
	dir               = $CA_ROOT/intermediate
	certs             = \$dir/certs
	crl_dir           = \$dir/crl
	new_certs_dir     = \$dir/newcerts
	database          = \$dir/index.txt
	serial            = \$dir/serial
	RANDFILE          = \$dir/private/.rand

	# The root key and root certificate.
	private_key       = \$dir/private/intermediate.key.pem
	certificate       = \$dir/certs/intermediate.cert.pem

	# For certificate revocation lists.
	crlnumber         = \$dir/crlnumber
	crl               = \$dir/crl/intermediate.crl.pem
	crl_extensions    = crl_ext
	default_crl_days  = 30

	# SHA-1 is deprecated, so use SHA-2 instead.
	default_md        = sha256

	name_opt          = ca_default
	cert_opt          = ca_default
	default_days      = $CA_CERT_DAYS
	preserve          = no
	policy            = policy_strict

	[ policy_strict ]
	# The root CA should only sign intermediate certificates that match.
	# See the POLICY FORMAT section of 'man ca'.
	countryName             = match
	stateOrProvinceName     = match
	organizationName        = match
	organizationalUnitName  = optional
	commonName              = supplied
	emailAddress            = optional

	[ policy_loose ]
	# Allow the intermediate CA to sign a more diverse range of certificates.
	# See the POLICY FORMAT section of the 'ca' man page.
	countryName             = optional
	stateOrProvinceName     = optional
	localityName            = optional
	organizationName        = optional
	organizationalUnitName  = optional
	commonName              = supplied
	emailAddress            = optional

	[ req ]
	# Options for the 'req' tool ('man req').
	default_bits        = 2048
	distinguished_name  = req_distinguished_name
	string_mask         = utf8only

	# SHA-1 is deprecated, so use SHA-2 instead.
	default_md          = sha256

	# Extension to add when the -x509 option is used.
	x509_extensions     = v3_ca

	[ req_distinguished_name ]
	# See <https://en.wikipedia.org/wiki/Certificate_signing_request>.
	countryName                     = Country Name (2 letter code)
	stateOrProvinceName             = State or Province Name
	localityName                    = Locality Name
	0.organizationName              = Organization Name
	organizationalUnitName          = Organizational Unit Name
	commonName                      = Common Name
	emailAddress                    = Email Address

	# Optionally, specify some defaults.
	countryName_default             = $CA_COUNTRY
	stateOrProvinceName_default     = $CA_STATE
	localityName_default            = $CA_LOCALITY
	0.organizationName_default      = $CA_ORGANIZATION
	organizationalUnitName_default  = $CA_ORGANIZATION Certificate Authority
	commonName_default              = $CA_ORGANIZATION Intermediate CA
	emailAddress_default            = $CA_ADMIN_MAIL

	[ v3_ca ]
	# Extensions for a typical CA ('man x509v3_config').
	subjectKeyIdentifier = hash
	authorityKeyIdentifier = keyid:always,issuer
	basicConstraints = critical, CA:true
	keyUsage = critical, digitalSignature, cRLSign, keyCertSign

	[ v3_intermediate_ca ]
	# Extensions for a typical intermediate CA ('man x509v3_config').
	subjectKeyIdentifier = hash
	authorityKeyIdentifier = keyid:always,issuer
	basicConstraints = critical, CA:true, pathlen:0
	keyUsage = critical, digitalSignature, cRLSign, keyCertSign

	[ usr_cert ]
	# Extensions for client certificates ('man x509v3_config').
	basicConstraints = CA:FALSE
	nsCertType = client, email
	nsComment = "OpenSSL Generated Client Certificate"
	subjectKeyIdentifier = hash
	authorityKeyIdentifier = keyid,issuer
	keyUsage = critical, nonRepudiation, digitalSignature, keyEncipherment
	extendedKeyUsage = clientAuth, emailProtection

	[ server_cert ]
	# Extensions for server certificates ('man x509v3_config').
	basicConstraints = CA:FALSE
	nsCertType = server
	nsComment = "OpenSSL Generated Server Certificate"
	subjectKeyIdentifier = hash
	authorityKeyIdentifier = keyid,issuer:always
	keyUsage = critical, digitalSignature, keyEncipherment
	extendedKeyUsage = serverAuth
	subjectAltName = @alt_names

	[ crl_ext ]
	# Extension for CRLs ('man x509v3_config').
	authorityKeyIdentifier=keyid:always

	[ ocsp ]
	# Extension for OCSP signing certificates ('man ocsp').
	basicConstraints = CA:FALSE
	subjectKeyIdentifier = hash
	authorityKeyIdentifier = keyid,issuer
	keyUsage = critical, digitalSignature
	extendedKeyUsage = critical, OCSPSigning

	[ alt_names ]
	DNS.1 = www.kuku.eu
EOF

printHead "Generate intermediate keys"
openssl genrsa -aes256 -out private/intermediate.key.pem 4096
chmod 400 private/intermediate.key.pem

printHead "Create CSR"
openssl req -config openssl.cnf -new -sha256 -key private/intermediate.key.pem -out csr/intermediate.csr.pem

printHead "Sign with root CA"
openssl ca -config ../openssl.cnf -extensions v3_intermediate_ca -notext -md sha256 -in csr/intermediate.csr.pem -out certs/intermediate.cert.pem
chmod 444 certs/intermediate.cert.pem
openssl x509 -noout -text -in certs/intermediate.cert.pem

printHead "Verify intermediate agaist root"
openssl verify -CAfile ../certs/ca.cert.pem certs/intermediate.cert.pem

cat certs/intermediate.cert.pem ../certs/ca.cert.pem > $CA_ROOT/intermediate/certs/ca-chain.cert.pem
chmod 444 $CA_ROOT/intermediate/certs/ca-chain.cert.pem
echo "Certificate chain file generated to $CA_ROOT/intermediate/certs/ca-chain.cert.pem"

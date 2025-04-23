# certs
Create SSL signing certificates (CSR) and private keys using a script

## Usage
Run create_csr.sh and pass in the common name (CN) the certificate should use.

./create_csr.sh common-name-here

It will then ask for the Subject Alternative Names to be added to the request, separate multiple with a space.
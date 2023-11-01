usage() {
  echo create CSR and private key
  echo input the certificate name (common name) as a value
  echo example:
  echo $0 test.example.com
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

echo "what are the subject alternative names? (separate multiple with space)"
read -a san

conffile=openssl-$commonname.cnf

# Fill out below with the correct State, Locality, Organization, Organization Unit, and Email address (optional)
# If email address is not provided, delete that line
echo "[req]
distinguished_name = req_distinguished_name
req_extensions = v3_req
prompt = no
[req_distinguished_name]
C = US
ST = 
L = 
O = 
OU = 
CN = $commonname
emailAddress = 
[v3_req]
subjectAltName = @alt_names
[alt_names]" > $conffile

x=1
# Populate Subject Alternative Names
for i in $sans; do echo "DNS.$x = $i" >> $conffile; let "x=$x+1"; done
openssl req -newkey rsa:2048 -nodes -keyout $commonname.pem -out $commonname.csr -config $conffile

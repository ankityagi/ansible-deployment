# go to folder
cd {{ mysql_ssl_pem_location }}

# Create CA certificate
openssl genrsa 2048 > ca-key.pem
openssl req -new -x509 -nodes -days {{ mysql_ssl_days_valid }} -subj "/CN={{ mysql_ssl_ca_common_name }}" -key ca-key.pem -out {{ mysql_ssl_ca_name }}

# Create server certificate, remove passphrase, and sign it
# server-cert.pem = public key, server-key.pem = private key
openssl req -newkey rsa:2048 -nodes -days {{ mysql_ssl_days_valid }} -subj "/CN={{ mysql_ssl_server_common_name }}" -keyout {{ mysql_ssl_server_key_name }} -out server-req.pem
openssl rsa -in {{ mysql_ssl_server_key_name }} -out {{ mysql_ssl_server_key_name }}
openssl x509 -req -in server-req.pem -days {{ mysql_ssl_days_valid }} -CA {{ mysql_ssl_ca_name }} -CAkey ca-key.pem -set_serial 01 -out {{ mysql_ssl_server_cert_name }}

# Create client certificate, remove passphrase, and sign it
# client-cert.pem = public key, client-key.pem = private key
openssl req -newkey rsa:2048 -nodes -days {{ mysql_ssl_days_valid }} -subj "/CN={{ mysql_ssl_client_common_name }}" -keyout {{ mysql_ssl_client_key_name }} -out client-req.pem
openssl rsa -in {{ mysql_ssl_client_key_name }} -out {{ mysql_ssl_client_key_name }}
openssl x509 -req -in client-req.pem -days {{ mysql_ssl_days_valid }} -CA {{ mysql_ssl_ca_name }} -CAkey ca-key.pem -set_serial 01 -out {{ mysql_ssl_client_cert_name }}

# traefik-passUserCert
Attempt at passing a user x509 cert through traefik on k3s
1.  Enter certs directory and change localhost.ext alt name to your domain name
2.  Run x509.sh and follow the prompts to fill out the cert info mostly for CN.  The root ca passphrase is set to changeit.  After completion of script cd ..
3.  Run Deploy.sh which deploys to the namespace who.  
4.  Run testHttps.sh to see the who feedback.  


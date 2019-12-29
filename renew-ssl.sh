#!/bin/bash
######################################################################
#
# Bash Script for renew SSL Certificate for Openfire
#
######################################################################
#
#Renew the SSL Certificate
#
certbot renew

#
#Convert the SSL Certificate to PKCS12
#
openssl pkcs12 -export -in /etc/letsencrypt/live/domain.de/fullchain.pem -inkey /etc/letsencrypt/live/domain.de/privkey.pem -out /etc/letsencrypt/live/domain.de/fullchain.pkcs12 -name domain.de -passout pass:changeit

#
#Delete the old SSL Certificate
#
keytool -delete -alias domain.de -storepass changeit -keystore /etc/openfire/security/keystore

#
#Import the new SSl Certificate
#
keytool -importkeystore -deststorepass changeit -destkeypass changeit -destkeystore /etc/openfire/security/keystore -srckeystore /etc/letsencrypt/live/domain.de/fullchain.pkcs12 -srcstoretype PKCS12 -deststoretype pkcs12 -srcstorepass changeit -alias domain.de

#
#Openfire Service restart
#
service openfire restart
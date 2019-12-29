# openfire-letsencrypt
Bash Script - Renew Letsencrypt Openfire

## Vorrausetzung
- certbot
- keystore
- openssl

## Installation
Git Repository klonen oder downloaden und die renew-ssl.sh ausführbar machen. (0755)
renew-ssl.sh bearbeiten und `domain.de` und `www.domain.de` durch eigene Werte ersetzen.
## Cron
Cron am besten per /etc/crontab ausführen lassen. Dazu bearbeiten wir die crontab
```
nano /etc/crontab
```
oder
```
crontab -e
```
Beispiel für die Ausführung jeden Monat am ersten Tag um 0 Uhr:
```
0 0 1 * * /root/renew-ssl.sh >> /var/log/renew-ssl-openfire.log 2>&1
```

### Mehr Scripte/Unterstüzung
- :orange_book: [Profoxi Blog](https://wiki.profoxi.de/)
- :orange_book: [OpenFire Artikel](https://wiki.profoxi.de/xmpp-server-openfire-auf-einem-debian-installieren)

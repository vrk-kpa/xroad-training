layout: true
name: sininen-palkki
class: sininen-palkki
![logo](../suomifi_logo.svg)

---
layout: true
name: valkoinen
class: valkoinen
![logo](../suomifi_logo.svg)

---
layout: true
name: header
class: center, middle, sininen
![logo](../suomifi_logo.svg)

<!--DON'T TOUCH ABOVE THIS !!!!!! -->
---

template: header
# Komentorivityökalut

---
template: sininen-palkki
# Tiedostojärjestelmä liityntäpalvelimella 1/3

- /etc/xroad

```bash
backup.d                                                                       # varmuuskopiointiin liittyvät palveluiden rekisteröinnit
conf.d                                                                              # palveluiden parametritiedostot (*.ini)
configuration-anchor.xml                                      # konfiguraatioankkuri keskuspalvelimelta
db.properties                                                               # tietokannan yhteysparametrit
devices.ini                                                                     # HSM-laitteen konfiguraatio
globalconf                                                                     # ladatun keskuskonfiguraation säilytyspaikka
jetty                                                                                  # jettyn konfiguraatio
nginx                                                                                # nginx konfiguraatio
services                                                                           # palveluiden käynnistysparametrit
signer                                                                               # signerin avaintiedot
ssl                                                                                      # internal- ja nginx-varmenteet ja avaimet
```

---
template: sininen-palkki
# Tiedostojärjestelmä liityntäpalvelimella 2/3

- /usr/share/xroad

```bash
bin                                                                             # signer-console
db                                                                              # liquibase tietokantamigraatiot
doc
jetty9                                                                        # jetty 9
jlib                                                                             # xroadin jar-kansio
lib                                                                              # muut xroadin ajettavat ohjelmistot
scripts                                                                      # xroadin komentoriviskriptit mm. backup & restore ja messagelog archive siirto
webapps
wsdlvalidator                                                       # wsdlvalidator
```

---
template: sininen-palkki
# Tiedostojärjestelmä liityntäpalvelimella 3/3

- /var/log/xroad sisältää X-Roadin sovelluslokit
- /var/lib/xroad sisältää messagelog arkistot (*.zip)
- /var/tmp/xroad X-Roadin temp-tiedostot

---
template: sininen-palkki
# Signer Console

- Signer ylläpitää software- ja hardware tokeneita, näihin liittyviä avaimia ja varmenteita, sekä ylläpitää varmenteiden OCSP-vastauksia
- Signer Console on työkalu, jolla voi hallinnoida signerin avaimia ja varmenteita komentoriviltä
- Käyttöopas löytyy https://github.com/ria-ee/X-Road/blob/develop/doc/Manuals/ug-sc_x-road_signer-console_users_guide_2.5_Y-883-20.docx
- Demo, käynnistyskomento alla

```bash
$ signer-console # xroad-käyttäjänä
```

---
template: sininen-palkki
# Parametrien muuttaminen

- Palveluiden parametrit asetetaan /etc/xroad/conf.d kansiossa
- Jos on tarve tehdä muutoksia niin peukalosääntönä muutokset tehdään /etc/xroad/conf.d/local.ini tiedostoon
  - Muutokset suoraan palveluiden .ini tiedostoihin ylikirjoittuvat ohjelmistopäivityksessä
- X-Roadin parametrit on kuvattu dokumentissa https://github.com/ria-ee/X-Road/blob/develop/doc/Manuals/ug-syspar_x-road_v6_system_parameters.md

---
template: sininen-palkki
# Autologin

- X-Roadin 6.16.0 versiossa tulee mukana tuettu ratkaisu PIN-koodin automaattiseen syöttöön
  - Oletuksena PIN-koodi tallennetaan selkokielisenä palvelimelle -> ei sellaisenaan korkeamman tietoturvan ympäristöihin
  - Ratkaisu kuitenkin muokattavissa tietoturvallisemmaksi omalla skriptillä
- Dokumentaatio https://github.com/ria-ee/X-Road/blob/master/doc/Manuals/Utils/ug-autologin_x-road_v6_autologin_user_guide.md
- Demo

---
template: sininen-palkki
# Toiminnan testaaminen komentoriviltä

- Halutaan varmistua, että liityntäpalvelin on käyttökuntoinen (periaatteet kuvattu "Toiminnan Testaus" kalvosetissä)
- Testataan listMethods-kutsua komentoriviltä

```bash
$ curl --header "content-type: text/xml" http://10.139.178.39 -d @listMethodsRequest.xml
```

---

template: sininen-palkki

# Varmuuskopiointi komentoriviltä

- Ajetaan xroad-käyttäjänä
- Backup kannattaa tehdä oletuskansioon niin se näkyy myös käyttöliittymässä

```bash
$ /usr/share/xroad/scripts/backup_xroad_proxy_configuration.sh -s AA/GOV/TS1OWNER/TS1 -f /var/lib/xroad/backup/mybackup.tar
```

---

template: sininen-palkki

# Palauttaminen komentoriviltä

- Ajetaan xroad-käyttäjänä
   -  Konfiguraation palauttaminen
   ```bash
   $ /usr/share/xroad/scripts/restore_xroad_proxy_configuration.sh -s <security server ID> -f <path + filename>
   ```
   - Esimerkiksi
   ```bash
   $ /usr/share/xroad/scripts/restore_xroad_proxy_configuration.sh -s AA/GOV/TS1OWNER/TS1 \
   -f /var/lib/xroad/backup/conf_backup_20140703-110438.tar
   ```
   - Konfiguraation palauttaminen toiselle liityntäpalvelimelle kuin alkuperäinen -F vivulla
   ```bash
   $ /usr/share/xroad/scripts/restore_xroad_proxy_configuration.sh -F \
   -f /var/lib/xroad/backup/conf_backup_20140703-110438.tar
   ```

---

template: sininen-palkki

# Health check komentoriviltä

- Health check ensin aktivoitava asetuksissa, oletuksena pois päältä
- Konfiguraatio tiedostoon /etc/xroad/conf.d/local.ini

```bash
[proxy]
health-check-port = 5588
```

- Health checkin kutsuminen curlilla

```bash
curl -i http://localhost:5588
```

- Vastaa HTTP 200 OK jos liityntäpalvelin on toimintakunnossa ja muussa tapauksessa HTTP 500 Server Error virhekuvauksen kera

---

template: sininen-palkki

# Asentaminen Ansiblella komentoriviltä

- X-Road palvelimet on mahdollista asentaa automaattisesti lähdekoodin mukana tulevilla Ansible-skripteillä
  - Keskuspalvelin, liityntäpalvelin, konfiguraatioproxy, CA
- Palvelimet voidaan asentaa kohdepalvelimille tai paikallisiin LXD-kontteihin
- Ohjelmistot voidaan asentaa palvelimille pakettirepoista tai kääntää paikallisesti
- Dokumentaatio https://github.com/ria-ee/X-Road/blob/develop/ansible/README.md

```bash
$ ansible-playbook -i hosts/example_xroad_hosts.txt xroad_init.yml
```
```bash
$ ansible-playbook  -i hosts/lxd_hosts.txt xroad_dev.yml
```

---

template: sininen-palkki

# Tietokannan tarkastelu

- Helpointa tehdä postgres-käyttäjänä

```bash
$ sudo su - postgres
$ psql
```

- Listaa tietokannat ja kirjaudu tietokantaan

```bash
$ \l
$ \c serverconf
```

- Listaa tietokannan taulut, kuvaa taulu ja listaa taulun data

```bash
$ \d
$ \d serverconf
$ select * from serverconf;
```

---

template: sininen-palkki

# Lokitustason muuttaminen

- Lokituksen konfiguraatiot löytyvät /etc/xroad/conf.d/ hakemistosta
  - Tiedostot \*logback\*.xml määrittelevät lokitustason
  - Ei säädettävissä local.ini tiedostolla kuten muut konfiguraatiot
- Lokitustasot hiljaisemmasta yksityiskohtaisempaan ERROR, INFO, DEBUG, TRACE
  - Oletustaso INFO
- Esim. /etc/xroad/conf.d/signer-logback.xml

```xml
<logger name="ee.ria.xroad" level="INFO" />
```

- Säätää ee.ria.xroad Java-pakettiin kuuluvien luokkien lokitustasoa

---
template: header
# Kysymyksiä?

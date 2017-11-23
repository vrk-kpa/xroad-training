layout: true
name: sininen-palkki
class: sininen-palkki
![logo](../suomifi_logo.svg)

---
layout: true
name: header
class: center, middle, sininen
![logo](../suomifi_logo.svg)

---
layout: true
name: valkoinen
class: valkoinen
![logo](../suomifi_logo.svg)

<!--DON'T TOUCH ABOVE THIS !!!!!! -->
---

template: header

# Kuormantasaus

---

template: sininen-palkki

# Kaksi tapaa
## Sisäinen kuormantasaus
* Liityntäpalvelimeen sisäänrakennettu ominaisuus
* Korkea saatavuus (HA)

## Ulkoinen kuormantasaus
* Saatavilla X-Roadin 6.16.0 versiosta lähtien
* Suorituskyky

---

template: sininen-palkki

# Sisäänrakennettu HA-tuki

* X-Roadissa on sisäänrakennettuna yksinkertainen korkean saatavuuden mekanismi
* Jos sama palvelu (sama organisaatio & alijärjestelmä & palvelu) on rekisteröity usealle liityntäpalvelimelle, käytetään sitä liityntäpalvelinta joka vastaa nopeiten

![](../images/internal-load-balancer.png)

---

template: sininen-palkki

# Sisäänrakennettu HA-tuki

* Jos tämä liityntäpalvelin lakkaa vastaamasta pyyntöihin, aletaan kutsua seuraavaksi nopeimmin vastaavaa
* Ratkaisu siis auttaa saavuttamaan korkean saatavuuden (HA)

.center[![small-image](../images/internal-load-balancer.png)]

---

template: sininen-palkki

# Sisäänrakennettu HA-tuki: ongelma

* Jos tällaiseen klusteriin kuuluu liityntäpalvelimet [SS1, SS2, SS3], jokin niistä on
yleensä nopein vastaamaan pyyntöihin ("lyhyimmät piuhat")
* Yksi klusterin nodeista vastaa kaikkiin pyyntöihin, toiset laiskottelevat
* Ei ole juuri hyödyksi suorituskyvyn suhteen

---

template: sininen-palkki

# Ulkoinen kuormantasaus

* Liityntäpalvelin klusterin edessä ulkoinen kuormantasaaja jakaa kuorman klusterin nodeille
* Kuormatasaaja havaitsee vikaantuneen noden ja lakkaa tarjoamasta sille kuormaa
* Tarjoaa liityntäpalvelimeen skaalautuvan suorituskyvyn ja vikasietoisuuden

![image](../images/external-load-balancer.png)

---

template: sininen-palkki

# Toimintaperiaate

* Klusteriin kuuluu n kappaletta nodeja
* Kaikki nodet palvelevat aktiivisesti asiakkaita (ei hot standby)
* Ulkomaailma näkee nämä yhtenä liityntäpalvelimena
* Yksi node on konfiguraation suhteen master, muut slaveja
* Konfiguraatiomuutokset tehdään masterille, josta ne päivittyvät hetken viiveellä slaveille
* Nodet hakevat itsenäisesti OCSP-vastauksia ja keskuskonfiguraatiota
* Väylässä on siis virallisesti yksi liityntäpalvelin (master) ja klusterin muut nodet teeskentelevät olevansa se

---

template: sininen-palkki

# Tekninen toteutus

* Konfiguraatiotietokanta on klusteroitu
  * PostgreSQL streaming replication (hot standby)
* Konfiguraatiotiedostot kopioidaan masterilta slaveille
  * Ajastettu rsync+ssh
* Slaveilla
  * On read-only käyttäjä
  * Tai ei ole ollenkaan käyttöliittymää
* Health check
* XRoad-sovellukseen on tehty muutoksia, jotka mahdollistavat klusteroinnin

---

template: sininen-palkki

# Ulkoisen kuormantasaajan käyttöönotto

* Asennus
  * Ansible https://github.com/ria-ee/X-Road/blob/develop/ansible/ss_cluster/README.md
  * Asennus käsin https://github.com/ria-ee/X-Road/blob/develop/doc/Manuals/LoadBalancing/ig-xlb_x-road_external_load_balancer_installation_guide.md
* Varsinainen kuormanjakaja voi olla mikä tahansa, joka tukee HTTP health checkiä ja kuormantasausta TCP-tasolla
  * Esim. AWS ELB, F5, haproxy, nginx
* Mahdollista käyttää automaattista PIN-koodin syöttöä (xroad-autologin)
  * Tietoturva huomioitava

---

template: sininen-palkki

# Kuormantasauksen healthcheck

* Mukana 6.16.0 versiosta lähtien
* Healthcheck palauttaa HTTP 200 OK viestin kun liityntäpalvelin on toimintakuntoinen, ja HTTP 500 mikäli ei
* Erikseen konfiguroitava käyttöön, oletuksena pois päältä

```bash
$ curl -i localhost:5588
HTTP/1.1 500 Server Error
Transfer-Encoding: chunked
Server: Jetty(8.y.z-SNAPSHOT)

Fetching health check response timed out for: Authentication key OCSP status
```

Lisätietoa ulkoisen kuormantasauksen dokumentaatiossa: https://github.com/ria-ee/X-Road/blob/develop/doc/Manuals/LoadBalancing/ig-xlb_x-road_external_load_balancer_installation_guide.md#34-health-check-service-configuration

---

template: sininen-palkki

# Liityntäpalvelinten päivittäminen

* Vaihtoehtoina joko offline-päivittäminen 
    - Keskeytetään palvelun käyttö
* Tai ns. rolling upgrade
    - palvelun käyttöä voidaan jatkaa keskeyttämättömänä

Ohjeet: 
https://github.com/ria-ee/X-Road/blob/develop/doc/Manuals/LoadBalancing/ig-xlb_x-road_external_load_balancer_installation_guide.md#7-upgrading-a-clustered-x-road-security-server-installation

---

template: sininen-palkki

# Lisätietoa

Käy lukemassa kuormantasaajaan liittyvä blogipostaus eSuomesta:
- https://esuomi.fi/palveluvaylaan-lisaa-tehoa-kuormantasaajan-kaytto-mahdolliseksi/

---

template: header

# Kysymyksiä?

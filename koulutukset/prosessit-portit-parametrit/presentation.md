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

# Prosessit, portit ja konfiguraatioparametrit

---

template: sininen-palkki

# Sisältö

* Prosessit
* Portit
* Konfiguraatioparametrit

---

template: sininen-palkki

# Ylläpitotoiminnoista yleisesti

* Liityntäpalvelimen valvonta on suositeltavaa, jotta järjestelmä pysyy stabiilina ja käyttökunnossa
* Liityntäpalvelinohjelmistosta julkaistaan uusia versioita ~2-3 kpl/vuosi sisältäen:
    * Suorituskykyparannuksia
    * Tietoturvapäivityksiä
    * Uusia käyttöä tukevia toiminnallisuuksia  

* Levytilan valvonta on tärkeää ja siihen kannattaa kiinnittää huomiota jo asennusvaiheessa
    * Levytila täyttyy jos arkistoituja tietoja ei poisteta tai siirretä muualle talteen liityntäpalvelimelta
    * Käyttäjämäärät ratkaisevia mm. levytilan ja palvelinkapasiteetin valinnassa.

---

template: sininen-palkki

# Liityntäpalvelimen prosessit

|Palvelu             |Tarkoitus                        |Loki                                       |
|:-------------------|:--------------------------------|:------------------------------------------|
|xroad-confclient    |Keskuskonfiguraation hakeminen   | `/var/log/xroad/configuration_client.log` |
|xroad-jetty (Ubuntu)<br>xroad-jetty9 (RHEL)|Käyttöliittymä |`/var/log/xroad/jetty/jetty.log`      |
|xroad-proxy         |Viestinvälitys                   |`/var/log/xroad/proxy.log`                 |
|xroad-signer        |Avainten ja varmenteiden hallinta|`/var/log/xroad/signer.log`                |
|nginx               |Edustapalvelin                   |`/var/log/nginx/`                          |
|postgresql          |Tietokantapalvelin               |`/var/log/postgresql/`                     |

* Tekstilokeihin kirjoitettavan data voidaan asettaa eri tasoisiksi ERROR, WARN, INFO (oletuksena), DEBUG, OFF
 -> muutokset tehdään /etc/xroad/conf.d logback.xml-tiedostoille tai local.ini-tiedostoon

---

template: valkoinen

![lipan-portit](../images/lipan-portit.png)

---

template: sininen-palkki

# Konfiguraatioparametrit

* Parametreilla voidaan säätää esimerkiksi käytettyjä tallennushakemistoja ja ajastuksia mm. messagelogien purkamiseen kannasta
    * Parametrien säätö tehdään käsin konsolin kautta tiedostoa muokkaamalla, ei käyttöliittymän kautta.
* Oletusarvoisesti parametrit ovat hakemistossa /etc/xroad/conf.d
    * Paikalliset muutokset tehdään local.ini -tiedostoon, joka ylikirjoittaa oletusasetukset

Kaikki säädettävissä olevat järjestelmäparametrit löytyvät: https://github.com/ria-ee/X-Road/blob/develop/doc/Manuals/ug-syspar_x-road_v6_system_parameters.md

* Huom: oletusparametrien arvoja ei kannata vaihtaa, jollei tiedä mitä on tekemässä
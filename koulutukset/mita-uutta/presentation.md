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
# Suomi.fi-palveluväylä
.center[Mitä uutta versiossa 6.16.0?]

---

template: sininen-palkki

# Mitä uutta versiossa 6.16.0?

- Ulkoisen kuormantasaajan tuki
    + Lue lisää ulkoisen kuormantasaajan käytöstä palveluväylässä [Blogi: Kuormantasaajan käyttö palveluväylässä](https://esuomi.fi/palveluvaylaan-lisaa-tehoa-kuormantasaajan-kaytto-mahdolliseksi/)
- Federointiin parannuksia
    + Federointi oletusarvoisesti pois käytöstä, liityntäpalvelimen omistaja voi itse määrittää onko federointi päällä vai ei
- Rest Adapter Service -sovitinpalvelu REST/JSON <-> SOAP muunnoksiin
    + Tutustu sovitinpalveluun: [Rest Adapter Service](https://github.com/vrk-kpa/REST-adapter-service)

---

template: sininen-palkki

# Mitä uutta versiossa 6.16.0?

- Liityntäpalvelimen messagelog-tietokantaan parannuksia
    + Indeksin lisäys
    + Viestiarkistointiin parannusta
- Read-Only käyttäjä
    + Pelkästään lukuoikeudet hallintakäyttöliittymään
- SOAP standardiin liittyvät parannukset:
    + SOAP Fault -tieto välitetään kokonaisuudessaan vastaanottajalle
    + Liityntäpalvelin säilyttää ja välittää jatkossa SOAPAction -otsikkotietueen
- Hallintakäyttöliittymän parannukset
    + Diagnostiikka UI ei rikkonnu jos sivun osakyselyt eivät toimi
    + Pieniä bugikorjauksia UI toiminnallisuuksiin

---

template: sininen-palkki
# Mitä uutta versiossa 6.16.0?

- Alustamonitorointikomponentin kehitystyö
    + Tulossa käyttöön Q4/2017
    + Varmennetiedot mukaan kerättäviin tietoihin
- WSDL:n tietoturvaparannus
    + Liityntäpalvelin ei tietoturvasyistä enää palauta alkuperäisessä WSDL:ssä olevaa palvelun endpoint locationia kun metapalvelulta haetaan WSDL
- Paikallisen X-Roadin ja kehitysympäristön pystyttämiseen parannusta
    + [X-Road installation instructions](https://github.com/ria-ee/X-Road/blob/develop/ansible/README.md) ja [Build environment and local X-Road instances](https://github.com/ria-ee/X-Road/blob/develop/src/Vagrant.md)
- Liityntäpalvelimen vanhentuvien varmenteiden uusimiseen on tehty ohje
    + [Liityntäpalvelimen vanhenevien varmenteiden uusiminen](https://esuomi.fi/palveluntarjoajille/palveluvayla/tekninen-aineisto/hyva-tietaa/liityntapalvelimen-vanhenevien-varmenteiden-uusiminen/)
    + Liityntäpalvelinsertifikaattien uusimiseen lomake
        * [Liityntäpalvelinsertifikaattien uusiminen](https://esuomi.fi/palveluntarjoajille/palveluvayla/liityntapalvelinsertifikaattien-uusiminen/)

---

template: sininen-palkki
# Mitä uutta versiossa 6.16.0?

- Lue koko julkaisutiedote eSuomi.fi -osoitteesta [Suomi.fi-palveluväylän versio 6.16.x julkaistaan](https://esuomi.fi/suomi-fi-palveluvaylan-versio-6-16-x-julkaistaan/)

---

template: header
# Kysymyksiä?

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
# Varmenteiden uusiminen

---

template: sininen-palkki

# Varmenteiden vanheneminen

- Varmenteet ovat voimassa 2 vuotta (kehitys-, testi- ja tuotantoympärissä)
   - Ylläpito saattaa asiasta huomauttaa
   - Hyvä kuitenkin olla tietoinen mahdollisesti lähestyvästä expireoitumispäivästä, jotta niihin ehditään puuttua ja vältytään käyttökatkolta
![vanheminen](../images/varmenteiden-vanheneminen.png)

---

template: sininen-palkki

# Varmenteiden uusiminen (1/2)

- Hyvin samanlainen prosessi mitä asennusvaiheessa (hallintakäyttöliittymässä)
- Luodaan luoduille palvelin- ja allekirjoitusavaimille uudet allekirjoituspyynnöt
   - Suosikaa PEM formaattia allekirjoituspyynnöissä (VRK Varmennepalvelun toive)
   - Lähetetään ylläpidolle allekirjoitettavaksi: palveluvayla@palveluvayla.fi
![luominen](../images/varmenteen-luominen.png)

---

template: sininen-palkki
class: split-70

# Varmenteiden uusiminen (2/2)

.column[
- Importoidaan allekirjoitetut varmenteet
- TÄRKEÄÄ! Antakaa uusien varmenteiden olla rinnakkain aktiivisina vanhenemassa olevien varmenteiden kanssa ainakin vuorokauden ajan
   - Status pitäisi olla *registered* ja OCSP response *good*
   - Tieto uudesta varmenteesta ehtii leviämään palveluväyläympäristön sisällä
- Sen jälkeen vanhenevat varmenteet voi disabloida ja poistaa
]

.column[![status](../images/varmenteiden-status.png)]

---

template: sininen-palkki

# Uusien varmenteiden hankkimen

- Testi- ja tuotantoympäristössä organisaation täytettävä uusittavat hakemukset eSuomen sivuilta (rasti ruutuun)

![varmenne](../images/varmenne-lomake.png)

---

template: sininen-palkki

# Varmenteiden hallinta (osa 1)

![hallinta](../images/varmenteiden-hallinta-1.png)

---

template: sininen-palkki

# Varmenteiden hallinta (osa 2)

![hallinta](../images/varmenteiden-hallinta-2.png)

---

template: sininen-palkki

# Miksi asiakkaan tarvitsee toimia välikätenä?

- Varmenteiden tilaamista varten tarvitaan toimija, jolla on organisaation nimenkirjoitusoikeus
- Mikäli varmenteita tilaa henkilö, jolla ei ole organisaation nimenkirjoitusoikeutta, tulee olla valtakirja. Valtakirjaksi riittää yleensä yksinkertainen
   - ”Valtuutamme Nano Nano Organisaation X edustajana hakemaan palvelinvarmenteita Väestörekisterikeskukselta organisaatio.fi – verkkotunnukselle.” (+Allekirjoittajana organisaation nimenkirjoitusoikeuden haltija)

---
template: header
# Kysymyksiä?

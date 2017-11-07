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
# PIN-koodi

---

template: sininen-palkki
class: split-55

# PIN-koodin rajoitukset

.column[
- Suojaa hallintakäyttöliittymään konfiguroituja avaimia
- Liityntäpalvelimen asentajan päättämä koodi, jonka pituus on vähintään 10 merkkiä.
- PIN-koodissa pitää olla merkkejä vähintään kolmesta luokasta:
   - pienet kirjaimet,
   - isot kirjaimet,
   - numerot,
   - erikoismerkit.
- PIN-koodi täytyy säilyttää turvallisessa paikassa.
   - Palauttaminen ei ole mahdollista
]
.column[![PIN-koodi](../images/pin-koodi.png)]

---

template: sininen-palkki

# PIN-koodin virheitä

- PIN-koodi syötettävä aina palvelimen tai xroad-signer -prosessin uudelleenkäynnistyksen jälkeen
- Sanomien lähettäminen epäonnistuu, jos koodin aktivointi on jäänyt tekemättä.
   - Sanomat palauttavat faultcodea, joita kutsu palauttaa
   - Virheviestit tarkasteltavissa proxy-lokista
   
---

template: sininen-palkki

# PIN-koodi aktivoimatta
   
- Kutsujan (consumer) liityntäpalvelimella PIN-koodi syöttämättä - kutsu palauttaa:

```
<SOAP-ENV:Body>
    <SOAP-ENV:Fault>
         <faultcode>Server.ClientProxy.SslAuthenticationFailed</faultcode>
         <faultstring>Service provider did not send correct authentication certificate</faultstring>
         <faultactor/>
         <detail>
            <faultDetail>76269a4f-94b5-4a2a-9823-a6eb1b1554ae</faultDetail>
         </detail>
    </SOAP-ENV:Fault>
</SOAP-ENV:Body>
```

---

template: sininen-palkki

# PIN-koodi aktivoimatta

- Palveluntarjoajan provider-liityntäpalvelimella PIN-koodi syöttämättä - kutsu palauttaa:

```
<SOAP-ENV:Body>
    <SOAP-ENV:Fault>
         <faultcode>Server.ClientProxy.CannotCreateSignature.Signer.TokenNotActive</faultcode>
         <faultstring>Token 'softToken' not active</faultstring>
         <faultactor/>
         <detail>
            <faultDetail>f7bd5c00-69a6-49f2-b767-069d54060957</faultDetail>
         </detail>
    </SOAP-ENV:Fault>
</SOAP-ENV:Body>
```

---

template: sininen-palkki

# Automaattinen PIN-koodin syöttö

- Tuettu ratkaisu automaattiseen PIN-koodin syöttöön uusimmassa versiossa 6.16 
    - Ratkaisu helpottamaan mm. kuormantasaajaliityntäpalvelimien ylläpitoa
- Asennusohjeet Githubissa: 
https://github.com/ria-ee/X-Road/blob/master/doc/Manuals/Utils/ug-autologin_x-road_v6_autologin_user_guide.md 

---
template: header
# Kysymyksiä?

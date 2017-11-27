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
# Rest Adapter

---

template: sininen-palkki
class: split-55

# Consumer ja/tai Provider adapter

![Kuva](../images/rest-adapter-kayttotapaukset.png)

---

template: sininen-palkki
class: split-55

# Tuetut toiminnot

![Kuva](../images/rest-adapter-toiminnot.png)

---

template: sininen-palkki
class: split-55

# Accept:application/json

.column[![Kuva](../images/rest-adapter-clip.png)]
.column[
```
{

   "PaluuKoodi": "OK",
   "Teksti": "bar tekstiä",
   "TekstiLisatiedot": "Foo tekstiä",
   "Tarkenne": "Foo tarkenne"
}
```
]
---

template: sininen-palkki
class: split-55

# Accept:application/xml

.column[![Kuva](../images/rest-adapter-clip.png)]
.column[
```
<toimija:HaeToimijaPFFResponse xmlns:toimija="http://vrk.fi/example/toimija">
   <toimija:PaluuKoodi>OK</toimija:PaluuKoodi>
   <toimija:Teksti>bar tekstiä</toimija:Teksti>
   <toimija:TekstiLisatiedot>Foo tekstiä</toimija:TekstiLisatiedot>
   <toimija:Tarkenne>Foo tarkenne</toimija:Tarkenne>
</toimija:HaeToimijaPFFResponse>

```
]
---

template: sininen-palkki
class: split-55

# wrappers=false

.column[![Kuva](../images/rest-adapter-clip.png)]
.column[
```
<SOAP-ENV:Body>
    <toimija:HaeToimijaPTF xmlns:toimija="http://vrk.fi/example/toimija">
        <toimija:Tunniste2>foobar2</toimija:Tunniste2>
        <toimija:Tunniste>foobar1</toimija:Tunniste>
    </toimija:HaeToimijaPTF>
</SOAP-ENV:Body>
```
]

---

template: sininen-palkki
class: split-55

# wrappers=true

.column[![Kuva](../images/rest-adapter-clip.png)]
.column[
```
<SOAP-ENV:Body>
    <toimija:HaeToimijaPTF xmlns:toimija="http://vrk.fi/example/toimija">
        <toimija:request>
            <toimija:Tunniste2>foobar2</toimija:Tunniste2>
            <toimija:Tunniste>foobar1</toimija:Tunniste>
        </toimija:request>
    </toimija:HaeToimijaPTF>
</SOAP-ENV:Body>
```
]


---

template: sininen-palkki
class: split-55

# Automaattiset integraatiotestit gdevissä

![Kuva](../images/rest-adapter-gdev.png)

- Jenkins
  - https://dev-jenkins.palveluvayla.com:8082/view/rest-adapter-service/job/rest-adapter-service-getCompany-gdev-rh1-ss1/
  - https://dev-jenkins.palveluvayla.com:8082/view/rest-adapter-service/job/rest-adapter-service-organizationlist-gdev-rh1-ss1/
- https://confluence.csc.fi/pages/viewpage.action?pageId=66685001

---

# PIN-koodin rajoitukset

.column[
- Suojaa hallintakäyttöliittymään konfiguroituja avaimia
- Liityntäpalvelimen asentajan päättämä koodi, jonka pituus on vähintään 10 merkkiä.
- PIN-koodissa pitää olla merkkejä vähintään kolmesta luokasta:
   - pienet kirjaimet,
   - isot kirjaimet,
   - numerot,
   - erikoismerkit.
]
.column[![PIN-koodi](../images/pin-koodi.png)]

---

# Yada yada
   
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

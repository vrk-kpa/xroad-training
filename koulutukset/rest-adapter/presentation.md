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
```json
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
```xml
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

# URL parameterit ja resourceId
```shell
13.path=/parametersdemo/{resourceId}
13.verb=post
13.convertPost=true
```
POST -> http://host/rest-adapter-service/Consumer/parametersdemo/88?someparam=banana
```json
{ 
    "Tunniste": "foo1",
    "Tunniste2": "bar2",
}
```
```xml
<SOAP-ENV:Body>
    <foo:Foo xmlns:foo="http://vrk.fi/example/foo">
        <foo:resourceId>88</foo:resourceId>
        <foo:someparam>banana</foo:someparam>
        <foo:Tunniste2>bar2</foo:Tunniste2>
        <foo:Tunniste>foo1</foo:Tunniste>
    </foo:Foo>
</SOAP-ENV:Body>
```

---
template: sininen-palkki
class: split-55

# URL parameterit ja resourceId, 2
```shell
13.path=/parametersdemo/{resourceId}
13.verb=post
13.convertPost=false
```
POST -> http://host/rest-adapter-service/Consumer/parametersdemo/88?someparam=banana
```json
{ 
    "Tunniste": "foo1",
    "Tunniste2": "bar2",
}
```
```xml
<SOAP-ENV:Body>
    <foo:Foo xmlns:foo="http://vrk.fi/example/foo">
        <foo:resourceId>88</foo:resourceId>
        <foo:someparam>banana</foo:someparam>
        <foo:RESTGatewayRequestBody href="RESTGatewayRequestBody"/>
    </foo:Foo>
</SOAP-ENV:Body>
```

---
template: sininen-palkki
class: split-55

# URL parameterit ja resourceId, 3
```shell
13.path=/parametersdemo/{resourceId}
13.verb=get
```
GET -> http://host/rest-adapter-service/Consumer/parametersdemo/88?someparam=banana
```xml
<SOAP-ENV:Body>
    <foo:Foo xmlns:foo="http://vrk.fi/example/foo">
        <foo:resourceId>88</foo:resourceId>
        <foo:someparam>banana</foo:someparam>
    </foo:Foo>
</SOAP-ENV:Body>
```

---

template: sininen-palkki
class: split-55

# wrappers=false

.column[![Kuva](../images/rest-adapter-clip.png)]
.column[
```xml
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

# Yhden namespacen tuki

.column[![Kuva](../images/rest-adapter-clip.png)]
.column[
```shell
1.namespace.serialize=http://vrk.fi/example/viesti
1.namespace.prefix.serialize=vies
1.namespace.deserialize=http://vrk.fi/example/viesti
```

```xml
<SOAP-ENV:Body>
    <vies:LisaaViesti xmlns:vies="http://vrk.fi/example/viesti">
        <vies:LahettajaTunniste>tunniste-123</vies:LahettajaTunniste>
        <vies:Viesti>
            <vies:ViestiKetjuTunniste>12345678</vies:ViestiKetjuTunniste>
            <vies:Otsikko>otsikko string</vies:Otsikko>
            <vies:Sisalto>sisältö string</vies:Sisalto>
            <vies:Liite>
                <vies:Otsikko>liite-otsikko-1</vies:Otsikko>
                <vies:Nimi>liite-1</vies:Nimi>
                <vies:MediaTyyppi>application/pdf</vies:MediaTyyppi>
            </vies:Liite>
            <vies:Liite>
                <vies:Otsikko>liite-otsikko-2</vies:Otsikko>
                <vies:Nimi>liite-2</vies:Nimi>
                <vies:MediaTyyppi>image/png</vies:MediaTyyppi>
            </vies:Liite>
        </vies:Viesti>
    </vies:LisaaViesti>
</SOAP-ENV:Body>
```
]

---

template: sininen-palkki
class: split-55

# Useampi namespace ei ole tuettu

.column[![Kuva](../images/rest-adapter-clip.png)]
.column[
```xml
<SOAP-ENV:Body>
    <vies:LisaaViesti xmlns:vies="http://vrk.fi/example/viesti">
        <vies:LahettajaTunniste>tunniste-123</vies:LahettajaTunniste>
        <vies:Viesti>
            <vies:ViestiKetjuTunniste>12345678</vies:ViestiKetjuTunniste>
            <vies:Otsikko>otsikko string</vies:Otsikko>
            <vies:Sisalto>sisältö string</vies:Sisalto>
            <liite:Liite xmlns:liite="http://vrk.fi/example/liite">
                <liite:Otsikko>liite-otsikko-1</liite:Otsikko>
                <liite:Nimi>liite-1</vies:Nimi>
                <liite:MediaTyyppi>application/pdf</liite:MediaTyyppi>
            </liite:Liite>
            <liite:Liite xmlns:liite="http://vrk.fi/example/liite">
                <liite:Otsikko>liite-otsikko-2</liite:Otsikko>
                <liite:Nimi>liite-2</liite:Nimi>
                <liite:MediaTyyppi>image/png</liite:MediaTyyppi>
            </vies:Liite>
        </vies:Viesti>
    </vies:LisaaViesti>
</SOAP-ENV:Body>
```
]

---

template: sininen-palkki
class: split-55

# X-Road headerit

.column[![Kuva](../images/rest-adapter-clip.png)]
.column[
- Adapter osaa muuntaa X-Road headerit HTTP headereiksi, ja päinvastoin
- Consumer voi asettaa vain userId ja id headerin

HTTP Header  | X-Road Header
------------- | -------------
X-XRd-Client  | client
X-XRd-Service  | service
X-XRd-UserId  | userId
X-XRd-MessageId  | id
]


---

template: sininen-palkki
class: split-55

# Salaus

.column[![Kuva](../images/rest-adapter-clip.png)]
.column[
```shell
10.convertPost=true
10.request.encrypted=true
10.response.encrypted=true
```
POST http://.../Consumer/crypted/
```json
{ "Tunniste": "12345" }
```
Provider:
```xml
<SOAP-ENV:Body>
    <toimija:HaeToimijaPTT xmlns:toimija="http://vrk.fi/example/toimija">
        <toimija:encrypted>+y48Nr3yvz7eFu+...</toimija:encrypted>
        <toimija:key>aBIeAMn+eDFhR...</toimija:key>
        <toimija:iv>YhZBl8HmfJtwvwYLqvdrRw==</toimija:iv>
    </toimija:HaeToimijaPTT>
</SOAP-ENV:Body>
```
]

---

template: sininen-palkki
class: split-55

# Salaus, 2

.column[![Kuva](../images/rest-adapter-clip.png)]
.column[
```shell
10.convertPost=false
10.request.encrypted=true
10.response.encrypted=true
```
```xml
<SOAP-ENV:Body>
    <toimija:HaeToimijaPTT xmlns:toimija="http://vrk.fi/example/toimija">
        <toimija:encrypted>matjTIPx5rUwrRI2U...</toimija:encrypted>
        <toimija:key>Le5AbsrbyuBhhxJ...</toimija:key>
        <toimija:iv>9Io8MPcB+358Ff9lspbbHA==</toimija:iv>
    </toimija:HaeToimijaPTT>
</SOAP-ENV:Body>
```
```shell
..------=_Part_3_2034243225.1511790096912
..Content-Type: application/json;charset=UTF-8
..Content-ID: RESTGatewayRequestBody
....87HmG1lW7i2zpxAtTQB+F/ghEweBqXKbuSHOul+apmI=
..------=_Part_3_2034243225.1511790096912--                   
```

]

---

template: sininen-palkki
class: split-55

# Salaus, 3

1. Consumer ja Provider vaihtavat julkiset avaimensa (CP1, PP1) _jotenkin_ 
2. Consumer luo kertakäyttöisen avaimen K1
3. Consumer salaa datan avaimella K1
4. Consumer salaa K1:n PP1:llä
5. Consumer lähettää (1) salatun datan, (2) salatun K1:n ja (3) IV:n
- Konfigurointi, consumer-gateway.properties:
```shell
publicKeyFile=/home/janne/kapa/.../consumertruststore.jks
publicKeyFilePassword=consumerts
privateKeyFile=/home/janne/.../consumerkeystore.jks
privateKeyFilePassword=consumerks
privateKeyAlias=consumerpri
privateKeyPassword=consumer
```
- Trustoreen tallennetaan varmenteet niin että alias on palvelun tai clientin tunniste
https://github.com/vrk-kpa/REST-adapter-service/blob/master/documentation/Encryption.md

---

template: sininen-palkki
class: split-55

# wrappers=false

.column[![Kuva](../images/rest-adapter-clip.png)]
.column[
```xml
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
```xml
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

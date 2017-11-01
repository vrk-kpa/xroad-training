## Running presentation

The presentation root is available in Github at https://vrk-kpa.github.io/xroad-training/


## Running presentation on local machine

Depending on what version of Python you have:

Find out python version: `python --version`

If Python 2.x: `python -m SimpleHTTPServer 8080`

If Python 3.x: `python -m http.server 8080`

You can then access the presentation at `http://localhost:8080`


## Creating new presentation

Run script `sh create-new-presentation.sh [presentation-name]`

If you add any images to presentation, put them in image folder under koulutukset. That way they can be used in different presentations.

Add new presentation to root folder index page as a link.

```html
<li><a href="koulutukset/{presentation-name}">NIMI</a><br />Lisätietoa</li>
```

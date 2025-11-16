# Schadenmeldungen mit XML und XSLT

Dieses Projekt zeigt, wie Schadenmeldungen in XML gespeichert und mit XSLT in eine HTML-Tabelle transformiert werden.

## Dateien
- `data.xml` – Beispielhafte Schadenmeldungen
- `template.xsl` – Stylesheet zur Transformation

## Nutzung
Moderne Browser blockieren lokale XSLT-Dateien, wenn sie über `file://` geöffnet werden:

- **Chrome/Edge:** zeigen keine Ausgabe (leer).
- **Firefox:** zeigt nur Rohtext ohne Zeilenumbrüche; die XSLT-Datei wird lokal blockiert.
- **Lösung:** Dateien über HTTP bereitstellen (z. B. mit `python -m http.server` oder über GitHub Pages).  
  Dann funktioniert die Transformation korrekt in allen modernen Browsern.
- **Alternative:** Online-Tools wie [FreeFormatter](https://www.freeformatter.com/xsl-transformer.html) für eine schnelle Vorschau.

## Beispielausgabe
![Schadenmeldungen Tabelle](docs/schadenmeldungen.png)


| Kunde           | Fahrzeug | Schadenart   | Betrag (€) |
|-----------------|----------|--------------|------------|
| Max Mustermann  | VW Golf  | Frontscheibe | 850        |
| Erika Beispiel  | BMW 3er  | Stoßstange   | 1200       |

## Live-Demo

👉 [Direkt zur Vorschau](https://mzakotin123.github.io/Schadenmeldungen/data.xml)

Die Schadenmeldungen werden per XSLT als HTML-Tabelle dargestellt.

# Schadenmeldungen mit XML und XSLT

Dieses Projekt zeigt, wie Schadenmeldungen in XML gespeichert und mit XSLT in eine HTML-Tabelle transformiert werden.

## Dateien
- `data.xml` – beispielhafte Schadenmeldungen
- `template.xsl` – Stylesheet zur Transformation
- `template.xsl_fo`- Stylesheet zur Transformation in ein formatiertes Objekt (*.fo-Datei) und anschließend in eine PDF-Datei
- `output.fo` - fo = formatted object (formatiertes Objekt): umgewandelte *.xml-Datei mit einer formatierten *.xls-Datei ohne Dateityp
- `output.pdf` - PDF-Datei mit Ausgabe als Endergebnis einer XLS-FO-Umwandlung mithilfe von Apache FOP sowie der Datei "output.fo"

## Nutzung der Umwandlung von XML in HTML mithilfe von XSLT
Moderne Browser blockieren lokale XSLT-Dateien, wenn sie über `file://` geöffnet werden:

- **Chrome/Edge:** zeigen keine Ausgabe (leer).
- **Firefox:** zeigt nur Rohtext ohne Zeilenumbrüche; die XSLT-Datei wird lokal blockiert.
- **Lösung:** Dateien über HTTP bereitstellen (z. B. mit `python -m http.server` oder über GitHub Pages).  
  Dann funktioniert die Transformation korrekt in allen modernen Browsern.
- **Alternative:** Online-Tools wie [FreeFormatter](https://www.freeformatter.com/xsl-transformer.html) für eine schnelle Vorschau.

## Beispielausgabe

| Kunde           | Fahrzeug | Schadensart   | Betrag (€) |
|-----------------|----------|---------------|------------|
| Max Mustermann  | VW Golf  | Frontscheibe  | 850        |
| Erika Beispiel  | BMW 3er  | Stoßstange    | 1200       |

## Live-Demo

👉 [Direkt zur Vorschau](https://mzakotin123.github.io/Schadenmeldungen/data.xml)

Die Schadenmeldungen werden per XSLT als HTML-Tabelle dargestellt.

## PDF-Erzeugung mit Saxon und Apache FOP

Dieses Projekt demonstriert die Transformation von XML-Daten in ein PDF-Dokument mithilfe von XSLT und XSL-FO.

### Schritte

**XML → XSL-FO mit SaxonHE 12.9 über die Eingabeaufforderung (cmd)**

   1. C:\Users\user>cd C:\Users\user\Dokumente\Schadenmeldungen  
      (ins Verzeichnis mit der XML- sowie der formatierten XSL-Datei wechseln)

   2. C:\Users\user\Dokumente\Schadenmeldungen>C:\Users\user\Downloads\SaxonHE12-9J\saxon-he-12.9.jar  
      (SaxonHE-12.9.JAR-Datei starten)

   3. C:\Users\user\Dokumente\Schadenmeldungen>java -jar C:\Users\user\Downloads\SaxonHE12-9J\saxon-he-12.9.jar -s:data.xml -   xsl:template_fo.xsl -o:output.fo  
      (aus der XML-Datei "data" sowie der formatierten XSL-Datei "template_fo" formatiertes Objekt "output.fo" erstellen) 

   4. C:\Users\user\Dokumente\Schadenmeldungen>"C:\Users\user\Downloads\fop-2.11-bin\fop-2.11\fop\fop.cmd" output.fo output.pdf  
   (Anschließend wird mithilfe des Verzeichnisses der CMD-Datei "fop" sowie der FO-Datei "output.fo" eine PDF-Datei "output.pdf" erzeugt.)


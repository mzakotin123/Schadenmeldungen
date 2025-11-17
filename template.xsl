<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head><title>Schadenmeldungen</title></head>
      <body>
        <h2>Schadenmeldungen</h2>
        <table border="1">
          <tr>
            <th>Kunde</th>
            <th>Fahrzeug</th>
            <th>Schadensart</th>
            <th>Betrag (€)</th>
          </tr>
          <xsl:for-each select="schadenmeldungen/meldung">
            <tr>
              <td><xsl:value-of select="kunde"/></td>
              <td><xsl:value-of select="fahrzeug"/></td>
              <td><xsl:value-of select="schadensart"/></td>
              <td><xsl:value-of select="betrag"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>


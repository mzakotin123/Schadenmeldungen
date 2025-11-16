<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4"
          page-height="29.7cm" page-width="21cm" margin="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="A4">
        <fo:flow flow-name="xsl-region-body">
          <fo:block font-size="14pt" font-weight="bold" space-after="10pt">
            Schadenmeldungen
          </fo:block>

          <fo:table border="solid 1pt black" table-layout="fixed" width="100%">
            <fo:table-header>
              <fo:table-row>
                <fo:table-cell border="solid 1pt black">
                  <fo:block>Kunde</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid 1pt black">
                  <fo:block>Fahrzeug</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid 1pt black">
                  <fo:block>Schadenart</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid 1pt black">
                  <fo:block>Betrag (€)</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-header>

            <fo:table-body>
              <xsl:for-each select="schadenmeldungen/meldung">
                <fo:table-row>
                  <fo:table-cell border="solid 1pt black">
                    <fo:block><xsl:value-of select="kunde"/></fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid 1pt black">
                    <fo:block><xsl:value-of select="fahrzeug"/></fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid 1pt black">
                    <fo:block><xsl:value-of select="schadenart"/></fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid 1pt black">
                    <fo:block><xsl:value-of select="betrag"/></fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>
          </fo:table>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
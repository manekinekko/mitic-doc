<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" />

	<xsl:variable name="style" select="document('style.xml')" />

	<xsl:template match="/">

		<svg xmlns="http://www.w3.org/2000/svg" width="1000px" height="400px"
			viewBox="0 0 70 110" preserveAspectRatio="yes">

			<g>
				<xsl:for-each-group select="annee/mois" group-by="@numero">
					<xsl:variable name="y" select="100 - number(./text())"/>
					<rect x="{@numero * 10}" y="{ $y }" width="10" height="{./text()}"
						fill="{$style/style/color[ number(current-group()/@numero) ][position()]}"
						stroke="black" />
					<text x="{ (@numero * 10)}" y="{$y - 5}" font-size="5">
						<xsl:value-of select="./text()"/>%
					</text>

				</xsl:for-each-group>
			</g>


		</svg>
	</xsl:template>

</xsl:stylesheet>
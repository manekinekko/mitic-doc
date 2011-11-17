<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:variable name="style" select="document('../style.xml')" />
	<xsl:variable name="nb_mois" select="count(/annee/mois) * 10"></xsl:variable>

	<xsl:template match="/">

		<html>
			<head>
				<title>R&#233;sultat annuel</title>
			</head>
			<body>
				<h1>R&#233;sultat annuel</h1>
				<h2>En chiffre</h2>
				<ul>

					<xsl:for-each-group select="/annee/mois"
						group-by="@numero">
						<li><strong><xsl:value-of select="current-group()/@nom" /></strong> - <xsl:value-of select="current-group()/text()" /></li>
					</xsl:for-each-group>

				</ul>

				<h2>En histogramme</h2>
				<svg xmlns="http://www.w3.org/2000/svg" width="1000px" height="400px"
					viewBox="0 0 {$nb_mois} {$nb_mois}" preserveAspectRatio="yes">

					<g>
						<xsl:for-each-group select="annee/mois"
							group-by="@numero">
							<xsl:variable name="y" select="100 - number(./text())" />
							<rect x="{@numero * 10}" y="{ $y }" width="10" height="{./text()}"
								fill="{$style/style/color[ number(current-group()/@numero) ][position()]}"
								stroke="black" />
							<text x="{ (@numero * 10)}" y="{$y - 5}" font-size="5">
								<xsl:value-of select="./text()" />%
							</text>

						</xsl:for-each-group>
					</g>

				</svg>
			</body>

		</html>

	</xsl:template>


</xsl:stylesheet>
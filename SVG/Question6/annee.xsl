<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

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
				<img src="../Question4/annee.svg" alt="histogramme par mois"
					height="80%" width="80%" />
			</body>

		</html>

	</xsl:template>


</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:variable name="style" select="document('../style.xml')" />

	<xsl:template match="/">

		<html>
			<head>
			</head>

			<body>

				<svg xmlns="http://www.w3.org/2000/svg" width="1000px" height="400px"
					viewBox="0 0 70 100" preserveAspectRatio="yes"
					xmlns:xlink="http://www.w3.org/1999/xlink">

					<defs>
						<g id="graphic">

							<xsl:variable name="first_year"
								select="(/films/year[1]/@value div 10) * 10"></xsl:variable>

							<xsl:for-each-group select="films/year"
								group-by="@value">

								<xsl:if test=" @value mod 10 = 0">

									<xsl:variable name="decennie" select="(@value div 10)" />
									<xsl:variable name="annees__"
										select="/films/year[ starts-with(@value, string($decennie)) ]" />

									<xsl:variable name="x" select="10 + @value - $first_year" />
									<xsl:variable name="y"
										select="90 - sum($annees__/@number_films)" />
									<xsl:variable name="h" select="sum($annees__/@number_films)" />
									
									<!-- on prend la 4eme couleur arbitrairement -->
									<xsl:variable name="fill" select="$style/style/color[4]" />

									<rect x="{ $x }" y="{ $y }" width="5" height="{ $h }"
										fill="{ $fill }" />
									<text font-size="3" y="100" x="{ $x - 2 }">
										<xsl:value-of select="$decennie * 10" />
									</text>

								</xsl:if>

							</xsl:for-each-group>
						</g>
						<g id="axe">

							<line x1="6" y1="35" x2="6" y2="90"
								style="stroke:gray;stroke-width:0.5" />

							<xsl:for-each select="(100, 90, 80, 70, 60, 50)">

								<text y="{current()-10}" font-size="3">
									<xsl:value-of select="100 - current()"></xsl:value-of>
								</text>
								<line x1="5.5" y1="{current()-10}" x2="6.5" y2="{current()-10}"
									style="stroke:gray;stroke-width:0.5" />

							</xsl:for-each>

						</g>

					</defs>

					<g>
						<use xlink:href="#graphic" />
						<use xlink:href="#axe" />
					</g>


				</svg>

				<h2>Histogramme des nombre de films par decade</h2>

			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:variable name="style" select="document('style.xml')" />

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

							<xsl:for-each-group select="films/year"
								group-by="@value">

								<xsl:if test=" @value mod 10 = 0">
								
									<xsl:variable name="decennie" select="(@value div 10)" />
									<xsl:variable name="annees__" select="/films/year[ starts-with(@value, string($decennie)) ]" />
	
									<xsl:variable name="x" select="position() + 5" />
									<xsl:variable name="y" select="100 - sum($annees__/@number_films)" />
									<xsl:variable name="h" select="sum($annees__/@number_films)" />
									<xsl:variable name="fill"
										select="$style/style/color[4]" />

									<rect x="{ $x }" y="{ $y }" width="2" height="{ $h }" fill="{ $fill }" />
									
								</xsl:if>

							</xsl:for-each-group>
						</g>
						<g id="axe">
							
							<line x1="0" y1="0" x2="0" y2="100" style="stroke:rgb(255,0,0);stroke-width:0.5" />
							
							<xsl:for-each select="(100, 90, 80, 70, 60, 50, 40)">
						
							<text y="{current()}" size="5"><xsl:value-of select="100 - current()"></xsl:value-of></text>
							<line x1="-0.5" y1="{current()}" x2="0.5" y2="{current()}" style="stroke:rgb(255,0,0);stroke-width:0.5" />
							
							</xsl:for-each>
							
						</g>
						
					</defs>

					<g>
						<use xlink:href="#graphic"/>
						<use xlink:href="#axe" transform="translate(2, 0)" />
					</g>


				</svg>

			</body>
		</html>

	</xsl:template>

	<xsl:template name="incrementer">

		<xsl:param name="x" select="0"></xsl:param>
		<xsl:param name="entry"></xsl:param>

		<xsl:choose>

			<xsl:when test=" $entry and ($entry/@value mod 10) = 0">
				<xsl:value-of select=" $x + number($entry/@number_films) " />
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="result">
					<xsl:call-template name="incrementer">
						<xsl:with-param name="x" select="$x"></xsl:with-param>
						<xsl:with-param name="entry"
							select="$entry/following-sibling::year[1]"></xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$result + $x" />
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>


</xsl:stylesheet>
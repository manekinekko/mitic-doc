<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>

	<xsl:variable name="style" select="document('style.xml')" />

	<xsl:template match="/">

		<html>
			<head>
			</head>
		
			<body>
			
				<svg xmlns="http://www.w3.org/2000/svg" width="1000px" height="400px"
					viewBox="0 0 70 110" preserveAspectRatio="yes" xmlns:xlink="http://www.w3.org/1999/xlink">
					
					<defs>
						<g id="graphic">
							<xsl:for-each-group select="films/year" group-by="@value">
								<xsl:variable name="x" select="position() * 10"/>
								<xsl:variable name="y" select="@number_films"/>
								<xsl:variable name="h" select="@number_films"/>
								
								<rect x="{ $x }" y="{ $y }" width="10" height="{ $h }"
									fill="{$style/style/color[ number(current-group()/@number_films) ][position()]}"
									/>
			
							</xsl:for-each-group>
						</g>
					</defs>
		
					<g>
						<use xlink:href="#graphic" transform="translate(0,0) scale(1)" />
					</g>
					
		
				</svg>
			
			</body>
		</html>
	
	</xsl:template>

</xsl:stylesheet>
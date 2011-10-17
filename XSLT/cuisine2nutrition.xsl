<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" />

	<xsl:template match="/recettes/recette">
		
		<nutrition>
			
			<xsl:for-each-group select="nutrition" group-by="nutrition">
				<plat nom="{current-group()/nom/text()}">
				</plat>
			</xsl:for-each-group>


		</nutrition>


	</xsl:template>
</xsl:stylesheet>
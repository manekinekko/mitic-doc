<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="nutrition.dtd"/>

	<xsl:template match="/recettes">
		<nutrition>
			
			<xsl:for-each-group select="recette/nutrition" group-by="@calories">
				<plat 
					nom="{current-group()/parent::recette/nom/text()}"
					calories="{@calories}"
					gras="{@gras}" 
					glucides="{@glucides}" 
					proteines="{@proteines}"
					alcool="{ if ( @alcool ) then @alcool else '0' }"
				>
				</plat>
			</xsl:for-each-group>


		</nutrition>


	</xsl:template>
</xsl:stylesheet>
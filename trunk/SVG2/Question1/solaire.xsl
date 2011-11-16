<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />


	<xsl:template match="/">

		<html>

			<head></head>

			<body>
				<xsl:call-template name="dessinerNoeud">
					<xsl:with-param name="profondeur" select="0"></xsl:with-param>
					<xsl:with-param name="noeud_courant" select="."></xsl:with-param>
				</xsl:call-template>
			</body>
		</html>

	</xsl:template>

	<!--  -->
	<xsl:template name="dessinerNoeud">
		<xsl:param name="profondeur" select="0" />
		<xsl:param name="noeud_courant" />
		
		<p>
		<xsl:call-template name="for">
			<xsl:with-param name="i" select="1"></xsl:with-param>
			<xsl:with-param name="count" select="$profondeur"></xsl:with-param>
		</xsl:call-template>
		<xsl:value-of select="name()"></xsl:value-of>
		</p>

		<xsl:for-each select="$noeud_courant/*">

			<xsl:call-template name="dessinerNoeud">
				<xsl:with-param name="profondeur" select=" $profondeur+1 "></xsl:with-param>
				<xsl:with-param name="noeud_courant" select="."></xsl:with-param>
			</xsl:call-template>


		</xsl:for-each>
		
	</xsl:template>
	
	<!--  -->
	<xsl:template name="for">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="count"></xsl:param>

		<xsl:if test=" $i &lt; $count ">
			<xsl:text>...</xsl:text>
			<xsl:call-template name="for">
				<xsl:with-param name="i" select="$i+1"></xsl:with-param>
				<xsl:with-param name="count" select="$count"></xsl:with-param>
			</xsl:call-template>
		</xsl:if>

	</xsl:template>

</xsl:stylesheet>
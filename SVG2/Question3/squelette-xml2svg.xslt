<?xml version="1.0" encoding="ISO-8859-15"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="ISO-8859-15"
		indent="yes" doctype-public="-//W3C//DTD SVG 1.1//EN"
		doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" />

	<xsl:param name="text.style" select="'fill:#000000;stroke:none;'" />
	<xsl:param name="handle.path.style"
		select="'stroke-width:0.5;stroke-miterlimit:3;fill:none;'" />
	<xsl:param name="graph.style">
		fill-rule:nonzero;clip-rule:nonzero;fill:#FFFFD0;
		stroke:#000000;stroke-miterlimit:4; font-family:'ArialMT';
		font-size:12;
	</xsl:param>

	<xsl:param name="handles" select="'true'" />
	<xsl:param name="root.handle" select="'false'" />
	<xsl:param name="boxes" select="'true'" />

	<xsl:param name="letterHeight" select="8" />
	<xsl:param name="letterWidth" select="8" />
	<xsl:param name="x0" select="20" />
	<xsl:param name="y0" select="20" />
	<xsl:param name="rowHeight" select="20" />
	<xsl:param name="columnWidth" select="20" />
	<xsl:param name="boxHeight" select="16" />

	<xsl:include href="string-width.xslt" />

	<!-- Pour rejeter tous les textes -->
	<xsl:template match="text()" />


	<xsl:template match="/">

		<html>

			<head></head>

			<body>
				<svg xmlns="http://www.w3.org/2000/svg" width="1000px" height="400px"
					viewBox="0 0 70 200" preserveAspectRatio="yes">

					<g transform="scale(0.5)">
						<xsl:call-template name="dessinerNoeud">
							<xsl:with-param name="profondeur" select="0" />
							<xsl:with-param name="noeud_courant" select="." />
							<xsl:with-param name="nb_element" select="0" />
						</xsl:call-template>
					</g>

				</svg>
			</body>
		</html>

	</xsl:template>

	<!-- dessiner le noeud courant -->
	<xsl:template name="dessinerNoeud">
		<xsl:param name="profondeur" select="0" />
		<xsl:param name="noeud_courant" />
		<xsl:param name="nb_element" />

		 <xsl:variable name="y"
			select="$y0 + count( preceding::* | ancestor::* ) * ($rowHeight+5)"></xsl:variable>
		<xsl:variable name="x" select="$profondeur*10"></xsl:variable>

		<xsl:if test=" $profondeur &gt; 0 ">

			<xsl:call-template name="dessiner">
				<xsl:with-param name="x" select="$x"></xsl:with-param>
				<xsl:with-param name="y" select="$y"></xsl:with-param>
				<xsl:with-param name="name" select="name()"></xsl:with-param>
				<xsl:with-param name="profondeur" select="$profondeur"></xsl:with-param>
			</xsl:call-template>

			<!-- on affiche les feuilles -->
			<xsl:if test="not(*)">
				<xsl:call-template name="dessiner">
					<xsl:with-param name="x" select="$x + 20"></xsl:with-param>
					<xsl:with-param name="y" select="$y + $rowHeight"></xsl:with-param>
					<xsl:with-param name="name" select="text()"></xsl:with-param>
					<xsl:with-param name="profondeur" select="$profondeur"></xsl:with-param>
				</xsl:call-template>
			</xsl:if>

		</xsl:if>

		<xsl:for-each select="$noeud_courant/*">

			<xsl:call-template name="dessinerNoeud">
				<xsl:with-param name="profondeur" select="$profondeur+1"></xsl:with-param>
				<xsl:with-param name="noeud_courant" select="."></xsl:with-param>
				<xsl:with-param name="nb_element" select="$nb_element+1"></xsl:with-param>
			</xsl:call-template>

		</xsl:for-each>

	</xsl:template>


	<xsl:template name="dessiner">

		<xsl:param name="x" />
		<xsl:param name="y" />
		<xsl:param name="name" />
		<xsl:param name="profondeur" />

		<xsl:if test=" string-length($name) &gt; 0 ">

			<xsl:variable name="width">
				<xsl:call-template name="string-width">
					<xsl:with-param name="s" select="$name"></xsl:with-param>
				</xsl:call-template>
			</xsl:variable>

			<!-- les lignes -->
			<xsl:if test=" $profondeur &gt; 1 ">
				<line x1="{$x - 5}" y1="{$y + ($rowHeight div 2)}" x2="{$x}"
					y2="{$y + ($rowHeight div 2)}" style="stroke:rgb(0,0,0);stroke-width:1" />
			</xsl:if>

			<!-- les rectangles -->
			<rect x="{$x}" y="{$y}" width="{$width}" height="{$rowHeight}"
				fill="white" stroke="black" />

			<!-- les textes -->
			<text font-family="ArialMT" font-size="12" x="{$x+2}" y="{$y+12}">
				<xsl:value-of select="$name"></xsl:value-of>
			</text>

			<xsl:variable name="ln"
				select=" count(child::*[ position() != last() ]/descendant-or-self::*) " />

			<xsl:if test=" $ln &gt; 0 ">
				<line x1="{$x + 5}" y1="{$y + $rowHeight}" x2="{$x + 5}"
					y2="{$y + (($rowHeight+5) * ($ln+1.4) )}" style="stroke:rgb(0,0,0);stroke-width:1" />
			</xsl:if>

		</xsl:if>
	</xsl:template>

</xsl:stylesheet>

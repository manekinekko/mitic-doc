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

	<!-- ... Remplir ici ... -->

</xsl:stylesheet>

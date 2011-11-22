<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- transform1.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:output method="xml" indent="yes" encoding="ISO-8859-1" />

	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!-- Modèle de mise en page -->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="page"
					page-height="210mm" page-width="297mm" margin-top="10mm"
					margin-bottom="10mm" margin-left="20mm" margin-right="20mm">
					<fo:region-body margin-top="15mm" margin-bottom="15mm" />
					<fo:region-before extent="20mm" />
					<fo:region-after extent="10mm" />
				</fo:simple-page-master>
			</fo:layout-master-set>

			<!-- Séquence de pages -->
			<fo:page-sequence master-reference="page">
				<fo:flow flow-name='xsl-region-body' font-size="20pt">
					<fo:block>
						<fo:inline font-style="normal" text-transform="uppercase" font-size="30pt">
						   		<xsl:text>Mondial</xsl:text>
						   	</fo:inline>
					</fo:block>
					<fo:block>
						<fo:inline>
							<xsl:text>Liste des villes</xsl:text>
						</fo:inline>
					</fo:block>
					
					<xsl:apply-templates select="mondial/country" />
					
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="country">
		<fo:block text-align="left" font-size="20pt" font-weight="bold"
			space-after="20pt">
			<!-- Titre -->
			<fo:inline>
				<xsl:text>&#42;</xsl:text>
			</fo:inline>
			<fo:inline font-size="30pt" text-transform="uppercase">
				<xsl:value-of select="./name/text()" />
			</fo:inline>
		</fo:block>
		<fo:block padding-start="80pt">
			<fo:inline font-style="italic">
				car_code
			</fo:inline>
			<fo:inline text-transform="uppercase" font-weight="bold" >
				: <xsl:value-of select="@car_code" />
			</fo:inline>
		</fo:block>
		<fo:block padding-start="80pt">
			<fo:inline font-style="italic">
				area
			</fo:inline>
			<fo:inline text-transform="uppercase" font-weight="bold" >
				: <xsl:value-of select="@area" />
			</fo:inline>
		</fo:block>
		<fo:block padding-start="80pt">
			<fo:inline font-style="italic" color="red" border-style="dashed" border-color="red">
				: <xsl:value-of select="government/text()" />
			</fo:inline>
		</fo:block>
		<fo:block padding-start="80pt">
			<fo:inline font-style="italic">
				continent
			</fo:inline>
			<fo:inline text-transform="capitalize" font-weight="bold" >
				: <xsl:value-of select="encompassed/@continent" />
			</fo:inline>
		</fo:block>
	</xsl:template>

</xsl:stylesheet>




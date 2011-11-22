<?xml version="1.0" encoding="ISO-8859-1"?> 
<!-- transform1.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
<xsl:output method="xml" indent="yes" encoding="ISO-8859-1"/>

<xsl:template match="/">
  <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <!-- Modèle de mise en page -->
    <fo:layout-master-set>
      <fo:simple-page-master master-name="page" 
			     page-height="210mm" page-width="297mm" 
			     margin-top="10mm" margin-bottom="10mm" 
			     margin-left="20mm" margin-right="20mm"> 
		<fo:region-body margin-top="15mm" margin-bottom="15mm"/> 
		<fo:region-before extent="20mm" /> 
		<fo:region-after extent="10mm"/> 
     </fo:simple-page-master> 
    </fo:layout-master-set>
    
    <!-- Séquence de pages -->
    <fo:page-sequence master-reference="page">
		<fo:flow flow-name='xsl-region-body' font-size="20pt">
			<xsl:apply-templates select="mondial" />
      </fo:flow>
    </fo:page-sequence>
  </fo:root>
</xsl:template>

<xsl:template match="mondial" >
   <fo:block text-align="center" font-size="20pt" 
   		font-weight="bold" space-after="20pt">
   		<!-- Titre -->
    	<fo:inline font-style="normal" text-transform="uppercase">
    		<xsl:value-of select="name()"/>
    	</fo:inline> :	
		<xsl:text>Liste des villes</xsl:text>
	</fo:block>  
	<xsl:apply-templates select=".//city" >
		<xsl:sort select="name" />
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="city">
  <!-- applique les règles sur les attributs de city -->
  <fo:block space-before="14pt" font-size="10pt"> 
    <xsl:apply-templates select="longitude|latitude|name|population" />    
  </fo:block>
</xsl:template>

<!-- Traitement des éléments de city :
 copier le nom de l'élément et donner sa valeur -->
<xsl:template match="longitude|latitude|name|population" >
  <fo:block> 
    <fo:inline font-style="italic">
      <xsl:value-of select="name(.)" /> 
    </fo:inline> : 
    <fo:inline font-weight="bold"> 
      <xsl:value-of select="." />
    </fo:inline> 
  </fo:block>
</xsl:template>

</xsl:stylesheet>




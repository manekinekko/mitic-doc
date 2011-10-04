<?xml version="1.0" encoding="ISO-8859-15"?>
<!-- DOC - TP XPath -->
<!-- test2.xsl -->
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:top500="http://www.top500.org/xml/top500/1.0">
	<xsl:output method="xml" version="1.0" indent="yes"	encoding="UTF-8" 
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>
	
<!-- Produire une page HTML -->
	<xsl:template match="top500:list">
		<html>
			<head>
				<title>Question 2 XPath</title>
			</head>
			<body>
				<h1>Question 2 - binôme ??? </h1>
				<p><xsl:value-of select="@date"/></p>
				<table border="1">
					<tbody>
						<tr>
							<th>Rang</th>
							<th>Nom du constructeur</th>
							<th>Nom de la machine</th>
							<th>Pays</th>
							<th>Puissance théorique maximale</th>
							<th>ID</th>
						</tr>
    <!-- INSERER VOTRE EXPRESSION XPath dans le select="..." -->
	<!-- Exemple : afficher le premier site -->
	 				<xsl:apply-templates select="//top500:site[ top500:rank/text() &lt; 16 ]"/>              	
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	
<!-- Afficher un site (une ligne dans la table) -->	
	<xsl:template match="top500:site"> 
		<tr>
			<td><xsl:value-of select="top500:rank"/></td>
			<td><xsl:value-of select="top500:manufacturer"/></td>
			<td><em><xsl:value-of select="top500:computer"/></em></td>
			<td><xsl:value-of select="top500:country"/></td>
			<td><xsl:value-of select="top500:r-peak"/></td>
			<td><xsl:value-of select="top500:system-id"/></td>
		</tr>
	</xsl:template>	
</xsl:stylesheet>

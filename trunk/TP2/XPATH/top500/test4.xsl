<!-- DOC - TP XPath -->
<!-- test4.xsl -->
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:top500="http://www.top500.org/xml/top500/1.0">
	<xsl:output method="xml" version="1.0" indent="yes"	encoding="ISO-8859-15" 
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>
		
	<xsl:variable name="req" >
		<xsl:value-of select="'???'"/> 
	</xsl:variable>
	
<!-- Produire une table dans une page XHTML -->
	<xsl:template match="top500:list">
		<html>
			<head>
				<title>Question 4 XPath</title>
				<style type="text/css">
					td {text-align:center }
			  		td.col1 { width:10%; text-align:center }
			  		td.col2 { width:40% }
				</style>
			</head>
			<body>
				<h1>Question 4 - binôme ??? </h1>
				<p><strong>Top 500 </strong><xsl:value-of select="@date"/></p>
				<table border="1" cellpadding='3' width="90%"  >
					<tr>
      					<th colspan="7"><strong>Top 500 </strong><xsl:value-of select="@date"/></th>
    				</tr>
					<tr>
						<th class="col1" >Pays (<code>country</code>)</th>
						<th class="col1" >Nombre de constructeurs (<code>manufacturer</code>)</th>
						<th class="col2" >Liste des constructeurs</th>
						<th class="col1" >Puissance maximale (<code>power</code>)</th>
						<th class="col1" >Nombre total de processeurs</th>
						<th class="col1" >Nombre moyen de processeurs</th>
						<th class="col1" >Liste ville, état</th>
					</tr>
					<xsl:for-each-group select="top500:site" group-by="top500:country" >
						<tr>
							<td><xsl:value-of select="top500:country" /></td>
							<td><xsl:value-of select="count(current-group())" /></td>
							<td><xsl:value-of select="distinct-values(current-group()/top500:manufacturer)" separator=", "/></td>
							<td><xsl:value-of select="max(current-group()/top500:power)" /></td>
							<td><xsl:value-of select="sum(current-group()/top500:number-of-processors)" /></td>
							<td><xsl:value-of select="avg(current-group()/top500:number-of-processors)" /></td>
							<td><xsl:value-of select="for $group in current-group() return 
															if ( $group/top500:town/text() != '' ) then
																distinct-values(text())
															else 
																if ( $group/top500:state/text() != '' ) then
																	distinct-values($group/top500:state/text())
																else 
																	''
														" separator=", "/></td>
						</tr>
					</xsl:for-each-group>
				</table>	
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>

	<xsl:template match="/nutrition">
		<html>
             <head>
                     <title>Valeurs nutritionnelles</title>
             </head>
             <body>
				
				<table>
					<caption><b><u>Valeurs nutritionnelles</u></b></caption>
					<thead>
						<tr>
							<th>Plat</th>
							<th>Calories</th>
							<th>Gras</th>
							<th>Glucides</th>
							<th>Proteines</th>
						</tr>
						
					</thead>
					<tbody>
					
					<xsl:for-each-group select="plat" group-by="@nom">
					<xsl:sort select="@nom" order="descending"></xsl:sort>
						<tr>
							<td><xsl:value-of select="@nom" /></td>
							<td><xsl:value-of select="@calories" /></td>
							<td><xsl:value-of select="@gras" /> %</td>
							<td><xsl:value-of select="@glucides" /> %</td>
							<td><xsl:value-of select="@proteines" /> %</td>
						</tr> 
					</xsl:for-each-group>
					
					</tbody>
					<tfoot>
						<tr>
							<td>Moyenne</td>
							<td><xsl:value-of select="sum(/nutrition/plat/@calories) div count(/nutrition/plat/@calories) "  /></td>
							<td><xsl:value-of select="sum(/nutrition/plat/@gras) div count(/nutrition/plat/@gras) "  /> %</td>
							<td><xsl:value-of select="sum(/nutrition/plat/@glucides) div count(/nutrition/plat/@glucides) "  /> %</td>
							<td><xsl:value-of select="sum(/nutrition/plat/@proteines) div count(/nutrition/plat/@proteines) "  /> %</td>
						</tr>
					</tfoot>
				</table>
			</body>
		</html>


	</xsl:template>
</xsl:stylesheet>
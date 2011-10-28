<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />




	<xsl:template match="/recettes">
		<html>
			<head>
				<title>LISTE ALPHABÉTIQUE DES RECETTES</title>
			</head>
			<body>

				<h1>Liste alphabétique des recettes</h1>

				<!-- index -->
				<ol>
					<xsl:for-each-group select="recette" group-by="nom">
						<xsl:sort select="nom"></xsl:sort>
						<li>
							<a href="#{generate-id(current-group())}" title="Voir la description de la recette">
								<xsl:value-of select="nom" />
							</a>
						</li>
					</xsl:for-each-group>
					<li>
						<a href="#tableau-nutritionnelle">Tableau des valeurs nutritionnelles</a>
					</li>
				</ol>


				<ul>
					<xsl:for-each-group select="recette" group-by="nom">
						<li>
							<h2>
								<xsl:value-of select="nom" />
							</h2>

							<ul>
								<xsl:call-template name="ingredient" />
							</ul>
							
						</li>
					</xsl:for-each-group>
				</ul>



				<!-- tableau valeurs nutritionnelles -->
				<a id="tableau-nutritionnelle" />
				<table>
					<caption>
						<b>
							<u>Valeurs nutritionnelles</u>
						</b>
					</caption>
					<thead>
						<tr>
							<th>Plat</th>
							<th>Calories</th>
							<th>Gras</th>
							<th>Glucides</th>
							<th>Proteines</th>
							<th>Alcool</th>
						</tr>

					</thead>
					<tbody>

						<xsl:for-each-group select="recette/nutrition"
							group-by="@calories">
							<xsl:sort select="current-group()/parent::recette/nom/text()"
								order="ascending"></xsl:sort>
							<tr>
								<td>
									<xsl:value-of select="current-group()/parent::recette/nom/text()" />
								</td>
								<td>
									<xsl:value-of select="@calories" />
								</td>
								<td>
									<xsl:value-of select="@gras" />
									%
								</td>
								<td>
									<xsl:value-of select="@glucides" />
									%
								</td>
								<td>
									<xsl:value-of select="@proteines" />
									%
								</td>
								<td>
									<xsl:value-of select="if ( @alcool ) then @alcool else '-'" />
									%
								</td>
							</tr>
						</xsl:for-each-group>

					</tbody>
				</table>

			</body>
		</html>

	</xsl:template>

	<xsl:template match="ingredient" name="ingredient">

		<li>
			<xsl:value-of select="@qte" />
			<xsl:text> #### </xsl:text>
			<xsl:value-of select="@nom" />
			<xsl:if test="count(ingredient) &gt; 0">
				<ul>
					<xsl:apply-templates select="ingredient" />
				</ul>
			</xsl:if>
			
			<xsl:if test=" count(preparation/pas) &gt; 0 ">
			<ol>
				<xsl:apply-templates select="pas" />
			</ol>
			</xsl:if>

		</li>
	
	</xsl:template>
	
	<xsl:template match="pas" name="pas">
		
		<li>
			<xsl:value-of select="."></xsl:value-of>
		</li>
	
	</xsl:template>

</xsl:stylesheet>
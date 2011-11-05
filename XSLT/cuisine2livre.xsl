<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:template match="recettes">
		<html>
			<head>
				<title>
					<xsl:apply-templates select="description" />
				</title>
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
						<a href="#tableau-nutritionnel">Tableau des valeurs nutritionnelles</a>
					</li>
				</ol>
				<!-- index -->

				<!-- la liste des recettes -->
				<ul>
					<xsl:apply-templates select="recette"/>
				</ul>
				<!-- la liste des recettes -->

				<!-- tableau valeurs nutritionnelles -->
				<xsl:apply-templates select="nutrition"/>
				<!-- tableau valeurs nutritionnelles -->

			</body>
		</html>

	</xsl:template>

	<xsl:template match="recette">
	<li>
		<a id="{generate-id(.)}"></a>
		<h2>
			<xsl:value-of select="nom" />
		</h2>
		<ul>
			<xsl:apply-templates select="ingredient" />
		</ul>
		<xsl:apply-templates select="preparation" />
	</li>
	</xsl:template>

	<!-- Template pour les ingredients -->
	<xsl:template match="ingredient" name="ingredient">

		<li>
			<xsl:if test="@qte != '*'">
				<xsl:value-of select="@qte" />
				<xsl:text> </xsl:text>
				
				<xsl:if test="@unit">
					<xsl:value-of select="@unit" />
					<xsl:if test="number(@qte) &gt; 1">
    	            	<xsl:text>s</xsl:text>
					</xsl:if>
					<xsl:text> of </xsl:text>
				</xsl:if>
				
            </xsl:if>
            <xsl:value-of select="@nom" />
			<xsl:if test="count(ingredient) &gt; 0">
				<ul>
					<xsl:apply-templates select="ingredient" />
				</ul>
			</xsl:if>
			<xsl:apply-templates select="preparation" />
		</li>

	</xsl:template>

	<!-- Template pour les pas -->
	<xsl:template name="preparation" match="preparation">
	<ol>
		<xsl:apply-templates select="pas"/>
	</ol>
	</xsl:template>

	<xsl:template name="pas" match="pas">
	<li><xsl:value-of select="."></xsl:value-of></li>
	</xsl:template>

	<xsl:template match="nutrition" name="nutrition">
	<a id="tableau-nutritionnel" />
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
						%s
					</td>
					<td>
						<xsl:value-of select="if ( @alcool ) then @alcool else '-'" />
						%
					</td>
				</tr>
			</xsl:for-each-group>

		</tbody>
	</table>
	</xsl:template>

</xsl:stylesheet>
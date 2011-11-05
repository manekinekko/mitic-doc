<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />


	<xsl:template match="/">

		<!-- index.html -->
		<xsl:result-document encoding="utf-8" href="index.html" method="xml">
			<html>
				<head>
					<title>
						<xsl:value-of select="recettes/description" />
					</title>
					<link href='style.css' type='text/css' rel='stylesheet' />
				</head>
				<body>
					<h1 class="doc-index-title">
						Liste alphabetique des recettes
					</h1>
					<ol class="doc-index-index">
						<xsl:for-each select="recettes/recette">
							<li>
								<a href="{concat('recette', position(), '.html')}">
									<xsl:value-of select="nom" />
								</a>
							</li>
						</xsl:for-each>
						<li>
							<a href="nutrition.html">Voir aussi les informations nutritionnelles</a>
						</li>
					</ol>
				</body>
			</html>
		</xsl:result-document>

		<!-- recetteXX.html -->
		<xsl:for-each-group select="recettes/recette"
			group-starting-with="recette">
			<xsl:result-document href="recette{position()}.html"
				method="xml">
				<html>
					<head>
						<title>
							<xsl:value-of select="nom" />
						</title>
						<link href='style.css' type='text/css' rel='stylesheet' />
					</head>
					<body class="doc-recette">
						<h1 class="doc-recette-title">
							<xsl:value-of select="nom" />
						</h1>
						<ul class="doc-recette-ingredient">
							<xsl:apply-templates select="ingredient" />
						</ul>
						<xsl:apply-templates select="preparation" />

						<hr />
						<a href="index.html">retour</a>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each-group>

		<!-- nutrition.html -->
		<xsl:result-document encoding="utf-8" href="nutrition.html" method="xml">
			<xsl:call-template name="nutrition" />
		</xsl:result-document>

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

	<!-- Template pour les preparations -->
	<xsl:template name="preparation" match="preparation">
		<ol class="doc-recette-preparation">
			<xsl:apply-templates select="pas" />
		</ol>
	</xsl:template>

	<!-- Template pour les pas des prepartions -->
	<xsl:template name="pas" match="pas">
		<li>
			<xsl:value-of select="."></xsl:value-of>
		</li>
	</xsl:template>

	<!-- Template pour la table des nutrition -->
	<xsl:template name="nutrition">
		<html>
			<head>
				<title>
					Informations nutritionnelles
				</title>
				<link href='style.css' type='text/css' rel='stylesheet' />
			</head>
			<body>
				<h1 class="doc-nutrition-title">Informations nutritionnelles</h1>
				<table class="doc-nutrition-table">
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

						<xsl:for-each-group select="/recettes/recette/nutrition"
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
									<xsl:value-of select="@gras" />%
								</td>
								<td>
									<xsl:value-of select="@glucides" />%
								</td>
								<td>
									<xsl:value-of select="@proteines" />%
								</td>
								<td>
									<xsl:value-of select="if ( @alcool ) then concat(@alcool, '%') else '_'" />
								</td>
							</tr>
						</xsl:for-each-group>

					</tbody>
				</table>
				<hr/>
				<a href="index.html">retour</a>
			</body>
		</html>
	</xsl:template>


</xsl:stylesheet>
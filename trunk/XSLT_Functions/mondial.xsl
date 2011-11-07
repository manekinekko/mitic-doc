<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" indent="yes"
		encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:template match="/">
		<html>
			<head></head>
			<body>
				<h1>Questions</h1>
				<ul>
					<xsl:for-each select="(1, 2, 3, 4, 5)">
						<li>
							<a href="#question-{position()}">
								<xsl:value-of select="concat('Question ', position())"></xsl:value-of>
							</a>
						</li>
					</xsl:for-each>
				</ul>
				<hr />

				<!-- Question 1 -->
				<a id="question-1" />
				<h1>Question 1</h1>
				<ul>
					<xsl:for-each-group select="mondial/river"
						group-by="@id">
						<li>
							<xsl:text>Le nombre de pays traverses par </xsl:text>
							<b>
								<xsl:value-of select="name" />
							</b>
							<xsl:text> est de </xsl:text>
							<b>
								<xsl:call-template name="nb-pays">
									<xsl:with-param name="river" select="name"></xsl:with-param>
								</xsl:call-template>
							</b>
							<xsl:text>, </xsl:text>

						</li>
					</xsl:for-each-group>
				</ul>
				<hr />

				<a id="question-2" />
				<h1>Question 2</h1>
				<ul>
					<xsl:for-each-group select="mondial/river"
						group-by="@id">
						<xsl:if test="located/@country">
							<li>
								<xsl:variable name="river_name" select="name"></xsl:variable>

								<xsl:text>La </xsl:text>

								<b>
									<xsl:value-of select="$river_name" />
								</b>

								<xsl:text> traverse </xsl:text>

								<xsl:for-each select="located">

									<xsl:variable name="country_code" select="@country"></xsl:variable>
									<xsl:variable name="country_name"
										select="/mondial/country[ @car_code = $country_code ]/name"></xsl:variable>

									<!-- sauvegarder la valeur de retour -->
									<xsl:variable name="nb_regions_par_pays">
										<xsl:call-template name="nb-regions-par-pays">
											<xsl:with-param name="river" select="$river_name"></xsl:with-param>
											<xsl:with-param name="pays" select="$country_code"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>

									<b>
										<xsl:value-of select="$nb_regions_par_pays" />
									</b>

									<xsl:text> region</xsl:text>
									<xsl:if test="$nb_regions_par_pays &gt; 1">
										s
									</xsl:if>

									<xsl:text> de </xsl:text>
									<b>
										<xsl:value-of select="$country_name" />
									</b>

									<xsl:text>, </xsl:text>

								</xsl:for-each>

							</li>
						</xsl:if>
					</xsl:for-each-group>
				</ul>
				<hr />

				<a id="question-3" />
				<h1>Question 3</h1>
				<ul>
					<xsl:for-each-group select="mondial/river"
						group-by="@id">
						<li>
							<xsl:text>Le nombre total des regions traversees est de </xsl:text>
							<b>
								<xsl:call-template name="nb-regions">
									<xsl:with-param name="river" select="name"></xsl:with-param>
								</xsl:call-template>
							</b>
						</li>
					</xsl:for-each-group>
				</ul>


			</body>
		</html>
	</xsl:template>

	<!-- Question 1 -->
	<xsl:template name="nb-pays">
		<xsl:param name="river" />

		<xsl:variable name="x"
			select="/mondial/river[ name = $river ]/located/@country"></xsl:variable>
		<xsl:value-of select="count($x)" />

	</xsl:template>

	<!-- Question 2 -->
	<xsl:template name="nb-regions-par-pays">
		<xsl:param name="river" />
		<xsl:param name="pays" />

		<xsl:variable name="x"
			select="/mondial/river[ name = $river ]/located[ @country = $pays ]/@province"></xsl:variable>
		<xsl:variable name="resultat" select="tokenize($x, '\s+')" />
		<xsl:variable name="c" select="count($resultat)" />
		<xsl:value-of select="$c" />

	</xsl:template>

	<!-- Question 3 -->
	<xsl:template name="nb-regions">
		<xsl:param name="river" />

		<xsl:choose>
			<xsl:when test="$river">
				<xsl:for-each select="$river/located">
					<xsl:variable name="recursive_result">
						<xsl:call-template name="nb-regions-par-pays">
							<xsl:with-param name="river" select="$river[position() > 1]" />
							<xsl:with-param name="pays" select="@country" />
						</xsl:call-template>
					</xsl:variable>
					<xsl:value-of
						select="number(substring-after($productList[1]/Price,'$'))
                  + $recursive_result" />
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="0" />
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

</xsl:stylesheet>
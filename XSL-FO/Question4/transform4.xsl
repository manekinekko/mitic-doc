<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- transform1.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:output method="xml" indent="yes" encoding="ISO-8859-1" />

	<xsl:template match="/mondial">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!-- Modèle de mise en page -->
			<fo:layout-master-set>

				<fo:simple-page-master margin-right="20mm"
					margin-left="20mm" margin-bottom="10mm" margin-top="10mm"
					page-width="210mm" page-height="297mm" master-name="paire">
					<fo:region-body margin-top="15mm" margin-bottom="15mm" />
					<fo:region-before region-name="entete-paire"
						extent="20mm" />
					<fo:region-after extent="10mm" />
				</fo:simple-page-master>

				<fo:page-sequence-master master-name="pair-impair">
					<fo:repeatable-page-master-alternatives
						maximum-repeats="no-limit">
						<fo:conditional-page-master-reference
							odd-or-even="odd" master-reference="impair" />
						<fo:conditional-page-master-reference
							odd-or-even="even" master-reference="pair" />
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>

			</fo:layout-master-set>


			<fo:page-sequence master-reference="pair-impair">
				<!-- placer ici le contenu de l'entête des pages impaires -->
				<fo:static-content font-size="12pt" flow-name="xsl-region-before">
					<fo:block color="#aaa">

						<fo:table border-after-style="solid" width="100%"
							table-layout="fixed">
							<fo:table-column column-width="50%"
								column-number="1">
							</fo:table-column>
							<fo:table-column column-width="50%"
								column-number="2">
							</fo:table-column>

							<fo:table-body start-indent="0pt" text-align="start">
								<fo:table-row>
									<fo:table-cell>
										<fo:block text-align="right" text-transform="italic">
											<fo:page-number />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="left">
											<xsl:value-of select="name()"></xsl:value-of>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>

					</fo:block>
				</fo:static-content>
				<fo:static-content font-size="12pt" flow-name="entete-deux">
					<!-- placer ici le contenu de l'entête des pages paires -->
					<fo:block color="#aaa">

						<fo:table border-after-style="solid" width="100%"
							table-layout="fixed">
							<fo:table-column column-width="50%"
								column-number="1">
							</fo:table-column>
							<fo:table-column column-width="50%"
								column-number="2">
							</fo:table-column>

							<fo:table-body start-indent="0pt" text-align="start">
								<fo:table-row>
									<fo:table-cell>
										<fo:block text-align="right" text-transform="uppercase">
											<xsl:value-of select="name()"></xsl:value-of>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="left">
											<fo:page-number />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>

					</fo:block>
				</fo:static-content>
				<fo:flow flow-name='xsl-region-body' font-size="12pt">
					<xsl:apply-templates select="country" mode="body" />
				</fo:flow>
			</fo:page-sequence>

		</fo:root>
	</xsl:template>

	<xsl:template match="country">

		<fo:block keep-together="always">

			<fo:block text-align="left" font-weight="bold">
				<!-- Titre -->
				<fo:inline>
					<xsl:text>&#42;</xsl:text>
				</fo:inline>
				<fo:inline text-transform="capitalize">
					<xsl:value-of select="./name/text()" />
				</fo:inline>
			</fo:block>
			<fo:block text-align="left" margin-left="50pt">

				<fo:block>
					<fo:inline font-style="italic">
						car_code
					</fo:inline>
					<fo:inline text-transform="uppercase" font-weight="bold">
						:
						<xsl:value-of select="@car_code" />
					</fo:inline>
				</fo:block>
				<fo:block>
					<fo:inline font-style="italic">
						area
					</fo:inline>
					<fo:inline text-transform="uppercase" font-weight="bold">
						:
						<xsl:value-of select="@area" />
					</fo:inline>
				</fo:block>
				<fo:block>
					<fo:inline font-style="italic">
						capital
					</fo:inline>
					<fo:inline text-transform="capitalize" font-weight="bold">
						:
						<xsl:value-of select="@capital" />
					</fo:inline>
				</fo:block>

			</fo:block>
		</fo:block>

	</xsl:template>

	<xsl:template match="continent">

	</xsl:template>

</xsl:stylesheet>




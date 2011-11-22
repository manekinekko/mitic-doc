<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- transform1.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:output method="xml" indent="yes" encoding="ISO-8859-1" />

	<xsl:template match="/mondial">
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

			<fo:page-sequence master-reference="page">
				<fo:static-content flow-name='xsl-region-before'
					font-size="12pt">
					<fo:block color="#aaa">

						<fo:table border-after-style="solid" width="100%"
							table-layout="fixed">
							<fo:table-column column-width="30%"
								column-number="1">
							</fo:table-column>
							<fo:table-column column-width="40%"
								column-number="2">
							</fo:table-column>
							<fo:table-column column-width="30%"
								column-number="3">
							</fo:table-column>

							<fo:table-body start-indent="0pt" text-align="start">
								<fo:table-row>
									<fo:table-cell>
										<fo:block text-align="right" text-transform="uppercase">
											<xsl:value-of select="name()"></xsl:value-of>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center">
											<xsl:value-of select="name()"></xsl:value-of>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="left">uni-goettingen.de
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>

					</fo:block>
				</fo:static-content>
				<fo:static-content break-after="page" flow-name='xsl-region-after'
					font-size="12pt">
					<fo:block text-align="center">
						page
						<fo:page-number />
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name='xsl-region-body' font-size="12pt">
					<xsl:apply-templates select="country" />
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




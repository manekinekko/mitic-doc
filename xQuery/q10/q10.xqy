<result>
{
	for $origine in distinct-values(/epicerie/listeProduit/produit/Origine)
		
	return 
		<origine ville="{$origine}" >
		{
			for $produit in /epicerie/listeProduit/produit
			where $produit/Origine = $origine
			
			return 
				<produit>
					<nom>{ $produit/Nom_p/text() }</nom>
					{
						let $doc := doc('../epicerie.xml')
						for 
							$fournisseur in $doc/epicerie/listeFournisseur/fournisseur,
							$fourniture in $doc/epicerie/listeFourniture/fourniture
						
						where $fourniture/P = $produit/P 
						and   $fourniture/F = $fournisseur/F
						
						return
							<fournisseur>{$fournisseur/Nom/text()}</fournisseur>
					}
				</produit>
		}
		</origine>
}
</result>
					
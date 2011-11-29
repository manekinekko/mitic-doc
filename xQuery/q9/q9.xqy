<result>
{
	for 
		$produit in /epicerie/listeProduit/produit
		
	return
		<produit nom="{$produit/Nom_p}">{ 
			for 		
				$fournisseur in /epicerie/listeFournisseur/fournisseur,
				$fourniture in /epicerie/listeFourniture/fourniture

			where $fourniture/P = $produit/P
			and   $fournisseur/F = $fourniture/F
			
			return $fournisseur/Nom
			
		}</produit>
	
}
</result>
<result>
{
let 
	$fournisseur := /epicerie/listeFournisseur/fournisseur[ Nom = 'Barnibus' ],
	$produit := /epicerie/listeProduit/produit[ Couleur = 'vert'],
	$fourniture := /epicerie/listeFourniture/fourniture[ $fournisseur/F = F and $produit/P = P ]  
	
return 
	$produit[ $fourniture/P  = P ]/Nom_p
}
</result>
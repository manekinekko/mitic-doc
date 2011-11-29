let
	$res := /epicerie/listeProduit/produit[ Couleur = 'vert' ]
return
<result>
	{count($res)}
</result>
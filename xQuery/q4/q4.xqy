declare namespace local = "http://cheghamwassim.com";

declare function local:produitsParCouleur($couleur as xs:string){
	let $res := doc('../epicerie.xml')/epicerie/listeProduit/produit
	return  $res[ Couleur = $couleur ]
};

<result>
{count(local:produitsParCouleur('vert')[ Origine = "Riec" ])}
</result>
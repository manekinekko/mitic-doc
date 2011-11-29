declare namespace local = "http://cheghamwassim.com";

declare function local:fournisseurParProduit($codep as xs:string){
	let 
		$fourniture := doc('../epicerie.xml')/epicerie/listeFourniture/fourniture[ $codep = P ],
		$fournisseur := doc('../epicerie.xml')/epicerie/listeFournisseur/fournisseur[ F = $fourniture/F ]
		
	return  $fournisseur
};

<result> {
local:fournisseurParProduit('p4')/Nom
} </result>
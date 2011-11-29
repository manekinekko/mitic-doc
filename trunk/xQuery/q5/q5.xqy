<result>
{
let 
$produit := /epicerie/listeProduit/produit[ Couleur = 'vert'],
$fourniture := /epicerie/listeFourniture/fourniture[ $produit/P = P ]

for $x in distinct-values($fourniture/F)

return <F>{$x}</F>
}
</result>
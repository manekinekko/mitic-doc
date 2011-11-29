<result>
{
for $fourniture in /epicerie/listeFourniture/fourniture
where $fourniture/P = 'p2' or $fourniture/P = 'p4'
	
return
<plop>{
	$fourniture/F
	$fourniture/P
}</plop>
}
</result>
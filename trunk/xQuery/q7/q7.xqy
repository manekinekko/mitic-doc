<result>
{
	for $fourniture in /epicerie/listeFourniture/fourniture
	where $fourniture/P = 'p2' and 'p4'
		
	return
		$fourniture/F
}
</result>
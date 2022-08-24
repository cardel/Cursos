<?php
$a = 3;
$b = 3;
$c = 3+3;
echo($c);
echo("\n");

function f($a,$b,$c){
	global $j;
	$j = 2*($a+$b+$c);
	return $a+$b+$c;
}

echo(f(4,5,3));
echo("\n");
echo($j);
echo("\n");

?>

<?php
function isInt($s) {
	$v = mb_str_split($s, 1);
	$i = 0;
	$l = count($v);
	goto S0;
S0:
	if ($i >= $l) {
		goto S4;
	} else if ($v[$i] == '+' || $v[$i] == '-') {
		$i++;
		goto S1;
	} else if ('0' <= $v[$i] && $v[$i] <= '9') {
		$i++;
		goto S2;
	} else {
		goto S4;
	}
S1:
S2:
S3:
	return true;
S4:
	return false;
}

$tests = array(
	array('', false),
	array(' ', false),
	array('+', false),
	array('-', false),
	array('++', false),
	array('--', false),
	array('+0+', false),
	array('-0-', false),
	array('+0123456789', true),
	array('-0123456789', true),
	array('0123456789', true),
);

foreach ($tests as &$t) {
	printf("%s\t'%s'\n", $t[1] == isInt($t[0]) ? 'OK' : 'NG', $t[0]);
}
unset($t);
?>

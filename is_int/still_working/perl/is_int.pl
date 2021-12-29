use strict;
use utf8;
binmode STDOUT, ":utf8";

sub is_int {
	my $s = shift @_;
	goto S0;
S0:
	if ($s !~ /./g) {
		goto S4;
	} elsif ($& eq "+" or $& eq "-") {
		goto S1;
	} elsif ("0" le $& and $& le "9") {
		goto S2;
	} else {
		goto S4;
	}
S1:
S2:
S3:
	return 1;
S4:
	return 0;
}

my @tests = (
	["", 0],
	[" ", 0],
	["+", 0],
	["-", 0],
	["++", 0],
	["--", 0],
	["+0+", 0],
	["-0-", 0],
	["+0123456789", 1],
	["-0123456789", 1],
	["0123456789", 1],
);

for my $t (@tests) {
	printf("%s\t'%s'\n", $t->[1] == is_int($t->[0]) ? "OK" : "NG", $t->[0]);
}

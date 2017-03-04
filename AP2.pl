#!/usr/bin/perl
use strict;
use warnings;
chomp(my $t = <>);
while($t-->0){
	chomp(my $line = <>);
	my @input = split(/ /,$line);
	my($K1,$K2,$K3) = ($input[0],$input[1],$input[2]);
	my $n = (2*$K3)/($K1+$K2);
	my $d = ($K1-$K2)/(5-$n);
	my $a = $K1 - 2*$d;
	print "$n\n";
	for(my $i = 1 ; $i <= $n ; $i += 1){
		my $num = $a + ($i - 1)*$d;
		print $num;
		print " ";	
	}
	print "\n";
}

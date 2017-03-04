#!/usr/bin/perl

use strict;
use warnings;

chomp(my $t = <>);

while($t-- > 0){
	<>;
	chomp(my $n = <>);
	chomp(my $count = 0);
	my (%A,@NUMS);
	while($count < $n){
		chomp(my $num = <>);
		$count += 1;
		$A{$num} = $count;
		$NUMS[$count] = $num;
	}
	my @s_keys = sort keys(%A);
	my $ans = 0;
	for(my $i = 1 ; $i <= $#NUMS ; $i += 1){
		for(my $j = 0 ; $j <= $#s_keys ; $j += 1){
			#print "\$i = $i\t\$j = $j\t\$NUMS[$i] = $NUMS[$i]\t\$s_keys[$j] = $s_keys[$j]\t\$A{\$s_keys[$j]} = $A{$s_keys[$j]}\n";
			if($NUMS[$i] > $s_keys[$j] && $i < $A{$s_keys[$j]}){
				#print "Incrementing answer!!\n";
				$ans += 1;			
			}elsif($NUMS[$i] <= $s_keys[$j]){
				last;
			}
		}
	}
	print "$ans\n";
}

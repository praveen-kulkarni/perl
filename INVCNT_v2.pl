#!/usr/bin/perl

use strict;
use warnings;

sub convert;
sub getInvCount;
sub getSum;
sub updateBIT;

chomp(my $t = <>);

while($t-- > 0){
	<>;
	chomp(my $n = <>);
	my @a;
	for(my $i = 0 ; $i < $n ; $i++){
		chomp($_ = <>);
		$a[$i] = $_;		
	}
	my @a_converted = convert(\@a);
	#print "@a_converted\n";
	#updateBIT(\@a_converted,1,2,3);
	my $ans = getInvCount(\@a_converted, $n);
	print "$ans\n";
}

sub convert{
	my $input_array_ref = shift;
	my @input_array = @{$input_array_ref};
	my @s_temp = sort @input_array;
	#print "sorted : @s_temp\n";
	my %h;
	my $count = 1;
	foreach(@s_temp){
		$h{$_} = $count;
		$count++; 	
	}
	for(my $i = 0 ; $i <= $#input_array ; $i++){
		$input_array[$i] = $h{$input_array[$i]};	
	}
	@input_array;
}

sub getInvCount{
	my $aref = shift;
	my @a = @{$aref};
	my $n = shift;
	my $invertCount = 0;
	my @BIT;
	for(my $i = 1; $i <= $n ; $i++){
		$BIT[$i] = 0;	
	}
	for(my $j = $n - 1 ; $j >= 0 ; $j--){
		$invertCount += getSum(\@BIT, $a[$j] - 1);
		@BIT = updateBIT(\@BIT, $n, $a[$j], 1);	
	}
	$invertCount;
}

sub getSum{
	my $BITreeref = shift;
	my @BITree = @{$BITreeref};
	my $index = shift;
	my $sum = 0;
	while($index > 0){
		$sum += $BITree[$index];
		$index -= $index & (-$index);	
	}
	$sum;
}

sub updateBIT{
	#my(@BITree,$n,$index,$val) = ($_[0],$_[1],$_[2],$_[3]);
	my $BITreeref = shift;
	my $n = shift;
	my $index = shift;
	my $val = shift;
	my @BITree = @{$BITreeref};
	while($index <= $n){
		$BITree[$index] += $val;
		$index += $index & (-$index);	
	}
	@BITree;
}

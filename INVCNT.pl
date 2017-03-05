#!/usr/bin/perl

use strict;
use warnings;
sub mergeSort;
sub _mergeSort;
sub merge;

chomp(my $t = <>);

while($t-- > 0){
	<>;
	chomp(my $n = <>);
	my @a;
	for(my $i = 0 ; $i < $n ; $i++){
		chomp($_ = <>);
		$a[$i] = $_;		
	}
	my $ans = mergeSort(\@a, $n);
	print "$ans\n";
}

sub mergeSort{
	my ($a_ref, $array_size) = (shift, shift);
	my @tmp;
	_mergeSort($a_ref,\@tmp,0,$array_size - 1);
}

sub _mergeSort{
	my ($a_ref, $tmp_ref, $left, $right) = (shift, shift, shift, shift);
	# print "Called _mergeSort with \$left = $left and \$right = $right\n";
	my $mid;
	my $inv_count = 0;
	if($right > $left){
		$mid = int(($left + $right) / 2);		
		$inv_count = _mergeSort($a_ref, $tmp_ref, $left, $mid);
		$inv_count += _mergeSort($a_ref, $tmp_ref, $mid + 1, $right);
		$inv_count += merge($a_ref, $tmp_ref, $left, $mid + 1, $right);	
	}
	$inv_count;
}

sub merge{
	my ($a_ref, $tmp_ref, $left, $mid, $right) = (shift, shift, shift, shift, shift);
	# print "Called the merge with \$left = $left, \$mid = $mid and \$right = $right\n";
	my ($i, $j, $k) = ($left, $mid, $left);
	my $inv_count = 0;
	# print "Inside merge subroutine: @{$a_ref}\t@{$tmp_ref}\n";
	while(($i <= $mid - 1) && ($j <= $right)){
		if(${$a_ref}[$i] <= ${$a_ref}[$j]){
			${$tmp_ref}[$k++] = ${$a_ref}[$i++];		
		}else{
			${$tmp_ref}[$k++] = ${$a_ref}[$j++];
			$inv_count += $mid - $i;
		}	
	}
	${$tmp_ref}[$k++] = ${$a_ref}[$i++] while($i <= $mid - 1);
	${$tmp_ref}[$k++] = ${$a_ref}[$j++] while($j <= $right);
	for(my $ii = $left; $ii <= $right; $ii++){
		${$a_ref}[$ii] = ${$tmp_ref}[$ii];	
	}
	# print "\$inv_count = $inv_count\n";
	$inv_count;
}

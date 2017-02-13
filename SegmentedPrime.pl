#!/usr/bin/perl

use strict;
use warnings;

# Pre-declaration of subroutines used
sub initialize;
sub sieve;

# Read number of test cases
chomp(my $t = <>);

# Process each test case
while($t-- > 0){
	# Read lower and upper limits seperated by space
	my @input = split(/ /,<>);
	
	# Assgin the limits to individual scalars
	my $m = $input[0];
	my $n = $input[1];
	
	# Initialize array of primes
	my @primes = initialize($n - $m + 1);
	
	# Select the segment as sqrt($n)
	my @delta = initialize(int(sqrt($n)) + 1);
	
	# Store primes less than or equal to sqrt($n) in seperate aarray using normal Sieve
	my @b = sieve(@delta);
	
	# For every prime found so far, start eliminating their multiples in the range ($m, $n)
	foreach(@b){
		my $num = int($m / $_);
		$num *= $_;
		$num += $_ if $num < $m;
		# Above three statements make sure that $num will contain first number divisible by $_ i.e., prime considered in this iteration
		# Try eliminating multiples of $num in the range ($m, $n)
		while($num >= $m && $num <= $n){
			# Ignore $num if it is one of the primes found using normal seive
			if($num == $_){
				$num += $_;
				next;
			}
			if($primes[$num - $m] == 1){
				$primes[$num - $m] = 0;
			}
			# Advance to next multiple 
			$num += $_;
		}
	}

	# Print each primes within the range ($m, $n)
	for(my $j = $m ; $j <= $n ; $j++){
		if($primes[$j - $m] && $j != 1){
			print $j;
			print "\n";
		}
	}
}

# Subroutine to initialize array elements with value 1
sub initialize{
	my $upper_bound = shift;
	my @a = (1) x $upper_bound;
	return @a;
}

# Seive of Eratoshenes for finding list of primes till a given upper limit
sub sieve{
	my @array = @_;
	$array[0] = 0;
	$array[1] = 0;
	my @result;
	for(my $i = 2; $i <= $#array; $i += 1){
		if($array[$i]){
			my $j = $i;
			while($j + $i <= $#array){
				$j += $i;
				$array[$j] = 0;
			}
		}
	}
	for(my $i = 0 ; $i <= $#array ; $i++){
		push @result, $i if $array[$i];
	}
	return @result;
}
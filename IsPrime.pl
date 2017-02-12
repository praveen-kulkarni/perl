#!/usr/bin/perl
use POSIX;		#This module is supports few math functions such as ceil(), floor() etc.,
sub isPrime; 	#Pre-declaration of subroutine
print "This program tells if input integer is prime or non-prime\n";
print "Enter any integer(positive) : ";

chomp(my $num = <>);	#Take the input and chomp it

if(isPrime($num)){
	print "$num is prime\n";
}else{
	print "$num is not prime\n";
}

sub isPrime{
	my $num1 = shift;	#Read the parameter passed to subroutine and make local assignment to a variable 
	for(my $i = 2 ; $i * $i <= $num1 ; $i += 1){	#Loop from 2 till a number which is less-than or equal to square root of given number; it is guranteed that all the factors of number will be in this range
		return 0 if $num1 % $i == 0;	#If $i divides given number, then number is not a prime
	}
	return 1;	#Number is prime otherwise
}

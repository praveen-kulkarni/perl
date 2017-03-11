#!/usr/bin/perl

use strict;
use warnings;

chomp(my $num = <>);

if($num % 10 == 0){
	print "2\n";
}else{
	print "1\n";
	print $num % 10;
	print "\n";
}

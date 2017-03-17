#!/usr/bin/perl

use strict;
use warnings;
use Math::Trig;

chomp(my $L = <>);
while($L != 0){
        # Simple mathematical formula
        # Maximum area covered will be semi circle by fence covering the wall
        my $a = ($L * $L)/(2 * pi);    
        # Rounding of to two decimal places using sprintf
        my $ans = sprintf "%.2f", $a;
        print "$ans\n";
        chomp($L = <>);
}

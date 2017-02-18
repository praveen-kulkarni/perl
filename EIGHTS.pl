#!/usr/bin/perl
use strict;
use warnings;
use Math::BigInt;
chomp(my $t = <>);
while($t-- > 0){
        chomp(my $n = <>);
        my $k = Math::BigInt->new($n);
        print 250 * ($k - 1) + 192 . "\n";
}

#!/usr/bin/perl
use strict;
use warnings;
use Math::BigInt;
my $t = 10;
while($t-- > 0){
        chomp(my $a = <>);
        chomp(my $b = <>);
        my $total = Math::BigInt->new($a);
        my $more = Math::BigInt->new($b);
        my $x = ($total - $more) / 2;
        print $x + $more;
        print "\n";
        print $x . "\n";
}

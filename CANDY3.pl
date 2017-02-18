#!/usr/bin/perl
use strict;
use warnings;
use Math::BigInt;
chomp(my $t = <>);
while($t-- > 0){
        chomp(my $blank_line = <>);
        chomp(my $N = <>);
        my $sum = 0;
        my $n = $N;
        while($n-- > 0){
                chomp(my $a = <>);
                my $num = Math::BigInt->new($a);
                $sum += $num;
        }
        if($sum % $N == 0){
                print "YES\n";
        }else{
                print "NO\n";
        }
}

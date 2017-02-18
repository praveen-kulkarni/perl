#!/usr/bin/perl
use strict;
use warnings;
chomp(my $t = <>);
while($t-- > 0){
        chomp(my $n = <>);
        while(1){
                $n += 1;
                my $nstring = sprintf "%d", $n;
                if($nstring eq scalar reverse $nstring){
                        print "$nstring\n";
                        last;
                }
        }
}

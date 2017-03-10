#!/usr/bin/perl

use strict;
use warnings;

chomp(my $n = <>);
chomp(my $line1 = <>);
my @S = split(/ /,$line1);
chomp(my $m = <>);
chomp(my $line2 = <>);
my @Q = split(/ /,$line2);
my %h;
$h{$_} = 1 foreach(@Q);
foreach(@S){
        print "$_ " if(!defined($h{$_}));
}
print "\n";

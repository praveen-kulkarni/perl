#!/usr/bin/perl
use strict;
use warnings;
chomp(my $P = <>);
while($P-- > 0){
        chomp(my $N = <>);
        chomp(my $line = <>);
        # Initialize all the possible coin sequence with zeros
        my %hash = ("TTT" => 0, "TTH" => 0, "THT" => 0, "THH" => 0, "HTT" => 0, "HTH" => 0, "HHT" => 0, "HHH" => 0);
        # Use array of coin-sequences to generate output in required order
        my @coin_seq = qw( TTT TTH THT THH HTT HTH HHT HHH );
        for(my $i = 0 ; $i <= length($line) - 3 ; $i++){
                # Increment the count of coin-sequence using substr and hash
                $hash{substr($line,$i,3)} += 1;
        }
        print "$N ";
        foreach(@coin_seq){
                print "$hash{$_} ";
        }
        print "\n";
}


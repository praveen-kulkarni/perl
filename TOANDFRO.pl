#!/usr/bin/perl

use strict;
use warnings;

sub readColumns;
sub readString;

while(1){
        my $col = readColumns();
        last if $col == 0;
        my $str = readString();
        my @mutated;
        my $i = 0;
        my $flag = 0;
        while($i < length($str)){
                if($flag == 0){
                        push @mutated, split("", substr($str,$i, $col));
                        $flag = 1;
                }else{
                        push @mutated, split("", scalar reverse(substr($str,$i, $col)));
                        $flag = 0;
                }
                $i += $col;
        }
        #print "\@mutated = @mutated\n";
        for(my $j = 0 ; $j < $col ; $j += 1){
                        my $k = $j;
                        while($k < length($str)){
                                print "$mutated[$k]";
                                $k += $col;
                        }
                }
        print "\n";
}

sub readColumns{
        chomp(my $num = <>);
        $num;
}

sub readString{
        chomp(my $s = <>);
        $s;
}


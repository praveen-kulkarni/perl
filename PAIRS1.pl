#!/usr/bin/perl
use strict;
use warnings;
sub binarySearch;
chomp(my $Line = <>);
my @input = split(/ /,$Line);
my($N, $K) = ($input[0], $input[1]);
chomp(my $line = <>);
my @array = split(/ /,$line);
my @array_sorted = sort {$a <=> $b} @array;
my $ans = 0;
for(my $i = 0 ; $i < @array ; $i += 1){
        my $key = $array_sorted[$i] + $K;
        if($key <= $array_sorted[-1] && binarySearch(\@array_sorted, $key)){
                $ans += 1;
        }
}
print "$ans\n";
sub binarySearch{
        my ($array_r, $key) = (shift, shift);
        my $lo = 0;
        my $hi =  @{$array_r} - 1;
        while($lo <= $hi){
                my $mid = $lo + int(($hi - $lo) / 2);
                if(${$array_r}[$mid] < $key){
                        $lo = $mid + 1;
                }elsif(${$array_r}[$mid] > $key){
                        $hi = $mid - 1;
                }else{
                        return 1
                }
        }
        return 0;
}

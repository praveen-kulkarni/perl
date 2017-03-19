#!/usr/bin/perl
use strict;
# use warnings;
chomp(my $T = <>);
sub max;
while($T-- > 0){
    chomp(my $line = <>);
    my @dimenstions = split(/ /,$line);
    my @matrix;
    my ($h, $w) = ($dimenstions[0], $dimenstions[1]);
    for(my $i = 0 ; $i < $h ; $i++){
        chomp(my $line = <>);
        my @line = split(/ /,$line);
        for(my $j = 0 ; $j < $w ; $j++){
            $matrix[$i][$j] = $line[$j];
        }
    }
    my @maxValues;
    # print "Printing the DP Matrix\n";
    for(my $i = 0 ; $i < $h ; $i++){
        for(my $j = 0 ; $j < $w ; $j++){
            if($i == 0){
                $maxValues[$i][$j] = $matrix[$i][$j];
            }elsif($i > 0 && $j == 0){
                $maxValues[$i][$j] = $matrix[$i][$j] + max($maxValues[$i-1][$j], $maxValues[$i-1][$j+1]);
            }elsif($i > 0 && $j == $w - 1){
                $maxValues[$i][$j] = $matrix[$i][$j] + max($maxValues[$i-1][$j-1], $maxValues[$i-1][$j]);
            }else{
                $maxValues[$i][$j] = $matrix[$i][$j] + max($maxValues[$i-1][$j-1],max($maxValues[$i-1][$j],$maxValues[$i-1][$j+1]));
            }
            # print "$maxValues[$i][$j] ";
        }
        # print "\n";
    }
    my @last_row = sort { $a <=> $b } (@{$maxValues[$h-1]});
    print "$last_row[-1]\n";
}

sub max{
    return $_[0] > $_[1] ? $_[0] : $_[1];
}


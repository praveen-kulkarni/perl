#!/usr/bin/perl

use strict;
use warnings;

sub binary_search;
sub maxPossible;

chomp(my $T = <>);

while($T-- > 0){
    chomp(my $line = <>);
    my @INPUT = split(/ /,$line);
    my ($N, $C) = ($INPUT[0], $INPUT[1]);
    my (@x, %x);
    for(my $i = 0 ; $i < $N; $i++){
        chomp(my $num = <>);
        $x[$i] = $num;
        $x{$num} = 1 if(not defined $x{$num});
    }
    my @sorted_x = sort { $a <=> $b } @x ;
    my $ans = binary_search(\@sorted_x, \%x, $N, $C);
    print "$ans\n";
}

sub binary_search{
    my ($x_ref, $x_hashRef, $N, $C) = (shift, shift, shift, shift);
    my ($hi , $lo, $mid);
    $hi = ${$x_ref}[$N - 1] - ${$x_ref}[0];
    my($first, $second);
    $first = ${$x_ref}[0];
    my $j = 0;
    $j++ while($j < $N && ${$x_ref}[$j] == $first);
    $second = ${$x_ref}[$j];
    $lo = $second - $first;
    return 0 if $lo == $hi;
    my $old_mid = -1;
    my $in_count = -1;
    while($hi - $lo > 1){
        $mid = $lo + int(($hi - $lo) / 2);
        if($mid == $old_mid && $in_count < $C){
                $mid -= 1;
        }elsif($mid == $old_mid && $in_count == $C){
                return $mid;
        }
        # print "\$lo = $lo\t\$mid = $mid\t\$hi = $hi\n";
        $in_count = 1;
        my $start_elem = ${$x_ref}[0];
        my $diff = 0;
        my @hash_keys = keys %{$x_hashRef};
        my @sorted_keys = sort {$a <=> $b} @hash_keys;
        # print "Sorted_keys: @sorted_keys\t";
        for(my $i = 0 ; $i < @sorted_keys ; $i++){
                # print "\$start_elem = $start_elem\t";
                $diff = $sorted_keys[$i] - $start_elem;
                # print "\$i = $i\t\$diff = $diff\n";
                if($diff >= $mid){
                        $in_count++;
                        $diff = 0;
                        $start_elem = $sorted_keys[$i];
                }
        }
        # print "\$diff = $diff\t\$in_count = $in_count\t\$C = $C\n";
        # sleep(1);
        if($in_count < $C){
            $hi = $mid + 1;
        }else{
            $lo = $mid - 1;
        }
        $old_mid = $mid;
    }
    return $lo;
}


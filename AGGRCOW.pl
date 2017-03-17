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
    # @x holds the stall poistions and %x is used for optimizing the solution
    my (@x, %x);
    for(my $i = 0 ; $i < $N; $i++){
        chomp(my $num = <>);
        $x[$i] = $num;
        $x{$num} = 1 if(not defined $x{$num});
    }
    # Numeric sort of stall positions helps us calculating distance between two consecutive stalls; there by helping
    # us find final answer
    my @sorted_x = sort { $a <=> $b } @x ;
    my $ans = binary_search(\@sorted_x, \%x, $N, $C);
    print "$ans\n";
}

sub binary_search{
    # Solution is based on Binary-Search (iterative version)
    # We decide what is the maximum possible distance between two cows by placing them one at very first stall 
    # and the other at very last stall. In the same way, the minimum possible distance between two cows would
    # be distance between first two stalls. Keeping these minimum and maximum possible distances as two extremes
    # i.e., low and high values required for binary search, we calculate mid value and check if this mid value will serve the purpose
    # of placing all the C cows in N stalls
    my ($x_ref, $x_hashRef, $N, $C) = (shift, shift, shift, shift);
    my ($hi , $lo, $mid);
    # Calculate high extreme for binary search
    $hi = ${$x_ref}[$N - 1] - ${$x_ref}[0];
    # sorted_keys is computed with the intention of fine-tuning the performance
    my @sorted_keys = sort {$a <=> $b} (keys %{$x_hashRef});
    my($first, $second) = ($sorted_keys[0], $sorted_keys[1]);
    # Calculate the low extreme for binary search
    $lo = $second - $first;
    return 0 if $lo == $hi;
    my $old_mid = -1;
    my $in_count = -1;
    while($hi - $lo > 1){
        # Compute the mid value
        $mid = $lo + int(($hi - $lo) / 2);
        if($mid == $old_mid && $in_count < $C){
            # In case of repeting mid value and number of cows fit with that mid value is less than expected, decrement the mid value by 1
            $mid -= 1;
        }elsif($mid == $old_mid && $in_count == $C){
            # In case of repeting mid value and number of cows fit with that mid value equals to expected value, return mid value as answer
            return $mid;
        }
        #print "\$lo = $lo\t\$mid = $mid\t\$hi = $hi\n";
        $in_count = 1;
        my $start_elem = ${$x_ref}[0];
        my $diff = 0;
        #print "Sorted_keys: @sorted_keys\t";
        # For every stall distances since beginning
        for(my $i = 0 ; $i < @sorted_keys ; $i++){
            #print "\$start_elem = $start_elem\t";
            # Compute the distance so far
            $diff = $sorted_keys[$i] - $start_elem;
            #print "\$i = $i\t\$diff = $diff\n";
            # If so computed distance exceeds or equals mid value, place a cow and re-initialze the variables
            if($diff >= $mid){
                $in_count++;
                # If cows placed so-far equals to expected value, silently stop processing further for current loop
                last if $in_count == $C;
                $diff = 0;
                $start_elem = $sorted_keys[$i];
            }
        }
        #print "\$diff = $diff\t\$in_count = $in_count\t\$C = $C\n";
        #sleep(1);
        if($in_count < $C){
            $hi = $mid + 1;
        }else{
            $lo = $mid - 1;
        }
        $old_mid = $mid;
    }
    return $lo;
}


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
    while($lo < $hi){
        $mid = $lo + int(($hi - $lo) / 2);
        $mid = $mid - 1 if $mid == $old_mid;
        # print "\$lo = $lo\t\$mid = $mid\t\$hi = $hi\t";
        my $in_count = 1;
        my $start_elem = ${$x_ref}[0];
        my $diff = 0;
        for(my $i = 0 ; $i < $N ; $i++){
            $diff = ${$x_ref}[$i] - $start_elem;
            if($diff >= $mid){
                $in_count++;
                $diff = 0;
                $start_elem = ${$x_ref}[$i];
            }
        }
        # print "\$diff = $diff\t\$in_count = $in_count\t\$C = $C\n";
        # sleep(1);
        if($in_count < $C){
            $hi = $mid + 1;
        }elsif($in_count > $C){
            $lo = $mid - 1;
        }else{
            last;
        }
        $old_mid = $mid;
    }
    my $finalAnswer = $mid;
    for(my $loop_v = $finalAnswer + 1; ; $loop_v++){
        if(maxPossible($loop_v, $x_ref, $x_hashRef, $N, $C)){
            $finalAnswer = $loop_v;
            last;
        }else{
            last;
        }
    }
    return $finalAnswer;
}

sub maxPossible{
    my ($count, $x_ref, $x_hashRef, $N, $C) = (shift, shift, shift, shift, shift);
    my $in_count = 1;
    my $start_elem = ${$x_ref}[0];
    my $diff = 0;
    my @hash_keys = keys %{$x_hashRef};
    my @sorted_keys = sort {$a <=> $b} @hash_keys;
    # print "Inside maxPossible(): sorted keys => @sorted_keys\n";
    for(my $i = 1 ; $i < @sorted_keys ; $i++){
        $diff = ${$x_ref}[$i] - $start_elem;
        if($diff >= $count){
            $in_count++;
            $diff = 0;
            $start_elem = ${$x_ref}[$i];
        }
    }
    # print "Inside maxPossible() \$diff = $diff\t\$in_count = $in_count\t\$C = $C\n";
    # sleep(1);
    if($in_count == $C){
        return 1;
    }else{
        return 0;
    }
}


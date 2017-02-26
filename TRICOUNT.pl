#!/usr/bin/perl
use strict;
use warnings;
chomp(my $t=<>);
while($t-->0){
    chomp(my $N=<>);
    my($s1,$s2)=(0,0);
    $s1=($N*($N+1)*($N+2))/6;
    if($N%2==0){
        for(my $i=1;$i<=$N-1;$i+=2){
                $s2+=($i*($i+1)/2);
        }
    }else{
        for(my $i=2;$i<=$N-1;$i+=2){
            $s2+=($i*($i+1)/2);
        }
    }
    print $s1+$s2;
    print "\n";
}

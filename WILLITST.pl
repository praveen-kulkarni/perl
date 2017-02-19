#!/usr/bin/perl
use strict;
use warnings;
my %myhash;
my $flag = 1;
chomp(my $n = <>);
$myhash{$n} = 1;
while($n > 1){
        if($n % 2 == 0){
                $n = $n / 2;
                if(defined $myhash{$n}){
                        $flag = 0;
                        last;
                }else{
                        $myhash{$n} = 1;
                }
        }else{
                $n = 3 * $n + 3;
                if(defined $myhash{$n}){
                        $flag = 0;
                        last;
                }else{
                        $myhash{$n} = 1;
                }
        }
}
if($flag){
        print "TAK\n";
}else{
        print "NIE\n";
}


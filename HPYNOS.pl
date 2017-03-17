#!/usr/bin/perl
use strict;
use warnings;
sub isHappy;
chomp(my $N = <>);
my %hash;
my $count = 1;
if(isHappy($N)){
    print "$count\n";
}else{
    print "-1\n";
}

# A recursive sub-routine
sub isHappy{
    my $N = shift;
    my $len = length($N);
    my $sum = 0;
    
    # Using substr() to fetch each digit by treating $N as a string instead of number 
    # is best way to get digits from the number $N
    $sum += (substr($N,$_,1) * substr($N,$_,1)) for(0..$len-1);
    # print "\$N = $N\t\$sum = $sum\t\$count = $count\n";
    if(defined $hash{$sum}){
        return 0;
    }else{
        if($sum == 1){
            return 1;
        }
        $count++;
        $hash{$sum} = 1;
        isHappy($sum);
    }
}


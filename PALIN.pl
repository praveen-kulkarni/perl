#!/usr/bin/perl
use strict;
use warnings;
sub middleTerm;
sub leftHalf;
sub rightHalf;
sub makePalindrome;
sub findNextPalindrome;
chomp(my $t = <>);
while($t-- > 0){
        chomp(my $n = <>);
        #print "LeftHalf = ".leftHalf($n)."\n";
        #print "Middle Term = ".middleTerm($n)."\n";
        #print "RightHalf = ".rightHalf($n)."\n";
        chomp(my $palin1 = makePalindrome($n));
        #print "\$palin1 = $palin1\n";
        if($palin1 > $n){
                print "$palin1\n";
        }else{
                if(middleTerm($palin1) =~ /9/){
                        my $increment = 10 ** (int(length($palin1)/2) + 1);
                        #print "\$increment = $increment\n";
                        $palin1 = (int($palin1/$increment) + 1) * $increment;
                        #print "New \$palin1 = $palin1\n"
                }
                print findNextPalindrome($palin1)."\n";
        }
}

sub middleTerm{
        my $a = shift;
        my $middle;
        if(length($a) % 2 == 0){
                $middle = substr($a,(length($a) / 2 - 1),2);
        }else{
                $middle = substr($a,(length($a) / 2),1);
        }
        $middle;
}

sub leftHalf{
        my $a = shift;
        my $index;
        if(length($a) % 2 == 0){
                $index = length($a) / 2 - 1;
        }else{
                $index = length($a) / 2;
        }
        substr($a,0,$index);
}

sub rightHalf{
        my $a = shift;
        my $index;
        my $right;
        if(length($a) % 2 == 0){
                $index = length($a) / 2;
                $right = substr($a,$index + 1,length($a) + 1);
        }else{
                $index = length($a) / 2 + 1;
                $right = substr($a,$index,length($a) + 1);
        }
        $right;
}

sub makePalindrome{
        my $n = shift;
        if(length($n) % 2 == 1){
                return leftHalf($n).middleTerm($n).scalar reverse(leftHalf($n));
        }else{
                return leftHalf($n).substr(middleTerm($n),0,length(middleTerm($n))/2).scalar reverse(substr(middleTerm($n),0,length(middleTerm($n))/2)).scalar reverse(leftHalf($n));
        }
}

sub findNextPalindrome{
        my $n = shift;
        my $l = leftHalf($n);
        my $m = middleTerm($n);
        my $r = scalar reverse($l);
        my $middle = $m + "1" x length($m);
        #print "\$middle = $middle\n";
        $l.$middle.$r;
}


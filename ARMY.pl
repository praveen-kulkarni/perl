#!/usr/bin/perl
use strict;
use warnings;
chomp(my $t = <>);
while($t-- > 0){
        chomp(my $ignored_line = <>);
        chomp($_ = <>);
        my @input = split(/ /,$_);
        my($NG, $NM) = ($input[0], $input[1]);
        chomp($_ = <>);
        my @NG_ARMY = split(/ /,$_);
        chomp($_ = <>);
        my @NM_ARMY = split(/ /,$_);
        @NG_ARMY = sort(@NG_ARMY);
        @NM_ARMY = sort(@NM_ARMY);
        while(@NG_ARMY != 0 and @NM_ARMY != 0){
                if($NG_ARMY[0] >= $NM_ARMY[0]){
                        # print "Inside if\n";
                        shift @NM_ARMY;       # This will shifts off the first element of the list @NM_ARMY
                        # print "@NM_ARMY\n";
                }else{
                        # print "Inside else\n";
                        shift @NG_ARMY;       # This will shifts off the first element of the list @NG_ARMY
                        # print "@NG_ARMY\n";
                }

        }
        # print "\@NG_ARMY = @NG_ARMY\n";
        # print "\@NM_ARMY = @NM_ARMY\n";
        if(scalar @NG_ARMY > 0){
                print "Godzilla\n";
        }else{
                print "MechaGodzilla\n";
        }
}

#!/usr/bin/perl
use strict;
use warnings;

chomp(my $T = <>);
while($T-- > 0){
    chomp(my $blankLine = <>);
    chomp(my $expression = <>);
    # Get rid off any additional spaces in the expression
    $expression =~ s/\s//g;
    # Get rid off = sign at the end of expression
    $expression =~ s/=//;
    
    # Loop till expression contains any operator(s)
    while($expression =~ /[\+\-\*\/%]/){
        my $ans = "";
        # Match operand operator operand at the beginning of expression and store the patterns matched for future use
        if($expression =~ m{^(\d+)([\+\-\*\/%])(\d+)}){
            # Compute the partial expression value based on the operands and operator by referencing stored pattern values
            if($2 eq "+"){
                $ans = $1 + $3;
            }elsif($2 eq "-"){
                $ans = $1 - $3;
            }elsif($2 eq "*"){
                $ans = $1 * $3;
            }elsif($2 eq "/"){
                $ans = int($1 / $3);
            }elsif($2 eq "%"){
                $ans = $1 % $3;
            }
        }
        # Replace already computed portion of the expression with null
        $expression =~ s/^(\d+)([\+\-\*\/%])(\d+)//;
        # Form the expression to be used in next iteration
        $expression = $ans.$expression;
    }
    # Print the final answer
    print "$expression\n";
}


#!/usr/bin/perl -w
my $secret_word = "llama";
print "What's your name? : ";
chomp($name = <STDIN>);
if($name eq "Praveen"){
	print "Hello $name, How good are you to be here!!\n";
}else{
	print "Hello $name\n";
	print "Guess the secret word : ";
	chomp($guess = <STDIN>);
	until($guess eq $secret_word){
		print "Wrong guess!";
		print "Guess the correct secret word: ";
		chomp($guess = <STDIN>);
	}
}

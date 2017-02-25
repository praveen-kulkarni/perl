#!/usr/bin/perl -w
%words = qw(
    fred        camel
    barney      llama
    betty       alpaca
    wilma       alpaca
);
print "What's you name? : ";
$name = <STDIN>;
chomp($name);
$original_name = $name;
$name =~ s/\W.*//;
$name =~ tr/A-Z/a-z/;
if($name eq "praveen"){
	print "Hello $original_name, How good are you to be here!!\n";
}else{
	print "Hello $original_name\n";
	$secret_word = $words{$name};
	if($secret_word eq ''){
		$secret_word = "fruit";
	}
	print "Guess the secret word: ";
	chomp($guess = <STDIN>);
	until($guess eq $secret_word){
		print "Wrong guess!! Guess the correct word: ";
		$guess = <STDIN>;
		chomp($guess);
	}
}

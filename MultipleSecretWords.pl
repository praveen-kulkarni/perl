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
if($name eq "Praveen"){
	print "Hello $name, How good are you to be here!!\n";
}else{
	$secret_word = $words{$name};
	if($secret_word eq ''){
		$secret_word = "fruit";
	}
	print "Guess the secret word: ";
	$guess = <STDIN>;
	chomp($guess);
	until($guess eq $secret_word){
		print "Wrong guess!! Guess the correct word: ";
		$guess = <STDIN>;
		chomp($guess);
	}
}

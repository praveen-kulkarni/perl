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

if($name =~ /praveen\b/i ){
	print "Hello $name, How good are you to be here!!\n";
}else{
	print "Hello $name\n";
	print "Guess the secret word: ";
	chomp($guess = <STDIN>);
	while(!good_word($name, $guess)){
		print "Wrong guess!! Guess the correct word: ";
		$guess = <STDIN>;
		chomp($guess);
	}
}

sub good_word{
	my($somename, $someguess) = @_;
	$somename =~ s/\W.*//;
	$somename =~ tr/A-Z/a-z/;
	if($somename eq "praveen"){
		return 1;
	}elsif(($words{$somename} || "fruit") eq $someguess){
		return 1;
	}else{
		return 0;
	}
}

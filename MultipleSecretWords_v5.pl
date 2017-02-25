#!/usr/bin/perl -w
init_words();
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

sub init_words{
	open WORDLIST, "<", "wordlist" || die "Can't fine the wordlist: $!\n";
	if(-M WORDLIST > 7.0){
		die "Sorry the wordlist being used is older than 7 days\n";
	}
	while(defined($name = <WORDLIST>)){
		chomp($name);
		chomp($word = <WORDLIST>);
		$words{$name} = $word;
	}
	close WORDLIST;
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
		open MAIL, "|mail praveen.kulakrni.code\@gmail.com";
		print MAIL "Bad news: $somename guessed $someguess\n";
		close MAIL;
		return 0;
	}
}

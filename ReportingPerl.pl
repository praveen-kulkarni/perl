#!/usr/bin/perl -w
while(defined($filename = glob("*.secret"))){
	open WORDLIST,"<",$filename || die "Couldn't open the file named $filename : $!\n";
	if(-M WORDLIST > 7.0){
		die "Sorry, the secreword file $filename is older than 7 days!\n";
	}
	while(defined($name = <WORDLIST>)){
		chomp($name);
		chomp($word = <WORDLIST>);
		write;				# invokes format STDOUT to STDOUT
	}
	close WORDLIST || die "Couldn't close the $filename : $!\n";
}

format STDOUT =
@<<<<<<<<<<<<<<< @<<<<<<<<< @<<<<<<<<<<<
$filename, $name, $word
.

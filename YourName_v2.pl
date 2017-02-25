#!/usr/bin/perl -w
print "What is you name? : ";
chomp($name = <STDIN>);
if($name eq "Praveen"){
	print "Hello $name, How good are you to be here!!\n";
}else{
	print "Hello, $name\n";
}

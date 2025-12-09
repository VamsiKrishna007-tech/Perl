use strict;
use warnings;

while (1){
print "Enter the first number or type 'stop' to exit:\n";
my $number1 = <STDIN>;  
chomp($number1);
last if $number1 eq "stop";
print "Enter the second number:\n"; 
my $number2 = <STDIN>;
chomp($number2);
print "Select Operator (+,-,*,/):\n";
my $operator = <STDIN>;
chomp($operator);

my $result;
if ($operator eq "+"){
	$result = $number1 + $number2;
	print "Addition of $number1 and $number2 is $result\n";
}
elsif ($operator eq "-"){
	$result = $number1 - $number2;
	print "Subtraction of $number1 and $number2 is $result\n";	
}
elsif ($operator eq "*"){
	$result = $number1 * $number2;
	print "Multiplication of $number1 and $number2 is $result\n";	
}
elsif ($operator eq "/"){
	$result = $number2 eq 0 ? "Invalid Div by zero" :$number1 / $number2;
	print "Division of $number1 and $number2 is $result\n";	
}
else{
	print "Invalid Operator";
}
}

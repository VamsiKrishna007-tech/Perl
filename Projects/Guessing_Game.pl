use strict;
use warnings;

my $guess = int(rand(100))+1;
chomp($guess);

my $chance = 0;
while ($chance < 6){
 $chance++;
print "Enter a number between 1 to 100";
my $num = <STDIN>;
chomp($num); 
 if ($num == $guess){
 print "Contrats, right answer\n";
 last;
 }
 elsif ($num < $guess){
 print "Too Low, try again\n";
 }
 else {
 print "Too High, try again\n";
 } 
 }
 
 print "Sorry you Failed, correct answer is $guess" if $chance == 6;
use strict;
use warnings;

my $log_file = "report.txt";
my $output_file = "output.txt";
open(my $fh, '<', $log_file) or die "Could not open";
open(my $out, '>', $output_file) or die "Could not open";
my $f1; 
my $f2;
my @pattern;
my @coverage;
my @rows;

#print $out " Pattern   Coverage \n";
#print $out "--------------------\n";

while (my $line = <$fh>) { 
if ($line =~ /Run\s+fault\s+simulation\s+for\s+abcd\s*=\s*([01]{4})/i) {
        $f1 = $1;
		push (@pattern, $f1);
        next;		
	}
if (defined $f1 && $line =~ /^\s*test_coverage\s+([0-9]+(?:\.[0-9]+)?)\s*%/i) {
        $f2 = $1;
		push (@coverage, $f2);
		push (@rows, [$f1,$f2]);              #Added @rows to store pairs like: ["0010", 20.59]
#		print $out " $f1    $f2% \n";
		undef $f1; 
		next;
    }		
}

my $max = $coverage[0];
my $max_pattern = $pattern[0];
for ( my $i = 0; $i < @coverage; $i++){
if ($coverage[$i] > $max){
	$max = $coverage[$i];
	$max_pattern = $pattern[$i];
}
}

print $out " Sorted Coverage \n";
print $out " Pattern   Coverage \n";
print $out "--------------------\n";
@rows = sort { $b->[1] <=> $a->[1] } @rows;       #Sorting is done on @rows using numeric coverage
foreach my $r (@rows) {
    print $out "$r->[0]      $r->[1]%\n";
}

print $out "Pattern with highest Coverage is $max_pattern : $max% \n"; 
print "Saved Results to $output_file\n";
 
 
close($fh);
close($out); 

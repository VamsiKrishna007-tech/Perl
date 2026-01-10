=begin comment
 A log parser is a tool or process that converts messy, unstructured log files 
(from servers, apps, networks) into organized, machine-readable data, making it searchable 
and analyzable for IT, security, and performance insights using SQL-like queries, 
essentially turning text logs into a searchable database for troubleshooting, 
security monitoring, and performance optimization. 
=cut

use strict;
use warnings;

#Define log file path
my $log_file = "logs.txt";

#Open the log file for reading
open (my $fh, '<', $log_file) or die "Could not open the log file";

#Menu Selection
sub menu {
    print "\n-- Welcome to Log Parser Tool -- \n";
    print "Choose an option\n";
    print "1. Show all logs\n";
    print "2. Show Error logs\n";
    print "3. Show Warning logs\n";
    print "4. Show Info logs\n";
    print "5. Search logs by keyword\n";
    print "6. Exit\n";
    chomp (my $option = <STDIN>);
    return $option;
}

#Main
while (1) {
my $option = &menu();
if ($option == 1) {
    display_logs("");
}
elsif ($option == 2) {
    display_logs("ERROR");
}
elsif ($option == 3) {
    display_logs("WARNING");
}
elsif ($option == 4) {
    display_logs("INFO");
}
elsif ($option == 5) {
    keyword();
}
elsif ($option == 6) {
    print("Exiting..\n");
    last;
}
else {
    print("Invalid option, Try Again\n");
}
}

close($fh); # Close the open log file

#Option-1,2,3,4
sub display_logs {
    my ($filter) = @_;
    seek($fh,0,0);  #It resets the pointer to start of log file every time a new search begins
    my $found = 0;

    while (my $line = <$fh>){
        if (!$filter || $line =~ /\[$filter\]/) {
            print $line;
            $found = 1;
        }
    }
    print "The $filter  is not found\n", unless $found;
}

#Option-5
sub keyword {
    print "Enter keyword to search: ";
    my $keyword = <STDIN>;
    chomp($keyword);
    seek($fh,0,0);
    my $found = 0;

    while (my $line = <$fh>){
        if ($line =~ /$keyword/i) {
            print $line;
            $found = 1;
        }
    }
    print "The Keyword you are searching is not found\n", unless $found;
   }

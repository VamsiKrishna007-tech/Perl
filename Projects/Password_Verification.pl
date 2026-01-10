use strict;
use warnings;

sub enter_password {
	my $password = "Vamsi_Krishna007";
	print "Enter Password\n";
	my $pass = <STDIN>;
	chomp($pass);
	if ($pass eq $password) {
		print " Acess Granted\n";
	}
	else {
		&message;
	}
}

sub message {
	print "Access Denied!\n" x 20;
}

&enter_password;
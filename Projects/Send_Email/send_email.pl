#!/usr/bin/perl
###cpan install MIME::Lite Net::SMTP::SSL Authen::SASL
use MIME::Lite;
use Net::SMTP::SSL;
use Authen::SASL;

# Email settings
my $smtp_server = 'smtp.gmail.com';
my $smtp_port   = 465;
my $username    = 'your_email@gmail.com';
my $password    = 'your_app_password';  # Use App Password for Gmail

my $from    = 'your_email@gmail.com';
my $to      = 'recipient_email@example.com';
my $subject = 'Automated Email Notification';
my $body    = "Hello,\n\nThis is an automated email sent from a Perl script.\n\nBest regards,\nPerl Bot";

# Create email
my $msg = MIME::Lite->new(
    From    => $from,
    To      => $to,
    Subject => $subject,
    Type    => 'text/plain',
    Data    => $body
);

# Connect to SMTP server and send email
my $smtp = Net::SMTP::SSL->new($smtp_server, Port => $smtp_port)
    or die "Could not connect to SMTP server: $!";

$smtp->auth($username, $password)
    or die "SMTP Authentication failed: $!";

$smtp->mail($from);
$smtp->to($to);
$smtp->data();
$smtp->datasend($msg->as_string);
$smtp->dataend();
$smtp->quit;

print "Email sent successfully to $to\n";


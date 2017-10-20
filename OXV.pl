#!/usr/bin/perl

use HTTP::Request; # If not installed, do -> su => cpan => install HTTP::Request
use LWP::UserAgent; # If not installed, do -> su => cpan => install LWP::UserAgent
use Term::ANSIColor; # if not installed, do -> su => cpan => install Term::ANSIColor

print "\n";
print color("red"), "\n                       @ [By] MOHAMMED ADEL \n\n", color("reset");
print color("blue"),"                     [+] Examples of outputs [+]\n", color("reset");
print color("blue"), "           [T] with URL -> path is working perfectly. \n";
print "           [F] with URL -> path is redirected to login page.\n";
print "           [T] with NO URL -> path doesn't exists.\n\n", color("reset");
print color("white"), "           NOTICE : If the output is [T] with URL,\n", color("reset");
print color("white"), "           then the URL leads to access\n", color("reset");
print color("white"), "           information without logging in. ;)\n\n", color("reset");
print color("red"), "      ------------------------------------------------------------\n\n", color("reset");
print color("blue"), "                     [+] Example of input [+]\n";
print "           [*] https://example.oracle.com/ords/f?p=\n\n\n", color("reset");
print color("yellow"), "Enter URL --> ", color("reset");
my $url1 = <STDIN>;
chomp $url1;
my $i;
my $start_num = 340; # minimum number is 1 .
my $end_num = 345; # As many number as you want ;)

for($i = $start_num; $i <= $end_num; $i++){

my $url = "$url1".$i;
my $ua = LWP::UserAgent->new;
my $request  = HTTP::Request->new( GET => $url );
my $response = $ua->request($request);
my $final = $response->header('Location');

if ($final =~ m/:LOGIN_DESKTOP:/)
 {
 print color("red"), "\n\n[F] $final\n", color("reset");
}
else
{
  print color("green"), "\n\n[T] $final\n", color("reset");
}
}

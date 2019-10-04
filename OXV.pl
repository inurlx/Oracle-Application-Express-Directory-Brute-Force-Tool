#!/usr/bin/perl

use HTTP::Request; # If not installed, do -> su => cpan => install HTTP::Request
use LWP::UserAgent; # If not installed, do -> su => cpan => install LWP::UserAgent
use Term::ANSIColor; # If not installed, do -> su => cpan => install Term::ANSIColor
use Win32::Console::ANSI; # If not installed, do -> su => cpan => install Win32::Console::ANSI

print "\n";
print color("red"), <<MD;
                             _..:::.._
                           .:::::/|::::.
                          ::::::/ V|:::::
                         ::::::/'  |::::::
                         ::::<_,   (::::::
                          :::::|    \::::
                           '::/      \:' ~ By MOHAMMED ADEL 
	~ Oracle Application Express Directory Brute Force ~
					
					
MD
print color("blue"), "      ------------------------------------------------------------\n\n", color("reset");
print "           [*] Example: https://example.oracle.com/ords/f?p=\n\n\n", color("reset");
print color("yellow"), "[-] LINK || URL --> ", color("reset");
my $url1 = <STDIN>;
chomp $url1;
my $i;
my $start_num = 100; # minimum number is 1 .
my $end_num = 9999; # the higher the better

for($i = $start_num; $i <= $end_num; $i++){

my $url = "$url1".$i;
my $ua = LWP::UserAgent->new;
my $request  = HTTP::Request->new( GET => $url );
my $response = $ua->request($request);
my $final = $response->header('Location');
my $final_code = $response->status_line;

if ($final =~ m/:LOGIN_DESKTOP:/)
 {
 print color("red"), "\n\n[FAILED] $final\n", color("reset");
}
    else
    {
        next if($final_code =~ m/200 OK/);

	       if($final_code =~ m/302 Found/)
		      {
  		        print color("green"), "\n\n[SUCCESS] $final\n", color("reset");
                }
        }
}

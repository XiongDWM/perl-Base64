#!/strawberry/perl/bin -w
use MIME::Base64;
#use Scalar::Util qw(looks_like_number);
use strict;
use warnings;

=TODO
 later, make this script object-oriented design 
	 to make the variable $require and $emsg(prob the origin $msg) as the parameter
	 and make this script as a package (encodin.pm) and write the new() subs in. sub get and set.
	 write another scprit called encodeImpl.pl and call this method.
	 $require=~/^\d+&/&&
=cut
sub encodeWithBase64;

encodeWithBase64;

print "type N  to exist ";
my $str=<STDIN>;
encodeWithBase64 unless $str=~/N/i;

my $Waiting=<STDIN>;


sub encodeWithBase64{
	print "enter the bits requirement: ";
	our $require=<STDIN>;
	#encoding msg within 64 bytes
	print "please enter text: ";
	our $emsg=encode_base64(<STDIN>);
	our $dmsg=decode_base64($emsg);
	our $count=length($dmsg)*8;
	if($require=~/\d+/&&$require>0&&$count>$require){
		print "already typed da txt in and meet the requirement, move to next\n";
		#write to file
		open my $d,">>documented.txt"||die "!!";  
		print $d "the key: $dmsg encoded :$emsg count: $count \n==========================";
		print $d "\n";
		close $d||die"!!!";
		print "after encode the msg turn to be $emsg\n";
		print "origin text is: $dmsg\n";
		print "count bits: $count\n";
		print "SUCCESS!!!";
		print "\n";
	}else{
		print "requirement not meet: either text is too short to meet the bits-requirment which enter at the top of the all OR the bits-requirment is not numeric
			   please do it again\n"
	}
}













=CopyrightAndAuthorInfo
author:dawei xiong
email 1:wowrealmer@163.com
email 2:wowrealmer@gmail.com

=cut







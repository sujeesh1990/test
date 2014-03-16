#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $file = $ARGV[0] or die "Need to get CSV file on the command line\n";
my $fields =  $ARGV[1];
my @field = split "," , $fields;
  
open my $fh, "<", $file or die "$file: $!";

my $csv = Text::CSV->new ({
	sep_char => ',',
    binary => 1, # Allow special character. Always set this
    auto_diag => 1, # Report irregularities immediately
    });
while (my $row = $csv->getline ($fh)) {
		my  $counter = 0;
		while ($counter <= $#field) {
			print "@$row[$field[$counter] - 1]|" ;
			$counter++;
		}
		$counter = 0;
		print "\n";
}
close $fh;

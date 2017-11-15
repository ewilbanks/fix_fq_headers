#!/usr/bin/env perl


use strict;
use warnings;

die "usage: fq_fix_index.pl infile.fastq\n Pulls indexes out of header of fastq and makes them their own file" unless @ARGV==1;

open(IN, "< $ARGV[0]") or die "can't open file $ARGV[0]\n";
while (my $line = <IN>) {
  #	if ($line =~ /^@([^\s]+) \d:N:\d:([A-Z]+)\+([A-Z]+)/){
	if ($line =~ /^(@[^\s]+) \d:N:\d:([A|T|C|G]+)\+([A|T|C|G]+)/){
    print "$1\n$2\n$1\n$3\n";
  }
}
close(IN);

#!/usr/bin/env perl


use strict;
use warnings;

die "usage: fq_fix_index.pl infile.fastq\n Pulls indexes out of header of fastq and makes them their own file\n" unless @ARGV==1;

open(IN, "< $ARGV[0]") or die "can't open file $ARGV[0]\n";
my @filepath = split(/\//, $ARGV[0]);
my @filename = split(/\.fastq/, $filepath[-1]);
my $base = $filename[0];
print "$base\n";

open(OUT1,">$base.index1.fastq");
open(OUT2,">$base.index2.fastq");
while (my $line = <IN>) {
  #	if ($line =~ /^@([^\s]+) \d:N:\d:([A-Z]+)\+([A-Z]+)/){
	if ($line =~ /^@([^\s]+ \d:N:\d):([A|T|C|G]+)\+([A|T|C|G]+)/){
    print OUT1 "\@$1\n$2\n\+\nXXXXXXXX\n";
    print OUT2 "\>$1\n$3\n+\nXXXXXXXX\n";
  }
}
close(IN);

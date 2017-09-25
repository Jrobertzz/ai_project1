/usr/bin/perl
use strict;
use warnings;

my $filename1 = 'dataM.txt';
my $filename2 = 'dataM2.txt';

open(my $fh1, '<:encoding(UTF-8)', $filename1)
  or die "Could not open file '$filename' $!";
  
open(my $fh2, '>:encoding(UTF-8)', $filename2)
  or die "Could not open file '$filename' $!";
 
while (my $row = <$fh1>) {
  chomp $row;
  $row =~ m/^\s+(\S+)\s(\S+)\s+$/;
  print $fh2 $1 . "," . $2 . ",1";
}

close($fh2);
close($fh1);
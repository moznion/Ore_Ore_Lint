#!/usr/bin/env perl

use 5.012;
use strict;
use warnings;

use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 1;

foreach my $filename ( @ARGV ) {
    open my $fh, '<', $filename;

    my $line_number = 1;
    foreach my $line ( <$fh> ) {
        if ( $line =~ /(.*)(TODO|FIXME|XXX|HACK)(.*)/ ) {
            print "$filename (line:$line_number): ";
            print $1;
            print BOLD RED $2;
            print $3."\n";
        }
        $line_number++;
    }
    close $fh;
}

#!/usr/bin/perl
use strict;
use warnings;
use English qw( -no_match_vars ) ;
use Data::Dumper;
use Test::More tests => 2;

$main::attr{global}{logfile} = q{fhem.log};

use FHEM::Core;

say Dumper(\%main::defs);


done_testing();
__END__

use_ok(q{FHEM::Modules::Weather::Buienradar::Precipitation});




# diag FHEM::Modules::Weather::Buienradar::Precipitation::initialize_module(%main::defs);





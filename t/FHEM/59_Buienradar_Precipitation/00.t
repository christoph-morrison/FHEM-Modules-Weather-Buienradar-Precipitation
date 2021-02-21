#!/usr/bin/perl
use strict;
use warnings;
use Test2::V0;
use English qw( -no_match_vars ) ;
use Data::Dump::Color qw{dd};
use FHEM::Mock;
use lib q{FHEM/};

require q{59_Buienradar_Precipitation.pm};

subtest q{init} => sub {
    diag main::Buienradar_Initialize();
    SKIP: {
        skip "TODO Implement tests for oo init";
    }
};

done_testing();


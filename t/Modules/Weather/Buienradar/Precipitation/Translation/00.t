#!/usr/bin/perl
use strict;
use warnings;
use Test2::V0;
use English qw( -no_match_vars ) ;
use Data::Dump::Color qw{dd};
use FHEM::Mock;

subtest q{init} => sub {
    SKIP: {
        skip "TODO Implement tests for oo init";
    }
};

done_testing();


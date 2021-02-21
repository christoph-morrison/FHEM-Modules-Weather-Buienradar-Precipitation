## no critic

use warnings FATAL => 'all';
use strict;
use FHEM::Modules::Weather::Buienradar::Precipitation;
use English q{-no_match_vars};

sub main::Buienradar_Initialize {
    return FHEM::Modules::Weather::Buienradar::Precipitation::initialize_module(@ARG);
}

1;
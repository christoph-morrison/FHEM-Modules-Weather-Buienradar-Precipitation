package FHEM::Mock;
use strict;
use warnings FATAL => 'all';
use 5.015;

use Log::Log4perl qw(:easy);
use Data::Dumper;

# ----- initialze logger
Log::Log4perl::init('devconf/log4perl.conf');
$main::logger = Log::Log4perl->get_logger();
$main::logger->info(q{Mock started});

# central hash for device definitions
our %defs;

sub main::AttrVal {
    my ($device_name, $attr_name, $default_value) = @_;
    return $default_value if (not defined($defs{$device_name}{attr}{$attr_name}));
    return $defs{$device_name}{attr}{$attr_name}{value};
};

sub main::Attr {
    my ($device_name, $attr_name, $attr_val) = @_;

    $defs{$device_name}{attr}{$attr_name} = {
        value     => $attr_val,
        timestamp => time,
    };
}

sub main::Log3 {
    my ($device_name, $log_level, $message) = @_;
    $main::logger->info(Dumper({ mocked_function => q{Log3}, device_name => $device_name, log_level => $log_level, message => $message }));
}

1;
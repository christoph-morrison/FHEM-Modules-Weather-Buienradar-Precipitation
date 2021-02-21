package FHEM::Modules::Weather::Buienradar::Precipitation;

# ---------- configure execution
use strict;
use warnings FATAL => 'all';
use 5.015;
use locale;
use utf8;
use feature 'unicode_strings';
use English qw{-no_match_vars};

# ---------- load core modules
use Data::Dumper;
use Carp;
use POSIX qw(locale_h);

# ---------- load non-core modules savely
BEGIN {
    eval q{ use Module::Load::Conditional qw[check_install] };
    ::Log3(undef, 1, qq{Please install Module::Load::Conditional for } . __PACKAGE__) if $EVAL_ERROR;
    croak $EVAL_ERROR if $EVAL_ERROR;

    my @used_modules = qw{
        JSON::MaybeXS
        Locale::TextDomain
        Cpanel::JSON::XS
        Readonly
        FHEM::Meta
        FHEM::Modules::Weather::Buienradar::Precipitation::Data
    };

    my $error = undef;

    for my $module (@used_modules) {
        my $module_info = check_install( module => $module );

        if ( not defined  $module_info ) {
            $error = qq{$module is not installed. Can't initialize } . __PACKAGE__;
            ::Log3(undef, 1, $error);
            croak $error;
            last;
        }

        if ( $module_info->{uptodate} != 1 ) {
            ::Log3(undef, 2, qq{$module is not up to date. Consider an update.});
        }

        if ( defined $main::logger ) {
            $main::logger->info(Data::Dumper->Dump([ $module_info ], [ qw($module) ]));
        }
    }

    # ---------- load translations
    use Locale::TextDomain(
        q{buienradar},
        qw{ lib/FHEM/Modules/Weather/Buienradar/Precipitation/Translation },
    );

    # ---------- load data model
    use FHEM::Modules::Weather::Buienradar::Precipitation::Data;

    # use FHEM::Meta;
    use JSON::MaybeXS;
    use Readonly;
}



#### -------------------------------------------------------------------------------------------------------------------


sub initialize_module {
    my ($definition_hash) = shift;

    $definition_hash->{SetFn}       = \&FHEM::Modules::Weather::Buienradar::Precipitation::set_handler;
    $definition_hash->{GetFn}       = \&FHEM::Modules::Weather::Buienradar::Precipitation::get_handler;
    $definition_hash->{DefFn}       = \&FHEM::Modules::Weather::Buienradar::Precipitation::define_handler;
    $definition_hash->{NotifyFn}    = \&FHEM::Modules::Weather::Buienradar::Precipitation::notify_handler;
    $definition_hash->{UndefFn}     = \&FHEM::Modules::Weather::Buienradar::Precipitation::undefine_handler;
    $definition_hash->{DeleteFn}    = \&FHEM::Modules::Weather::Buienradar::Precipitation::delete_handler;
    $definition_hash->{ShutdownFn}  = \&FHEM::Modules::Weather::Buienradar::Precipitation::shutdown_handler;
};

1;
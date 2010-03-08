#!/usr/bin/perl
#############################################################################
#
#    Filename: makelinks.pl
#      Author: Chris Charles
#
# ---------------------------------------------------------------------------
#
#    Link versioned dotfiles into the active user's home directory, creating
#    directories as necessary.
#
#############################################################################

use diagnostics;
use strict;
use warnings;

use Cwd;
use File::Basename;
use File::Find;
use File::Path;
use File::Spec;
use FindBin;
use Getopt::Long;

my $exit_value = 0;
my $base_dir = "$FindBin::Bin";
my $ignore_file = '.ignore';

GetOptions('ignore-file=s' => \$ignore_file);

my @files;  # Array of relative files and directories
my %links;  # Hash of absolute links -> targets
my @ignore = ("^$ignore_file\$", '^\.$');

# Read the .ignore file
if (-e "$ignore_file") {
    open(IGNORE, File::Spec->catfile($base_dir, $ignore_file));
    while (<IGNORE>) {
        # Ignore comments in the config file
        # TODO: Use regex to remove comments to end of line then ignore blanks
        unless ($_ =~ /^(?:#.*)?$/) {
            chomp $_;
            push @ignore, $_;
        }
    }
    close(IGNORE);
}

find(\&wanted, $base_dir);
sub wanted {
    my $file = File::Spec->abs2rel($File::Find::name, $base_dir);

    # We only care about files.
    if (-f $_) {
        my $make_link = 1;
        foreach my $pattern (@ignore) {
            if ($file =~ /$pattern/) {
                $make_link = 0;
                last;
            }
        }

        push @files, $file if $make_link;
    }
}

%links = map {
    File::Spec->catfile($ENV{'HOME'}, '.' . $_) =>
            File::Spec->catfile($base_dir, $_);
} @files;

foreach my $link (sort keys %links) {
    my $target = $links{$link};
    my $link_dir = dirname($link);

    unless (-e $link_dir) {
        if (mkpath($link_dir)) {
            print "mkdir $link_dir\n";
        }
    }
    if (symlink $target, $link) {
        print "ln -s $target $link\n";
    }
}

exit $exit_value;

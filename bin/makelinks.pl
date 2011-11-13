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

use Term::ANSIColor qw(:constants);


my $exit_value = 0;
my $base_dir = Cwd::realpath("$FindBin::Bin/..");
my $ignore_file = '.ignore';
my $do_delete = 0;
my $find_broken = 1;

GetOptions('ignore-file=s' => \$ignore_file,
           'delete'        => \$do_delete,
           'find-broken'   => \$find_broken);

my @files;  # Array of relative files and directories
my %links;  # Hash of absolute links -> targets
my @ignore = ("^$ignore_file\$", '^\.$');

# Read the .ignore file
if (-e File::Spec->catfile($base_dir, "$ignore_file")) {
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

if ($do_delete) {
    foreach my $link (sort keys %links) {
        my $target = $links{$link};

        if (-l $link) {
            if (readlink($link) eq $target) {
                if (unlink $link) {
                    print "rm $link\n";
                }
            }
            else {
                print "$link does not point to $target\n";
            }
        }
    }
}
else {
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
}

if ($find_broken) {
    find(sub {
             my $file = $File::Find::name;
             if (-l $file) {
                 my $target = readlink($file);
                 if ($target =~ /$base_dir/) {
                     if (not -e $target) {
                         print STDERR RED, "Broken link: $file ($target)\n", RESET;
                     }
                 }
             }
         },
         $ENV{'HOME'});
}

exit $exit_value;

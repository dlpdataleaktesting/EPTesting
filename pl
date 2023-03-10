#!/usr/bin/env perl -w

##############################################################################
# File   : 
# Author : Guillaume-Jean Herbiet  <guillaume-jean@herbiet.net>
#
#
# Copyright (c) 2010 Guillaume-Jean Herbiet     (http://herbiet.net)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Guillaume-Jean Herbiet
# <guillaume-jean@herbiet.net>
#
##############################################################################
use strict;
use warnings;

#-----------------------------------------------------------------------------
# Load aditional packages
#
use Getopt::Long;					# To easily retrieve arguments from command-line
use Term::ANSIColor qw(:constants);	# Colored output for the terminal

#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Log and debug
#
sub say 	{ print @_, "\n"; }
sub ohai	{ say BOLD, BLUE,	"==> ", RESET, @_;}
sub oops	{ say BOLD, YELLOW,	"/!\\ ",RESET, @_;}
sub fail	{ say BOLD, RED,	"!!! ", RESET, @_;}

#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Global variables
#
my %OPTIONS;						# Hash of passed options
my $OPTIONS_VALID;					# Are the passed options valid ?
my @ARGS = @ARGV;					# Array of passed options
my $COMMAND = `basename $0`;		# Name of the script
chomp($COMMAND);
my $VERSION = "";					# Version of this script

#
# Generic variables
#
my $VERBOSE = 0;					# Verbose mode
my $DEBUG = 0;						# Debug mode

#
# Script specific variables
#

#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Get passed arguments and check for validity.
#
$OPTIONS_VALID = GetOptions(
	\%OPTIONS,
	'help|h'	 => sub { USAGE(); },
	'version'	 => sub { VERSION_MESSAGE(); },
	'verbose|v+' => \$VERBOSE,
	'debug|d'	 => sub { $VERBOSE = 1; $DEBUG = 1; }
);

unless ($OPTIONS_VALID) {
	fail "Error in arguments.";
	USAGE(1);
}

sub USAGE {
	my $exitval = defined($_) ? $_ : 0;
	print <<EOF;
$COMMAND [-h|--help] [--version]

    --help, -h          : Print this help, then exit
    --version           : Print the script version, then exit
EOF
	exit $exitval;
}

sub VERSION_MESSAGE {
	say "This is ", BOLD, "$COMMAND", RESET, " v$VERSION.";
	print <<EOF;
Copyright (c) 2010 Guillaume-Jean Herbiet  (http://herbiet.net)
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
EOF
	exit 0;
}

#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Core code
#

#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Additional functions
#

#-----------------------------------------------------------------------------

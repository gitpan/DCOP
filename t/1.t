#!/usr/bin/perl -w

use Test::More tests => 3;

BEGIN { use_ok('DCOP') };
my $dcop = DCOP->new();
ok( defined $dcop, "new() defined the object" );
ok( $dcop->isa(DCOP), "   Object belongs to the class" );

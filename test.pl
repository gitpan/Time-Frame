#!/usr/bin/perl -w
# 39HKYkg - test.pl created by Pip@CPAN.org to validate Time::Frame
#     functionality.  
#   Before `make install' is performed this script should be run with
#     `make test'.  After `make install' it should work as `perl test.pl'.

BEGIN { $| = 1; print "0..15\n"; }
END   { print "not ok 1\n" unless($lded); }
use strict;
use Time::Frame;

my $rslt; my $fldz; my $tnum = 0; our $lded = 1;
my @rdat = ();
&rprt(1);

sub rprt { # prints test progress
  my $baad = !shift;
  print "not " x $baad;
  print "ok ", $tnum++, "\n";
  print @_ if(($ENV{TEST_VERBOSE} ||1) and $baad);
}
$fldz = new Time::Frame;
&rprt($fldz == 0);

$rslt = $fldz->get_century();
&rprt($rslt == 0, "$rslt\n");

$rslt = $fldz->set_century(20);
&rprt($rslt == 20, "$rslt\n");

$fldz = Time::Frame->new();
&rprt($fldz == 0);

$fldz = Time::Frame->new('str' => '0123456789');
&rprt($fldz);

$fldz = Time::Frame->new('hash' => { 'jink' => 31 });
&rprt($fldz);

$rslt = $fldz->get_jink();
&rprt($rslt == 31, "$rslt\n");

$fldz = Time::Frame->new('list' => [ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27 ]);
&rprt($fldz);

@rdat = $fldz->ymd();
&rprt($rdat[1] == 6, "@rdat\n");

@rdat = $fldz->ymd(4, 8, 12);
&rprt($rdat[1] == 8, "@rdat\n");

$fldz = Time::Frame->new('9876543210');
&rprt($fldz);

$rslt = $fldz->j(127);
&rprt($rslt == 127, "$rslt\n");

@rdat = $fldz->FooIsMyJoy(4, 8, 12);
&rprt($rdat[2] == 12, "$rslt\n");
&rprt($rdat[7] == 127, "@rdat\n");

$fldz = Time::Frame->new('verbose' => '2 weeks');
$rslt = $fldz->day();
&rprt($rslt == 14, "$rslt\n");

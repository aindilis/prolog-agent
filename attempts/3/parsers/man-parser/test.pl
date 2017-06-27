#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

use Man;

my $parser = Man->new();

my $man = `man man`;
print $man."\n\n";
my @res = $parser->from_string($man);
print Dumper(\@res);

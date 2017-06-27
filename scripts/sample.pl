#!/usr/bin/perl -w

use Rex;
use Rex::Commands::Run;
use Rex::Commands::Fs;
use Rex::Group::Entry::Server;

Rex::connect
  (
   server    => '<IP>',
   user      => '<USERNAME>',
   password  => '<PASSWORD>',
  );

my $output = run('/home/aindilis/play-music.sh');
print "<hi: $output>\n";

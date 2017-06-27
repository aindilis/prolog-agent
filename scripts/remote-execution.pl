#!/usr/bin/perl -w

use BOSS::Config;
use PerlLib::SwissArmyKnife;

use Rex;
use Rex::Commands::Run;
use Rex::Commands::Fs;
use Rex::Group::Entry::Server;

my $specification = q(
	-s <server>		Server
	-u <username>		Username
	-c <command>		Command
);

my $config =
  BOSS::Config->new
  (Spec => $specification);
my $conf = $config->CLIConfig;
# $UNIVERSAL::systemdir = "/var/lib/myfrdcsa/codebases/minor/system";

die unless $conf->{'-s'} and $conf->{'-u'} and $conf->{'-c'};

my $server = $conf->{'-s'};
my $username = $conf->{'-u'};
my $command = $conf->{'-c'};

my $credentials =
  {
   '<IP>' => {
	      '<USERNAME>' => '<PASSWORD>',
	     },
  };

my $verbose = 0;

my $flphostname = `hostname -f`;
chomp $flphostname;
my $flpusername = `whoami`;
chomp $flpusername;

my $output = 'No Output';
my $ran = 0;
if ($flphostname eq "<ACERTAINHOSTNAME>") {
  if ($username eq $flpusername and
      $server eq '<THECORRESPONDINGIP>') {
    # print "<COMMAND: $command>\n";
    $output = `$command`;
    $ran = 1;
  }
}
if (! exists $credentials->{$server}{$username}) {
  die "Don't have credentials stored for $username\@$server\n" unless $ran;
} else {
  if (! $ran) {
    my %args =
      (
       server    => $server,
       user      => $username,
       password  => $credentials->{$server}{$username},
      );
    print Dumper({Args => \%args}) if $verbose;
    Rex::connect(%args);
    $output = run($command);
  }
}

# print "<Command: $command>\n";
# print "<Output: $output>\n";

print $output;

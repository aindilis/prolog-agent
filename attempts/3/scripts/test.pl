#!/usr/bin/perl -w

use UniLang::Util::TempAgent;

my $tempagent = UniLang::Util::TempAgent->new();

$tempagent->MyAgent->QueryAgent
    (
      Receiver => "Emacs-Client",
      Contents => "eval (find-file \"/var/lib/myfrdcsa/codebases/minor/normal-form/to.do\")",
      Data => {
 	      _DoNotLog => 1,
	      },
     );

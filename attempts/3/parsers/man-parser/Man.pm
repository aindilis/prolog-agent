package Man;

use PerlLib::SwissArmyKnife;

use base qw( Parse::Man );

sub para_P {
  my ($self,@args) = @_;
  print Dumper(\@args);
}

sub chunk {
  my ($self,@args) = @_;
  print Dumper(\@args);
}

1;

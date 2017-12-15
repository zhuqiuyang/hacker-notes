use strict;
use warnings;

print "hi NAME\n";

my $name = 'ace';
print "Hi $name\n";


my @mixed   = ("camel", 42, 1.23);
print $mixed[$#mixed], ,$#mixed + 1;
print "n" x 5, "\n";
 
# ref
my $variables = {
    scalar  =>  {
                description => "single item",
                sigil => '$',
                },
    array   =>  {
                description => "ordered list of items",
                sigil => '@',
                },
    hash    =>  {
                description => "key/value pairs",
                sigil => '%',
                },
};
print "Scalars begin with a $variables->{'scalar'}->{'sigil'}\n";

# subroutine
# shift in here mean:
# my ($logmessage, $priority) = @_;       # common
sub logger {
  my $logmessage = shift;
  open my $logfile, ">>", "my.log" or die "Could not open my.log: $!";
  print $logfile $logmessage;
}
logger("We have a logger subroutine!");

sub square {
    my $num = shift;
    my $result = $num * $num;
    return $result;
}
my $sq = square(8);
print $sq, "\n";
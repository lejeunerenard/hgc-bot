use strict;
use warnings;

use lib 'local/lib/perl5';

use lib 'lib';

use HGC::Bot;

my $bot = HGC::Bot->new(
   interval => 60,
);
$bot->run;

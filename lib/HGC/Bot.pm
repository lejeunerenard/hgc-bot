package HGC::Bot;

use strict;
use warnings;

use Moo;
use AE;
use AnyEvent::HTTP;
use JSON;

use Data::Printer;

has interval => (
   is       => 'rw',
   isa    => sub {
      return;
   },
);

=head2 run

Summary of run

=cut

sub run {
   my $self = shift;

   my $cv = AE::cv;

   my $w = AE::timer 0, $self->interval, sub {
      http_post $ENV{API_URL}, to_json({
            text => 'beep boop',
            channel => '#webhooks-playground',
            username => 'Bob',
            icon_emoji => ':alien:',
         }), sub {
         my ($data, $headers) = @_;
            p $data;
            p $headers;
      };
   };

   #{"text": "This is posted to <#general> and comes from *monkey-bot*.", "channel": "#general", "username": "monkey-bot", "icon_emoji": ":monkey_face:"}

   $cv->wait;
}

1;

__END__

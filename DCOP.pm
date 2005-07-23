package DCOP;

use 5.008001;
use strict;
use warnings;

our $VERSION = '0.01';

sub new(){
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my %params = @_;
	my $self  = {};
	$self->{start}	  = localtime;
	$self->{user}	  = $params{user}   if( $params{user} );
	$self->{target}  = $params{target} if( $params{target} );
	$self->{control} = $params{control} if( $params{control} );
	$self->{dcop}	  = "dcop";
	$self->{dcop} 	 .= " --user $self->{user} " if($self->{user});
	$self->{dcop} 	 .= " $self->{target} " if($self->{target});
	$self->{dcop} 	 .= " $self->{control} " if($self->{control});
	bless( $self, $class );
	return $self;
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

DCOP - Perl extension to speak to the dcop server via system's DCOP client.

=head1 SYNOPSIS

  use DCOP;
  $dcop = DCOP->new();

=head1 DESCRIPTION

This class is meant to be a base constructor for higher level of abstraction
on dcop clients.

=head2 EXPORT

None by default.

=head1 SEE ALSO

DCOP::Amarok

=head1 AUTHOR

Juan C. Müller, E<lt>jcmuller@gmail.com<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2005 by Juan C. Müller

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

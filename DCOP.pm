package DCOP;

use 5.008001;
use strict;
use warnings;

our $VERSION = '0.035';

sub new(){
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my %params = @_;
	my $self  = {};
	$self->{start}		= localtime;
	$self->{user}		= $params{user}   if( $params{user} );
	$self->{target}		= $params{target} if( $params{target} );
	$self->{control} 	= $params{control} if( $params{control} );
	chomp( my $basepath = `kde-config --expandvars --exec-prefix` );
	$self->{dcop}	 	= "$basepath/bin/dcop ";
	$self->{dcop} 	 	.= "--user $self->{user} " if($self->{user});
	$self->{dcop} 	 	.= "$self->{target} " if($self->{target});
	$self->{dcop} 	 	.= "$self->{control} " if($self->{control});
	bless( $self, $class );
	return $self;
}

1;
__END__

=head1 NAME

DCOP - Perl extension to speak to the dcop server via system's DCOP client.

=head1 SYNOPSIS

  use DCOP;
  $dcop = DCOP->new();

=head1 DESCRIPTION

This class is meant to be a base constructor for higher level of abstraction
on dcop clients.

=head1 AUTHOR

Juan C. Muller, E<lt>jcmuller@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2005 by Juan C. Muller

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

use strict;
use warnings;

package Code::TidyAll::Plugin::SortLines::Naturally;

use Moo;
extends 'Code::TidyAll::Plugin';

use Unicode::Collate::Locale ();

has 'locale' => ( is => 'ro', default => 'en_US' );

sub transform_source {
    my ( $self, $source ) = @_;

    my $collator = Unicode::Collate::Locale->new( locale => $self->locale );
    return
        join( "\n", $collator->sort( grep {/\S/} split( /\n/, $source ) ) )
        . "\n";
}

1;
__END__

# ABSTRACT: Sort lines of a file using Unicode::Collate::Locale

=pod

=head1 SYNOPSIS

   # In configuration:

   [SortLines::Naturally]
   select = .ispell* **/.gitignore

=head1 DESCRIPTION

Sorts the lines of a file; whitespace lines are discarded. Useful for files
containing one entry per line, such as C<.svnignore>, C<.gitignore>, and
C<.ispell*>.

=head1 CONFIGURATION

=over

=item locale

The locale to use for collation. Defaults to "en_US".

=back

=head1 ACKNOWLEDGEMENTS

This code was essentially pilfered from L<Code::TidyAll::Plugin::SortLines>

=cut

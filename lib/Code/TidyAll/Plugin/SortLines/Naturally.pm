use strict;
use warnings;

package Code::TidyAll::Plugin::SortLines::Naturally;

use Moo;
extends 'Code::TidyAll::Plugin';

use Sort::Naturally qw( nsort );

sub transform_source {
    my ( $self, $source ) = @_;

    return join( "\n", nsort( grep {/\S/} split( /\n/, $source ) ) ) . "\n";
}

1;
__END__

# ABSTRACT: Sort lines of a file using Sort::Naturally

=pod

=head1 SYNOPSIS

   # In configuration:

   [SortLines::Naturally]
   select = .ispell* **/.gitignore

=head1 DESCRIPTION

Sorts the lines of a file; whitespace lines are discarded. Useful for files
containing one entry per line, such as C<.svnignore>, C<.gitignore>, and
C<.ispell*>.

=head1 ACKNOWLEDGEMENTS

This code was essentially pilfered from L<Code::TidyAll::Plugin::SortLines>

=cut

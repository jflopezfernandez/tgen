#!/usr/bin/perl

use utf8;
use v5.26;

use strict;
use warnings;


open(INPUT, "<:utf8", "input.txt") || die "Failed to open exam file!\n";
binmode(STDOUT, ":utf8");

my $examTitle;

# Exam Question Structure:
# - Title
# - Answer 1
# - Answer 2
# - Answer 3
# - Answer 4

sub PrintExam {
    my $questions = 0;

    $examTitle = <INPUT>;

    PrintTitle($examTitle);

    my ($questionTitle, $a, $b, $c, $d);

    while (1) {

        $questionTitle = <INPUT>;

        if (!$questionTitle) {
            exit();
        }

        $a = <INPUT>;
        $b = <INPUT>;
        $c = <INPUT>;
        $d = <INPUT>;

        PrintQuestion(++$questions, $questionTitle, $a, $b, $c, $d);
    }
}

sub PrintQuestion {
    my ($n, $title, $a, $b, $c, $d) = @_;

    say "\tQuestion $n: $title";
    say "\t\tA: $a";
    say "\t\tB: $b";
    say "\t\tC: $c";
    say "\t\tD: $d";
    
    say "";
}

sub PrintTitle {
    my ($title) = @_;

    say "\n" x 3;
    say "\t" x 3 . "$title";
    say "\n" x 3;
}



PrintExam();

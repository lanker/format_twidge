#!/usr/bin/perl

use Text::Wrap;
use Date::Parse;
use Time::Local;

use warnings;
use strict;

$Text::Wrap::columns = 55;

# row, row, header, clear
my @color = ("\033[0;36m", "\033[1;35m", "\033[38;5;243m", "\033[0m");
my $i = 0;
my $link = "https://twitter.com/#!/%s/status/%s";

while (<>)
{
    m/(.*?)\t(.*?)\t(.*?)\t(.*?)\t(.*)\t$/;
    my ($s, $m, $h, $d, $mo, $y) = localtime(timegm(strptime($5)));
    printf("%s%s (%02d%02d|%02d%02d%02d)\n%s\n%s%s%s\n\n",
         $color[2], $2, $h, $m, $y + 1900, $mo+1, $d,
         sprintf($link, $2, $1), $color[$i=!$i], wrap('', '', $4), $color[3]);
}

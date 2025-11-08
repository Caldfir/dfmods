#!/usr/bin/perl

use warnings;
use strict;

while (<>)
{
  s/\[(BIOME:\w*)\]/($1)/g;
  s/\[(COMMON_DOMESTIC)\]/($1)/g;
  s/\[(WAGON_PULLER)\]/($1)/g;
  s/\[(PACK_ANIMAL)\]/($1)/g;
  s/\[(\w*MEGABEAST)\]/($1)/g;
  print;
}

#!/usr/bin/perl

use warnings;
use strict;

my $ob = 0;
while (<>)
{
  my $ok = 0;
  s/\[/<</g;
  s/\]/>>/g;
  if (s/<<(OBJECT:(PLANT|CREATURE))>>/[$1]/g) { $ob = $ok = 1; }
  if (not $ob) { next; }
  if (s/<<(PLANT|CREATURE):([^>]*)>>/\n[SELECT_$1:$2]/) { $ok = 1; }
  if (s/<<(BIOME:\w*)>>/[$1]/g) { $ok = 1; }
  if (s/<<(COMMON_DOMESTIC)>>/[$1]/g) { $ok = 1; }
  if (s/<<(WAGON_PULLER|PACK_ANIMAL)>>/[$1]/g) { $ok = 1; }
  if (s/<<((PET|MOUNT)\w*)>>/[$1]/g) { $ok = 1; }
  if (s/<<(WET|DRY)>>/[$1]/g) { $ok = 1; }
  if (s/<<(\w*MEGABEAST)>>/[$1]/g) { $ok = 1; }
  if (not $ok) { next; }
  s/<<[^>]*>>//g;
  print;
}

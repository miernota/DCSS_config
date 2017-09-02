#!/bin/bash

printf "|(PING X 5 )%55s|\n" "$(date)"
printf "|%66s|\n" " "| tr ' ' '-'

echo "|       MIN  |       AVG  |       MAX  |          SERVER           |"
printf "|%66s|\n" " " | tr ' ' '-'

for i in underhound.eu crawl.xtahua.com crawl.jorgrun.rocks crawl.berotato.org crawl.akrasiac.org lazy-life.ddo.jp crawl.project357.org webzook.net
do
  
  printf "%s %-25s |\n" "$( ping -c 5 $i | tail -1| awk -F '/' '{print $4,$5,$6}' | awk -F '=' '{print $2}' | awk -F ' ' '{printf ("| %10.1f | %10.1f | %10.1f |", $1, $2, $3) }' )" $i 
  
done 
printf "|%66s|\n" " "| tr ' ' '-'
printf "%68s\n" " "| tr ' ' '#'


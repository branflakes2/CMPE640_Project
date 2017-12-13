#!/bin/bash
for i in *.vhd; do
    [ -f "$i" ] || break
    enscript --columns=2 --line-numbers --fancy-header --borders --landscape --pretty-print=vhdl --output "$i.ps" $i
done

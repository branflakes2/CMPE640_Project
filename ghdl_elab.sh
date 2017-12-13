#!/bin/bash

ghdl -a --ieee=synopsys $1.vhd
ghdl -m --ieee=synopsys $1

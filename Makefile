counter_test:
	./ghdl_analyze.sh *.vhd
	./ghdl_elab.sh Counter_Test
	./ghdl_run.sh Counter_Test

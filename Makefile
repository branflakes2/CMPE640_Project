counter_test: *.vhd
	./ghdl_analyze.sh *.vhd
	./ghdl_elab.sh ${MODULE}
	./ghdl_run.sh ${MODULE}
clean:
	rm *.o

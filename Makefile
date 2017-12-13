counter_test: *.vhd
	./ghdl_elab.sh ${MODULE}
	./ghdl_run.sh ${MODULE}
clean:
	rm *.o

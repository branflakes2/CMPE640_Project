set tcl_prompt1 {puts -nonewline "ncsim> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 1
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 1
set tcl_all64 false
set tcl_runerror_exit false
set assert_report_incompletes 0
set show_force 1
set force_reset_by_reinvoke 0
set tcl_relaxed_literal 0
set probe_exclude_patterns {}
set probe_packed_limit 4k
set probe_unpacked_limit 16k
set assert_internal_msg no
set svseed 1
set assert_reporting_mode 0
alias iprof profile
database -open -shm -into waves.shm waves -default
probe -create -database waves :busy :clk :clk_count :clock :cpu_add :cpu_data :cpu_rd_wrn :done :Gnd :mem_add :mem_data :mem_en :reset :start :Vdd
probe -create -database waves :c1:cache:row0:valid:s :c1:cache:row0:valid:q :c1:cache:row0:valid:r
probe -create -database waves :c1:cache:row0:valid:q1
probe -create -database waves :c1:cache:row0:Col0_Rd_En :c1:cache:row0:Col0_Wr_En :c1:cache:row0:Col1_Rd_En :c1:cache:row0:Col1_Wr_En :c1:cache:row0:Col2_Rd_En :c1:cache:row0:Col2_Wr_En :c1:cache:row0:Col3_Rd_En :c1:cache:row0:Col3_Wr_En :c1:cache:row0:Data_In :c1:cache:row0:Data_Out :c1:cache:row0:Gnd :c1:cache:row0:reset :c1:cache:row0:Row_En :c1:cache:row0:Row_Rd_En :c1:cache:row0:Row_Wr_En :c1:cache:row0:Set_Valid :c1:cache:row0:Tag_In :c1:cache:row0:Tag_Out :c1:cache:row0:Tag_Wr :c1:cache:row0:Tag_Wr_En :c1:cache:row0:Val_Set :c1:cache:row0:Valid_Out
probe -create -database waves :c1:addr_reg_out :c1:aout_en :c1:busy :c1:cache_data_out :c1:cache_tag_out :c1:cache_valid_out :c1:cache_write :c1:clk :c1:col_dec_en :c1:col_dec_out :c1:col_en :c1:cpu_add :c1:cpu_data :c1:cpu_rd_wrn :c1:data_bus :c1:data_reg_out :c1:delayed_rm :c1:dout_en :c1:e :c1:Gnd :c1:hitmiss :c1:internal_busy :c1:mem_add :c1:mem_data :c1:mem_en :c1:nbusy :c1:nrd_miss :c1:nrdwr :c1:nstart :c1:rd_miss :c1:rdwr :c1:reg_clk_en :c1:reset :c1:reset_nor_start :c1:rm_wr_en :c1:row_dec_out :c1:start :c1:Vdd :c1:w0 :c1:w1 :c1:w2 :c1:w3 :c1:wr_hit :c1:wr_on_rd_miss :c1:wr_on_wr_hit

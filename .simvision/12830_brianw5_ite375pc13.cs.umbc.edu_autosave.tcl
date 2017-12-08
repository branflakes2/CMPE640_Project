
# NC-Sim Command File
# TOOL:	ncsim	15.20-s035
#

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
probe -create -database waves :c1:cache:row0:Col0_Rd_En :c1:cache:row0:Col0_Wr_En :c1:cache:row0:Col1_Rd_En :c1:cache:row0:Col1_Wr_En :c1:cache:row0:Col2_Rd_En :c1:cache:row0:Col2_Wr_En :c1:cache:row0:Col3_Rd_En :c1:cache:row0:Col3_Wr_En :c1:cache:row0:Data_In :c1:cache:row0:Data_Out :c1:cache:row0:Gnd :c1:cache:row0:reset :c1:cache:row0:Row_En :c1:cache:row0:Row_Rd_En :c1:cache:row0:Row_Wr_En :c1:cache:row0:Set_Valid :c1:cache:row0:Tag_In :c1:cache:row0:Tag_Out :c1:cache:row0:Tag_Wr :c1:cache:row0:Tag_Wr_En :c1:cache:row0:Val_Set :c1:cache:row0:Valid_Out

simvision -input /afs/umbc.edu/users/b/r/brianw5/home/CMPE640/vhdl/project/.simvision/12830_brianw5_ite375pc13.cs.umbc.edu_autosave.tcl.svcf

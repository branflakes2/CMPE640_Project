
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
probe -create -database waves :c1:state:rwrhm_reg:wr_miss :c1:state:rwrhm_reg:wr_hit :c1:state:rwrhm_reg:wmiss :c1:state:rwrhm_reg:whit :c1:state:rwrhm_reg:rmiss :c1:state:rwrhm_reg:rhit :c1:state:rwrhm_reg:reset :c1:state:rwrhm_reg:reg2_in :c1:state:rwrhm_reg:reg1_in :c1:state:rwrhm_reg:rd_wr_set_en :c1:state:rwrhm_reg:rd_wr_o :c1:state:rwrhm_reg:rd_wr :c1:state:rwrhm_reg:rd_miss :c1:state:rwrhm_reg:rd_hit :c1:state:rwrhm_reg:nreset :c1:state:rwrhm_reg:nen :c1:state:rwrhm_reg:n_rd_wr :c1:state:rwrhm_reg:n_hit_miss :c1:state:rwrhm_reg:latched_rd_wr :c1:state:rwrhm_reg:latched_hit_miss :c1:state:rwrhm_reg:hit_miss_en :c1:state:rwrhm_reg:hit_miss :c1:state:rwrhm_reg:Gnd :c1:state:rwrhm_reg:enabled_clk :c1:state:rwrhm_reg:clk_en2 :c1:state:rwrhm_reg:clk_en1 :c1:state:rwrhm_reg:clk
probe -create -database waves :c1:hm:comp_out :c1:hm:HitMiss :c1:hm:n_valid :c1:hm:tag1 :c1:hm:tag2 :c1:hm:Valid

simvision -input /afs/umbc.edu/users/b/r/brianw5/home/CMPE640/vhdl/project/.simvision/21729_brianw5_ite240pc12.cs.umbc.edu_autosave.tcl.svcf

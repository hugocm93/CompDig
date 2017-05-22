
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Projeto2 -dir "C:/Users/aula/Downloads/CompDig/Projeto2/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Sche.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {mod_m_counter.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {d_ff_reset.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {display_7_seg.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Sche.vhf}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top Sche $srcset
add_files [list {Sche.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4


# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Tutorial -dir "D:/Tutorial/planAhead_run_3" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "eq1.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {eq1.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {eq2.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top eq2 $srcset
add_files [list {eq1.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4


# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Teclado -dir "C:/Users/aula/Desktop/CompDig/CompDig/lab2/Teclado/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "control_lab2.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {control_lab2.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top control_lab2 $srcset
add_files [list {control_lab2.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4

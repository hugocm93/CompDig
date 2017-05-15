
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name SomadorModular -dir "C:/Users/aula/Desktop/hugo_1212984/SomadorModular/planAhead_run_3" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "somador2bit.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {somador1bit.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {somador2bit.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top somador2bit $srcset
add_files [list {somador2bit.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4

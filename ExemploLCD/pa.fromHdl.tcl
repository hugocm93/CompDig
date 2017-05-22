
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name ExemploLCD -dir "C:/Users/aula/Downloads/CompDig/ExemploLCD/planAhead_run_4" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Exemplo.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {PROCESADOR_LCD4BITS.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {COMMANDS_LCD4BITS.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Exemplo.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top exemplo $srcset
add_files [list {Exemplo.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4

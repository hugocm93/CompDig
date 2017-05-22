
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Serial -dir "C:/Users/aula/Downloads/CompDig/Serial/planAhead_run_3" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/aula/Downloads/CompDig/Serial/Transmissor.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/aula/Downloads/CompDig/Serial} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Transmissor.ucf" [current_fileset -constrset]
add_files [list {Transmissor.ucf}] -fileset [get_property constrset [current_run]]
link_design


# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name SomadorModular -dir "C:/Users/aula/Desktop/hugo_1212984/SomadorModular/planAhead_run_3" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/aula/Desktop/hugo_1212984/SomadorModular/somador2bit.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/aula/Desktop/hugo_1212984/SomadorModular} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "somador1bit.ucf" [current_fileset -constrset]
add_files [list {somador1bit.ucf}] -fileset [get_property constrset [current_run]]
link_design

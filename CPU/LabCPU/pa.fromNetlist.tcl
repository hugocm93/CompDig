
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name LabCPU -dir "D:/Usuarios/marcos/Documentos/Faculdade/Computacao_Digital/CompDig/CPU/LabCPU/planAhead_run_1" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Usuarios/marcos/Documentos/Faculdade/Computacao_Digital/CompDig/CPU/LabCPU/CPU.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Usuarios/marcos/Documentos/Faculdade/Computacao_Digital/CompDig/CPU/LabCPU} }
set_property target_constrs_file "CPU.ucf" [current_fileset -constrset]
add_files [list {CPU.ucf}] -fileset [get_property constrset [current_run]]
link_design

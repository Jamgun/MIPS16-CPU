
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name CPU1 -dir "D:/iseFiles/CPUsim/CPU2/planAhead_run_2" -part xc3s1200efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/iseFiles/CPUsim/CPU2/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/iseFiles/CPUsim/CPU2} {ipcore_dir} }
add_files [list {ipcore_dir/fontRom.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ram1.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ram2.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design


# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Lab2_2 -dir "C:/Xilinx/Lab2_2/planAhead_run_4" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "SSD_Decoder.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {SSD_Decoder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top SSD_Decoder $srcset
add_files [list {SSD_Decoder.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3

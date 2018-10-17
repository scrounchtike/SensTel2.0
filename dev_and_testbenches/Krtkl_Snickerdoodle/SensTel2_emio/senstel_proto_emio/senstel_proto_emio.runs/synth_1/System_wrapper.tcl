# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.cache/wt [current_project]
set_property parent.project_path C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part krtkl.com:snickerdoodle_prime_le:part0:1.0 [current_project]
set_property ip_output_repo c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/hdl/System_wrapper.vhd
add_files C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/System.bd
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/ip/System_processing_system7_0_0/System_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/ip/System_axi_timer_0_0/System_axi_timer_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/ip/System_axi_timer_0_0/System_axi_timer_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/ip/System_rst_ps7_0_49M_0/System_rst_ps7_0_49M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/ip/System_rst_ps7_0_49M_0/System_rst_ps7_0_49M_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/ip/System_rst_ps7_0_49M_0/System_rst_ps7_0_49M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/ip/System_xbar_0/System_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/ip/System_auto_pc_0/System_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/System_ooc.xdc]
set_property is_locked true [get_files C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/sources_1/bd/System/System.bd]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/constrs_1/new/senstel_sys0.xdc
set_property used_in_implementation false [get_files C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio/senstel_proto_emio/senstel_proto_emio.srcs/constrs_1/new/senstel_sys0.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top System_wrapper -part xc7z020clg400-1


write_checkpoint -force -noxdef System_wrapper.dcp

catch { report_utilization -file System_wrapper_utilization_synth.rpt -pb System_wrapper_utilization_synth.pb }

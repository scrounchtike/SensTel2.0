# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.cache/wt [current_project]
set_property parent.project_path C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_repo_paths c:/Users/Chinook-ELE/ZynqWorkspace/NN_1.0 [current_project]
set_property ip_output_repo c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0.xci
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/System_axi_timer_1_0_synth_1 -new_name System_axi_timer_1_0 -ip [get_ips System_axi_timer_1_0]]

if { $cached_ip eq {} } {

synth_design -top System_axi_timer_1_0 -part xc7z020clg400-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix System_axi_timer_1_0_ System_axi_timer_1_0.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ System_axi_timer_1_0_stub.v
 lappend ipCachedFiles System_axi_timer_1_0_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ System_axi_timer_1_0_stub.vhdl
 lappend ipCachedFiles System_axi_timer_1_0_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ System_axi_timer_1_0_sim_netlist.v
 lappend ipCachedFiles System_axi_timer_1_0_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ System_axi_timer_1_0_sim_netlist.vhdl
 lappend ipCachedFiles System_axi_timer_1_0_sim_netlist.vhdl

 config_ip_cache -add -dcp System_axi_timer_1_0.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips System_axi_timer_1_0]
}

rename_ref -prefix_all System_axi_timer_1_0_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef System_axi_timer_1_0.dcp
create_report "System_axi_timer_1_0_synth_1_synth_report_utilization_0" "report_utilization -file System_axi_timer_1_0_utilization_synth.rpt -pb System_axi_timer_1_0_utilization_synth.pb"

if { [catch {
  file copy -force C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/System_axi_timer_1_0_synth_1/System_axi_timer_1_0.dcp C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/System_axi_timer_1_0_synth_1/System_axi_timer_1_0.dcp C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/System_axi_timer_1_0_synth_1/System_axi_timer_1_0_stub.v C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/System_axi_timer_1_0_synth_1/System_axi_timer_1_0_stub.vhdl C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/System_axi_timer_1_0_synth_1/System_axi_timer_1_0_sim_netlist.v C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/System_axi_timer_1_0_synth_1/System_axi_timer_1_0_sim_netlist.vhdl C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.ip_user_files/ip/System_axi_timer_1_0]} {
  catch { 
    file copy -force C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_stub.v C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.ip_user_files/ip/System_axi_timer_1_0
  }
}

if {[file isdir C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.ip_user_files/ip/System_axi_timer_1_0]} {
  catch { 
    file copy -force C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.srcs/sources_1/bd/System/ip/System_axi_timer_1_0/System_axi_timer_1_0_stub.vhdl C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.ip_user_files/ip/System_axi_timer_1_0
  }
}

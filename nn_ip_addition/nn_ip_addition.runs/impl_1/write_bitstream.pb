
r
Command: %s
1870*	planAhead2=
)open_checkpoint System_wrapper_routed.dcp2default:defaultZ12-2866h px� 
^

Starting %s Task
103*constraints2#
open_checkpoint2default:defaultZ18-103h px� 
�

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.031 . Memory (MB): peak = 226.863 ; gain = 0.0002default:defaulth px� 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
2532default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2017.42default:defaultZ1-479h px� 
V
Loading part %s157*device2#
xc7z020clg400-12default:defaultZ21-403h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
�
Parsing XDC File [%s]
179*designutils2�
�C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/impl_1/.Xil/Vivado-9920-LAPTOP-GDRKMBCO/dcp1/System_wrapper_board.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2�
�C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/impl_1/.Xil/Vivado-9920-LAPTOP-GDRKMBCO/dcp1/System_wrapper_board.xdc2default:default8Z20-178h px� 
�
Parsing XDC File [%s]
179*designutils2�
�C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/impl_1/.Xil/Vivado-9920-LAPTOP-GDRKMBCO/dcp1/System_wrapper_early.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2�
�C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/impl_1/.Xil/Vivado-9920-LAPTOP-GDRKMBCO/dcp1/System_wrapper_early.xdc2default:default8Z20-178h px� 
�
Parsing XDC File [%s]
179*designutils2�
�C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/impl_1/.Xil/Vivado-9920-LAPTOP-GDRKMBCO/dcp1/System_wrapper.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2�
�C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/impl_1/.Xil/Vivado-9920-LAPTOP-GDRKMBCO/dcp1/System_wrapper.xdc2default:default8Z20-178h px� 
?
Reading XDEF placement.
206*designutilsZ20-206h px� 
D
Reading placer database...
1602*designutilsZ20-1892h px� 
=
Reading XDEF routing.
207*designutilsZ20-207h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
Read XDEF File: 2default:default2
00:00:012default:default2 
00:00:00.8302default:default2
641.5392default:default2
6.4572default:defaultZ17-268h px� 
�
7Restored from archive | CPU: %s secs | Memory: %s MB |
1612*designutils2
1.0000002default:default2
0.0000002default:defaultZ20-1924h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common20
Finished XDEF File Restore: 2default:default2
00:00:012default:default2 
00:00:00.8302default:default2
641.5392default:default2
6.4572default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2m
Y  A total of 19 instances were transformed.
  IOBUF => IOBUF (IBUF, OBUFT): 19 instances
2default:defaultZ1-111h px� 
�
'Checkpoint was created with %s build %s378*project2+
Vivado v2017.4 (64-bit)2default:default2
20862212default:defaultZ1-604h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
open_checkpoint: 2default:default2
00:00:142default:default2
00:00:152default:default2
641.5392default:default2
415.5552default:defaultZ17-268h px� 
n
Command: %s
53*	vivadotcl2=
)write_bitstream -force System_wrapper.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
G
"No user IP repositories specified
1154*coregenZ19-1704h px� 
|
"Loaded Vivado IP repository '%s'.
1332*coregen23
C:/Xilinx/Vivado/2017.4/data/ip2default:defaultZ19-2313h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A[29:0]�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[0].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[0].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[0].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[0].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[0].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[0].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[0].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[0].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[1].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[1].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[1].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[1].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[1].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[1].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[1].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[1].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[2].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[2].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[2].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[2].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[2].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[2].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[2].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[2].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[3].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[3].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[3].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[3].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[3].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[3].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[3].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[3].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[4].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[4].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[4].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[4].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[4].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[4].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[4].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[4].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[5].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[5].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[5].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[5].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[5].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[5].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[5].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[5].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[6].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[6].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[6].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[6].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[6].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[6].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[6].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[6].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[7].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[7].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[7].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	zSystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[7].INST_MULT/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[7].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	~System_i/NN_1/U0/NN/GEN_FIRST_LAYER[7].INST_MULT_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[7].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_FIRST_LAYER[7].INST_MULT_ADD_BIAS/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[0].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[1].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[2].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[0].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[1].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[2].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].GEN_MULT_ADD[3].INST_INVERSION_ADD_j/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_BOTTOM_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_FIRST_ADD_TOP_NEURONS_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_SECOND_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	�System_i/NN_1/U0/NN/GEN_SECOND_LAYER[3].INST_THIRD_ADD_i/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_MULT_NONE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the Multiplier (USE_MULT = NONE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[0].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[0].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-5h px� 
�
�enum_USE_MULT_NONE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the Multiplier (USE_MULT = NONE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[1].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[1].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-5h px� 
�
�enum_USE_MULT_NONE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the Multiplier (USE_MULT = NONE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[2].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[2].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-5h px� 
�
�enum_USE_MULT_NONE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the Multiplier (USE_MULT = NONE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[3].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[3].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-5h px� 
�
�enum_USE_MULT_NONE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the Multiplier (USE_MULT = NONE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[4].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[4].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-5h px� 
�
�enum_USE_MULT_NONE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the Multiplier (USE_MULT = NONE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[5].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[5].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-5h px� 
�
�enum_USE_MULT_NONE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the Multiplier (USE_MULT = NONE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[6].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[6].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-5h px� 
�
�enum_USE_MULT_NONE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the Multiplier (USE_MULT = NONE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[7].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive	ySystem_i/NN_1/U0/NN/GEN_FIRST_LAYER[7].INST_ADD/U0/i_synth/i_synth_option.i_synth_model/opt_7series.i_uniwrap/i_primitive2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-5h px� 
v
DRC finished with %s
1905*	planAhead28
$0 Errors, 32 Warnings, 72 Advisories2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
Q
/Please set project.enableDesignId to be 'true'.457*projectZ1-821h px� 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
e
Writing bitstream %s...
11*	bitstream2(
./System_wrapper.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px� 
�
�'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2�
|C:/Users/Chinook-ELE/ZynqWorkspace/SensTel2_emio_NNip/nn_ip_addition/nn_ip_addition.runs/impl_1/usage_statistics_webtalk.xml2default:default2,
Sat Jul  7 21:37:08 20182default:default2I
5C:/Xilinx/Vivado/2017.4/doc/webtalk_introduction.html2default:defaultZ17-186h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
922default:default2
322default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:312default:default2
00:00:262default:default2
1125.7272default:default2
484.1882default:defaultZ17-268h px� 


End Record
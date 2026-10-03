vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/microblaze_v11_0_17
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_lite_ipif_v3_1_0
vlib modelsim_lib/msim/axi_timer_v2_0_38
vlib modelsim_lib/msim/interrupt_control_v3_2_0
vlib modelsim_lib/msim/axi_gpio_v2_0_38
vlib modelsim_lib/msim/lmb_v10_v3_0_16
vlib modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_28
vlib modelsim_lib/msim/blk_mem_gen_v8_4_13
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/proc_sys_reset_v5_0_17
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_37
vlib modelsim_lib/msim/axi_vip_v1_1_23
vlib modelsim_lib/msim/axi_intc_v4_1_23
vlib modelsim_lib/msim/mdm_v3_2_30

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap microblaze_v11_0_17 modelsim_lib/msim/microblaze_v11_0_17
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_1_0 modelsim_lib/msim/axi_lite_ipif_v3_1_0
vmap axi_timer_v2_0_38 modelsim_lib/msim/axi_timer_v2_0_38
vmap interrupt_control_v3_2_0 modelsim_lib/msim/interrupt_control_v3_2_0
vmap axi_gpio_v2_0_38 modelsim_lib/msim/axi_gpio_v2_0_38
vmap lmb_v10_v3_0_16 modelsim_lib/msim/lmb_v10_v3_0_16
vmap lmb_bram_if_cntlr_v4_0_28 modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_28
vmap blk_mem_gen_v8_4_13 modelsim_lib/msim/blk_mem_gen_v8_4_13
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap proc_sys_reset_v5_0_17 modelsim_lib/msim/proc_sys_reset_v5_0_17
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_37 modelsim_lib/msim/axi_register_slice_v2_1_37
vmap axi_vip_v1_1_23 modelsim_lib/msim/axi_vip_v1_1_23
vmap axi_intc_v4_1_23 modelsim_lib/msim/axi_intc_v4_1_23
vmap mdm_v3_2_30 modelsim_lib/msim/mdm_v3_2_30

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_23 -L smartconnect_v1_0 -L xilinx_vip "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_23 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"D:/AMDdesign/2026.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/AMDdesign/2026.1/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/AMDdesign/2026.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"D:/AMDdesign/2026.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_17  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/959b/hdl/microblaze_v11_0_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_microblaze_0_0/sim/MicroBlaze_microblaze_0_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_clk_wiz_0_0/MicroBlaze_clk_wiz_0_0_clk_wiz.v" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_clk_wiz_0_0/MicroBlaze_clk_wiz_0_0.v" \

vcom -work axi_lite_ipif_v3_1_0  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/de33/hdl/axi_lite_ipif_v3_1_rfs.vhd" \

vcom -work axi_timer_v2_0_38  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/c960/hdl/axi_timer_v2_0_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_axi_timer_0_0/sim/MicroBlaze_axi_timer_0_0.vhd" \

vcom -work interrupt_control_v3_2_0  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/e2ca/hdl/interrupt_control_v3_2_rfs.vhd" \

vcom -work axi_gpio_v2_0_38  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/6ccd/hdl/axi_gpio_v2_0_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_axi_gpio_0_0/sim/MicroBlaze_axi_gpio_0_0.vhd" \

vcom -work lmb_v10_v3_0_16  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/dac4/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_dlmb_v10_0/sim/MicroBlaze_dlmb_v10_0.vhd" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_ilmb_v10_0/sim/MicroBlaze_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_28  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/a190/hdl/lmb_bram_if_cntlr_v4_0_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_dlmb_bram_if_cntlr_0/sim/MicroBlaze_dlmb_bram_if_cntlr_0.vhd" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_ilmb_bram_if_cntlr_0/sim/MicroBlaze_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_13  -incr -mfcu  "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/59f9/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_lmb_bram_0/sim/MicroBlaze_lmb_bram_0.v" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_microblaze_0_axi_periph_0/bd_0/sim/bd_3fc3.v" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_23 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \

vcom -work proc_sys_reset_v5_0_17  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/9438/hdl/proc_sys_reset_v5_0_rfs.vhd" \

vcom -work smartconnect_v1_0  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/21d5/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_23 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/21d5/hdl/sc_ultralite_v1_0_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_23 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_microblaze_0_axi_periph_0/bd_0/ip/ip_0/sim/bd_3fc3_sc_ul_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_23 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/c7d2/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_37  -incr -mfcu  "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/8c55/hdl/axi_register_slice_v2_1_rfs.v" \

vlog -work axi_vip_v1_1_23  -incr -mfcu  -sv -L axi_vip_v1_1_23 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/4d28/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_23 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_microblaze_0_axi_periph_0/sim/MicroBlaze_microblaze_0_axi_periph_0.sv" \

vcom -work axi_intc_v4_1_23  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ca9d/hdl/axi_intc_v4_1_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_microblaze_0_axi_intc_0/sim/MicroBlaze_microblaze_0_axi_intc_0.vhd" \

vcom -work mdm_v3_2_30  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/23b0/hdl/mdm_v3_2_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_mdm_1_0/sim/MicroBlaze_mdm_1_0.vhd" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ip/MicroBlaze_rst_clk_wiz_0_100M_0/sim/MicroBlaze_rst_clk_wiz_0_100M_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ee6d" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/00fe/hdl/verilog" "+incdir+../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/ipshared/ec67/hdl" "+incdir+../../../../../../../../AMDdesign/2026.1/Vivado/data/rsb/busdef" "+incdir+D:/AMDdesign/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../MicroBlaze.gen/sources_1/bd/MicroBlaze/sim/MicroBlaze.v" \

vlog -work xil_defaultlib \
"glbl.v"


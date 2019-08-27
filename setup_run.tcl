####################################################################################
#             MAIN SETUP (root attributes & setup variables)                       #
####################################################################################
##############################################################################
## Preset global variables and attributes
##############################################################################
set libpath /opt/local/cadence/design_kits/gpdk045/lan/flow/t1u1/reference_libs/GPDK045
set lefpath $libpath/gsclib045_all_v4.4/gsclib045/lef
set timingpath $libpath/gsclib045_all_v4.4/gsclib045/timing
set qrcpath $libpath/gsclib045_all_v4.4/gsclib045/qrc/qx
set DESIGN designName
set GEN_EFF medium
set MAP_OPT_EFF high
set DATE [clock format [clock seconds] -format "%b%d-%T"] 
set _OUTPUTS_PATH outputs_${DATE}
set _REPORTS_PATH reports_${DATE}
set _LOG_PATH logs_${DATE}
##set ET_WORKDIR <ET work directory>
set_db / .init_lib_search_path [list $timingpath $lefpath $qrcpath]
set_db / .script_search_path {. <path>}
set_db / .init_hdl_search_path {. ./rtl}
##Uncomment and specify machine names to enable super-threading.
##set_db / .super_thread_servers {<machine names>} 
##For design size of 1.5M - 5M gates, use 8 to 16 CPUs. For designs > 5M gates, use 16 to 32 CPUs
##set_db / .max_cpus_per_server 8

##Default undriven/unconnected setting is 'none'.  
##set_db / .hdl_unconnected_value 0 | 1 | x | none

set_db / .information_level 7 

###############################################################
## Library setup
###############################################################
set_db library fast_vdd1v0_basicCells.lib
set_db lef_library {gsclib045_tech.lef gsclib045_macro.lef gsclib045_multibitsDFF.lef}
## Provide either cap_table_file or the qrc_tech_file
#set_db / .cap_table_file <file> 
set_db qrc_tech_file gpdk045.tch
##generates <signal>_reg[<bit_width>] format
#set_db / .hdl_array_naming_style %s\[%d\] 
## 


set_db / .lp_insert_clock_gating true 

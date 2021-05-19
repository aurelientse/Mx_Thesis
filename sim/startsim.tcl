set PACKAGES_DIR    "../packages"
set TALKER_DIR      "../talker"
set LISTENER_DIR    "../listener"
set HANDSHAKE_DIR   "../handshake"
set TESTBENCH_DIR   "../testbench"

set USER_DEFINED_COMPILE_OPTIONS ""
set USER_DEFINED_ELAB_OPTIONS    ""


# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  # ----------------------------------------
  # DUT
  # ----------------------------------------
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$PACKAGES_DIR/handshake_pkg.vhd"
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$TALKER_DIR/talker_fsm.vhd"
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$TALKER_DIR/talker_data.vhd"
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$TALKER_DIR/talker_top.vhd"
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$LISTENER_DIR/listener_fsm.vhd"
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$LISTENER_DIR/listener_data.vhd"
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$LISTENER_DIR/listener_top.vhd"
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$HANDSHAKE_DIR/handshake_top.vhd"


  # ----------------------------------------
  # Testbench
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS  "$TESTBENCH_DIR/handshake_tb.sv"
}
  
# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ns -L work handshake_tb
}


alias sim {
 echo "\[exec\] run simulation"
 eval do wave.do
 eval run 100
}

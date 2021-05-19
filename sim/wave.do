onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group DUT /handshake_tb/DUT/rst_n
add wave -noupdate -expand -group DUT /handshake_tb/DUT/clk_tx
add wave -noupdate -expand -group DUT /handshake_tb/DUT/clk_rx
add wave -noupdate -expand -group DUT /handshake_tb/DUT/start
add wave -noupdate -expand -group DUT /handshake_tb/DUT/ready
add wave -noupdate -expand -group Tx_fsm -expand /handshake_tb/DUT/tx/tx_control_unit/txIn
add wave -noupdate -expand -group Tx_fsm -expand /handshake_tb/DUT/tx/tx_control_unit/r
add wave -noupdate -expand -group Tx_fsm -expand /handshake_tb/DUT/tx/tx_control_unit/txOu
add wave -noupdate -expand -group Rx_fsm -expand /handshake_tb/DUT/rx/rx_control_unit/rxIn
add wave -noupdate -expand -group Rx_fsm -expand /handshake_tb/DUT/rx/rx_control_unit/r
add wave -noupdate -expand -group Rx_fsm -expand /handshake_tb/DUT/rx/rx_control_unit/rxOu
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {52 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 420
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {45 ns} {73 ns}

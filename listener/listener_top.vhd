LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE Work.handshake_pkg.All;


ENTITY listener_top IS   
PORT ( 
     clk_rx: IN  STD_LOGIC;
     rst_n : IN  STD_LOGIC; -- Active Low 
     rxIn  : IN  listener_in;      
     rxOu  : OUT listener_ou );
END listener_top;

ARCHITECTURE rtl OF listener_top IS
 


component listener_fsm is
port ( 
     clk   : IN  STD_LOGIC;
     rst_n : IN  STD_LOGIC; -- Active Low 
     rxIn  : IN  listener_in;      
     rxOu  : OUT listener_ou );
end component listener_fsm ;


component listener_data is
port ( 
     clk   : IN  STD_LOGIC;
     rst_n : IN  STD_LOGIC -- Active Low 
     );
end component listener_data ;


BEGIN  
 
  
rx_control_unit: listener_fsm port map (
                                        clk   => clk_rx,
                                        rst_n => rst_n ,
                                        rxIn  => rxIn  ,    
                                        rxOu  => rxOu                                 
                                       ); 
                                      
rx_data_path   : listener_data port map (
                                        clk   => clk_rx,
                                        rst_n => rst_n                             
                                       ); 
END rtl;


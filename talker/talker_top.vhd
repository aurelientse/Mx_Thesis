LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.handshake_pkg.All;


ENTITY talker_top IS   
PORT( 
     clk_tx : IN  STD_LOGIC;
     rst_n  : IN  STD_LOGIC; -- Active Low 
     txIn   : IN  talker_in;      
     txOu   : OUT talker_ou 
    );
END talker_top;


ARCHITECTURE rtl OF talker_top IS


component talker_fsm is
port ( 
     clk   : IN  STD_LOGIC;
     rst_n : IN  STD_LOGIC; -- Active Low 
     txIn  : IN  talker_in;      
     txOu  : OUT talker_ou );
end component talker_fsm ;


component talker_data is
port ( 
     clk   : IN  STD_LOGIC;
     rst_n : IN  STD_LOGIC -- Active Low  
     );
end component talker_data ;

BEGIN  

tx_control_unit: talker_fsm  port map (
                                       clk   => clk_tx,
                                       rst_n => rst_n ,
                                       txIn  => txIn  ,    
                                       txOu  => txOu ); 
                                      
                                      
tx_data_path   : talker_data port map (
                                       clk   => clk_tx,
                                       rst_n => rst_n );
END rtl;

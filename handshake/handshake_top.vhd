LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE Work.handshake_pkg.All;


ENTITY handshake_top IS   
PORT ( 
      clk_tx    : IN  STD_LOGIC;
      clk_rx    : IN  STD_LOGIC;
      rst_n     : IN  STD_LOGIC;
      start     : IN  STD_LOGIC;
      ready     : OUT STD_LOGIC);
END  handshake_top;

ARCHITECTURE rtl OF handshake_top IS
 

component talker_top
port ( 
     clk_tx: IN  STD_LOGIC;
     rst_n : IN  STD_LOGIC; -- Active Low 
     txIn  : IN  talker_in;      
     txOu  : OUT talker_ou );
end component;

component listener_top
port ( 
     clk_rx: IN  STD_LOGIC;
     rst_n : IN  STD_LOGIC; -- Active Low 
     rxIn  : IN  listener_in;      
     rxOu  : OUT listener_ou );
end component;


signal txIn  : talker_in;
signal txOu  : talker_ou;
signal rxIn  : listener_in;
signal rxOu  : listener_ou;


BEGIN  


txIn.start    <= start; 
txIn.ack_sync <= rxOu.ack_out;
rxIn.req_sync <= txOu.req_out;
ready         <= txOu.ready;


 
tx : talker_top port map (
                         clk_tx => clk_tx,
                         rst_n  => rst_n ,
                         txIn   => txIn  ,    
                         txOu   => txOu ); 


rx : listener_top port map (
                       clk_rx => clk_rx,
                       rst_n  => rst_n ,
                       rxIn   => rxIn  ,    
                       rxOu   => rxOu  ); 
  
 
END rtl;

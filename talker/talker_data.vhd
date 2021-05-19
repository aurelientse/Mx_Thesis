LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.handshake_pkg.All;


ENTITY talker_data IS   
PORT ( 
     clk    : IN  STD_LOGIC;
     rst_n  : IN  STD_LOGIC -- Active Low
     );
END talker_data;

ARCHITECTURE data_path OF talker_data IS
 

BEGIN  

    
END data_path ;


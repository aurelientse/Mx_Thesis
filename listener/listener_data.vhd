LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE Work.handshake_pkg.All;


ENTITY listener_data IS   
PORT ( 
     clk   : IN  STD_LOGIC;
     rst_n : IN  STD_LOGIC -- Active Low
     );
END listener_data;

ARCHITECTURE data_path OF listener_data IS
 

BEGIN  
 

END data_path;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE Work.handshake_pkg.All;


ENTITY listener_fsm IS   
PORT ( 
     clk   : IN  STD_LOGIC;
     rst_n : IN  STD_LOGIC; -- Active Low
     rxIn  : IN  listener_in;      
     rxOu  : OUT listener_ou);
END listener_fsm;

ARCHITECTURE FSM OF listener_fsm IS
 

signal r, rin: listener_reg; --registers bundles

BEGIN  
 
 -- *** synchronous process       ***
 --     register && output buffer
 --
 listener_sync_pro:process(clk)
 begin
  If (clk'event and clk ='1') then
      If (rst_n ='0') then
          r<= init_listener_fsm_reg;
      else 
          r<= rin;
      end if;
  end if;
 end process listener_sync_pro;   
   
 
 -- ***
 -- *** This process aim at changing the FSM state.
 -- *** 
 listener_comb_pro:process(rst_n, rxIn, r)
 variable v: listener_reg;
 begin
   
   v:=r; --- Copying all register values into a variables
   
   case(v.state)is                
        WHEN ACK0_ST => 
                     If (rxIn.req_sync ='1') then                         
                	  v.state:= ACK1_ST; 
                	  v.ack_out :='1';               	
              	      End If;            		   		    
        WHEN ACK1_ST =>                                        
                     If (rxIn.req_sync ='0') then   
              		  v.state   := ACK0_ST;
              		  v.ack_out :='0';
              	     End If;                                                                                       
   end case; 
     
   --> 0 : register all variables to avoid latches
   rin<=v; 
   
   --> 1 : Drive any combinational output here :: use v signal
   -- rxOu.ack_out   <= v.ack_out ;  
 end process listener_comb_pro;
 
 
  --> 2: Drive any sequential output here :: use r signal
  rxOu.ack_out <= r.ack_out ;  
 
END FSM;


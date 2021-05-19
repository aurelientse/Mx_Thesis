LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.handshake_pkg.All;


ENTITY talker_fsm IS   
PORT ( 
     clk   : IN  STD_LOGIC;
     rst_n : IN  STD_LOGIC; -- Active Low
     txIn  : IN  talker_in;      
     txOu  : OUT talker_ou);
END talker_fsm;

ARCHITECTURE FSM OF talker_fsm IS
 

signal r, rin: talker_reg; --registers bundles

BEGIN  
 
 -- *** synchronous process       ***
 --     register && output buffer
 --
 talker_sync_pro:process(clk)
 begin
  If ( clk'event and clk ='1') then
       If (rst_n ='0') then
           r<= init_talker_fsm_reg;
       else 
           r<= rin;
       end if;
  end if;
 end process talker_sync_pro;   
   
 
 -- ***
 -- *** This process aim at changing the FSM state.
 -- ***
 talker_comb_pro:process(rst_n, txIn, r)
 variable v: talker_reg;
 begin
 
   v:=r; --- Copying all registers values into a variables
   
   case(v.state)is                
        WHEN IDLE_ST => 
                      v.ready   :='1'; 
                      If (txIn.start ='1') then                         
                	   v.state   := REQ1_ST;
                	   v.ready   :='0'; 
                	   v.req_out :='1';              	
              	       End If;            		   		    
        WHEN REQ1_ST =>                                              
                       If (txIn.ack_sync='0') then   
              		    v.state   := REQ0_ST;
              		    v.req_out :='0';  
              		End If;   
        WHEN REQ0_ST =>                      
                       If (txIn.ack_sync='1') then   
              		    v.state:= IDLE_ST;
              		    v.ready   :='1';
              		End If;                                                                                     
  end case; 

  --> 0: register all variables to avoid latches
  rin<=v; 
  
  --> 1 : Drive any combinational output here :: use v signal
  --txOu.ready    <= v.ready;
  --txOu.req_out  <= v.req_out;    
 end process talker_comb_pro;
 
  --> 2: combinatorial outputs
  txOu.ready    <= r.ready;
  txOu.req_out  <= r.req_out; 
    
END FSM;


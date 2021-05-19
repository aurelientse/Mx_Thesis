LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


PACKAGE handshake_pkg IS

  -- *** Constant Declaration ***
  --

  
  -- *** User Define Types *** 
  -- 
  --                   
  TYPE TALKER_FSM_T IS ( 
                       IDLE_ST  ,
                       REQ0_ST  , 
                       REQ1_ST  );
            
  TYPE LISTENER_FSM_T IS ( 
                       ACK0_ST  ,
                       ACK1_ST  );
                      
  -- *** Talker Module Handles ***
  --
  --
  TYPE talker_in IS RECORD
       start    : STD_LOGIC;
       ack_sync : STD_LOGIC;
  END RECORD talker_in;
  
  TYPE talker_ou IS RECORD
       ready    : STD_LOGIC;
       req_out  : STD_LOGIC;
  END RECORD talker_ou;  
  
  TYPE talker_reg IS RECORD
       state   : TALKER_FSM_T;
       ready   : STD_LOGIC;
       req_out : STD_LOGIC;
  END RECORD talker_reg;
    
  -- *** Listener Module Interface ***
  --
  --
  TYPE listener_in IS RECORD
       req_sync : STD_LOGIC;
  END RECORD listener_in;
  
  TYPE listener_ou IS RECORD
       ack_out  : STD_LOGIC;
  END RECORD listener_ou;   
  
  TYPE listener_reg IS RECORD
       state  : LISTENER_FSM_T;
       ack_out: STD_LOGIC;
  END RECORD listener_reg;
  
  --- *** reset fonction ***
  ---
  ---
  
  -- *** functions prototypes ***
  function init_talker_fsm_reg  return talker_reg;
  
  function init_listener_fsm_reg return listener_reg;                        
                         
END PACKAGE handshake_pkg;



Package body handshake_pkg is

  -- reset talker fsm registers	
  function init_talker_fsm_reg return talker_reg is
           variable v :talker_reg;
  begin
    v.state   :=IDLE_ST;
    v.ready   :='0';
    v.req_out :='0';
    return v; 
  end Function init_talker_fsm_reg;  
  
  
    -- reset listener fsm registers	
  function init_listener_fsm_reg return listener_reg is
           variable v :listener_reg;
  begin
    v.state    := ACK0_ST;
    v.ack_out  :='0';
    return v; 
  end Function init_listener_fsm_reg;  

END PACKAGE BODY handshake_pkg;


module handshake_tb;

logic clk_tx;
logic clk_rx;
logic rst_n;
logic start; 
logic ready;


handshake_top DUT ( .clk_tx(clk_tx),
	            .clk_rx(clk_rx),
                    .rst_n(rst_n),
                    .start(start),
                    .ready(ready)
                  );

initial begin:tb_clk_tx_gen
  clk_tx =0; #9ns;
  forever begin
    clk_tx = ~clk_tx;
    #3.33ns;
  end
end:tb_clk_tx_gen


initial begin:tb_clk_rx_gen
  clk_rx =0; #9ns;
  forever begin
    clk_rx = ~clk_rx;
    #6.25ns;
  end
end:tb_clk_rx_gen



initial begin : reset_flow
    start=0;
    rst_n=0; #37;
    forever begin 
        rst_n=1;
        wait(ready==1); 
        @(posedge clk_tx);
        start<=1;
        @(posedge clk_tx);
        start<=0;                  
    end
end:reset_flow


endmodule:handshake_tb

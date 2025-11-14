module traffic_light_cont_tb;
    reg clk,rst;
    wire [2:0] light;

    traffic_light_cont uut(clk,rst,light);

    // Clock generation
    initial clk=0; always #5 clk=~clk;

    initial begin
        rst=1; #10; rst=0;
        #200 $finish;   // run simulation for 200 time units
    end

    initial begin
        $monitor("Time=%0t | Lights={Red,Yellow,Green}=%b", $time, light);
    end
endmodule
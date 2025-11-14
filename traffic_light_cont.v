module traffic_light_cont(
    input clk, rst,
    output reg [2:0] light
);

 parameter [1:0]RED = 2'b00, GREEN=2'b01, YELLOW=2'b10 ;
 reg [1:0]state, nxt_state;  
 reg [3:0] count; 

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= RED;
            count <= 0;
        end
        else begin
            state <= nxt_state;
            count <= count + 1;
        end
    end
    always @(*) begin
        nxt_state = state;
        case(state)
            RED: if(count==4)
        nxt_state = GREEN; 
            GREEN:  if(count==6) nxt_state = YELLOW;  // 6 cycles Green
            YELLOW: if(count==2) nxt_state = RED;     // 2 cycles Yellow
        endcase
    end

    always @(*) begin
        case(state)
            RED:    light = 3'b001; 
            GREEN:  light = 3'b010; 
            YELLOW: light = 3'b100; 
            default:light = 3'b000;
        endcase
    end

endmodule
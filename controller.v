module controler (
    input clk,
    input rst,
    input start,
    input done,
    output reg ld_sum,
    output reg ld_counter,
    output reg en_sum,
    output reg en_counter,
    output reg finish
);
    
    localparam  IDLE = 2'b00,
                COUNT = 2'b01,
                DONE = 2'b10;

    reg [2:0] state, next_state;

    //state update
    always @(posedge clk or negedge rst) begin
        if(!rst)
            state <=IDLE;
        else
            state <=next_state;
    end

    //next state logic
    always @(*) begin
        case (state)
            IDLE: next_state <= start?COUNT:IDLE;
            COUNT: next_state <= (done)?DONE:COUNT;
            DONE: next_state <= DONE;
            default:next_state <= IDLE;
        endcase
    end

    //output logic
    always @(*) begin
        case (state)
            IDLE: begin
                ld_counter <= 1;
                ld_sum <= 1;
                en_sum <= 0;
                en_counter <= 0;
                finish <= 0;
            end
            COUNT: begin
                ld_counter <= 0;
                ld_sum <= 0;
                en_sum <= 1;
                en_counter <= 1;
                finish <= 0;
            end
            DONE: begin
                ld_counter <= 0;
                ld_sum <= 0;
                en_sum <= 0;
                en_counter <= 0;
                finish <= 1;
            end

        endcase
    end



endmodule

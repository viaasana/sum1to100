module datapath (
    input clk,
    input ld_sum,
    input rst,
    input ld_counter,
    input en_sum,
    input en_counter,
    output reg done,
    output reg [12:0] result
);

    reg [6:0] count;
    reg [12:0] sum;


    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            count <=0;
            sum <=0;
            result <=0;
            done <= 0;
        end else begin
            if(ld_sum) sum <= 0;
            if(ld_counter) count <= 0;
            if(en_counter) count<=count+1;
            if(en_sum && !done)
                sum <= sum + count;

            if(count>=100)
                done <=1;
        end
    end


    always @(posedge clk) begin
        if(done)
            result = sum;
    end

endmodule

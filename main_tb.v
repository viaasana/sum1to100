`timescale 1ps/1ps

module sum1to100_tb ;


    reg clk = 0;
    reg rst = 0;
    wire unsigned [15:0] result;
    wire finish;

    sum1to100 uut (
        .clk(clk),
        .rst(rst),
        .result(result),
        .finish(finish)
    );

    always #5 clk = ~clk;

    initial begin
        #10;
        rst = 1;
    end

endmodule
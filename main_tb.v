`timescale 1ps/1ps

module sum1to100_tb ;


    reg clk = 0;
    reg rst = 0;
    reg start = 0;
    wire unsigned [12:0] result;
    wire finish;

    sum1to100 uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .result(result),
        .finish(finish)
    );

    always #5 clk = ~clk;

    initial begin
        #10;
        rst = 1;
        #10;
        start = 1;
        #1100;
        rst=0;
        start = 0;
        #10;
        rst = 1;
        start = 1;
    end

endmodule

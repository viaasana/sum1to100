module sum1to100 (
    input clk,
    input rst,
    input start,
    output [12:0] result,
    output finish
);

    wire ld_counter, ld_sum, en_sum, en_counter, done;

    controler controler_unit (
        .clk(clk),
        .rst(rst),
        .start(start),
        .done(done),
        .ld_sum(ld_sum),
        .ld_counter(ld_counter),
        .en_sum(en_sum),
        .en_counter(en_counter),
        .finish(finish)
    );

    datapath datapath_unit (
        .clk(clk),
        .ld_sum(ld_sum),
        .rst(rst),
        .ld_counter(ld_counter),
        .en_sum(en_sum),
        .en_counter(en_counter),
        .done(done),
        .result(result)
    );

    
endmodule

module sinegen #(
    parameter WIDTH = 8
)(
    input  logic clk,       // input clock
    input  logic rst,       // reset
    input logic en,
    input  logic [WIDTH-1:0] incr,   // serial data in
    output logic [WIDTH-1:0] dout
);                          // End of port list

    logic [WIDTH-1:0] count;
    counter counter (
        .clk(clk),
        .rst(rst),
        .en(en),
        .incr(incr),
        .count(count)
    );

    rom rom(
        .clk(clk),
        .addr(count),
        .dout(dout)
    );

endmodule

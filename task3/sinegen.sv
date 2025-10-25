module sinegen #(
    parameter WIDTH = 8
)(
    input  logic clk,       // input clock
    input  logic rst,       // reset
    input logic en,
    input logic [WIDTH-1:0] incr,
    input  logic [WIDTH-1:0] phase,   // serial data in
    output logic [WIDTH-1:0] dout1,
    output logic [WIDTH-1:0] dout2

);                          // End of port list

    logic [WIDTH-1:0] count;
    counter counter (
        .clk(clk),
        .rst(rst),
        .en(en),
        .incr(incr),//? default incr val
        .count(count)
    );
    rom2ports rom2ports(
        .clk(clk),
        .addr1(count),
        .addr2(count + phase),
        .dout1(dout1),
        .dout2(dout2)
    );

endmodule


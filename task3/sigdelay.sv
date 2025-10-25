module sinegen #(
    parameter WIDTH = 8
)(
    input  logic clk,       // input clock
    input  logic rst,       // reset
    input logic [WIDTH-1:0] mic_signal, //?width ->din
    input logic wr,
    input logic rd,
    input logic [WIDTH-1:0] offset,
    input logic [WIDTH-1:0] incr,

    output logic [WIDTH-1:0] delayed_signal

);                          // End of port list

    logic [WIDTH-1:0] count;
    counter counter (
        .clk(clk),
        .rst(rst),
        .incr(incr),//? default incr val
        .count(count)
    );

    ram2ports ram2ports(
        .clk(clk),
        .wr_en(wr),
        .rd_en(rd),
        .wr_addr(count),
        .rd_addr(count - offset),
        .din(mic_signal),
        .dout(delayed_signal)
    );

endmodule


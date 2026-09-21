// 综合视图：不许有 initial、不许有延时
module {{name}}_top #(
    parameter DATA_BITS = 8
) (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        psel,
    input  wire        penable,
    input  wire        pwrite,
    input  wire [7:0]  paddr,
    input  wire [31:0] pwdata,
    output wire [31:0] prdata,
    output wire        pready,
    output wire        pslverr,
    output wire        o_tx,
    input  wire        i_rx,
    output wire        o_irq
);
endmodule

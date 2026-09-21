package {{Name}}Tb;

import {{Name}}::*;

// 周期 4 拍翻一次。64 拍里看得见 15 次：首个采样没有前一拍可比，少算一次。
// 数线上的翻转，不数寄存器。
(* synthesize *)
module mk{{Name}}Tb(Empty);
  {{Name}}Ifc#(4) d <- mk{{Name}}({{Name}}Cfg { invert: False });
  Reg#(Bit#(16)) n     <- mkReg(0);
  Reg#(Bit#(16)) turns <- mkReg(0);
  Reg#(Bit#(1))  prev  <- mkReg(0);

  rule count (n < 64);
    n <= n + 1;
    if (d.pins.tick != prev) turns <= turns + 1;
    prev <= d.pins.tick;
  endrule

  rule fin (n == 64);
    if (turns != 15) begin
      $display("FAIL tick turned %0d times in 64 cycles, want 15", turns);
      $finish(1);
    end
    $display("PASS {{name}}: tick turns once every period");
    $finish(0);
  endrule
endmodule

endpackage

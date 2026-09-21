package {{Name}}Tb;

import {{Name}}::*;

// 往返一遍全部 8 位取值，并验相邻两个格雷码只差一位。
(* synthesize *)
module mk{{Name}}Tb(Empty);
  Reg#(Bit#(9)) i <- mkReg(0);
  Reg#(Bool)  bad <- mkReg(False);

  rule step (i < 256);
    Bit#(8) v = truncate(i);
    if (ungray(gray(v)) != v) begin
      $display("FAIL ungray(gray(%0d)) is %0d", v, ungray(gray(v)));
      bad <= True;
    end
    if (v != 0) begin
      Bit#(8) d = gray(v) ^ gray(v - 1);
      if (countOnes(d) != 1) begin
        $display("FAIL gray(%0d) and gray(%0d) differ in %0d bits", v, v - 1, countOnes(d));
        bad <= True;
      end
    end
    i <= i + 1;
  endrule

  rule fin (i == 256);
    if (bad) begin $display("FAILED"); $finish(1); end
    $display("PASS {{name}}: gray round-trips and steps one bit at a time");
    $finish(0);
  endrule
endmodule

endpackage

module DFFSR(reset,clock,data,q);
input reset;
input clock;
input[7:0] data;
output[7:0] q;
reg[7:0] q;
always@(posedge clock) begin SR// AR (posedge clock or posedge reset)
if(reset) begin
	q<=0;
end 
else
 begin 
 q<= data;
 end
end
endmodule

module mod_counter(
    input wire reset,
    input wire clock,
    input wire [3:0]in,
    input wire load,
    output reg [3:0]cnt
    );

parameter MODULE = 6;

always @(posedge clock or posedge reset)
begin
  if(reset)
    cnt <= 4'b0000;
  else
  begin
  if(load)
    cnt <= in;
  else
    if(cnt+1==MODULE)
       cnt <= 4'b0000;
    else
       cnt <= cnt + 1'b1;
  end
end

endmodule

module test(
  input wire clock,
  input wire [3:0]in,
  output reg [3:0]x,
  output reg [3:0]y,
  output reg [3:0]z );

always @(posedge clock)
begin
  x <= in + 1;
  y <= x + 1;
  z <= y + 1;
end

endmodule

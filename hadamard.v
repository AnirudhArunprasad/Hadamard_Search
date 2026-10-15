module hadamard(

  input wire clk,
  input wire [3:0] vector_a,
  input wire [3:0] vector_b,
  output reg [3:0] hamming_dist

);

  wire [3:0] temp = vector_a ^ vector_b;
  wire [3:0] sum = temp[3] + temp[2] + temp[1] + temp[0];

  always @(posedge clk) begin
    hamming_dist <= sum;
  end


endmodule
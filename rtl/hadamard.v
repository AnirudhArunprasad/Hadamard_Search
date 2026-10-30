module hadamard #(
    parameter WIDTH = 8
  ) (
  input wire clk,
  input wire [WIDTH-1:0] vector_a,
  input wire [WIDTH-1:0] vector_b,
  output reg [WIDTH-1:0] hamming_dist
);

  wire [WIDTH-1:0] temp = vector_a ^ vector_b;
  reg [$clog2(WIDTH):0] sum;

  always @(*) begin

    integer i;
    sum = 0;

    for (i = 0; i < WIDTH; i = i + 1) begin
      sum = sum + temp[i];
    end
  end

  always @(posedge clk) begin
    hamming_dist <= sum;
  end

endmodule
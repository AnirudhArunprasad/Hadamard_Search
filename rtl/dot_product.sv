// dot_product.sv

/*
inputs: 
clock
vector a
vector b

va * vb = dot

output:
dot

*/

module dot_product #(
  parameter int WIDTH = 8
) (
  input wire [WIDTH-1:0] vector_a,
  input wire [WIDTH-1:0] vector_b,
  output reg signed [$clog2(WIDTH+1):0] dot_product
);

reg [WIDTH-1:0] distance;
reg [$clog2(WIDTH+1):0] sum;

always_comb begin : hamming_dot_block

  sum = 0;

  distance = (vector_a ^ vector_b);
  for (int i = 0; i < WIDTH; i++) begin
    if (distance[i] == 1) begin
      sum = sum + 1;
    end
  end
  dot_product = (WIDTH - (2*sum));
end

endmodule
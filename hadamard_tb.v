module hadamard_tb;

  reg clk;
  reg [3:0] vector_a;
  reg [3:0] vector_b;

  wire [3:0] hamming_dist;

  hadamard dut (
    .clk(clk),
    .vector_a(vector_a),
    .vector_b(vector_b),
    .hamming_dist(hamming_dist)
  );

  always #5 clk = ~clk;
  
  initial begin
    $dumpvars(0, hadamard_tb);

    clk = 0;

    vector_a = 4'b0000;
    vector_b = 4'b0000;

    #10;

    vector_a = 4'b0000;
    vector_b = 4'b0001;

    #10;

    vector_a = 4'b0000;
    vector_b = 4'b0011;

    #10;

    vector_a = 4'b0000;
    vector_b = 4'b1111;

    #10;

    $finish;
  end

endmodule
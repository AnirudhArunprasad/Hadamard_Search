module hadamard_tb;

  localparam WIDTH = 8;

  reg clk;
  reg [WIDTH-1:0] vector_a;
  reg [WIDTH-1:0] vector_b;

  wire [WIDTH-1:0] hamming_dist;

  hadamard #(
    .WIDTH(WIDTH)
  ) uut (
    .clk(clk),
    .vector_a(vector_a),
    .vector_b(vector_b),
    .hamming_dist(hamming_dist)
  );

  always #5 clk = ~clk;

  integer expected;
  
  initial begin
    $dumpvars(0, hadamard_tb);

    clk = 0;

    vector_a = 8'b00000000;
    vector_b = 8'b00000000;
    expected = 0;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, hamming_dist);

    vector_a = 8'b00000000;
    vector_b = 8'b00001111;
    expected = 4;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, hamming_dist);

    vector_a = 8'b00000000;
    vector_b = 8'b00110011;
    expected = 4;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, hamming_dist);

    vector_a = 8'b00000000;
    vector_b = 8'b00010110;
    expected = 3;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, hamming_dist);

    vector_a = 8'b00110100;
    vector_b = 8'b01100001;
    expected = 4;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, hamming_dist);

    vector_a = 8'b01111100;
    vector_b = 8'b00001111;
    expected = 5;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, hamming_dist);

    vector_a = 8'b00010001;
    vector_b = 8'b00110011;
    expected = 2;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, hamming_dist);

    vector_a = 8'b00010000;
    vector_b = 8'b00000001;
    expected = 2;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, hamming_dist);

    $finish;
  end

endmodule
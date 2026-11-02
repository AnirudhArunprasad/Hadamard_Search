// dot_product_tb.sv

module moduleName;

  localparam WIDTH = 8;

  reg clk;
  reg [WIDTH-1:0] vector_a;
  reg [WIDTH-1:0] vector_b;

  reg [$clog2((2*WIDTH)-1):0] dot_product;

  dot_product #(
    .WIDTH(WIDTH)
  ) uut (
    .clk(clk),
    .vector_a(vector_a),
    .vector_b(vector_b),
    .dot_product(dot_product)
  );

  always #5 clk = ~clk;

  integer expected;
  
  initial begin
    $dumpvars(0, dot_product);

    clk = 0;

    vector_a = 8'b00000000;
    vector_b = 8'b00000000;
    expected = 8;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, dot_product);

    vector_a = 8'b00000000;
    vector_b = 8'b00001111;
    expected = 0;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, dot_product);

    vector_a = 8'b00000000;
    vector_b = 8'b00110011;
    expected = 0;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, dot_product);

    vector_a = 8'b00000000;
    vector_b = 8'b00010110;
    expected = 2;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, dot_product);

    vector_a = 8'b00110100;
    vector_b = 8'b01100001;
    expected = 0;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, dot_product);

    vector_a = 8'b01111100;
    vector_b = 8'b00001111;
    expected = 14; //16-2
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, dot_product);

    vector_a = 8'b00010001;
    vector_b = 8'b00110011;
    expected = 4;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, dot_product);

    vector_a = 8'b00010000;
    vector_b = 8'b00000001;
    expected = 4;
    #10;

    $display("A=%b B=%b expected=%0d actual=%0d",
             vector_a, vector_b, expected, dot_product);

    $finish;
  end

endmodule
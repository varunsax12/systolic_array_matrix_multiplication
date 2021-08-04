/* Taking matrices

A = [1 2 3]
    [4 5 6]
    [7 8 9]
B = [2 1 3]
    [4 5 7]
    [6 9 8]
AxB = [28 38 41]
      [64 83 95]
      [100 128 149]
*/

module tb_matrix_multiply;

//ensure proper sizing of data to ensure the accumulate can save all data
localparam DATA_SIZE = 1024, MATRIX_SIZE = 3;

logic [DATA_SIZE-1:0] in_a [MATRIX_SIZE-1:0];
logic [DATA_SIZE-1:0] in_b [MATRIX_SIZE-1:0];
logic [DATA_SIZE-1:0] out_sum [MATRIX_SIZE*MATRIX_SIZE-1:0];
logic reset, clk;

matrix_multiply #(.DATA_SIZE(DATA_SIZE), .MATRIX_SIZE(MATRIX_SIZE)) uut (.in_a(in_a), .in_b(in_b), .reset(reset), .clk(clk), .out_matrix(out_sum));

always
	begin
		clk = 1; #10;
		clk = 0; #10;
	end

initial
	begin
		$monitor("Matrix status %d %d %d %d %d %d %d %d %d", out_sum[0], out_sum[1], out_sum[2], out_sum[3], out_sum[4], out_sum[5], out_sum[6], out_sum[7], out_sum[8]);
		@(negedge clk) reset = 1;
		@(negedge clk) reset = 0;
		in_a[0] = 1; in_a[1] = 0; in_a[2] = 0; in_b[0] = 2; in_b[1] = 0; in_b[2] = 0;
		@(negedge clk)
		in_a[0] = 2; in_a[1] = 4; in_a[2] = 0; in_b[0] = 4; in_b[1] = 1; in_b[2] = 0;
		@(negedge clk)
		in_a[0] = 3; in_a[1] = 5; in_a[2] = 7; in_b[0] = 6; in_b[1] = 5; in_b[2] = 3;
		@(negedge clk)
		in_a[0] = 0; in_a[1] = 6; in_a[2] = 8; in_b[0] = 0; in_b[1] = 9; in_b[2] = 7;
		@(negedge clk)
		in_a[0] = 0; in_a[1] = 0; in_a[2] = 9; in_b[0] = 0; in_b[1] = 0; in_b[2] = 8;
		@(negedge clk)
		in_a[0] = 0; in_a[1] = 0; in_a[2] = 0; in_b[0] = 0; in_b[1] = 0; in_b[2] = 0;
		@(negedge clk) #10; $stop;
	end

endmodule

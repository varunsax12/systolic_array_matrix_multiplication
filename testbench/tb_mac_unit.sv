module tb_mac_unit;

localparam DATA_SIZE = 8;

logic [DATA_SIZE-1:0] in_a, in_b, out_a, out_b;
logic [2*DATA_SIZE-1:0] out_sum, last_sum;

logic reset, clk;

mac_unit #(.data_size(DATA_SIZE)) mu (.in_a(in_a), .in_b(in_b), .out_a(out_a), .out_b(out_b), .out_sum(out_sum), .reset(reset), .clk(clk));

always
	begin
		clk = 1; #10;
		clk = 0; #10;
	end

initial
	begin
		@(negedge clk) reset = 1;
		for (int i = 0; i<=9; i++)
			begin
				@(negedge clk) reset = 0; in_a = i; in_b = i+1;
				@(posedge clk)
				#1;
				check_value(.in_a(in_a), .in_b(in_b), .out_a(out_a), .out_b(out_b), .out_sum(out_sum), .last_sum(last_sum));
				last_sum = out_sum;
			end
		#500; $finish;
	end

task check_value;
	input [DATA_SIZE-1:0] in_a, in_b, out_a, out_b;
	input [2*DATA_SIZE-1:0] out_sum, last_sum;
	begin
		assert(out_a==in_a) else $error("Output for a mismatched");
		assert(out_b==in_b) else $error("Output for b mismatched");
		assert(out_sum==(in_a*in_b+last_sum)) else $error("Output for sum mismatched");
	end
endtask

endmodule

# systolic_array_matrix_multiplication
Scalable (parameterized) systolic array for NxN matrix multiplication

# Code organization:
modules -> contains the functional unit (Multiply-accumulate unit)
testbench -> contains the testbench used for testing the FU
matrix_multiply.sv -> top level file for the implementation
tb_matrix_multiply.sv -> testbench used for testing

# Running the code
Run the file tb_matrix_multiply.sv.

# Implementation details:

Reference: "A serial-parallel architecture for two-dimensional Discrete Cosine and Inverse Discrete Cosine Transforms", IEEE Transactions on Computers, Hyesook Lim et. al.

![Semisystolic-arrays-for-matrix-multiplication-a-Type-I-array-and-b-Type-2-array](https://user-images.githubusercontent.com/79747613/128184755-999363eb-b268-476d-9764-afb6f6ff2c59.png)

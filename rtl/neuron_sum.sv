// Code your design here
module neuron_sum (
    input  logic signed [7:0] x1,
    input  logic signed [7:0] x2,
    output logic signed [8:0] y
);

    // Sign-extend both 8-bit inputs to 9 bits
    assign y = $signed({x1[7], x1}) + $signed({x2[7], x2});

endmodule
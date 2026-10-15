`timescale 1ns/1ps

module tb_neuron_sum;

    logic signed [7:0] x1;
    logic signed [7:0] x2;
    logic signed [8:0] y;

    // Instantiate the neuron
    neuron_sum dut (
        .x1(x1),
        .x2(x2),
        .y(y)
    );

    // Generate waveform
    initial begin
        $dumpfile("neuron.vcd");
        $dumpvars(0, tb_neuron_sum);
    end

    initial begin

        // Test 1
        x1 = 8'sd10;
        x2 = 8'sd5;
        #10;

        $display("Test 1: x1 = %0d, x2 = %0d, y = %0d",
                 x1, x2, y);

        // Test 2
        x1 = -8'sd20;
        x2 = 8'sd5;
        #10;

        $display("Test 2: x1 = %0d, x2 = %0d, y = %0d",
                 x1, x2, y);

        // Test 3
        x1 = 8'sd127;
        x2 = 8'sd127;
        #10;

        $display("Test 3: x1 = %0d, x2 = %0d, y = %0d",
                 x1, x2, y);

        #10;

        $finish;
    end

endmodule
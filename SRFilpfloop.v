module SRFilpfloop (
    input  wire clk, 
    input  wire rst, 
    input  wire S, 
    input  wire R,
    output reg  Q
);
    always @(posedge clk) begin
        if (rst)
            Q <= 1'b0;         // Reset
        else begin
            case ({S,R})
                2'b00: Q <= Q;     // No change
                2'b01: Q <= 1'b0;  // Reset
                2'b10: Q <= 1'b1;  // Set
                2'b11: Q <= Q;     // Avoid Q = X (hardware cannot synthesize X)
            endcase
        end
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2024 15:07:51
// Design Name: 
// Module Name: shannon_encoding
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shannon_encoding(
   
    input [7:0] symbol_probabilities, 
    output reg [7:0] codewords 
);

reg [7:0] sorted_probs; 
integer total_symbols = 8; 
integer partition_index; 
 integer i, j;
 integer temp;
 integer prefix_sum = 0;

parameter THRESHOLD = 4; 


initial begin
   

    
    sorted_probs = symbol_probabilities;

    // Bubble sort to sort 
    for (i = 0; i < total_symbols; i = i + 1) begin
        for (j = 0; j < total_symbols - i - 1; j = j + 1) begin
            if (sorted_probs[j] < sorted_probs[j+1]) begin
                // Swap probabilities
                temp = sorted_probs[j];
                sorted_probs[j] = sorted_probs[j+1];
                sorted_probs[j+1] = temp;
            end
        end
    end

    
    
    partition_index = 0;
    for (i = 0; i < total_symbols; i = i + 1) begin
        prefix_sum = prefix_sum + sorted_probs[i];
        if (prefix_sum >= (symbol_probabilities >> 1)) begin
            partition_index = i;
          
        end
    end

    // Generate codewords
    for (i = 0; i < total_symbols; i = i + 1) begin
        if (i < partition_index) begin
            codewords[i] = (i < THRESHOLD) ? i : i + 1; 
        end
        else begin
            codewords[i] = (i < THRESHOLD) ? i + 1 : i + 2; 
        end
    end
end

endmodule

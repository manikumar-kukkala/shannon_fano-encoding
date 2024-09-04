`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2024 15:17:00
// Design Name: 
// Module Name: shannon_encodingTB
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


module shannon_encodingTB;

 
  reg [7:0] symbol_probabilities; 
  
  
  wire [7:0] codewords; 
  
  
  practice_encoding practice_encoding_inst (
    .symbol_probabilities(symbol_probabilities),
    .codewords(codewords)
  );

  
  initial begin
    symbol_probabilities = 8'b11010110;
   
    #100;
   
    symbol_probabilities = 8'b11111111;
    #100;
    
    
  
      symbol_probabilities = 8'b00000000;
    #100;
   
  
     symbol_probabilities = 8'b11100000;
       #100;
     
     symbol_probabilities = 8'b00111100;
  
    #100;
        #100;
    $finish;
  end
  
endmodule


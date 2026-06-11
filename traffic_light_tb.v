`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 01:25:16
// Design Name: 
// Module Name: traffic_light_tb
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


`timescale 1ns / 1ps

module traffic_light_tb;

reg clk;
reg reset;

wire [2:0] roadA;
wire [2:0] roadB;

traffic_light uut(
    .clk(clk),
    .reset(reset),
    .roadA(roadA),
    .roadB(roadB)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;

    // Apply reset
    #10;
    reset = 0;

    // Run simulation
    #100;

    $finish;
end

// Display values in console
initial
begin
    $monitor("Time=%0t RoadA=%b RoadB=%b",
             $time, roadA, roadB);
end

endmodule

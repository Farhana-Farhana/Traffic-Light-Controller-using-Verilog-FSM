`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 01:24:52
// Design Name: 
// Module Name: traffic_light
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


module traffic_light(
    input clk,
    input reset,
    output reg [2:0] roadA,
    output reg [2:0] roadB
);

reg [1:0] state;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

// State Transition Logic
always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= S0;
    else
        case(state)
            S0: state <= S1;
            S1: state <= S2;
            S2: state <= S3;
            S3: state <= S0;
        endcase
end

// Output Logic
always @(*)
begin
    case(state)

        S0:
        begin
            roadA = 3'b100; // Green
            roadB = 3'b001; // Red
        end

        S1:
        begin
            roadA = 3'b010; // Yellow
            roadB = 3'b001; // Red
        end

        S2:
        begin
            roadA = 3'b001; // Red
            roadB = 3'b100; // Green
        end

        S3:
        begin
            roadA = 3'b001; // Red
            roadB = 3'b010; // Yellow
        end

        default:
        begin
            roadA = 3'b001;
            roadB = 3'b001;
        end

    endcase
end

endmodule

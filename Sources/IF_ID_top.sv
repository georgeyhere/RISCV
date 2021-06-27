`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2021 05:43:46 PM
// Design Name: 
// Module Name: IF_ID_top
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
import RV32I_definitions ::*;

module IF_ID_top

    (
    input            Clk,
    input            Reset_n,
    
    input            IF_Stall,
    input            ID_Stall,
    
    output [31:0]    ID_PC,
    output           ID_RegFile_wr_en,
    output           ID_ALU_source_sel,
    output [3:0]     ID_ALU_op,
    
    output [1:0]     ID_Branch_op,
    output           ID_Mem_wr_en,
    output           ID_Mem_rd_en,
    output           ID_MemToReg,
    output           ID_Jump,
    output           ID_Mem_op,
    
    output [31:0]    ID_Immediate_1,
    output [31:0]    ID_Immediate_2, 
    
    output [4:0]     ID_Rd_addr,
    output [31:0]    ID_Rs1_data,
    output [31:0]    ID_Rs2_data
    );
    
    wire [31:0] IF_PC;
    wire [31:0] IF_Instruction;
    
    wire [31:0] WB_Rd_address;
    wire [31:0] WB_Rd_wr_data;
    wire        WB_wr_en;
    
    
    RV32I_IF IF_inst(
    .Clk                (Clk),
    .Reset_n            (Reset_n),
    .MEM_PC_branch_dest (EX_PC_branch_dest),
    .MEM_PC_source_sel  (EX_PC_source_sel),
    .IF_Stall           (IF_Stall),
    .IF_PC              (IF_PC),
    .IF_Instruction     (IF_Instruction)
    );
    
    
    
    
    RV32I_ID ID_inst(
    .Clk                (Clk),
    .Reset_n            (Reset_n),
    
    .IF_PC              (IF_PC),
    .IF_Instruction     (IF_Instruction),
    .ID_Stall           (ID_Stall),
    
    .WB_Regfile_Rd_addr (32'd32),
    .WB_RegFile_wr_data (32'd420),
    .WB_RegFile_wr_en   (1'b0),
    
    .ID_PC              (ID_PC),
    
    .ID_ALU_source_sel  (ID_ALU_source_sel),
    .ID_ALU_op          (ID_ALU_op),
    .ID_Branch_op       (ID_Branch_op),
    .ID_Branch_flag     (ID_Branch_flag),
    .ID_Mem_wr_en       (ID_Mem_wr_en),
    .ID_Mem_rd_en       (ID_Mem_rd_en),
    .ID_RegFile_wr_en   (ID_RegFile_wr_en),
    .ID_MemToReg        (ID_MemToReg),
    .ID_Jump            (ID_Jump),
    .ID_Mem_op          (ID_Mem_op),
    
    .ID_Immediate_1     (ID_Immediate_1),
    .ID_Immediate_2     (ID_Immediate_2),
    .ID_Rs1_data        (ID_Rs1_data),
    .ID_Rs2_data        (ID_Rs2_data),
    .ID_Rd_addr         (ID_Rd_addr)
    );
    
    
    
endmodule

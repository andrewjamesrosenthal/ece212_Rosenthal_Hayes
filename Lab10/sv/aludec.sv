//--------------------------------------------------------------
// aludec.sv - MIPS multi-cycle ALU decoder
// David_Harris@hmc.edu and Sarah_Harris@hmc.edu 23 October 2005
// Updated to SystemVerilog dmh 12 November 2010
// Refactored into separate files & updated using additional SystemVerilog
// features by John Nestor May 2018
//--------------------------------------------------------------
module aludec(
    mips_decls_p::funct_t funct,
    input  logic [1:0] aluop,
    output logic [2:0] alucontrol
    );

   import mips_decls_p::*;

  
 always_comb
    case(aluop)
        2'b00: alucontrol = 3'b010;
        2'b01: alucontrol = 3'b110;
        2'b10: begin
            case(funct)          // RTYPE
                F_ADD:   alucontrol = 3'b010; 
                F_SUB:   alucontrol = 3'b110;
                F_AND:   alucontrol = 3'b000;
                F_OR:    alucontrol = 3'b001;
                F_SLT:   alucontrol = 3'b111;
                default: alucontrol = 3'bxxx;
            endcase
        end
        default: alucontrol = 3'bxxx;
    endcase
  


endmodule // aludec

module S4_actividad3xd #(parameter M=8)(
    input logic [M-1:0]A,[M-1:0]B,        //Entrada M bits
    input logic [1:0]OpCode,             // Codigo de operacion
    output logic [M-1:0]Result,         //Salida M bits
    output logic [4:0]Flags);          //Flags={N,Z,C,V,P}

    logic [M:0]resultado;
    logic paridad = 'd0;
    
    always_comb begin          
 
    case(OpCode)
    2'd0:begin//resta
            Result = A-B;
            if (Result==0) begin        // Si (A - B) == 0 levantamos el Flag Flag Zero
                Flags[3]=1;                                                       
            end else begin
                Flags[3]=0;                                                       
            end
            if (B>A) begin              // Si (B > A) la operación requiere de Carry, por lo que levantamos el Flag Carry                                          
                Flags[2]=1;                                                       
            end else begin
                Flags[2]=0;                                                       
            end
            if (Result[M-1]==1) begin   // Si el resultado es negativo levantamos el Flag Negative                                             
                Flags[4]=1;                                                       
            end else begin
                Flags[4]=0;                                                       
            end
            if (A[M-1]==1 && B[M-1]==0 && Result[M-1]==0) begin       // Si A < 0, B > 0 y (A + B) > 0 levantamos el Flag Overflow                   
                Flags[1]=1;                                                      
            end else if (A[M-1]==0 && B[M-1]==1 && Result[M-1]==1) begin   // Si A > 0, B < 0 y (A + B) < 0 levantamos el Flag Overflow       
                Flags[1]=1;                                                     
            end else begin
                Flags[1]=0;                                                     
            end
         end
    2'd1:begin//suma
            resultado = A + B;
            Result = resultado[M-1:0];
            if (Result==0) begin        // Si (A + B) == 0 levantamos el Flag Flag Zero
                Flags[3]=1;                                                    
            end 
            else begin
                Flags[3]=0;                                                     
            end
            if (resultado[M]==1) begin   // Si el resultado sale de la representación levantamos el Flag Carry
                Flags[2]=1;                                                       
            end else begin
                Flags[2]=0;                                                       
            end
            if (Result[M-1]==1) begin    // Si el resultado es negativo levantamos el Flag Negative         
                Flags[4]=1;                                                       
            end else begin
                Flags[4]=0;                                                       
            end

            // Comprobamos el Flag Overflow
            if (A[M-1]==0 && B[M-1]==0 && Result[M-1]==1) begin       // Si A > 0, B > 0 y (A + B) < 0 levantamos el Flag Overflow
                Flags[1]=1;                                                       
            end else if (A[M-1]==1 && B[M-1]==1 && Result[M-1]==0) begin   // Si A < 0, B < 0 y (A + B) < 0 levantamos el Flag Overflow        
                Flags[1]=1;                                                       
            end else begin
                Flags[1]=0;                                                       
            end
         end
    2'd2:begin//or
            Result = A|B;
            Flags[1]=0;
            Flags[2]=0;
            if (Result==0) begin        // Si (A | B) == 0 levantamos el Flag Flag Zero                                                  
                Flags[3]=1;                                                     
            end else begin
                Flags[3]=0;                                                     
            end
            if (Result[M-1]==1) begin   // Si el resultado es negativo levantamos el Flag Negative
                Flags[4]=1;                                                    
            end else begin
                Flags[4]=0;                                                    
            end
         end
    2'd3:begin//and
            Result = A&B;
            Flags[1]=0;
            Flags[2]=0;
            if (Result==0) begin        // Si (A & B) == 0 levantamos el Flag Flag Zero
                Flags[3]=1;                                                    
            end else begin
                Flags[3]=0;                                                    
            end
            if (Result[M-1]==1) begin   // Si el resultado es negativo levantamos el Flag Negative
                Flags[4]=1;                                                   
            end else begin
                Flags[4]=0;                                                   
            end
         end
    default:begin
                Result=0;
                Flags=5'b00000;
            end
    endcase

    paridad = ^Result;
    if (paridad)
        Flags[0]=1;
    else
        Flags[0]=0;
 end
endmodule

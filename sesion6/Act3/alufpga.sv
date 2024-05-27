module S4_actividad3 #(parameter M = 7)(
    input logic [M-1:0] A,B,
    input logic [1:0] OpCode,  
    output logic [M-1:0] Result,
    output logic [4:0] Flags 
    );
    logic [M:0] tempResult;
    logic P;
 
    logic V, C, Z, N, F; 
    assign P = ^Result ; 
    always_comb begin
       case(OpCode)
        2'b00: begin //Resta
               tempResult = A-B;
               Result = tempResult[M-1:0]; //Resultado sin considerar carry 
               
               if (tempResult[M] == 1'b1) begin
                  Flags[2] = 1'b1; // Fija C=1 -> Indica Carry
               end
               else begin
                 Flags[2] = 1'b0; // Fija C=0 -> Indica ausencia Carry
               end
               
               if (((~A[M-1]& B[M-1]& Result[M-1])|(A[M-1]& ~B[M-1]& ~Result[M-1]))==1 )begin //Expresion para determinar si hay Overflow
                  Flags[1]=1'b1; // V=1 (HAY OVERFLOW)
               end
               else begin
                  Flags[1]=1'b0;// V=0 (NO HAY OVERFLOW)
               end  
                                 
               end
        
        2'b01: begin //Suma
               tempResult = A+B;
               Result = tempResult[M-1:0]; //Resultado sin considerar carry 
               
               if (tempResult[M] == 1'b1) begin
                  Flags[2] = 1'b1; 
               end
               else begin
                 Flags[2] = 1'b0; 
               end    
               
               if (((A[M-1]& B[M-1]& ~Result[M-1])| (~A[M-1]& ~B[M-1]& Result[M-1]))==1  )begin //Expresi n para determinar si hay Overflow 
                  Flags[1]=1'b1; 
               end
               else begin
                 Flags[1]=1'b0; 
               end                                     
               end
               
        //////// 
              
        2'b10: begin //OR
               Result = (A|B);
                  Flags[1]=1'b0; //No es operaci n algebraica V = 0; C = 0
                  Flags[2]=1'b0;             
               end
               
        ////////       
        2'b11: begin //AND
               Result = (A&B);
                  Flags[1]=1'b0; //No es operaci n algebraica V = 0; C = 0 
                  Flags[2]=1'b0;         
               end
       endcase
       
      
       
       ///Resultado = 0
       if (Result == 'b0) begin // Si el resultado de la operacion realizada es cero
           Flags[3] = 1'b1; // Z = 1 
       end
       else begin
           Flags[3] = 1'b0; // Z = 0
       end
       
       ///Signo dado por el bit m s significativo
       
        if (Result[M-1] == 1'b1) begin 
            Flags[4] = 1'b1; // N=1
        end 
        else begin
            Flags[4] = 1'b0; // N=0
        end
        
        ///Cantidad de 1's pares en el bus
         
        if  (P == 1'b1) begin
           Flags[0] = 1'b1; 
        end
        else begin
           Flags[0] = 1'b0; 
        end
    end
    
    
    
endmodule

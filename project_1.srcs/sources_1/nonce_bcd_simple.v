// ============================================================================
// MODULO: Conversor BCD Otimizado
// ============================================================================

`timescale 1ns / 1ps

module nonce_bcd_simple (
    input  wire [31:0] nonce,
    output wire [3:0]  digit10,  // BCD puro (0-9) - NOVO para 10^9
    output wire [3:0]  digit9,   // BCD puro (0-9)
    output wire [3:0]  digit8,   // BCD puro (0-9)
    output wire [3:0]  digit7,   // BCD puro (0-9)
    output wire [3:0]  digit6,   // BCD puro (0-9)
    output wire [3:0]  digit5,   // BCD puro (0-9)
    output wire [3:0]  digit4,   // BCD puro (0-9)
    output wire [3:0]  digit3,   // BCD puro (0-9)
    output wire [3:0]  digit2,   // BCD puro (0-9)
    output wire [3:0]  digit1,   // BCD puro (0-9)
    output wire [3:0]  digit_count  // Quantos digitos validos (1-10)
);


    // ========================================================================
    // Digito 10 (casa 10^9 = 1.000.000.000) - NOVO
    // ========================================================================
    // Extrai o digito mais significativo (bilhoes)
    // Suporta valores ate 4.294.967.295 (maximo 32 bits)
    // digit10 pode ser 0-4 (pois 5*10^9 > 32 bits)
    
    assign digit10 = (nonce >= 32'd4000000000) ? 4'd4 :
                     (nonce >= 32'd3000000000) ? 4'd3 :
                     (nonce >= 32'd2000000000) ? 4'd2 :
                     (nonce >= 32'd1000000000) ? 4'd1 : 4'd0;
    
    wire [31:0] remainder_d10 = nonce - (digit10 * 32'd1000000000);

    // ========================================================================
    // Digito 9 (casa 10^8 = 100.000.000) - MODIFICADO
    // ========================================================================
    // Agora trabalha com o resto de digit10 (remainder_d10)
    
    assign digit9 = (remainder_d10 >= 32'd900000000) ? 4'd9 :
                    (remainder_d10 >= 32'd800000000) ? 4'd8 :
                    (remainder_d10 >= 32'd700000000) ? 4'd7 :
                    (remainder_d10 >= 32'd600000000) ? 4'd6 :
                    (remainder_d10 >= 32'd500000000) ? 4'd5 :
                    (remainder_d10 >= 32'd400000000) ? 4'd4 :
                    (remainder_d10 >= 32'd300000000) ? 4'd3 :
                    (remainder_d10 >= 32'd200000000) ? 4'd2 :
                    (remainder_d10 >= 32'd100000000) ? 4'd1 : 4'd0;
    
    wire [31:0] remainder_d9 = remainder_d10 - (digit9 * 32'd100000000);
    
    // ========================================================================
    // Digito 8 (casa 10^7 = 10.000.000)
    // ========================================================================
    
    assign digit8 = (remainder_d9 >= 32'd90000000) ? 4'd9 :
                    (remainder_d9 >= 32'd80000000) ? 4'd8 :
                    (remainder_d9 >= 32'd70000000) ? 4'd7 :
                    (remainder_d9 >= 32'd60000000) ? 4'd6 :
                    (remainder_d9 >= 32'd50000000) ? 4'd5 :
                    (remainder_d9 >= 32'd40000000) ? 4'd4 :
                    (remainder_d9 >= 32'd30000000) ? 4'd3 :
                    (remainder_d9 >= 32'd20000000) ? 4'd2 :
                    (remainder_d9 >= 32'd10000000) ? 4'd1 : 4'd0;
    
    wire [31:0] remainder_d8 = remainder_d9 - (digit8 * 32'd10000000);
    
    // ========================================================================
    // Digito 7 (casa 10^6 = 1.000.000)
    // ========================================================================
    
    assign digit7 = (remainder_d8 >= 32'd9000000) ? 4'd9 :
                    (remainder_d8 >= 32'd8000000) ? 4'd8 :
                    (remainder_d8 >= 32'd7000000) ? 4'd7 :
                    (remainder_d8 >= 32'd6000000) ? 4'd6 :
                    (remainder_d8 >= 32'd5000000) ? 4'd5 :
                    (remainder_d8 >= 32'd4000000) ? 4'd4 :
                    (remainder_d8 >= 32'd3000000) ? 4'd3 :
                    (remainder_d8 >= 32'd2000000) ? 4'd2 :
                    (remainder_d8 >= 32'd1000000) ? 4'd1 : 4'd0;
    
    wire [31:0] remainder_d7 = remainder_d8 - (digit7 * 32'd1000000);
    
    // ========================================================================
    // Digito 6 (casa 10^5 = 100.000)
    // ========================================================================
    
    assign digit6 = (remainder_d7 >= 32'd900000) ? 4'd9 :
                    (remainder_d7 >= 32'd800000) ? 4'd8 :
                    (remainder_d7 >= 32'd700000) ? 4'd7 :
                    (remainder_d7 >= 32'd600000) ? 4'd6 :
                    (remainder_d7 >= 32'd500000) ? 4'd5 :
                    (remainder_d7 >= 32'd400000) ? 4'd4 :
                    (remainder_d7 >= 32'd300000) ? 4'd3 :
                    (remainder_d7 >= 32'd200000) ? 4'd2 :
                    (remainder_d7 >= 32'd100000) ? 4'd1 : 4'd0;
    
    wire [31:0] remainder_d6 = remainder_d7 - (digit6 * 32'd100000);
    
    // ========================================================================
    // Digito 5 (casa 10^4 = 10.000)
    // ========================================================================
    
    assign digit5 = (remainder_d6 >= 32'd90000) ? 4'd9 :
                    (remainder_d6 >= 32'd80000) ? 4'd8 :
                    (remainder_d6 >= 32'd70000) ? 4'd7 :
                    (remainder_d6 >= 32'd60000) ? 4'd6 :
                    (remainder_d6 >= 32'd50000) ? 4'd5 :
                    (remainder_d6 >= 32'd40000) ? 4'd4 :
                    (remainder_d6 >= 32'd30000) ? 4'd3 :
                    (remainder_d6 >= 32'd20000) ? 4'd2 :
                    (remainder_d6 >= 32'd10000) ? 4'd1 : 4'd0;
    
    wire [31:0] remainder_d5 = remainder_d6 - (digit5 * 32'd10000);
    
    // ========================================================================
    // Digito 4 (casa 10^3 = 1.000)
    // ========================================================================
    
    assign digit4 = (remainder_d5 >= 32'd9000) ? 4'd9 :
                    (remainder_d5 >= 32'd8000) ? 4'd8 :
                    (remainder_d5 >= 32'd7000) ? 4'd7 :
                    (remainder_d5 >= 32'd6000) ? 4'd6 :
                    (remainder_d5 >= 32'd5000) ? 4'd5 :
                    (remainder_d5 >= 32'd4000) ? 4'd4 :
                    (remainder_d5 >= 32'd3000) ? 4'd3 :
                    (remainder_d5 >= 32'd2000) ? 4'd2 :
                    (remainder_d5 >= 32'd1000) ? 4'd1 : 4'd0;
    
    wire [31:0] remainder_d4 = remainder_d5 - (digit4 * 32'd1000);
    
    // ========================================================================
    // Digito 3 (casa 10^2 = 100)
    // ========================================================================
    
    assign digit3 = (remainder_d4 >= 32'd900) ? 4'd9 :
                    (remainder_d4 >= 32'd800) ? 4'd8 :
                    (remainder_d4 >= 32'd700) ? 4'd7 :
                    (remainder_d4 >= 32'd600) ? 4'd6 :
                    (remainder_d4 >= 32'd500) ? 4'd5 :
                    (remainder_d4 >= 32'd400) ? 4'd4 :
                    (remainder_d4 >= 32'd300) ? 4'd3 :
                    (remainder_d4 >= 32'd200) ? 4'd2 :
                    (remainder_d4 >= 32'd100) ? 4'd1 : 4'd0;
    
    wire [31:0] remainder_d3 = remainder_d4 - (digit3 * 32'd100);
    
    // ========================================================================
    // Digito 2 (casa 10^1 = 10)
    // ========================================================================
    
    assign digit2 = (remainder_d3 >= 32'd90) ? 4'd9 :
                    (remainder_d3 >= 32'd80) ? 4'd8 :
                    (remainder_d3 >= 32'd70) ? 4'd7 :
                    (remainder_d3 >= 32'd60) ? 4'd6 :
                    (remainder_d3 >= 32'd50) ? 4'd5 :
                    (remainder_d3 >= 32'd40) ? 4'd4 :
                    (remainder_d3 >= 32'd30) ? 4'd3 :
                    (remainder_d3 >= 32'd20) ? 4'd2 :
                    (remainder_d3 >= 32'd10) ? 4'd1 : 4'd0;
    
    wire [31:0] remainder_d2 = remainder_d3 - (digit2 * 32'd10);
    
    // ========================================================================
    // Digito 1 (casa 10^0 = 1)
    // ========================================================================
    
    assign digit1 = remainder_d2[3:0];  // Resto final (0-9)
    
    // ========================================================================
    // Determinar contagem de Digitos validos (sem zeros à esquerda)
    // ========================================================================
    
    assign digit_count = (nonce == 0)  ? 4'd1 :          // "0"
                         (digit10 != 0) ? 4'd10 :         // 1B-9.999.999.999 (NOVO)
                         (digit9 != 0) ? 4'd9 :           // 100M-999.999.999
                         (digit8 != 0) ? 4'd8 :           // 10M-99.999.999
                         (digit7 != 0) ? 4'd7 :           // 1M-9.999.999
                         (digit6 != 0) ? 4'd6 :           // 100K-999.999
                         (digit5 != 0) ? 4'd5 :           // 10K-99.999
                         (digit4 != 0) ? 4'd4 :           // 1K-9.999
                         (digit3 != 0) ? 4'd3 :           // 100-999
                         (digit2 != 0) ? 4'd2 :           // 10-99
                                         4'd1;            // 1-9

endmodule
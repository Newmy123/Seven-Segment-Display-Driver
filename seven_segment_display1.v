// Verilog code for displaying values on HEX1 and HEX0 based on switches SW7-0.
// The values represented by SW7-4 are displayed on HEX1.
// The values represented by SW3-0 are displayed on HEX0.
// Only digits 0-9 are displayed; values 10-15 are considered don't-care.

module seven_segment_display1 (
    input  [7:0] SW,        // Input switches SW7-0
    output [6:0] HEX0,      // Output to 7-segment display HEX0
    output [6:0] HEX1       // Output to 7-segment display HEX1
);

    // Wires for SW[3:0] (HEX0) and SW[7:4] (HEX1)
    wire [3:0] digit0 = SW[3:0];
    wire [3:0] digit1 = SW[7:4];

    // HEX0 display logic
    assign HEX0[0] = (~digit0[3] & ~digit0[2] & ~digit0[1] & digit0[0]) | //1
		     (~digit0[3] & digit0[2] & ~digit0[1] & ~digit0[0]) | //4
		     (digit0[3] & ~digit0[2] & digit0[1] & digit0[0]) | //b
		     (digit0[3] & digit0[2] & ~digit0[1] & digit0[0]);   //d

    assign HEX0[1] = (~digit0[3] & digit0[2] & ~digit0[1] & digit0[0]) | //5
	             (~digit0[3] & digit0[2] & digit0[1] & ~digit0[0]) | //6
		     (digit0[3] & ~digit0[2] & digit0[1] & digit0[0]) | //b
		     (digit0[3] & digit0[2] & digit0[1] & ~digit0[0]) | //E
		     (digit0[3] & digit0[2] & digit0[1] & digit0[0]) | //F
		     (digit0[3] & digit0[2] & ~digit0[1] & ~digit0[0]);  //C

    assign HEX0[2] = (~digit0[3] & ~digit0[2] & digit0[1] & ~digit0[0]) | //2
		     (digit0[3] & digit0[2] & ~digit0[1] & ~digit0[0]) | //C
		     (digit0[3] & digit0[2] & digit0[1] & ~digit0[0]) | //E
		     (digit0[3] & digit0[2] & digit0[1] & digit0[0]); //F

    assign HEX0[3] = (~digit0[3] & ~digit0[2] & ~digit0[1] & digit0[0]) | //1
		     (~digit0[3] & digit0[2] & ~digit0[1] & ~digit0[0]) | //4
		     (digit0[2] & digit0[1] & digit0[0]) | //7
		     (digit0[3] & ~digit0[2] & digit0[1] & ~digit0[0]) | //A
		     (digit0[3] & digit0[2] & digit0[1] & digit0[0]); //F

    assign HEX0[4] = (~digit0[3] & ~digit0[2] & ~digit0[1] & digit0[0]) | //1
		     (~digit0[3] & digit0[2] & ~digit0[1] & ~digit0[0]) | //4
		     (~digit0[3] & digit0[2] & ~digit0[1] & digit0[0]) | //5
		     (~digit0[3] & digit0[2] & digit0[1] & digit0[0]) | //7
		     (~digit0[3] & ~digit0[2] & digit0[1] & digit0[0]) | //3
		     (digit0[3] & ~digit0[2] & ~digit0[1] & digit0[0]); //9
		     
    assign HEX0[5] = (~digit0[3] & ~digit0[2] & ~digit0[1] & digit0[0]) | //1
		     (~digit0[3] & ~digit0[2] & digit0[1] & ~digit0[0]) | //2
		     (~digit0[3] & ~digit0[2] & digit0[1] & digit0[0]) | //3
			(~digit0[3] & digit0[2] & digit0[1] & digit0[0]) | //7
			(digit0[3] & digit0[2] & ~digit0[1] & digit0[0]);   //d

    assign HEX0[6] = (~digit0[3] & ~digit0[2] & ~digit0[1] & digit0[0]) | //1
			(~digit0[3] & digit0[2] & digit0[1] & digit0[0]) | //7
			(digit0[3] & digit0[2] & ~digit0[1] & ~digit0[0]) | //C
			(~digit0[3] & ~digit0[2] & ~digit0[1] & ~digit0[0]); //0

    // HEX1 display logic (similar to HEX0)
    assign HEX1[0] = (~digit1[3] & ~digit1[2] & ~digit1[1] & digit1[0]) | //1
		     (~digit1[3] & digit1[2] & ~digit1[1] & ~digit1[0]) | //4
		     (digit1[3] & ~digit1[2] & digit1[1] & digit1[0]) | //b
		     (digit1[3] & digit1[2] & ~digit1[1] & digit1[0]);   //d

    assign HEX1[1] = (~digit1[3] & digit1[2] & ~digit1[1] & digit1[0]) | //5
	             (~digit1[3] & digit1[2] & digit1[1] & ~digit1[0]) | //6
		     (digit1[3] & ~digit1[2] & digit1[1] & digit1[0]) | //b
		     (digit1[3] & digit1[2] & digit1[1] & ~digit1[0]) | //E
		     (digit1[3] & digit1[2] & digit1[1] & digit1[0]) | //F
		     (digit1[3] & digit1[2] & ~digit1[1] & ~digit1[0]);  //C

    assign HEX1[2] = (~digit1[3] & ~digit1[2] & digit1[1] & ~digit1[0]) | //2
		     (digit1[3] & digit1[2] & ~digit1[1] & ~digit1[0]) | //C
		     (digit1[3] & digit1[2] & digit1[1] & ~digit1[0]) | //E
		     (digit1[3] & digit1[2] & digit1[1] & digit1[0]); //F

    assign HEX1[3] = (~digit1[3] & ~digit1[2] & ~digit1[1] & digit1[0]) | //1
		     (~digit1[3] & digit1[2] & ~digit1[1] & ~digit1[0]) | //4
		     (digit1[2] & digit1[1] & digit1[0]) | //7
		     (digit1[3] & ~digit1[2] & digit1[1] & ~digit1[0]) | //A
		     (digit1[3] & digit1[2] & digit1[1] & digit1[0]); //F

    assign HEX1[4] = (~digit1[3] & ~digit1[2] & ~digit1[1] & digit1[0]) | //1
		     (~digit1[3] & digit1[2] & ~digit1[1] & ~digit1[0]) | //4
		     (~digit1[3] & digit1[2] & ~digit1[1] & digit1[0]) | //5
		     (~digit1[3] & digit1[2] & digit1[1] & digit1[0]) | //7
		     (~digit1[3] & ~digit1[2] & digit1[1] & digit1[0]) | //3
		     (digit1[3] & ~digit1[2] & ~digit1[1] & digit1[0]); //9

    assign HEX1[5] = (~digit1[3] & ~digit1[2] & ~digit1[1] & digit1[0]) | //1
		     (~digit1[3] & ~digit1[2] & digit1[1] & ~digit1[0]) | //2
		     (~digit1[3] & ~digit1[2] & digit1[1] & digit1[0]) | //3
		     (~digit1[3] & digit1[2] & digit1[1] & digit1[0]) | //7
		     (digit1[3] & digit1[2] & ~digit1[1] & digit1[0]);   //d

    assign HEX1[6] = (~digit1[3] & ~digit1[2] & ~digit1[1] & digit1[0]) | //1
		     (~digit1[3] & digit1[2] & digit1[1] & digit1[0]) | //7
		     (digit1[3] & digit1[2] & ~digit1[1] & ~digit1[0]) | //C
		     (~digit1[3] & ~digit1[2] & ~digit1[1] & ~digit1[0]); //0

endmodule

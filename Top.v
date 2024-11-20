// Copyright (c) 2020 FPGAcademy
// Please see license at https://github.com/fpgacademy/DESim

// Protect against undefined nets
`default_nettype none

module Top (CLOCK_50, KEY, SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, LEDR);
    input  wire         CLOCK_50;   // DE-series 50 MHz clock signal
    input  wire [ 3: 0] KEY;        // DE-series pushbuttons
    input  wire [ 9: 0] SW;         // DE-series switches
    output wire [ 6: 0] HEX0;       // DE-series HEX displays
    output wire [ 6: 0] HEX1;
    output wire [ 6: 0] HEX2;
    output wire [ 6: 0] HEX3;
    output wire [ 6: 0] HEX4;
    output wire [ 6: 0] HEX5;
    output wire [ 9: 0] LEDR;       // DE-series LEDs

   
    seven_segment_display1 U2 (
    SW,        // Input switches SW7-0
    HEX0,      // Output to 7-segment display HEX0
    HEX1       // Output to 7-segment display HEX1
);

endmodule

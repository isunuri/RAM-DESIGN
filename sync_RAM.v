module sync_RAM (
    input clk,              // Clock signal
    input we,               // Write enable
    input en,               // Enable signal (for read/write access)
    input [3:0] addr,       // 4-bit address (16 locations)
    input [7:0] din,        // Data input for write
    output reg [7:0] dout   // Data output for read
);
    reg [7:0] mem [0:15];   // 16 x 8-bit memory array

    always @(posedge clk) begin
        if (en) begin                 // Check if RAM is enabled
            if (we)                  // If write enable is high
                mem[addr] <= din;    // Write data to the specified address
            else
                dout <= mem[addr];   // Else, read data from the address
        end
    end
endmodule

module sync_RAM_tb;
    reg clk, we, en;                 // Control signals
    reg [3:0] addr;                  // Address register
    reg [7:0] din;                   // Data input register
    wire [7:0] dout;                 // Data output wire

    // Instantiate the RAM module
    sync_RAM uut (.clk(clk),.we(we),.en(en),.addr(addr),.din(din),.dout(dout) );
    // Generate clock: toggle every 5 time units
    always #5 clk = ~clk;
    initial begin
        $display("Time | clk | we | en | addr | din  | dout");
        $monitor("%4t |  %b  | %b  | %b  | %h   | %h  | %h", 
                 $time, clk, we, en, addr, din, dout);

        clk = 0; en = 1;             // Initialize clock and enable

        // ---------- Write Operations ----------
        we = 1;                        // Enable write mode
        addr = 4'h0; din = 8'hA5; #10; // Write 0xA5 to address 0
        addr = 4'h1; din = 8'h3C; #10; // Write 0x3C to address 1
        addr = 4'h2; din = 8'h7F; #10; // Write 0x7F to address 2
      
        // ---------- Read Operations ----------
        we = 0;                      // Switch to read mode
        addr = 4'h0; #10;            // Read from address 0 (should output 0xA5)
        addr = 4'h1; #10;            // Read from address 1 (should output 0x3C)
        addr = 4'h2; #10;            // Read from address 2 (should output 0x7F)

        // ---------- Disabled RAM ----------
        en = 0;                      // Disable RAM access
        addr = 4'h1; #10;            // No output change expected
        $finish;                     // End simulation
    end
endmodule

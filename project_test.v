`timescale 1ns / 1ps

module tablet_tb;

    // Inputs
    reg clk;
    reg reset;
    reg load_target_btn;
    reg [3:0] keypad_in;
    reg sensor_pulse;
    reg new_bottle_signal;

    // Outputs
    wire valve_close;
    wire [7:0] current_count;
    wire [7:0] target_limit;
    wire [15:0] total_tablets;

    // Instantiate the Unit Under Test (UUT)
    tablet_bottling_system uut (
        .clk(clk), 
        .reset(reset), 
        .load_target_btn(load_target_btn), 
        .keypad_in(keypad_in), 
        .sensor_pulse(sensor_pulse), 
        .new_bottle_signal(new_bottle_signal), 
        .valve_close(valve_close), 
        .current_count(current_count), 
        .target_limit(target_limit), 
        .total_tablets(total_tablets)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns Clock Period
    end

    // Simulation Procedure
    initial begin
        // 1. Initialize Inputs
        reset = 1;
        load_target_btn = 0;
        keypad_in = 0;
        sensor_pulse = 0;
        new_bottle_signal = 0;

        // 2. Apply Reset
        #20;
        reset = 0;
        $display("Simulation Start: Reset Complete.");

        // ---------------------------------------------------------
        // CASE 1: Set Target to 5 Tablets
        // ---------------------------------------------------------
        #10;
        keypad_in = 4'd5;   // Input '5' on keypad
        load_target_btn = 1; // Press Load Button
        #10;
        load_target_btn = 0; // Release Button
        $display("Target Set to: %d", 5);

        // 3. Simulate Sensor Pulses (Filling the Bottle)
        // We need to pulse 'sensor_pulse' 5 times.
        repeat (5) begin
            #20;
            sensor_pulse = 1; // Tablet falls
            #10;
            sensor_pulse = 0; // Sensor clears
            #10;
        end
        
        // Wait a moment for logic to process "Equal" state
        #20;
        if (valve_close == 1) 
            $display("SUCCESS: Valve Closed at count %d", current_count);
        else 
            $display("ERROR: Valve did not close!");

        // ---------------------------------------------------------
        // CASE 2: New Bottle / Conveyor Advances
        // ---------------------------------------------------------
        $display("Advancing Conveyor...");
        new_bottle_signal = 1; // Pulse reset signal
        #10;
        new_bottle_signal = 0;
        
        // Check if counter reset
        #10;
        if (current_count == 0 && valve_close == 0)
            $display("System Reset for Next Bottle. Current Total: %d", total_tablets);

        // ---------------------------------------------------------
        // CASE 3: Fill Second Bottle (Target still 5)
        // ---------------------------------------------------------
        repeat (5) begin
            #20; sensor_pulse = 1; #10; sensor_pulse = 0; #10;
        end
        
        #20;
        $display("Second Bottle Full. Total Tablets Accumulated: %d", total_tablets);

        // End Simulation
        #100;
        $stop;
    end
      
endmodule

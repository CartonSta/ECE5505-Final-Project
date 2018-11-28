# Circuit Simulation with Distinguishing Xs
Simulator for testing circuits with multi input gates using distinguishing Xs

To build: 
	g++ or equivalent is needed.
If GNU make is installed:
	run make build or make O3 for optimized code
If not:
	run g++ circuit.cpp -o circuit-simulator-burrow.app

Usage:


	./circuit-simulator-burrow.app [-iox] <ckt>
	-o is used to print the output of the circuit
	-x is used to calculate the X Trees of the circuit and print them at the POs
	-i is used to enable interactive mode, where gate values can be forced to a specific value to see how the circuit is impacted. 
		- If -x is enabled as well, interactive mode allows the user to see the X Trees for a specific gate and how they change when a gate is changed
		- Once in interactive mode type h for more help


Interactive mode commands:
	
	- h - help
	- q - quit (skips all remaining circuits and exits)
	- r - reset the current circuit to the current applied vector
	- c - continue to the next vector
	- s# - exit interactive mode for this vector and skip interactive mode for # following vectors to continue to the next vector
	- g# - set the gate value for gate #. You will be prompted for what value to set to, or you can type q to return to the normal interactive menu.
		note: setting a gate that is already set to x to x again will just propagate its current x value and X Tree (useful if you want to undo a change to a successor gate)
	If -x enabled:
	- x# - view the X Tree for gate #.
	note: The interactive mode has not been written to handle bad inputs well, so entering invalid numbers for the appropriate commands may cause it to prematurely exit.


How to interpret the output:

The output using the -o option is the same as for previous projects, but this implementation allows for multi-input gates (>2) with distinguishing Xs.

The X Trees mentioned above are a list of the distinguishing X's on the fanin of a given PO. They are displayed as follows:

	X#1(!) at gate #2, where the optional ~ indicates an inversed X (e.g. X1 & X1! == 0), #1 is the distinguishing X value, and #2 is the first gate at which that value occured.
		- note: In this implementation each distinguishing X is unique and can be set to X or X!, as opposed to some implementations where the positive Xs are the inverse of
				their odd (#-1) counterparts.

By using the -i and -x modes together, a user is able to not only view an X Tree for a given gate earlier in a fanin, but also to force a value on a specific gate and see how that affects the X Tree of its fanouts, i.e. if/how it propagates to the output.



.vec file format
----------------------------------------------------------------
14                  /* number of lines */
10                  /* junk, ignore */
1 1 0 0 1 6 4 ; 0 0         /* description of gate #1 */
2 1 0 0 1 8 5 ; 0 0
3 1 0 0 2 7 6 4 ; 0 0
4 1 0 0 1 7 4 ; 0 0
5 1 0 0 1 9 6 ; 0 0
6 7 5 2 1 3 1 3 1 10 3 ; 1 1
7 7 5 2 3 4 3 4 2 8 9 3 ; 2 2
8 7 10 2 7 2 7 2 2 11 10 2 ; 4 2
9 7 10 2 7 5 7 5 1 11 3 ; 3 1
10 7 15 2 8 6 8 6 1 12 0 ; 4 2
11 7 15 2 8 9 8 9 1 13 0 ; 4 4
12 2 20 1 10 10 0 0 O 4 2
13 2 20 1 11 11 0 0 O 4 4

/* each gate is described as:
gate_number gate_type gate_level number_inputs [input_list] [input_list]
number_outputs [output_list] [ignore the remainder of line for now] */

For example the line
8 7 10 2 7 2 7 2 2 11 10 2 ; 4 2
says that gate #8 is of type 7 (NAND gate, as indicated by the table below),
it is at level 10, has 2 inputs: gate 7 and gate 2, (repeats the fan-in
gates again, but could be in different order), it has 2 outputs: gate 11 and 
gate 10.  Ignore the rest of the line for now.

gate types are as follows:
T_input,        /* 1 */
T_output,       /* 2 */
T_xor,          /* 3 */
T_xnor,         /* 4 */
T_dff,          /* 5 */
T_and,          /* 6 */
T_nand,         /* 7 */
T_or,           /* 8 */
T_nor,          /* 9 */
T_not,          /* 10 */
T_buf,          /* 11 */
T_tie1,         /* 12 */
T_tie0,         /* 13 */
T_tieX,         /* 14 */
T_tieZ,         /* 15 */
T_mux_2,        /* 16 */
T_bus,          /* 17 */
T_bus_gohigh,   /* 18 */
T_bus_golow,    /* 19 */
T_tristate,     /* 20 */
T_tristateinv,  /* 21 */
T_tristate1     /* 22 */

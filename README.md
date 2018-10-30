# ECE5505-Final-Project
ECE 5505 Final Project

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

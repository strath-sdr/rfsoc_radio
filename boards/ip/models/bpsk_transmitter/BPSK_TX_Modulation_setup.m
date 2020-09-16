clear; clc;
f_system    = 128e6;
f_slave     = 12.5e3;
f_master    = 12.5e3*8*4;

tx_data     = fi(double('Hello World!'), 0, 8, 0);
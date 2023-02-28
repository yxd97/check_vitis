# Santiy checker for Zhang group Vitis tools # 
This design is taken from the official example from Xilinx(AMD):
[Vitis HLS Introductory Examples](https://github.com/Xilinx/Vitis-HLS-Introductory-Examples/tree/master/Vitis/single_kernel)


## 1.  Setup Envrionments ##
`source setupVitis.sh`

## 2. Test Cases ##
There are two designs: `test_vadd_xcl2` and `test_vadd_xrt`. 
The first one utilizes Xilinx OpenCL (XOCL) 2 API and the second one uese native Xilinx RunTime (XRT) API.

There are three build targets: `sw_emu`, `hw_emu`, and `hw`.
`sw_emu` will comiple a C++ binary that runs C-sim for the HLS design, along with a C++ behaviroal model of the card running on a different thread.
`hw_emu` will run push the HLS design through the flow, and build an RTL model for the system to be simulated.
`hw` will build the actual hardware bitstream.

Therefore, there are 2x3=6 test cases.

## 3. Test Compliation on All Servers ##
Run `make` 6 times:

```
cd [test_vadd_xcl2/test_vadd_xrt]
make TARGET=<sw_emu/hw_emu/hw>
```

Note: `make TARGET=hw` may take several hours to finish!

## 3. Test Simulation on All Servers ##

Run `make run` 4 times:

```
cd [test_vadd_xcl2/test_vadd_xrt]
make TARGET=<sw_emu/hw_emu>
```

## 3. Test Running on xcel Servers ##
**Only apply to `brg-zhang-xcel` and `zhang-capra-xcel` servers!**

Run `make run` 6 times:

```
cd [test_vadd_xcl2/test_vadd_xrt]
make TARGET=<sw_emu/hw_emu/hw>
```

Note: `make run TARGET=hw` may take several hours to finish!

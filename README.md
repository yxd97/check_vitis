# Santiy checker for Zhang group Vitis tools # 
This design is taken from the official example from Xilinx(AMD):
[Vitis HLS Introductory Examples](https://github.com/Xilinx/Vitis-HLS-Introductory-Examples/tree/master/Vitis/single_kernel)


## 1.  Setup Envrionments ##
* `brg-zhang-xcel`:<br>
`module load xilinx-vivado-vitis_2022.1.2`
* `zhang-capra-xcel`:<br> 
`source /work/shared/common/CAD_tool/Xilinx/Vitis-2022/Vitis/2022.1/settings64.sh`<br>
`source /opt/xilinx/xrt/setup.sh`
* `zhang-21` ~ `zhang-26`:<br>
`source /opt/xilinx/2022.1/Vitis/2022.1/settings64.sh`<br>
`source /opt/xilinx/xrt/setup.sh`

## 2. Test Compliation on All Servers ##
Run `make` 3 times for 3 different targets: sw_emu, hw_emu, and hw.

`make TARGET=<sw_emu/hw_emu/hw>`

Note: `make TARGET=hw` may take several hours to finish!

## 3. Test Running on xcel Servers ##
**Only apply to `brg-zhang-xcel` and `zhang-capra-xcel` servers!**

Run `make run` 3 times for 3 different targets: sw_emu, hw_emu, and hw.

`make run TARGET=<sw_emu/hw_emu/hw>`

Note: `make run TARGET=hw` may take several hours to finish!

VPP := $(XILINX_VITIS)/bin/v++
EMCONFIGUTIL := $(XILINX_VITIS)/bin/emconfigutil
TARGET:= sw_emu
PLATFORM:=/opt/xilinx/platforms/xilinx_u280_gen3x16_xdma_1_202211_1/xilinx_u280_gen3x16_xdma_1_202211_1.xpfm
DEVICE:=xilinx_u280_gen3x16_xdma_1_202211_1

HOST_ARCH:=x86

# kernel source file
KRNL_NAME := hbm_kernel
KRNL_SRC := ./hbm_kernel/hbm_kernel.cpp

# system configuration file
SYS_CONFIG := ./system.cfg

# host source file
HOST_SRC := ./host/host.cpp

# kernel objects and binaries
KRNL_XO := kernel.$(TARGET).xo
XCLBIN := kernel.$(TARGET).xclbin

# host binary
HOST_EXE := host.exe

# config files target
EMCONFIG_FILE := emconfig.json

VPP_OPTS := -t $(TARGET) --platform $(PLATFORM) --optimize 3
VPP_OPTS += --temp_dir ./all_builds/$(TARGET)
VPP_OPTS += --report_dir ./all_logs/$(TARGET)
VPP_OPTS += --log_dir ./all_logs/$(TARGET)

CFLAGS := -O3 -std=c++1y -I$(XILINX_XRT)/include -I./hbm_kernel
LFLAGS := -L$(XILINX_XRT)/lib -lOpenCL -lxrt_coreutil -lrt -luuid

# opencl and xcl2 includes
include ./xcl2/xcl2.mk
CFLAGS += $(xcl2_CXXFLAGS)
LFLAGS += $(xcl2_LDFLAGS)

include ./opencl/opencl.mk
CFLAGS += $(opencl_CXXFLAGS)
LFLAGS += $(opencl_LDFLAGS)

# run time args
CMD_ARGS:= kernel.${TARGET}.xclbin $(TARGET)

# primary build targets
.PHONY: xclbin host all

xclbin:  $(XCLBIN)
host: $(HOST_EXE) $(EMCONFIG_FILE)

all: xclbin host

clean:
	rm -rf $(EMCONFIG_FILE) $(HOST_EXE) $(XCLBIN)
	rm -rf *.log

cleanall: clean
	rm -rf hls.prj
	rm -rf all_builds all_logs *.xclbin *.compile_summary *.link_summary *.info *.xo .run .Xil .ipcache
	rm -rf ext_metadata.json xsa.xml

# kernel rules
$(KRNL_XO): $(KRNL_SRC)
	$(RM) $@
	$(VPP) $(VPP_OPTS) -c -k $(KRNL_NAME) -I'$(<D)' -o $@ $+

$(XCLBIN): $(KRNL_XO) $(SYS_CONFIG)
	$(VPP) $(VPP_OPTS) -l -o $@ $(KRNL_XO) --config $(SYS_CONFIG)

# host rules
$(HOST_EXE): $(HOST_SRC)
	g++ $(CFLAGS) -o $@ $+ $(xcl2_SRCS) $(LFLAGS)

$(EMCONFIG_FILE):
	$(EMCONFIGUTIL) --platform $(DEVICE)

run: $(XCLBIN) $(HOST_EXE) $(EMCONFIG_FILE)
	./$(HOST_EXE) $(CMD_ARGS)

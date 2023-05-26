#include <systemc>
#include "xtlm.h"
#include "hbmChannel.h"

#define HBM_AXI_DATA_WIDTH 256

//class customWrUtil;
//class customRdUtil;

class hbmModel : public sc_module {
 public:
  SC_HAS_PROCESS(hbmModel);
  explicit hbmModel(sc_core::sc_module_name, xsc::common_cpp::properties);
  virtual ~hbmModel();

  unsigned int transport_dbg(xtlm::aximm_payload&);
  xsc::common_cpp::report_handler* rH;

 protected:
 private:
  xsc::common_cpp::properties mProps;
  bool stack8Hi;
  unsigned numStack;
  sc_core::sc_vector<hbmChannel> chan;
  unsigned channelSize;
  float axiClkFreq;
  sc_time axiClkPrd;
  bool latencyEnabled;

 public:
  sc_core::sc_vector<xtlm::xtlm_aximm_target_socket> if_wr_socket;
  sc_core::sc_vector<xtlm::xtlm_aximm_target_socket> if_rd_socket;

 private:

  sc_core::sc_vector<xtlm::xtlm_aximm_initiator_socket> hbm_wr_socket;
  sc_core::sc_vector<xtlm::xtlm_aximm_initiator_socket> hbm_rd_socket;
  //sc_core::sc_vector<xtlm::xtlm_aximm_target_rd_socket_util> target_rd_sockets_util;
  //sc_core::sc_vector<xtlm::xtlm_aximm_target_wr_socket_util> target_wr_sockets_util;
  sc_core::sc_vector<customRdUtil> target_rd_sockets_util;
  sc_core::sc_vector<customWrUtil> target_wr_sockets_util;
  sc_core::sc_vector<xtlm::xtlm_aximm_initiator_rd_socket_util> initiator_rd_sockets_util;
  sc_core::sc_vector<xtlm::xtlm_aximm_initiator_wr_socket_util> initiator_wr_sockets_util;

  template <typename T>
  T* createSocketVector(sc_module_name);

  void handleSlaveReadCmd(int);
  void handleSlaveWriteCmd(int);
  void handleSlaveReadResp(int);
  void handleSlaveWriteResp(int);
  unsigned getHbmChannel(uint64_t);
  unsigned getSwitchLatency(unsigned, unsigned);
  uint64_t getUniqAxiId(std::pair<uint32_t, uint32_t>);
  std::pair<uint32_t, uint32_t> getOrigIds(uint64_t);
};

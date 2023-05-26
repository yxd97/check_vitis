#include <systemc>
#include <map>
#include <vector>

typedef std::vector<uint8_t> pg4KB;
typedef std::map<uint32_t, pg4KB*> Memory;

typedef enum{RNOP=0, ACT, PRE, PREA, REFSB, REF, PDE, SRE, SRX} rowCommands;
typedef enum{CNOP=0, RD, RDA, WR, WRA, MRS} columnCommands;

class cmd{
  public:
    cmd(uint32_t bgA, uint32_t bA):bg(bgA), bnk(bA){}
    uint32_t bg;
    uint32_t bnk;
};
class cmdRow: public cmd{
  public:
    cmdRow(uint32_t bgA, uint32_t bA, uint32_t RA, rowCommands C): cmd(bgA,bA),
      row(RA), rCmd(C){}
  uint32_t row;
  rowCommands rCmd;
  std::string print(){
    std::stringstream ss;
    ss << " For BankGrp[" <<std::hex<< bg << "], bank[" << bnk << "], page[" << row << "]" <<std::dec<< endl;
    return ss.str();
  }
};
class cmdCol: public cmd{
  public:
    cmdCol(uint32_t bgA, uint32_t bA, uint32_t CA, columnCommands C): cmd(bgA,bA),
      col(CA), cCmd(C){}
  uint32_t col;
  columnCommands cCmd;
};

typedef enum{IDLE=0, REFRESH} dramState;
typedef enum{H4=0, H8} stackHeight;
//SC_MODULE(dram){
class dram: public sc_core::sc_module{
  SC_HAS_PROCESS(dram);
  dram(sc_module_name nm, sc_time ck):sc_module(nm)
                          ,state(IDLE)
                          ,tRefi(3.9,SC_US)
                          //,tRfc(( (sh==H4)? sc_time(260,SC_NS):sc_time(350,SC_NS) ))
                          ,tRfc(sc_time(260,SC_NS))
                          ,bankXprvActivateTime(16, SC_ZERO_TIME)
                          ,rowCmdPipe(16)
                          ,colCmdPipe(16)
                          ,tCk(ck)
                          ,tActivate(2*tCk)
  {
    SC_THREAD(threadRefreshKeeper);
    SC_THREAD(threadRowCmdHandler);
  }
  ~dram(){
    for(auto &pg: mem){
      delete pg.second;
    }
  }
  friend class hbmChannel;

  private:
  Memory mem;
  sc_time tRefi;
  sc_time tRfc;
  dramState state;
  sc_event dramIdle;
  std::vector<sc_core::sc_time> bankXprvActivateTime;
  tlm::tlm_fifo<std::shared_ptr<cmdRow> > rowCmdPipe;
  tlm::tlm_fifo<std::shared_ptr<cmdCol> > colCmdPipe;


  //time periods
  sc_time tCk;
  sc_time tActivate;

 public:
  void threadRefreshKeeper(){
    while(1){
      wait(9*tRefi);
      state = REFRESH;
      wait(tRfc);                                                             //Refresh command period, Tk b/w REF and VALID
      state = IDLE;
      dramIdle.notify();
    }
  }

  void threadRowCmdHandler(){
    while (true) {
      try {
        std::shared_ptr<cmdRow> command = rowCmdPipe.peek();
        processRowCommand(command);
        rowCmdPipe.get();
        //if ( queue.used() == 0 ) {
        //  qEv.notify( sc_core::SC_ZERO_TIME );
        //}
      } catch ( sc_core::sc_unwind_exception& ex ) { // reset or kill
        if ( ex.is_reset() ) {
          // should re-start this thread
        } else {
          // killed - ends here
        }
        throw;
      }
    }
  }

  void processRowCommand(std::shared_ptr<cmdRow> c) {
    switch (c->rCmd) {
      case RNOP:
        break;
      case ACT:
        cout <<sc_time_stamp()<< "Activating " << c->print();
        wait(tActivate);
        {
          //sc_core::sc_spawn_options opts;
          //sc_core::sc_spawn([this] { sc_core::wait(this->tActivate); }, "activateTh", &opts);
        }
        break;
      default:
        break;
    }
  }

  void write(uint32_t bankPage, uint32_t row, uint8_t* data, uint32_t dataLen){
    pg4KB *pg = mem[bankPage];
    if(pg == nullptr){
      pg = new pg4KB(dataLen);
    }
    memcpy(&pg[0]+row, data, dataLen);
  }

  void read(uint32_t, uint32_t, uint32_t, uint8_t*);


};

--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : magneto_i2c.vhf
-- /___/   /\     Timestamp : 05/29/2018 01:34:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl D:/XilinxPrj/ucisw2_magnetometr/magneto_i2c.vhf -w D:/XilinxPrj/ucisw2_magnetometr/magneto_i2c.sch
--Design Name: magneto_i2c
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity MagnetoHMC5883LCtrl_MUSER_magneto_i2c is
   port ( Clk        : in    std_logic; 
          DRDY       : in    std_logic; 
          OutputRate : in    std_logic_vector (2 downto 0); 
          Reset      : in    std_logic; 
          DRX        : out   std_logic_vector (15 downto 0); 
          DRY        : out   std_logic_vector (15 downto 0); 
          DRZ        : out   std_logic_vector (15 downto 0); 
          DR_New     : out   std_logic; 
          ID         : out   std_logic_vector (23 downto 0); 
          NACK       : out   std_logic; 
          SCL        : inout std_logic; 
          SDA        : inout std_logic);
end MagnetoHMC5883LCtrl_MUSER_magneto_i2c;

architecture BEHAVIORAL of MagnetoHMC5883LCtrl_MUSER_magneto_i2c is
   signal XLXN_4     : std_logic;
   signal XLXN_5     : std_logic;
   signal XLXN_6     : std_logic;
   signal XLXN_27    : std_logic_vector (7 downto 0);
   signal XLXN_28    : std_logic_vector (7 downto 0);
   signal XLXN_29    : std_logic_vector (3 downto 0);
   signal XLXN_52    : std_logic;
   signal XLXN_54    : std_logic;
   signal XLXN_55    : std_logic;
   signal XLXN_57    : std_logic_vector (7 downto 0);
   component I2C_Master
      port ( Go         : in    std_logic; 
             Address    : in    std_logic_vector (7 downto 0); 
             ReadCnt    : in    std_logic_vector (3 downto 0); 
             SDA        : inout std_logic; 
             SCL        : inout std_logic; 
             FIFO_Pop   : in    std_logic; 
             FIFO_Push  : in    std_logic; 
             FIFO_DI    : in    std_logic_vector (7 downto 0); 
             FIFO_Empty : out   std_logic; 
             FIFO_Full  : out   std_logic; 
             FIFO_DO    : out   std_logic_vector (7 downto 0); 
             Reset      : in    std_logic; 
             Clk        : in    std_logic; 
             Busy       : out   std_logic; 
             NACK       : out   std_logic);
   end component;
   
   component Magneto_Drv
      port ( I2C_FIFO_Empty : in    std_logic; 
             I2C_FIFO_Full  : in    std_logic; 
             I2C_Busy       : in    std_logic; 
             DRDY           : in    std_logic; 
             Reset          : in    std_logic; 
             Clk            : in    std_logic; 
             I2C_FIFO_DO    : in    std_logic_vector (7 downto 0); 
             OutputRate     : in    std_logic_vector (2 downto 0); 
             I2C_Go         : out   std_logic; 
             I2C_FIFO_Push  : out   std_logic; 
             I2C_FIFO_Pop   : out   std_logic; 
             DR_New         : out   std_logic; 
             I2C_FIFO_DI    : out   std_logic_vector (7 downto 0); 
             I2C_Addr       : out   std_logic_vector (7 downto 0); 
             I2C_ReadCnt    : out   std_logic_vector (3 downto 0); 
             ID             : out   std_logic_vector (23 downto 0); 
             DRX            : out   std_logic_vector (15 downto 0); 
             DRY            : out   std_logic_vector (15 downto 0); 
             DRZ            : out   std_logic_vector (15 downto 0));
   end component;
   
begin
   I2CCtrl : I2C_Master
      port map (Address(7 downto 0)=>XLXN_28(7 downto 0),
                Clk=>Clk,
                FIFO_DI(7 downto 0)=>XLXN_27(7 downto 0),
                FIFO_Pop=>XLXN_6,
                FIFO_Push=>XLXN_5,
                Go=>XLXN_4,
                ReadCnt(3 downto 0)=>XLXN_29(3 downto 0),
                Reset=>Reset,
                Busy=>XLXN_55,
                FIFO_DO(7 downto 0)=>XLXN_57(7 downto 0),
                FIFO_Empty=>XLXN_52,
                FIFO_Full=>XLXN_54,
                NACK=>NACK,
                SCL=>SCL,
                SDA=>SDA);
   
   MagnetoInterface : Magneto_Drv
      port map (Clk=>Clk,
                DRDY=>DRDY,
                I2C_Busy=>XLXN_55,
                I2C_FIFO_DO(7 downto 0)=>XLXN_57(7 downto 0),
                I2C_FIFO_Empty=>XLXN_52,
                I2C_FIFO_Full=>XLXN_54,
                OutputRate(2 downto 0)=>OutputRate(2 downto 0),
                Reset=>Reset,
                DRX(15 downto 0)=>DRX(15 downto 0),
                DRY(15 downto 0)=>DRY(15 downto 0),
                DRZ(15 downto 0)=>DRZ(15 downto 0),
                DR_New=>DR_New,
                ID(23 downto 0)=>ID(23 downto 0),
                I2C_Addr(7 downto 0)=>XLXN_28(7 downto 0),
                I2C_FIFO_DI(7 downto 0)=>XLXN_27(7 downto 0),
                I2C_FIFO_Pop=>XLXN_6,
                I2C_FIFO_Push=>XLXN_5,
                I2C_Go=>XLXN_4,
                I2C_ReadCnt(3 downto 0)=>XLXN_29(3 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity magneto_i2c is
   port ( CLK    : in    std_logic; 
          DRDY   : in    std_logic; 
          Rate   : in    std_logic_vector (2 downto 0); 
          Reset  : in    std_logic; 
          DRLED  : out   std_logic; 
          DS     : out   std_logic_vector (7 downto 0); 
          DS_EN  : out   std_logic_vector (3 downto 0); 
          H_SYNC : out   std_logic; 
          NACK   : out   std_logic; 
          V_B    : out   std_logic_vector (4 downto 0); 
          V_G    : out   std_logic_vector (5 downto 0); 
          V_R    : out   std_logic_vector (4 downto 0); 
          V_SYNC : out   std_logic; 
          SCL    : inout std_logic; 
          SDA    : inout std_logic);
end magneto_i2c;

architecture BEHAVIORAL of magneto_i2c is
   attribute BOX_TYPE   : string ;
   signal XLXN_94                    : std_logic_vector (2 downto 0);
   signal XLXN_110                   : std_logic_vector (15 downto 0);
   signal XLXN_111                   : std_logic_vector (15 downto 0);
   signal XLXN_264                   : std_logic;
   signal XLXN_278                   : std_logic_vector (15 downto 0);
   signal ZAxisDisp_Blank_openSignal : std_logic_vector (3 downto 0);
   signal ZAxisDisp_DP_openSignal    : std_logic_vector (3 downto 0);
   component VGACompass
      port ( Reset  : in    std_logic; 
             Clk    : in    std_logic; 
             DRX    : in    std_logic_vector (15 downto 0); 
             DRY    : in    std_logic_vector (15 downto 0); 
             H_SYNC : out   std_logic; 
             V_SYNC : out   std_logic; 
             V_R    : out   std_logic_vector (4 downto 0); 
             V_G    : out   std_logic_vector (5 downto 0); 
             V_B    : out   std_logic_vector (4 downto 0));
   end component;
   
   component MagnetoHMC5883LCtrl_MUSER_magneto_i2c
      port ( OutputRate : in    std_logic_vector (2 downto 0); 
             Clk        : in    std_logic; 
             Reset      : in    std_logic; 
             DRDY       : in    std_logic; 
             DR_New     : out   std_logic; 
             ID         : out   std_logic_vector (23 downto 0); 
             DRX        : out   std_logic_vector (15 downto 0); 
             DRY        : out   std_logic_vector (15 downto 0); 
             DRZ        : out   std_logic_vector (15 downto 0); 
             NACK       : out   std_logic; 
             SDA        : inout std_logic; 
             SCL        : inout std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component Display4x7S
      port ( Clk   : in    std_logic; 
             DI    : in    std_logic_vector (15 downto 0); 
             DP    : in    std_logic_vector (3 downto 0); 
             Blank : in    std_logic_vector (3 downto 0); 
             DS_EN : out   std_logic_vector (3 downto 0); 
             DS    : out   std_logic_vector (7 downto 0));
   end component;
   
begin
   CompassDisp : VGACompass
      port map (Clk=>CLK,
                DRX(15 downto 0)=>XLXN_110(15 downto 0),
                DRY(15 downto 0)=>XLXN_111(15 downto 0),
                Reset=>XLXN_264,
                H_SYNC=>H_SYNC,
                V_B(4 downto 0)=>V_B(4 downto 0),
                V_G(5 downto 0)=>V_G(5 downto 0),
                V_R(4 downto 0)=>V_R(4 downto 0),
                V_SYNC=>V_SYNC);
   
   MagnetoCtrl : MagnetoHMC5883LCtrl_MUSER_magneto_i2c
      port map (Clk=>CLK,
                DRDY=>DRDY,
                OutputRate(2 downto 0)=>XLXN_94(2 downto 0),
                Reset=>XLXN_264,
                DRX(15 downto 0)=>XLXN_110(15 downto 0),
                DRY(15 downto 0)=>XLXN_111(15 downto 0),
                DRZ(15 downto 0)=>XLXN_278(15 downto 0),
                DR_New=>open,
                ID=>open,
                NACK=>NACK,
                SCL=>SCL,
                SDA=>SDA);
   
   XLXI_5 : INV
      port map (I=>Reset,
                O=>XLXN_264);
   
   XLXI_19 : BUF
      port map (I=>DRDY,
                O=>DRLED);
   
   XLXI_20_0 : INV
      port map (I=>Rate(0),
                O=>XLXN_94(0));
   
   XLXI_20_1 : INV
      port map (I=>Rate(1),
                O=>XLXN_94(1));
   
   XLXI_20_2 : INV
      port map (I=>Rate(2),
                O=>XLXN_94(2));
   
   ZAxisDisp : Display4x7S
      port map (Blank(3 downto 0)=>ZAxisDisp_Blank_openSignal(3 downto 0),
                Clk=>CLK,
                DI(15 downto 0)=>XLXN_278(15 downto 0),
                DP(3 downto 0)=>ZAxisDisp_DP_openSignal(3 downto 0),
                DS(7 downto 0)=>DS(7 downto 0),
                DS_EN(3 downto 0)=>DS_EN(3 downto 0));
   
end BEHAVIORAL;



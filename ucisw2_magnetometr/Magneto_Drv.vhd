----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:45 02/27/2018 
-- Design Name: 
-- Module Name:    Magneto_Drv - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Magneto_Drv is
    Port ( I2C_FIFO_Empty : in  STD_LOGIC;
           I2C_FIFO_Full : in  STD_LOGIC;
           I2C_FIFO_DO : in  STD_LOGIC_VECTOR (7 downto 0);
           I2C_Busy : in  STD_LOGIC;
           DRDY : in  STD_LOGIC;
           OutputRate : in STD_LOGIC_VECTOR (2 downto 0); 
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           I2C_Go : out  STD_LOGIC;
           I2C_FIFO_Push : out  STD_LOGIC;
           I2C_FIFO_Pop : out  STD_LOGIC;
           I2C_FIFO_DI : out  STD_LOGIC_VECTOR (7 downto 0);
           I2C_Addr : out  STD_LOGIC_VECTOR (7 downto 0);
           I2C_ReadCnt : out  STD_LOGIC_VECTOR (3 downto 0);
           ID : out  STD_LOGIC_VECTOR (23 downto 0);
           DRX : out  STD_LOGIC_VECTOR (15 downto 0);
           DRY : out  STD_LOGIC_VECTOR (15 downto 0);
           DRZ : out  STD_LOGIC_VECTOR (15 downto 0);
           DR_New : out  STD_LOGIC);
end Magneto_Drv;

architecture Behavioral of Magneto_Drv is
	-- Main state machine
   type state_type is ( Init, PushAddrID, SendAddrID, BusyAddrID, ReceiveID, BusyID, ReadID, PopID, CheckID, 
                        PushAddrConfigA, PushDataConfigA, SendConfigA, BusyConfigA, PushAddrMode, PushDataMode, 
                        SendMode, BusyMode, MeasureWait, MeasureReceive, MeasureBusy, MeasureRead, MeasurePop, 
                        MeasureCheck, MeasureLoad, MeasureOutput, MeasurePushAddr, MeasureSendAddr, MeasureBusyAddr  );
	signal state, next_state : state_type;
   
	-- DRDY synchronized input
	signal DRDY_in : STD_LOGIC;
	
	-- Input registers
   signal ID_reg : STD_LOGIC_VECTOR (23 downto 0);
   signal Input : STD_LOGIC_VECTOR (47 downto 0);
   
   -- Input byte counter
	signal bytes : integer range 0 to 5 := 0;
   
   -- Measure output registers
   signal DRX_reg : STD_LOGIC_VECTOR (15 downto 0);
   signal DRY_reg : STD_LOGIC_VECTOR (15 downto 0);
   signal DRZ_reg : STD_LOGIC_VECTOR (15 downto 0);

begin
	-- DRDY input synchronization to internal clock
	sync_process : process(Clk, Reset)
	begin
		if Reset = '1' then
			DRDY_in <= '0';
		elsif rising_edge(Clk) then
			DRDY_in <= DRDY;
		end if;
	end process sync_process;

	-- Main HMC5883L FSM
	-- (continuos measurement)
   process1 : process(Clk)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				state <= Init;
			else
				state <= next_state;
			end if;
		end if;
	end process process1;
   
	process2 : process(state, I2C_FIFO_Empty, I2C_Busy, DRDY_in)
	begin
		next_state <= state; -- by default
		
		case state is
         -- Initialization
         -- Reading identification register
			when Init =>
					next_state <= PushAddrID;
			when PushAddrID =>
				next_state <= SendAddrID;
			when SendAddrID =>
				next_state <= BusyAddrID;
			when BusyAddrID =>
				if I2C_Busy = '0' then
					next_state <= ReceiveID;
				end if;
			when ReceiveID =>
				next_state <= BusyID;
			when BusyID =>
				if I2C_Busy = '0' then
					next_state <= ReadID;
				end if;
         when ReadID =>
            next_state <= PopID;
         when PopID =>
            next_state <= CheckID;
         when CheckID =>
            if I2C_FIFO_Empty = '1' then
					next_state <= PushAddrConfigA;
            else
					next_state <= ReadID;
				end if;
         -- Setting data rate and mode
         when PushAddrConfigA =>
				next_state <= PushDataConfigA;
         when PushDataConfigA =>   
            next_state <= SendConfigA;
			when SendConfigA =>
				next_state <= BusyConfigA;
			when BusyConfigA =>
				if I2C_Busy = '0' then
					next_state <= PushAddrMode;
				end if;
         when PushAddrMode =>
				next_state <= PushDataMode;
         when PushDataMode =>   
            next_state <= SendMode;
			when SendMode =>
				next_state <= BusyMode;
			when BusyMode =>
				if I2C_Busy = '0' then
					next_state <= MeasureWait;
				end if;
         -- Measuring...
         when MeasureWait =>
				if DRDY_in = '0' then
					next_state <= MeasureReceive;
				end if;
         when MeasureReceive =>
				next_state <= MeasureBusy;
         when MeasureBusy =>
				if I2C_Busy = '0' then
					next_state <= MeasureRead;
				end if;
         -- Reading results...
         when MeasureRead =>
				next_state <= MeasurePop;
			when MeasurePop =>
				next_state <= MeasureCheck; --
			when MeasureCheck =>
				if I2C_FIFO_Empty = '1' then
					next_state <= MeasureLoad;
            else
					next_state <= MeasureRead;
				end if;
         when MeasureLoad =>
            next_state <= MeasureOutput;
         when MeasureOutput =>
            next_state <= MeasurePushAddr;
         when MeasurePushAddr =>
            next_state <= MeasureSendAddr;
         when MeasureSendAddr =>
            next_state <= MeasureBusyAddr;
         when MeasureBusyAddr =>
            if I2C_Busy = '0' then
					next_state <= MeasureWait;
				end if;
		end case;
	end process process2;
	
   id_register : process(Clk, state, next_state)
	begin
	   if rising_edge(Clk) then
			if state = ReadID then
            case bytes is
               when 0 =>
                  ID_reg(23 downto 16) <= I2C_FIFO_DO;
               when 1 =>
                  ID_reg(15 downto 8) <= I2C_FIFO_DO;
               when 2 =>
                  ID_reg(7 downto 0) <= I2C_FIFO_DO;
               when others =>
                  ID_reg <= X"000000";
            end case;
			end if;
		end if;
	end process id_register;
   
	-- Storing measurements in register
	input_register : process(Clk, state, next_state)
	begin
	   if rising_edge(Clk) then
			if state = MeasureRead then
            case bytes is
               when 0 =>
                  Input(47 downto 40) <= I2C_FIFO_DO;
               when 1 =>
                  Input(39 downto 32) <= I2C_FIFO_DO;
               when 2 =>
                  Input(31 downto 24) <= I2C_FIFO_DO;
               when 3 =>
                  Input(23 downto 16) <= I2C_FIFO_DO;
               when 4 =>
                  Input(15 downto 8) <= I2C_FIFO_DO;
               when 5 =>
                  Input(7 downto 0) <= I2C_FIFO_DO;
            end case;
			end if;
		end if;
	end process input_register;
   
   -- Stored bytes counter
   byte_counter : process(Clk)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				bytes <= 0;
			end if;
			if state = MeasurePop then
				if bytes = 5 then
					bytes <= 0;
				else
					bytes <= bytes + 1;
				end if;
			end if;
			if state = PopID then
				if bytes = 2 then
					bytes <= 0;
				else
					bytes <= bytes + 1;
				end if;
			end if;
		end if;
	end process byte_counter;
   
   -- Buffering output in registers
	output_sync : process(Clk, state, next_state)
	begin
	   if rising_edge(Clk) then
			if state = MeasureLoad then
				DRX_reg <= Input(47 downto 32);
				DRZ_reg <= Input(31 downto 16);
				DRY_reg <= Input(15 downto 0);
			end if;
		end if;
	end process output_sync;
   
   -- Output signals for FSM
	I2C_FIFO_DI <=	X"0A" when next_state = PushAddrID or state = PushAddrID else
						X"00" when next_state = PushAddrConfigA or state = PushAddrConfigA else
						"000" & OutputRate & "00" when next_state = PushDataConfigA or state = PushDataConfigA else
						X"02" when next_state = PushAddrMode or state = PushAddrMode else
						X"00" when next_state = PushDataMode or state = PushDataMode else
						X"03" when next_state = MeasurePushAddr or state = MeasurePushAddr else
						X"00";

	I2C_FIFO_Push <=	'1' when state = PushAddrID or state = PushAddrConfigA or state = PushDataConfigA
								or state = PushAddrMode or state = PushDataMode or state = MeasurePushAddr	else
							'0';
										
	I2C_Addr <=	X"3C" when next_state = SendAddrID or state = SendAddrID or next_state = SendConfigA
						or state = SendConfigA or next_state = SendMode or state = SendMode
						or next_state = MeasureSendAddr or state = MeasureSendAddr else
					X"3D" when next_state = ReceiveID or state = ReceiveID or next_state = MeasureReceive
						or state = MeasureReceive else
					X"00";
									
	I2C_Go <=	'1' when state = SendAddrID or state = ReceiveID or state = SendConfigA or state = SendMode
						or state = MeasureReceive or state = MeasureSendAddr	else
					'0';
					
	I2C_ReadCnt <=	X"3" when next_state = ReceiveID or state = ReceiveID else
						X"6" when next_state = MeasureReceive or state = MeasureReceive else
						X"0";
						
	I2C_FIFO_Pop <=	'1' when state = PopID or state = MeasurePop	else
							'0';
							
   DR_New <=	'1' when state = MeasureOutput else
					'0';
   
	-- Output registers
   ID <= ID_reg;
   DRX <= DRX_reg;
   DRY <= DRY_reg;
   DRZ <= DRZ_reg;

end Behavioral;


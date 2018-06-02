----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:30:49 01/03/2018 
-- Design Name: 
-- Module Name:    Display4x7S - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Display4x7S is
    Port ( DI : in  STD_LOGIC_VECTOR (15 downto 0);
           DP : in  STD_LOGIC_VECTOR (3 downto 0);
           Blank : in  STD_LOGIC_VECTOR (3 downto 0);
           Clk : in  STD_LOGIC;
           DS_EN : out  STD_LOGIC_VECTOR (3 downto 0);
           DS : out  STD_LOGIC_VECTOR (7 downto 0));
end Display4x7S;

architecture Behavioral of Display4x7S is
	type state_type is (A, B, C, D);
	signal state, next_state : state_type;
	signal cycles : integer range 0 to 10000 := 0;
	signal Bits : STD_LOGIC_VECTOR (3 downto 0);
	signal Digit : STD_LOGIC_VECTOR (6 downto 0);
	signal Point : STD_LOGIC;

begin
	process1 : process(Clk)
	begin
		if rising_edge(Clk) then
			-- Clock frequency divider
			-- 48 MHz -> 4800 Hz
			-- (1200 Hz digit refresh rate)
			if cycles = 10000 then
				state <= next_state;
				cycles <= 0;
			else
				cycles <= cycles + 1;
			end if;
		end if;
	end process process1;
   
	process2 : process(state)
	begin
		next_state <= state; -- by default
		
		case state is
			when A =>
				next_state <= B;
			when B =>
				next_state <= C;
			when C =>
				next_state <= D;
			when D =>
				next_state <= A;
		end case;
	end process process2;
	
	Bits <=	DI(3 downto 0) when state = A else
				DI(7 downto 4) when state = B else
				DI(11 downto 8) when state = C else
				DI(15 downto 12) when state = D else
				"0000";
	
	Point <=	DP(0) when state = A else
				DP(1) when state = B else
				DP(2) when state = C else
				DP(3) when state = D	else
				'0';
				
	with Bits select
		Digit <=	"0111111" when "0000",
					"0000110" when "0001",
					"1011011" when "0010",
					"1001111" when "0011",
					"1100110" when "0100",
					"1101101" when "0101",
					"1111101" when "0110",
					"0000111" when "0111",
					"1111111" when "1000",
					"1101111" when "1001",
					"1011111" when "1010",
					"1111100" when "1011",
					"0111001" when "1100",
					"1011110" when "1101",
					"1111001" when "1110",
					"1110001" when "1111",
					"0000000" when others;
	
	DS_EN <=	"1110" when state = A and Blank(0) = '0' else
				"1101" when state = B and Blank(1) = '0' else
				"1011" when state = C and Blank(2) = '0' else
				"0111" when state = D and Blank(3) = '0' else
				"1111";
	
	DS <= Point & Digit;
end Behavioral;

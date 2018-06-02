----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:11:03 05/28/2018 
-- Design Name: 
-- Module Name:    VGACompass - Behavioral 
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

entity VGACompass is
    Port ( DRX : in  STD_LOGIC_VECTOR (15 downto 0);
           DRY : in  STD_LOGIC_VECTOR (15 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           V_R : out  STD_LOGIC_VECTOR (4 downto 0);
           V_G : out  STD_LOGIC_VECTOR (5 downto 0);
           V_B : out  STD_LOGIC_VECTOR (4 downto 0);
           H_SYNC : out  STD_LOGIC;
           V_SYNC : out  STD_LOGIC);
end VGACompass;

architecture Behavioral of VGACompass is
	constant h_pulse : integer := 80;		-- Horiztonal sync pulse width in pixels
	constant h_bp : integer := 160;			-- Horiztonal back porch width in pixels
	constant h_pixels : integer := 800;		-- Horiztonal display width in pixels
	constant h_fp : integer := 16;			-- Horiztonal front porch width in pixels
	constant h_pol : STD_LOGIC := '1';		-- Horizontal sync pulse polarity (1 = positive, 0 = negative)
	constant v_pulse : integer := 3;			-- Vertical sync pulse width in rows
	constant v_bp : integer := 21;			-- Vertical back porch width in rows
	constant v_pixels	: integer := 600;		-- Vertical display width in rows
	constant v_fp : integer := 1;				-- Vertical front porch width in rows
	constant v_pol : STD_LOGIC := '1';		-- Vertical sync pulse polarity (1 = positive, 0 = negative)
	constant	h_period	: integer := h_pulse + h_bp + h_pixels + h_fp;		-- Total number of pixel clocks in a row
	constant	v_period	: integer := v_pulse + v_bp + v_pixels + v_fp;		-- Total number of rows in column
	
	signal disp_ena :	STD_LOGIC;		-- Display enable ('1' = display time, '0' = blanking time)
	signal column : integer;			-- Horizontal pixel coordinate
	signal row : integer;				-- Vertical pixel coordinate
	
	signal DataX : signed (15 downto 0) := signed(DRX);
	signal DataY : signed (15 downto 0) := signed(DRY);
	signal Color : unsigned (15 downto 0) := unsigned((abs(DataX) + abs(DataY)) / 2);

begin
	process(Clk, Reset)
		variable h_count : integer range 0 to h_period - 1 := 0;  -- Horizontal counter (counts the columns)
		variable v_count : integer range 0 to v_period - 1 := 0;  -- Vertical counter (counts the rows)
		
	begin
		if rising_edge(Clk) then
			if(Reset = '1') then			-- Reset asserted
				h_count := 0;				-- Reset horizontal counter
				v_count := 0;				-- Reset vertical counter
				H_SYNC <= not h_pol;		-- Deassert horizontal sync
				V_SYNC <= not v_pol;		-- Deassert vertical sync
				disp_ena <= '0';			-- Disable display
				column <= 0;				-- Reset column pixel coordinate
				row <= 0;					-- Reset row pixel coordinate
			end if;
			
			-- Counters
			if(h_count < h_period - 1) then
				-- Horizontal counter (pixels)
				h_count := h_count + 1;
			else
				h_count := 0;
				if(v_count < v_period - 1) then
					-- Veritcal counter (rows)
					v_count := v_count + 1;
				else
					v_count := 0;
				end if;
			end if;

			-- Horizontal sync signal
			if(h_count < h_pixels + h_fp or h_count >= h_pixels + h_fp + h_pulse) then
				H_SYNC <= not h_pol;		-- Deassert horiztonal sync pulse
			else
				H_SYNC <= h_pol;			-- Assert horiztonal sync pulse
			end if;
			
			-- Vertical sync signal
			if(v_count < v_pixels + v_fp or v_count >= v_pixels + v_fp + v_pulse) then
				V_SYNC <= not v_pol;		-- Deassert vertical sync pulse
			else
				V_SYNC <= v_pol;			-- Assert vertical sync pulse
			end if;
			
			-- Set pixel coordinates
			if(h_count < h_pixels) then  	-- Horiztonal display time
				column <= h_count;			-- Set horiztonal pixel coordinate
			end if;
			if(v_count < v_pixels) then	-- Vertical display time
				row <= v_count;				-- Set vertical pixel coordinate
			end if;

			-- Set display enable signal
			if(h_count < h_pixels and v_count < v_pixels) then
				-- Display time
				disp_ena <= '1';
			else
				-- Blanking time
				disp_ena <= '0';
			end if;
		end if;
	end process;

	process(disp_ena, row, column, DataX, DataY, Color)
	begin
		if(disp_ena = '1') then
			-- Display time
			if(row > 295 - shift_right(DataX, 3) and column > 395 - shift_right(DataY, 3) and row < 305 - shift_right(DataX, 3) and column < 405 - shift_right(DataY, 3)) then
				-- Northern marker (red)
				V_R <= (others => '1');
				V_G  <= STD_LOGIC_VECTOR(Color(10 downto 5));
				V_B <= (others => '0');
			elsif(row > 295 + shift_right(DataX, 3) and column > 395 + shift_right(DataY, 3) and row < 305 + shift_right(DataX, 3) and column < 405 + shift_right(DataY, 3)) then
				-- Southern marker (blue)
				V_R <= (others => '0');
				V_G  <= STD_LOGIC_VECTOR(Color(10 downto 5));
				V_B <= (others => '1');
			elsif(row = 300 or column = 400) then
				-- Axes (yellow)
				V_R <= (others => '1');
				V_G  <= (others => '1');
				V_B <= (others => '0');
			else
				-- Background (black)
				V_R <= (others => '0');
				V_G  <= (others => '0');
				V_B <= (others => '0');
			end if;
		else
			-- Blanking time
			V_R <= (others => '0');
			V_G <= (others => '0');
			V_B <= (others => '0');
		end if;
	end process;
end Behavioral;


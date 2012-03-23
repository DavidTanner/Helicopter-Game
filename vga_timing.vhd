library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_timing is
    Port ( HS : out  STD_LOGIC;
           VS : out  STD_LOGIC;
           pixel_x : out  STD_LOGIC_VECTOR (9 downto 0);
           pixel_y : out  STD_LOGIC_VECTOR (9 downto 0);
           last_column : out  STD_LOGIC;
           last_row : out  STD_LOGIC;
           blank : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end vga_timing;

architecture vga_arch of vga_timing is

signal pixel_en, vertical_en : STD_LOGIC;

signal x_reg, y_reg : UNSIGNED (9 downto 0);


begin

-- Half Clock
process(clk,rst)
begin
	if (rst='1') then 
		pixel_en <= '0';
	elsif (clk'event and clk='1') then
		pixel_en <= not pixel_en;
	end if;
end process;


-- Horizontal Pixel counter
process(clk,rst)
begin
	if (rst='1') then
		x_reg <= (others=>'0');
	elsif (clk'event and clk='1' and pixel_en='1') then
		if (x_reg = 10#799#) then 
			x_reg <= (others=>'0');
		else
			x_reg <= x_reg + 1;
		end if;
	end if;
end process;


-- Horizontal Logic
process(x_reg)
begin
	HS <= '1';
	vertical_en <= '0';
	if (x_reg=10#639#) then 
		vertical_en <= '1';
	end if;
	if (x_reg>10#655# and x_reg <=10#751#) then
		HS <='0';
	end if;
end process;

last_column <= vertical_en;


-- Vertical Pixel counter
process(clk,rst)
begin
	if (rst='1') then
		y_reg <=(others=>'0');
	elsif (clk'event and clk='1' and pixel_en='1' and vertical_en='1') then
		if (y_reg = 10#520#) then 
			y_reg <= (others=>'0');
		else
			y_reg <= y_reg + 1;
		end if;
	end if;
end process;


-- Vertical Logic
process(y_reg)
begin
	VS <= '1';
	last_row <= '0';
	if (y_reg=10#479#) then 
		last_row <= '1';
	end if;
	if (Y_reg>10#489# and Y_reg <=10#491#) then
		VS <='0';
	end if;
end process;



blank <= '1' when ((x_reg>10#639#) or (y_reg>10#479#)) else
			'0';

pixel_x <= STD_LOGIC_VECTOR(x_reg);
pixel_y <= STD_LOGIC_VECTOR(y_reg);


end vga_arch;

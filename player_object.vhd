library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity player_object is
    Port ( 
				in_object : out  STD_LOGIC;
				color : out STD_LOGIC_VECTOR (7 downto 0);
				current_icon : in std_logic_vector (1 downto 0);
				left_x : in  STD_LOGIC_VECTOR (9 downto 0);
				top_y : in  STD_LOGIC_VECTOR (9 downto 0);
				current_x : in  STD_LOGIC_VECTOR (9 downto 0);
				current_y : in  STD_LOGIC_VECTOR (9 downto 0);
				clk : in STD_LOGIC
			);
			  
end player_object;

architecture icon_select_arch of player_object is
	constant SIZE : integer := 32;
	
	
	signal internal_box : std_logic;
	
	signal u_x, u_y, x, y : UNSIGNED (9 downto 0);
	signal icon_select : UNSIGNED(1 downto 0);
	signal x_offset, y_offset : UNSIGNED(9 downto 0);
	signal icon_address : std_logic_vector(11 downto 0);
	
	signal icon_pixel : UNSIGNED(11 downto 0);

begin

	-- Assignments in
	u_x <= UNSIGNED(current_x);
	u_y <= UNSIGNED(current_y);
	x <= UNSIGNED(left_x);
	y <= UNSIGNED(top_y);
	icon_select <= unsigned(current_icon);
	
	in_object_process:process (internal_box, icon_pixel, current_icon) is begin
		in_object <= '0';
		if (internal_box='1') then
			in_object <= '1';
			if ((current_icon = "01" or current_icon ="10")) then
				if (icon_pixel=255) then 
					in_object <= '0';
				end if;
			end if;
		end if;
	end process in_object_process;
	
	
	
	internal_box <= '1' when (x_offset >= 0 and x_offset < SIZE and
						y_offset >= 0 and y_offset < SIZE) else '0';

	x_offset <= u_x-x;
	y_offset <= u_y-y;
	icon_select <= UNSIGNED(current_icon);
	
	icon_pixel <= (icon_select & y_offset(4 downto 0) & x_offset(4 downto 0)) when internal_box='1' else
					icon_select & "0000000000";
	
	icon_address <= std_logic_vector (icon_pixel);
	
	icon_collection : entity work.image_rom
		port map(clk             => clk,
			     char_read_addr  => icon_address,
			     char_read_value => color);
	

end icon_select_arch;


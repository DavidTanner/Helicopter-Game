library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity test_player_object is
	port (
			Hsync : out STD_LOGIC;
			Vsync : out STD_LOGIC;
			vgaRed : out STD_LOGIC_VECTOR (2 downto 0);
			vgaGreen : out STD_LOGIC_VECTOR (2 downto 0);
			vgaBlue : out STD_LOGIC_VECTOR (1 downto 0);
			sw : in STD_LOGIC_VECTOR (1 downto 0);
            clk : in  STD_LOGIC
         );
end entity test_player_object;

architecture player_test_arch of test_player_object is

	signal vX, vY : STD_LOGIC_VECTOR(9 downto 0);
	signal last_column, last_row : STD_LOGIC :='0';
	signal blank : STD_LOGIC :='0';
	--signal reset : STD_LOGIC;
	signal HS : STD_LOGIC :='1';
	signal VS : STD_LOGIC :='1';
	signal color, color_reg : std_logic_vector(7 downto 0);
	signal current_icon : std_logic_vector (1 downto 0);
	signal in_box : std_logic;
	
begin

	current_icon <= sw(1 downto 0);


	-- Registers 
	process(clk)
	begin
		if (clk'event and clk='1') then 
			Hsync <= HS;
			Vsync <= VS;
			vgaRed <= color_reg(7 downto 5);
			vgaGreen <= color_reg(4 downto 2);
			vgaBlue <= color_reg(1 downto 0);
			if (in_box='1') then
				color_reg <= color;
			else 
				color_reg <= (others=>'0');
			end if;
		end if;
	end process;

	player_object_test : entity work.player_object
		port map(in_object       => in_box,
			     color        => color,
			     current_icon => current_icon,
			     left_x       => "0011001000",
			     top_y        => "0011001000",
			     current_x    => vX,
			     current_y    => vY,
			     clk          => clk);
			     
			     
			     
	vga_timing_controller: entity work.vga_timing
		port map (
					 HS=>HS,
					 VS=>VS,
					 pixel_x=>vX,
					 pixel_y=>vY,
					 last_column=>last_column,
					 last_row=>last_row,
					 blank=>blank,
					 clk=>clk,
					 rst=>'0'
					 );
				     

end architecture player_test_arch;

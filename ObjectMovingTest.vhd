library ieee;
use ieee.std_logic_1164.all;

entity ObjectMovingTest is
	port (
			Hsync : out STD_LOGIC;
			Vsync : out STD_LOGIC;
			vgaRed : out STD_LOGIC_VECTOR (2 downto 0);
			vgaGreen : out STD_LOGIC_VECTOR (2 downto 0);
			vgaBlue : out STD_LOGIC_VECTOR (1 downto 0);
			sw : in STD_LOGIC_VECTOR (1 downto 0);
			btn : in STD_LOGIC;
            clk : in  STD_LOGIC
	);
end entity ObjectMovingTest;

architecture RTL of ObjectMovingTest is


	signal vX, vY : STD_LOGIC_VECTOR(9 downto 0);
	signal last_column, last_row : STD_LOGIC :='0';
	signal blank : STD_LOGIC :='0';
	--signal reset : STD_LOGIC;
	signal HS : STD_LOGIC :='1';
	signal VS : STD_LOGIC :='1';
	signal color, color_reg : std_logic_vector(7 downto 0);
	signal current_icon : std_logic_vector (1 downto 0);
	signal in_box : std_logic;
	signal new_frame : std_logic;
	
begin

	new_frame <= last_column and last_row;

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


	test_mover : entity work.object_mover
		port map(color         => color,
			     in_object     => in_box,
			     new_frame     => new_frame,
			     button        => btn,
			     current_state => sw,
			     clk           => clk,
			     rst           => '0');
			     
			     
			     
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

end architecture RTL;

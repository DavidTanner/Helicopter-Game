library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity object_mover is
	generic (	SCREEN_X_SIZE : UNSIGNED (9 downto 0) := to_unsigned(640,10);
				SCREEN_Y_SIZE : UNSIGNED (9 downto 0) := to_unsigned(480,10)
				);

	port(
		color : out std_logic_vector(7 downto 0);
		in_object : out std_logic;
				
		new_frame : in std_logic;
		button : in std_logic;
		current_state : std_logic_vector (1 downto 0);
		clk : in std_logic;
		rst : in std_logic
	);
end entity object_mover;

architecture moving_arch of object_mover is
	constant SIZE : integer := 32;

	signal left_paddle, right_paddle, ball, border : STD_LOGIC;
	signal vX, vY                                  : STD_LOGIC_VECTOR(9 downto 0);

	signal object_x, object_y         : UNSIGNED(9 downto 0) := to_unsigned(160, 10);
	signal ball_direction         : UNSIGNED(1 downto 0) := (others => '1');


	signal ball_hit_paddle : STD_LOGIC;
	
	signal current_icon : std_logic_vector(1 downto 0);
	
	
	

begin

	process(button, new_frame, current_state) begin
	
		if(new_frame'event and new_frame = '1' and current_state = "01") then
		
			if (button='1' and object_y > 0 and object_y + SIZE < SCREEN_Y_SIZE) then
				object_y <= object_y - 1;
			elsif (object_y > 0 and object_y + SIZE < SCREEN_Y_SIZE) then
				current_icon <= not current_state; 
				object_y <= object_y + 1;
			end if;
		elsif (current_state = "00") then
			object_y <= to_unsigned(240,10);
		end if;

	end process;
	
	
	player_object_test : entity work.player_object
		port map(in_object       => in_object,
			     color        => color,
			     current_icon => current_icon,
			     left_x       => object_x,
			     top_y        => object_y,
			     current_x    => vX,
			     current_y    => vY,
			     clk          => clk);

end architecture moving_arch;

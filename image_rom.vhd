library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity image_rom is
	port (
	      clk: in std_logic;
	      char_read_addr : in std_logic_vector(11 downto 0);
	      char_read_value : out std_logic_vector(7 downto 0)
		);	
end entity image_rom;

architecture icon_arch of image_rom is

   constant CHAR_RAM_ADDR_WIDTH: integer := 12; -- 2^7 X 2^5
   constant CHAR_RAM_WIDTH: integer := 8;  -- 8 bits per character
   type char_ram_type is array (0 to 2**CHAR_RAM_ADDR_WIDTH-1)
     of std_logic_vector(CHAR_RAM_WIDTH-1 downto 0);
   signal read_a : std_logic_vector(11 downto 0);
	-- character memory signal
   signal char_ram : char_ram_type := (

     -- Initial Value of character memory




-- Star_Wars_-_R2_Unit.gif
X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"25",X"26",X"25",X"26",X"6e",X"26",X"6e",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"92",X"00",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"6d",X"6d",X"00",X"db",X"01",X"26",X"25",X"26",X"6e",X"6e",X"db",X"db",X"ff",X"6e",X"6e",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"db",X"01",X"01",X"25",X"22",X"25",X"26",X"66",X"6e",X"db",X"db",X"93",X"ff",X"49",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"db",X"00",X"00",X"01",X"01",X"01",X"01",X"05",X"26",X"25",X"2e",X"6e",X"6e",X"db",X"db",X"6e",X"6e",X"26",X"00",X"00",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"00",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"00",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"db",X"db",X"db",X"49",X"db",X"49",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"49",X"49",X"24",X"24",X"24",X"24",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"db",X"00",X"00",X"00",X"00",X"00",X"db",X"db",X"db",X"db",X"20",X"00",X"db",X"db",X"db",X"49",X"24",X"24",X"24",X"24",X"24",X"24",X"24",X"24",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"db",X"db",X"00",X"a0",X"a0",X"00",X"00",X"00",X"db",X"db",X"00",X"ff",X"24",X"24",X"db",X"db",X"24",X"24",X"00",X"24",X"00",X"f0",X"f0",X"f8",X"24",X"db",X"00",X"00",X"00",
X"00",X"00",X"00",X"db",X"00",X"00",X"a0",X"a0",X"00",X"00",X"00",X"db",X"db",X"20",X"24",X"24",X"24",X"db",X"db",X"24",X"24",X"20",X"f0",X"f0",X"24",X"24",X"24",X"49",X"db",X"00",X"00",X"00",
X"00",X"00",X"00",X"db",X"00",X"00",X"a0",X"a0",X"00",X"00",X"00",X"db",X"db",X"00",X"24",X"24",X"24",X"db",X"db",X"24",X"24",X"00",X"00",X"00",X"24",X"24",X"49",X"24",X"db",X"db",X"00",X"00",
X"00",X"00",X"db",X"b6",X"00",X"20",X"00",X"24",X"24",X"24",X"00",X"db",X"db",X"db",X"24",X"24",X"db",X"db",X"db",X"24",X"49",X"00",X"24",X"24",X"00",X"00",X"24",X"24",X"db",X"db",X"00",X"00",
X"00",X"00",X"db",X"db",X"b6",X"db",X"db",X"24",X"24",X"49",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"6d",X"49",X"49",X"24",X"49",X"49",X"db",X"db",X"b6",X"b6",X"db",X"00",X"00",
X"00",X"00",X"6d",X"b6",X"6d",X"49",X"49",X"db",X"db",X"db",X"b6",X"b6",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"49",X"24",X"49",X"24",X"00",X"00",
X"00",X"00",X"24",X"24",X"24",X"00",X"49",X"24",X"24",X"24",X"00",X"24",X"24",X"24",X"24",X"49",X"24",X"00",X"24",X"6d",X"6d",X"6d",X"49",X"49",X"49",X"24",X"24",X"49",X"24",X"db",X"00",X"00",
X"00",X"00",X"db",X"49",X"92",X"49",X"49",X"49",X"92",X"6d",X"92",X"6d",X"b6",X"db",X"db",X"db",X"b6",X"b6",X"db",X"db",X"db",X"db",X"b6",X"b6",X"db",X"db",X"ff",X"ff",X"ff",X"db",X"00",X"00",
X"00",X"00",X"9b",X"b6",X"db",X"6d",X"49",X"db",X"6d",X"6d",X"6d",X"df",X"db",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"db",X"ff",X"ff",X"ff",X"ff",X"ff",X"6d",X"6d",X"6d",X"00",X"00",
X"00",X"00",X"b6",X"93",X"9a",X"9b",X"24",X"6d",X"db",X"24",X"6d",X"6d",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"df",X"ff",X"ff",X"df",X"6d",X"6d",X"6d",X"ff",X"6d",X"db",X"00",X"00",
X"00",X"00",X"72",X"b6",X"9b",X"b6",X"db",X"db",X"24",X"24",X"24",X"24",X"ff",X"ff",X"ff",X"ff",X"db",X"ff",X"db",X"db",X"db",X"db",X"db",X"ff",X"6e",X"ff",X"fb",X"db",X"ff",X"db",X"00",X"00",
X"00",X"00",X"6e",X"6e",X"b6",X"db",X"93",X"9b",X"24",X"db",X"db",X"24",X"db",X"db",X"db",X"db",X"ff",X"ff",X"db",X"ff",X"db",X"ff",X"ff",X"db",X"6d",X"ff",X"db",X"db",X"6d",X"db",X"00",X"00",
X"00",X"00",X"6e",X"6e",X"b6",X"93",X"9a",X"db",X"24",X"db",X"db",X"24",X"db",X"db",X"db",X"db",X"db",X"db",X"ff",X"db",X"db",X"db",X"db",X"ff",X"6d",X"ff",X"db",X"6d",X"ff",X"db",X"00",X"00",
X"00",X"00",X"6e",X"6e",X"6e",X"9a",X"9b",X"b6",X"24",X"db",X"9b",X"24",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"ff",X"db",X"6d",X"db",X"db",X"ff",X"db",X"db",X"00",X"00",
X"00",X"00",X"6e",X"26",X"92",X"93",X"b6",X"9b",X"24",X"db",X"db",X"24",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"fb",X"db",X"db",X"db",X"db",X"6d",X"db",X"db",X"db",X"6d",X"6d",X"00",X"00",
X"00",X"00",X"6e",X"6d",X"6e",X"b6",X"9b",X"b6",X"24",X"db",X"db",X"24",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"8d",X"24",X"6d",X"6d",X"ff",X"db",X"00",X"00",
X"00",X"00",X"6e",X"6e",X"6e",X"93",X"9a",X"9b",X"24",X"db",X"db",X"24",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"ff",X"db",X"ff",X"db",X"db",X"00",X"00",
X"00",X"00",X"6e",X"26",X"6e",X"9a",X"93",X"b6",X"24",X"b6",X"db",X"24",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"ff",X"db",X"db",X"db",X"ff",X"db",X"00",X"00",
X"00",X"00",X"6e",X"6e",X"6e",X"b6",X"9a",X"93",X"24",X"b6",X"db",X"24",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"db",X"6d",X"6d",X"6d",X"24",X"00",X"00",
X"00",X"00",X"6e",X"6e",X"6e",X"b6",X"93",X"9b",X"24",X"b6",X"db",X"24",X"db",X"db",X"db",X"db",X"9b",X"db",X"db",X"db",X"6d",X"24",X"6d",X"6d",X"6d",X"6d",X"b6",X"db",X"db",X"db",X"00",X"00",
X"00",X"00",X"6e",X"2d",X"6e",X"93",X"9b",X"db",X"24",X"db",X"db",X"24",X"db",X"db",X"9b",X"db",X"db",X"db",X"db",X"db",X"6d",X"db",X"db",X"db",X"db",X"db",X"db",X"ff",X"ff",X"db",X"00",X"00",
X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",

-- x-wing-up.bmp
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"00",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"b6",X"00",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"00",X"b6",X"e4",X"00",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"b6",X"b6",X"e4",X"00",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"b6",X"b2",X"e4",X"00",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"b6",X"b2",X"e4",X"00",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"b2",X"b6",X"e4",X"b6",X"00",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"00",X"b6",X"b6",X"e4",X"b6",X"00",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"00",X"b6",X"b2",X"e4",X"b6",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"00",X"b6",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"00",X"00",X"00",X"b6",X"b2",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"00",X"00",X"ff",X"00",X"b6",X"b2",X"b6",X"00",X"ff",X"ff",X"00",X"00",X"00",X"00",X"00",X"00",X"b6",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"00",X"db",X"00",X"b6",X"e4",X"e4",X"00",X"00",X"b6",X"b2",X"b6",X"00",X"ff",X"00",X"00",X"b6",X"00",X"00",X"00",X"b6",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"00",X"db",X"00",X"b6",X"e4",X"e4",X"b6",X"b6",X"b6",X"00",X"00",X"00",X"ff",X"00",X"b2",X"b6",X"00",X"b6",X"00",X"e4",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"00",X"db",X"00",X"ff",X"00",X"b6",X"e4",X"b2",X"b2",X"b6",X"b2",X"b6",X"b6",X"00",X"00",X"b6",X"b6",X"b2",X"00",X"e4",X"b6",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"00",X"b6",X"e4",X"b6",X"b2",X"b6",X"b2",X"b6",X"00",X"b6",X"b2",X"b6",X"b2",X"b6",X"b6",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"b6",X"e4",X"b6",X"b6",X"b2",X"00",X"b6",X"45",X"b6",X"00",X"b6",X"b2",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"b6",X"b2",X"b6",X"00",X"b6",X"41",X"b6",X"00",X"00",X"b6",X"00",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"45",X"b6",X"00",X"b6",X"45",X"b6",X"00",X"b6",X"b2",X"00",X"b6",X"b2",X"00",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"45",X"00",X"00",X"b2",X"45",X"b6",X"00",X"b6",X"b2",X"b6",X"00",X"00",X"b6",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"00",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"45",X"00",X"ff",X"00",X"00",X"b6",X"00",X"b6",X"b2",X"b6",X"b6",X"00",X"b6",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"00",X"db",X"00",
X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"b6",X"00",X"ff",X"00",X"00",X"ff",X"00",X"b2",X"b6",X"b2",X"b6",X"b2",X"b6",X"00",X"b6",X"00",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"00",X"db",X"00",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"45",X"b6",X"e4",X"b6",X"b2",X"b6",X"00",X"b6",X"b2",X"00",X"db",X"00",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"45",X"00",X"00",X"b6",X"e4",X"b6",X"e4",X"00",X"b6",X"00",X"db",X"00",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"45",X"00",X"ff",X"00",X"00",X"b6",X"e4",X"e4",X"e4",X"00",X"db",X"00",X"b6",X"00",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"b6",X"00",X"ff",X"00",X"00",X"ff",X"00",X"b6",X"e4",X"00",X"db",X"00",X"b2",X"b6",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"00",X"db",X"00",X"b6",X"b6",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"b6",X"b2",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"00",X"b6",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",

-- x-wing-down.gif
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"96",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"96",X"00",X"ff",X"ff",X"ff",X"ff",X"00",X"96",X"e4",X"96",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"24",X"00",X"ff",X"ff",X"00",X"96",X"e4",X"e4",X"e4",X"00",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"24",X"00",X"00",X"96",X"e4",X"92",X"96",X"e4",X"00",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"00",X"ff",X"00",X"24",X"96",X"e4",X"96",X"96",X"92",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"96",X"00",X"ff",X"ff",X"00",X"00",X"00",X"96",X"96",X"92",X"96",X"92",X"96",X"00",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"24",X"00",X"ff",X"ff",X"00",X"96",X"00",X"92",X"96",X"92",X"96",X"00",X"96",X"96",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"24",X"00",X"00",X"96",X"24",X"96",X"00",X"92",X"96",X"96",X"00",X"96",X"92",X"96",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"00",X"24",X"96",X"00",X"96",X"24",X"96",X"00",X"96",X"92",X"00",X"96",X"92",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"00",X"00",X"96",X"92",X"96",X"00",X"92",X"24",X"96",X"00",X"00",X"ff",X"00",X"00",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",
X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"ff",X"00",X"96",X"e4",X"96",X"92",X"96",X"00",X"96",X"24",X"96",X"00",X"00",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"00",X"96",X"e4",X"96",X"92",X"96",X"92",X"96",X"00",X"92",X"96",X"92",X"96",X"00",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"00",X"db",X"00",X"00",X"96",X"e4",X"92",X"96",X"96",X"92",X"96",X"92",X"00",X"00",X"96",X"92",X"96",X"00",X"00",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"e4",X"e4",X"e4",X"92",X"96",X"00",X"00",X"00",X"96",X"96",X"92",X"96",X"00",X"96",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",
X"ff",X"ff",X"00",X"ff",X"00",X"00",X"db",X"00",X"e4",X"00",X"00",X"00",X"96",X"00",X"96",X"00",X"96",X"92",X"00",X"96",X"00",X"00",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",
X"ff",X"00",X"db",X"00",X"96",X"96",X"00",X"db",X"00",X"96",X"96",X"96",X"00",X"92",X"96",X"00",X"00",X"96",X"e4",X"00",X"00",X"00",X"00",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"00",X"db",X"00",X"92",X"96",X"00",X"db",X"00",X"92",X"00",X"ff",X"00",X"00",X"ff",X"ff",X"00",X"96",X"e4",X"00",X"00",X"00",X"00",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"00",X"db",X"00",X"92",X"96",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"00",X"96",X"00",X"00",X"96",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"96",X"92",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"96",X"92",X"96",X"92",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"00",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"96",X"e4",X"96",X"96",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"96",X"e4",X"92",X"96",X"00",X"ff",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"96",X"e4",X"92",X"96",X"00",X"ff",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"96",X"e4",X"96",X"92",X"00",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"00",X"e4",X"96",X"00",X"ff",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"e4",X"96",X"00",X"ff",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"db",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"e4",X"96",X"00",
X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"ff",X"00",X"00",X"00",

-- mushroomcloud.gif
X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"40",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"40",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"00",
X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",
X"40",X"00",X"40",X"00",X"40",X"40",X"c0",X"c0",X"c0",X"c0",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"c0",X"c0",X"c0",X"40",X"40",X"00",X"40",X"00",X"40",
X"00",X"40",X"00",X"40",X"40",X"c0",X"c0",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"c0",X"c0",X"c0",X"40",X"40",X"00",X"40",X"00",
X"40",X"00",X"40",X"40",X"c0",X"c0",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"e4",X"e4",X"e4",X"e4",X"e4",X"e4",X"e4",X"e4",X"e4",X"e4",X"e4",X"c0",X"e4",X"c0",X"c0",X"c0",X"40",X"40",X"00",X"40",
X"00",X"40",X"40",X"40",X"c0",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"e4",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"e4",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"c0",X"40",X"40",X"40",X"00",
X"40",X"00",X"40",X"c0",X"c0",X"e4",X"c0",X"e4",X"c0",X"e4",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"e4",X"c0",X"e4",X"c0",X"e4",X"c0",X"c0",X"40",X"00",X"40",
X"00",X"40",X"40",X"c0",X"c0",X"c0",X"e4",X"c0",X"e4",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"e4",X"c0",X"e4",X"c0",X"c0",X"c0",X"40",X"40",X"00",
X"40",X"00",X"40",X"c0",X"c0",X"e4",X"c0",X"e4",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"f9",X"fe",X"f9",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"e4",X"c0",X"e4",X"c0",X"c0",X"40",X"00",X"40",
X"00",X"40",X"40",X"c0",X"c0",X"e4",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"f9",X"fe",X"f9",X"fe",X"f9",X"fe",X"f9",X"f9",X"f1",X"f9",X"f1",X"f9",X"f1",X"f1",X"e4",X"c0",X"c0",X"40",X"40",X"00",
X"40",X"00",X"40",X"c0",X"c0",X"f1",X"f9",X"f1",X"f9",X"f1",X"f9",X"f9",X"fe",X"f9",X"fe",X"f9",X"fe",X"f9",X"fe",X"f9",X"fe",X"f9",X"f9",X"f1",X"f9",X"f1",X"f1",X"c0",X"c0",X"40",X"00",X"40",
X"00",X"40",X"40",X"40",X"c0",X"f1",X"f1",X"f9",X"f1",X"f9",X"f9",X"fe",X"f9",X"fe",X"fe",X"fe",X"fe",X"fe",X"fe",X"fe",X"f9",X"fe",X"f1",X"f9",X"f1",X"f9",X"f1",X"c0",X"40",X"40",X"40",X"00",
X"40",X"00",X"40",X"40",X"c0",X"f1",X"f9",X"f1",X"f9",X"f1",X"fe",X"fe",X"fe",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"fe",X"fe",X"fe",X"fe",X"f1",X"f9",X"f1",X"f1",X"c0",X"40",X"40",X"00",X"40",
X"00",X"40",X"00",X"40",X"40",X"c0",X"f1",X"f9",X"fe",X"fe",X"fe",X"c0",X"c0",X"80",X"80",X"80",X"80",X"80",X"80",X"c0",X"c0",X"fe",X"fe",X"fe",X"f1",X"f1",X"c0",X"40",X"40",X"00",X"40",X"00",
X"40",X"00",X"40",X"00",X"40",X"40",X"c0",X"c0",X"c0",X"c0",X"c0",X"80",X"80",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"80",X"80",X"c0",X"c0",X"c0",X"c0",X"c0",X"40",X"40",X"00",X"40",X"00",X"40",
X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"40",X"40",X"40",X"40",X"c0",X"e4",X"e4",X"f1",X"f1",X"e4",X"e4",X"c0",X"40",X"40",X"40",X"40",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",
X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"40",X"40",X"40",X"40",X"c0",X"f1",X"f9",X"f9",X"f1",X"c0",X"40",X"40",X"40",X"40",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"00",
X"00",X"40",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"40",X"80",X"80",X"c0",X"f9",X"fe",X"fe",X"f9",X"c0",X"80",X"80",X"40",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"40",X"00",
X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"80",X"80",X"80",X"80",X"80",X"c0",X"f1",X"fe",X"fe",X"f1",X"c0",X"80",X"80",X"80",X"80",X"80",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"00",
X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"c0",X"c0",X"80",X"80",X"40",X"40",X"c0",X"e4",X"f1",X"f1",X"e4",X"c0",X"40",X"40",X"80",X"80",X"c0",X"c0",X"40",X"40",X"00",X"40",X"00",X"40",X"00",
X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"00",
X"00",X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"c0",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"40",X"40",X"c0",X"80",X"80",X"80",X"80",X"c0",X"40",X"40",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"40",X"c0",X"e4",X"c0",X"c0",X"e4",X"c0",X"40",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"c0",X"e4",X"f1",X"e4",X"e4",X"f1",X"e4",X"c0",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"40",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"c0",X"e4",X"f1",X"f1",X"f1",X"f1",X"e4",X"c0",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"c0",X"e4",X"f1",X"f1",X"f9",X"f9",X"f1",X"f1",X"e4",X"c0",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"00",X"00",X"00",
X"00",X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"40",X"c0",X"e4",X"f1",X"f9",X"fe",X"fe",X"f9",X"f1",X"e4",X"c0",X"40",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"00",X"00",
X"00",X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"40",X"c0",X"e4",X"f1",X"f9",X"fe",X"f9",X"fe",X"fe",X"f9",X"f1",X"e4",X"c0",X"40",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",X"00",
X"00",X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"40",X"c0",X"e4",X"f1",X"f9",X"fe",X"f9",X"fe",X"fe",X"f9",X"fe",X"f9",X"f1",X"e4",X"c0",X"40",X"40",X"40",X"40",X"00",X"40",X"00",X"40",X"00",
X"40",X"00",X"40",X"00",X"40",X"40",X"40",X"40",X"c0",X"e4",X"f1",X"f9",X"fe",X"f9",X"fe",X"fe",X"fe",X"fe",X"f9",X"fe",X"f9",X"f1",X"e4",X"c0",X"40",X"40",X"40",X"40",X"00",X"40",X"00",X"40",
X"00",X"40",X"00",X"40",X"40",X"40",X"40",X"c0",X"e4",X"f1",X"f9",X"fe",X"f9",X"fe",X"f9",X"fe",X"fe",X"f9",X"fe",X"f9",X"fe",X"f9",X"f1",X"e4",X"c0",X"40",X"40",X"40",X"40",X"00",X"40",X"00"



     );
begin

-- character memory concurrent statement
  process(clk)
  begin
    if (clk'event and clk='1') then
      read_a <= char_read_addr;
    end if;
  end process;
  char_read_value <= char_ram(to_integer(unsigned(read_a)));

end architecture icon_arch;

restart

isim force add clk 0 -value 1 -time 1ns -repeat 2ns

put left_x 0000000111
put top_y 0000000111
put current_icon 00


put current_x 0000000110
put current_y 0000000111
run 2ns


put current_x 0000000111
put current_y 0000000111
run 2ns


put current_x 0000001000
put current_y 0000000111
run 2ns


put current_x 0000001001
put current_y 0000000111
run 2ns


put current_x 0000001010
put current_y 0000000111
run 2ns
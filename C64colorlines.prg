10 rem c64 color lines
20 print chr$(147) : rem clear screen
30 base=2*4096:for i=base to base+7999:poke i,0:next i:rem set and clear base
40 poke 53272,peek(53272) or 8 : rem put bitmap at 8192
50 poke 53265,peek(53265) or 32 : rem enable bitmap
51 poke 53270,peek(53270) or 16 : rem enable multicolor
52 poke 53281,3 : rem set background color to cyan
53 poke 53282,1 : rem set color 1 to white
54 poke 53283,8 : rem set color 2 to orange
60 for i=1024 to 2023:poke i,3:next i:rem set colors to cyan/black
70 for x=0 to 39 : rem width of screen (chars)
80 y=10
100 ro=int(y/8) : rem row postion of y
110 ln=y and 7 : rem line in row
120 by=base+ro*160+4*x+ln : rem byte location
140 poke by,170 : rem set bits for 10 line (0/85/170/255)
150 next x
160 poke 1024,16 : rem set top left character color to flag end
170 goto 170 : rem loop to hold screen
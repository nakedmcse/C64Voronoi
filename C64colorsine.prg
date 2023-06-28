10 rem c64 color sine wave
20 print chr$(147) : rem clear screen
30 base=2*4096:for i=base to base+7999:poke i,0:next i:rem set and clear base
40 poke 53272,peek(53272) or 8 : rem put bitmap at 8192
50 poke 53265,peek(53265) or 32 : rem enable bitmap
51 poke 53270,peek(53270) or 16 : rem enable multicolor
52 poke 53281,3 : rem set background color to cyan
53 poke 53282,1 : rem set color 1 to white
54 poke 53283,8 : rem set color 2 to orange
60 for i=1024 to 2023:poke i,3:next i:rem set colors to cyan/black
70 for x=0 to 159 step .5 : rem width of screen
80 y=int(45+40*sin(x/10)) : rem equation for sine wave
90 ch=int(x/8) : rem character position of x
100 ro=int(y/8) : rem row postion of y
110 ln=y and 3 : rem line in row
120 by=base+ro*160+4*ch+ln : rem byte location
130 bi=3-(x and 3) : rem pixel in byte
140 poke by,peek(by) or (2^bi) : rem set bit in byte
150 next x
160 poke 1024,16 : rem set top left character color to flag end
170 goto 170 : rem loop to hold screen
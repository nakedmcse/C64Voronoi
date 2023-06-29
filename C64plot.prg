10 rem c64 color pixel plot
20 print chr$(147) : rem clear screen
30 base=2*4096:for i=base to base+7999:poke i,0:next i:rem set and clear base
40 poke 53272,peek(53272) or 8 : rem put bitmap at 8192
50 poke 53265,peek(53265) or 32 : rem enable bitmap
51 poke 53270,peek(53270) or 16 : rem enable multicolor
52 poke 53281,8 : rem set background color to orange
60 for i=1024 to 2023:poke i,3:next i:rem set colors to cyan/black
65 for i=55296 to 56295:poke i,1:next i:rem set third color to white
70 x = 0 : y = 0 : co = 1 : rem set variables for (0,0, color 1)
80 gosub 1000 : rem plot point
90 x = 159 : y = 0: co = 2 : rem set variables for (159,0, color 2)
100 gosub 1000 : rem plot point
110 x = 0 : y = 199 : co = 1 : rem set variables for (0,199, color 1)
120 gosub 1000 : rem plot point
130 x = 159 : y = 199 : co = 2 : rem set variables for (159,199, color 2)
140 gosub 1000 : rem plot point
150 x = 79 : y = 99 : co = 3 : rem set variables for (79,99, color 3)
160 gosub 1000 : rem plot point
161 x=0:y=4:co=1:gosub 1000:rem draw line
162 x=1:y=4:co=1:gosub 1000:rem draw line
163 x=2:y=4:co=1:gosub 1000:rem draw line
164 x=3:y=4:co=1:gosub 1000:rem draw line
165 x=4:y=4:co=1:gosub 1000:rem draw line
166 x=5:y=4:co=1:gosub 1000:rem draw line
167 x=6:y=4:co=1:gosub 1000:rem draw line
168 x=7:y=4:co=1:gosub 1000:rem draw line
169 x=8:y=4:co=1:gosub 1000:rem draw line
170 goto 170 : rem Loop to hold screen
900 rem plot point subroutine
1000 x = x * 2
1100 ch=int(x/8) : rem character position of x
1200 ro=int(y/8) : rem row postion of y
1300 ln=y and 7 : rem line in row
1400 by=base+ro*320+8*ch+ln : rem byte location
1500 bi=7-(x and 7) : rem pixel in byte
1600 co = co * (2^bi) : rem shift color to bit posn
1700 ma = 3 * (2^bi) : rem set two bits at bit posn
1800 ma = not ma : rem invert to give us mask
1900 va = peek(by) and ma : rem apply mask to clear bits
2000 poke by,va or co : rem set color bits
2100 return
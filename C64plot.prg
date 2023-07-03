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
161 x=0:y=9:co=1:gosub 1000:rem draw line
162 x=1:y=9:co=2:gosub 1000:rem draw line
163 x=2:y=10:co=2:gosub 1000:rem draw line
164 x=3:y=10:co=2:gosub 1000:rem draw line
165 x=4:y=11:co=3:gosub 1000:rem draw line
166 x=5:y=11:co=3:gosub 1000:rem draw line
167 x=6:y=12:co=2:gosub 1000:rem draw line
168 x=7:y=12:co=2:gosub 1000:rem draw line
169 x=8:y=13:co=1:gosub 1000:rem draw line
170 x1=79:y1=94:x2=79:y2=84:gosub 2900:rem draw upper line
171 x1=79:y1=104:x2=79:y2=114:gosub 2900:rem draw lower line
172 x1=64:y1=99:x2=74:y2=99:gosub 2900:rem draw left line
173 x1=84:y1=99:x2=94:y2=99:gosub 2900:rem draw right line
800 goto 800 : rem Loop to hold screen
900 rem plot point subroutine
1000 x = x + x
1100 ch=int(x/8) : rem character position of x
1200 ro=int(y/8) : rem row postion of y
1300 ln=y and 7 : rem line in row
1400 by=base+ro*320+8*ch+ln : rem byte location
1500 bi=7-(x and 7)-1 : rem pixel in byte (-1 because 7 is first position)
1600 co = co * (2^bi) : rem shift color to bit posn
1700 ma = 3 * (2^bi) : rem set two bits at bit posn
1800 ma = not ma and 255: rem invert to give us mask
1900 va = peek(by) and ma : rem apply mask to clear bits
2000 poke by,va or co : rem set color bits
2100 return
2900 rem draw line subroutine
2910 dx = abs(x2-x1) : dy = abs(y2-y1) : rem diff points
2920 ll = int(sqr(dx^2 + dy^2)) : rem line length
2930 mx = int((x2-x1)/ll) : my = int((y2-y1)/ll) : rem slopes in x and y
2940 xc = x1 : yc = y1 : rem starting point
2950 for ls=0 to ll
2960 x=xc:y=yc:co=3:gosub 1000: rem plot point
2970 xc = xc + mx : yc = yc + my : rem move point
2980 next ls
2990 return

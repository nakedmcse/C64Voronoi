10 rem c64 color ten print
11 print chr$(147) : rem clear screen
12 base=2*4096:for i=base to base+7999:poke i,0:next i:rem set and clear base
13 poke 53272,peek(53272) or 8:poke 53265,peek(53265) or 32 : rem enable bitmap
15 poke 53270,peek(53270) or 16:poke 53280,0:poke 53281,0:rem set black/black
17 for i=1024 to 2023:poke i,19:next i:rem set colors to white/red
18 z = rnd(-ti)
19 for i=55296 to 56295:poke i,int(rnd(1)*12)+3:next i:rem random 3rd color
20 for yo=0 to 199 step 3:for xo=0 to 159 step 3:d=rnd(1)<.5
21 x1=xo:y1=yo-d*2:x2=xo+2:y2=yo+(d+1)*2:co=int(rnd(1)*3)+1:gosub 201
22 next xo: next yo
99 goto 99 : rem Loop to hold screen
100 rem plot point subroutine
101 x = x + x:ch=int(x/8):ro=int(y/8):ln=y and 7
102 by=base+ro*320+8*ch+ln : rem byte location
103 bi=7-(x and 7)-1:cs = co * (2^bi):ma = 3 * (2^bi):ma = not ma and 255
104 va = peek(by) and ma:poke by,va or cs:return
200 rem draw line subroutine
201 dx = abs(x2-x1):dy = abs(y2-y1):ll = int(sqr(dx^2 + dy^2))
202 mx = (x2-x1)/ll:my = (y2-y1)/ll:xc = x1:yc = y1
203 for ls=0 to ll:x=int(xc):y=int(yc):gosub 101:xc=xc+mx:yc=yc+my:next ls
204 return
1 print chr$(147): v=53248: poke v+33,0: rem clear screen, set start vid ram
2 for x=12800 to 12927: poke x,0: next x: rem clear sprite ram
5 print chr$(147)
10 poke v+21,4: rem enable sprite 2
11 poke 2042,13: rem sprite 2 data from 13th block - 13*64 = 832
12 poke 53277,4: rem double size x 
13 poke 53271,4: rem double size y
20 for n = 0 to 62: read q: poke 832+n,q: next n: rem load sprite from data
30 for x = 0 to 255
40 poke v+4, x: rem update x coord
50 poke v+5, x: rem update y coord
60 next x
70 goto 30
200 data 0,127,0,0,255,192,1,255,224,1,255,224
210 data 3,255,240,3,255,240,3,255,240,1,255,224
220 data 1,255,224,1,255,224,1,255,224,1,255,224
230 data 0,255,192,0,127,128,0,63,0,0,30,0
240 data 0,30,0,0,26,0,0,10,0,0,10,0,0,14,0
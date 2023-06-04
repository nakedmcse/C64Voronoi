1 rem c64voronoi
3 print chr$(147) : rem clear screen
4 base=2*4096:for i=base to base+7999:poke i,0:next i
5 poke 53272,peek(53272) or 8 : rem screen mem to 8192
6 rem set ink to black, set border to black, enable hires graphics
10 poke 646, 0: poke 53280, 0: poke 53265,peek(53265) or 32
20 m = 40
25 n = 25 : poke 53280, 2
30 dim p(8,2)
40 for i = 1 to 8
50 p(i,1) = int(rnd(1) * m)
60 p(i,2) = int(rnd(1) * n)
65 poke (1024 + (p(i,2) * 40) + p(i,1)), i
70 next i
80 rem main loop
90 x = int(rnd(1) * m)
100 y = int(rnd(1) * n)
110 b = m * n
120 c = 0
130 for v = 1 to 8
140 rem p(v,1) = p(v,1) + (rc * 0.2) - 0.1
150 rem p(v,2) = p(v,2) + (rd * 0.2) - 0.1
160 d = (x - p(v,1))^2 + (y - p(v,2))^2
170 if b>d then b = d : c = v
180 next v
190 rem plot
200 poke (1024 + (y * 40) + x), c
210 goto 90
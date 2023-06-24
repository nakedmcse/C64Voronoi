1 rem c64voronoi
3 print chr$(147) : rem clear screen
4 base=2*4096:for i=base to base+7999:poke i,0:next i
5 poke 53272,peek(53272) or 8 : rem screen mem to 8192
6 rem set ink to black, set border to black, enable hires graphics
10 poke 646, 0: poke 53280, 0: poke 53265,peek(53265) or 32
20 m = 40
25 n = 25
30 dim p(8,2)
40 for i = 1 to 8
50 p(i,1) = int(rnd(1) * m)
60 p(i,2) = int(rnd(1) * n)
65 poke (1024 + (p(i,2) * 40) + p(i,1)), i
70 next i
71 rem set random offsets in array
72 dim o(1000)
73 for i = 1 to 1000: o(i) = i + 1023: next i
74 rem shuffle array
75 for i = 1 to 1000
76 j = int(rnd(1) * 999)+1
77 s = o(i): o(i) = o(j): o(j) = s: rem shuffle two indicies
78 next i
79 poke 53280, 2
80 rem main loop
90 for ml = 1 to 1000
100 y = int((o(ml)-1024) / 40) : x = (o(ml)-1024)-(y*40)
110 b = m * n
120 c = 0
130 for v = 1 to 8
140 rem p(v,1) = p(v,1) + (rc * 0.2) - 0.1
150 rem p(v,2) = p(v,2) + (rd * 0.2) - 0.1
160 rem real distance d = (x - p(v,1))^2 + (y - p(v,2))^2
161 d = abs(x - p(v,1)) + abs(y - p(v,2))
170 if b>d then b = d : c = v
180 next v
190 rem plot (offset is (1024 + (y * 40) + x))
200 poke o(ml), c
210 next ml
220 goto 220
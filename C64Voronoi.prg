1 rem c64voronoi
10 poke 646, 1: poke 53280, 0: poke 646, 2: print chr$(147)
20 m = 220
30 dim p(8,2)
40 for i = 1 to 8
45 get rx: get ry
50 p(i,1) = int(rx * m)
60 p(i,2) = int(ry * m)
70 next i
80 rem main loop
90 get ra: get rb
95 x = int(ra * m)
100 y = int(rb * m)
110 b = m * m
120 c = 0
130 for v = 1 to 8
135 get rc: get rd
140 p(v,1) = p(v,1) + (rc * 0.2) - 0.1
150 p(v,2) = p(v,2) + (rd * 0.2) - 0.1
160 d = (x - p(v,1))^2 + (y - p(v,2))^2
170 if b>d then b = d : c = v
180 next v
190 rem circle
200 for ys = y - 2 to y + 2
210 for xs = x - 2 to x + 2
220 if (xs - x)^2 + (ys - y)^2 <= 4 then poke 1024 + ys * 40 + xs, 1
230 next xs
240 next ys
250 goto 90
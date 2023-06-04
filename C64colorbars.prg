10 print chr$(147) : rem clear screen
20 for i = 0 to 15 : poke 646,i : b$ = chr$(18) : rem set background color
30 for j = 1 to 40 : b$ = b$ + " " : next j
40 print b$; : next i
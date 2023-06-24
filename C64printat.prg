5 rem print at using sys call
10 print chr$(147) : rem clear screen
20 poke 781, 13 : rem set X coord
30 poke 782, 14 : rem set Y coord
40 poke 783, 0 : rem clear overflow
50 sys 65520 : rem call kernal locate
60 print "hello world"
70 print
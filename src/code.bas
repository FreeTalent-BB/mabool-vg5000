1Clear350:DimS(160):DimE(6):DimH(20),I(20),J(20)
2N$=Chr$(8)+Chr$(8)+Chr$(10):K=1:L=1:A=0:T=0:U=0
3V=0:W=4:B=0:X=0:Y=0:F=0:O=0:M=0:G=0:I9A=0
4Gosub261
5Goto274
6IfL=1ThenRestore191
7IfL=2ThenRestore194
8IfL=3ThenRestore199
9IfL=4ThenRestore202
10IfL=5ThenRestore206
11IfL=6ThenRestore211
12IfL=7ThenRestore216
13IfL=8ThenRestore220
14IfL=9ThenRestore226
15IfL=10ThenRestore230
16IfL=11ThenRestore235
17IfL=12ThenRestore237
18IfL=13ThenRestore241
19IfL=14ThenRestore244
20IfL=15ThenRestore250
21IfL=16ThenRestore255
22Init0,0:R=1:G=0
23IfR>160then27
24ReadF6,Z0:ForG7=0ToF6-1:S(R+G7)=Z0:NextG7
25R=R+F6:IfR>160then27
26Goto24:Goto23
27Return
28P=4:Q=2:F=0:O=0:R=1:B=0:A=0:C=1
29Et7,0,0:CursorX12:CursorY24:?"LOADING STAGE...";:H8=1
30EgK,0,0:CursorXP:CursorYQ
31Z0=S(R)
32IfZ0=0then35
33OnZ0Goto177,178,179,180,181,182,183,184,185,186,187,188,189,190
34Goto35
35P=P+2:R=R+1:H8=H8+1
36IfH8=17ThenQ=Q+2:P=4:H8=1
37IfR<160then30
38Tx7,0,0:CursorX0:CursorY24:?SPC(39);:Gosub147:A1$="":Return
39M=0:Play"T10O3AAAD50"
40IfO=0AndF=0ThenGosub92
41B2=0
42IfJ0B=1ThenC3=StickX(1)+StickX(2):D4=StickY(1)+StickY(2):E5=Action(1)+Action(2)
43IfJ0B=2ThenC3=StickX(2):D4=StickY(2):E5=Action(2)
44IfC3=1AndT<34ThenB2=1:Goto51
45IfC3=255AndT>4ThenB2=1:Goto56
46IfD4=1AndU<20ThenB2=1:Goto66
47IfD4=255AndU>2ThenB2=1:Goto61
48ifE5=1AndM>0then113
49ifKey(0)=115then157
50Goto40
51EgK,0,0:CursorXT:CursorYU:IfS(A+1)=14AndB2=1then142
52IfS(A+1)=7AndB2=1ThenS(A+1)=27:CursorXT+2:CursorYU:?Chr$(43)+Chr$(47)+N$+Chr$(84)+Chr$(85);:Gosub154:Goto40
53IfS(A+1)=1OrS(A+1)=6OrS(A+1)=7OrS(A+1)=27OrS(A+1)=14then40
54B2=0:Gosub71
55A=A+1:T=T+2:CursorXT:CursorYU:Gosub78:Goto51
56EgK,0,0:CursorXT:CursorYU:IfS(A-1)=14AndB2=1then137
57IfS(A-1)=7AndB2=1ThenS(A-1)=27:CursorXT-2:CursorYU:?Chr$(43)+Chr$(47)+N$+Chr$(84)+Chr$(85);:Gosub154:Goto40
58IfS(A-1)=1OrS(A-1)=6OrS(A-1)=7OrS(A-1)=27OrS(A-1)=14then40
59B2=0:Gosub71
60A=A-1:T=T-2:CursorXT:CursorYU:Gosub78:Goto56
61EgK,0,0:CursorXT:CursorYU:IfS(A-16)=14AndB2=1then127
62IfS(A-16)=7AndB2=1ThenS(A-16)=27:CursorXT:CursorYU-2:?Chr$(43)+Chr$(47)+N$+Chr$(84)+Chr$(85);:Gosub154:Goto40
63IfS(A-16)=1OrS(A-16)=6OrS(A-16)=7OrS(A-16)=27OrS(A-16)=14then40
64B2=0:Gosub71
65A=A-16:U=U-2:CursorXT:CursorYU:Gosub78:Goto61
66EgK,0,0:CursorXT:CursorYU:IfS(A+16)=14AndB2=1then132
67IfS(A+16)=7AndB2=1ThenS(A+16)=27:CursorXT:CursorYU+2:?Chr$(43)+Chr$(47)+N$+Chr$(84)+Chr$(85);:Gosub154:Goto40
68IfS(A+16)=1OrS(A+16)=6OrS(A+16)=7OrS(A+16)=27OrS(A+16)=14then40
69B2=0:Gosub71
70A=A+16:U=U+2:CursorXT:CursorYU:Gosub78:Goto66
71Z0=S(A)
72IfZ0=0Then?"oo"N$"oo"
73IfZ0=2OrZ0=8Then?Chr$(34)+Chr$(34)+N$+Chr$(34)+Chr$(34)
74IfZ0=3Then?"#$"N$"HI"
75IfZ0=4Then?"%&"N$"JK"
76IfZ0=5Then?"oo"N$"oo":S(A)=0
77Return
78Sound15,1,7:Z0=S(A)
79IfZ0=0Then?"01"+N$"VW":Goto157
80IfZ0=2Then?"23"N$"XY"
81IfZ0=3Then?"45"N$"Z[":Goto97
82IfZ0=4Then?"67"N$"\]":Goto94
83IfZ0=5Then?"89"N$"^"Chr$(95)
84IfZ0=9Then?"23"N$"XY":S(A)=2:Gosub90:Goto40
85IfZ0=10Then?"23"N$"XY":S(A)=2:Gosub91:Goto40
86IfZ0=11Then?"23"N$"XY":Play"T10O1AD25":S(A)=2:M=M+1:Goto40
87IfZ0=26Then?"67"N$"\]":Goto162
88IfZ0=12OrZ0=13ThenEgK,0,7:?"01"N$"VW":Goto157
89Display2:Return
90Play"T1O2ABCDEFG":V=V+10:Gosub147:F=F-1:Return
91Play"T9O3AAAE50":V=V+10:Gosub147:O=O-1:Return
92EgK,0,0:S(B)=26:CursorXX:CursorYY
93?Chr$(43)+Chr$(44)+N$+Chr$(80)+Chr$(81);:Display5:Play"T5O2ABCDEFGGG":O=-1:F=-1:Return
94D=1:CursorXT:CursorYU:?"%&"N$"JK":Play"T10O3G4"
95IfT=E(1)AndU=E(2)ThenD=4
96T=E(D):U=E(D+1):A=E(D+2):CursorXT:CursorYU:?"67"N$"\]":goto40
97Gosub112
98IfS(A-1)=0then102
99IfS(A+1)=0then105
100IfS(A-16)=0then108
101IfS(A+16)=0then110
102IfS(A-1)<>0OrT=4then40
103T=T-2:A=A-1:Gosub112:S(A+1)=0
104CursorXT+2:CursorYU:?"oo"N$"oo":Display5:Goto102
105IfS(A+1)<>0OrT=34then40
106T=T+2:A=A+1
107Gosub112:S(A-1)=0	:CursorXT-2:CursorYU:?"oo"N$"oo":Display2:Goto105
108IfS(A-16)<>0OrU=2then40
109U=U-2:A=A-16:Gosub112:S(A+16)=0:CursorXT:CursorYU+2:?"oo"N$"oo":Display5:Goto108
110IfS(A+16)<>0OrU=20then40
111U=U+2:A=A+16:Gosub112:S(A-16)=0:CursorXT:CursorYU-2:?"oo"N$"oo":Display5:Goto110
112CursorXT:CursorYU:?"45"N$"Z[":S(A)=3:Play"T1A7":Return
113M=M-1:Play"T10O1A4B4C4D4":EgK,0,0
114IfU>2ThenGosub119
115IfU<20ThenGosub121
116IfT>4ThenGosub123
117IfT<34ThenGosub125
118Display5:goto40
119IfS(A-16)=1ThenS(A-16)=2:CursorXT:CursorYU-2:?Chr$(34)+Chr$(34)+N$+Chr$(34)+Chr$(34);
120Return
121IfS(A+16)=1ThenS(A+16)=2:CursorXT:CursorYU+2:?Chr$(34)+Chr$(34)+N$+Chr$(34)+Chr$(34);
122Return
123IfS(A-1)=1ThenS(A-1)=2:CursorXT-2:CursorYU:?Chr$(34)+Chr$(34)+N$+Chr$(34)+Chr$(34);
124Return
125IfS(A+1)=1ThenS(A+1)=2:CursorXT+2:CursorYU:?Chr$(34)+Chr$(34)+N$+Chr$(34)+Chr$(34);
126Return
127IfU=2Or(S(A-32)<>2AndS(A-32)<>8)then40
128Sound10,10,7:S(A-16)=2:S(A-32)=14:Gosub71
129CursorXT:CursorYU-2:?"23"N$"XY"
130CursorXT:CursorYU-4:?"pq"N$"tu"
131U=U-2:CursorXT:CursorYU:A=A-16:Gosub78:Goto40
132IfU=20Or(S(A+32)<>2AndS(A+32)<>8)then40
133Sound10,10,7:S(A+16)=2:S(A+32)=14:Gosub71
134CursorXT:CursorYU+2:?"23"N$"XY"
135CursorXT:CursorYU+4:?"pq"N$"tu"
136U=U+2:CursorXT:CursorYU:A=A+16:Gosub78:Goto40
137IfT=4Or(S(A-2)<>2AndS(A-2)<>8)then40
138Sound10,10,7:S(A-1)=2:S(A-2)=14:Gosub71
139CursorXT-2:CursorYU:?"23"N$"XY"
140CursorXT-4:CursorYU:?"pq"N$"tu"
141T=T-2:CursorXT:CursorYU:A=A-1:Gosub78:Goto40
142IfT=32Or(S(A+2)<>2AndS(A+2)<>8)then40
143Sound10,10,7:S(A+1)=2:S(A+2)=14:Gosub71
144CursorXT+2:CursorYU:?"23"N$"XY"
145CursorXT+4:CursorYU:?"pq"N$"tu"
146T=T+2:CursorXT:CursorYU:A=A+1:Gosub78:Goto40
147Et7,0,0:CursorX5:CursorY24:A1$=Mid$(Str$(V),2,Len(Str$(V))-1)
148IfLen(A1$)<6ThenForG7=Len(A1$)To6:A1$="0"+A1$:NextG7
149?"SCORE "A1$;:A1$=Mid$(Str$(L),2,Len(Str$(L))-1)
150IfLen(A1$)<2ThenA1$="0"+A1$
151?" STAGE "A1$;:A1$=Mid$(Str$(W),2,Len(Str$(W))-1)
152IfLen(A1$)<2ThenA1$="0"+A1$
153?" LIVES "A1$;:A1$="":Return
154ForG7=1ToG:S(J(G7))=2:EgK,0,0:CursorXH(G7):CursorYI(G7):?Chr$(34)+Chr$(34)+N$+Chr$(34)+Chr$(34);:Display5
155NextG7
156Return
157Tx7,0,0:CursorX0:CursorY24:?SPC(39);:Et1,0,0:CursorX13:CursorY24:?"HAAAAAaaaaa...";:Display5
158W=W-1:Play"T20O1DDDA+50":ForG7=1To10:NextG7:IfW=0then169
159goto274
160Tx7,0,0:CursorX0:CursorY24:?SPC(39);:Et2,0,0:CursorX15:CursorY24:?"EXTRA LIFE!";:Display5:I9A=0
161W=W+1:Play"T10O3AAAD+50":ForG7=1To10:NextG7:goto274
162Tx7,0,0:CursorX0:CursorY24:?SPC(39);:Et2,0,0:CursorX15:CursorY24:?"NICE JOB!";:Display5
163Play"T10O3DDAAEEBB+2DAEB50"
164K=K+1:IfK=4ThenK=5
165IfK>7ThenK=1
166L=L+1:IfL>16then173
167I9A=I9A+1:IfI9A=5then160
168goto274
169Init0,0:Et1,1,0:CursorX18:CursorY9:?"GAME":CursorX18:CursorY10:?"GAME":CursorX18:CursorY11:?"OVER":CursorX18:CursorY12:?"OVER";
170Et7,1,0:CursorX5:CursorY17:?"FINAL SCORE:"+Str$(V):CursorX5:CursorY18:?"FINAL SCORE:"+Str$(V)
171Display5:Play"T30O1ECDA70"
172ForG7=1To10:NextG7:L=1:K=1:W=4:V=0:Goto274
173Init0,0:Et3,1,0:CursorX13:CursorY9:?"CONGRATULATIONS!":CursorX13:CursorY10:?"CONGRATULATIONS!":CursorX5:CursorY11:?"THANKYOUFORPLAYINGMABOOL!":CursorX5:CursorY12:?"THANKYOUFORPLAYINGMABOOL!":Et7,1,0:CursorX5:CursorY17:?"FINAL SCORE:"+Str$(V):CursorX5:CursorY18:?"FINAL SCORE:"+Str$(V)
174Display5
175Play"T10O3AABBCC50BB50AA70AABBCCEEBBCCAA99"
176ForG7=1To5000:NextG7:L=1:K=1:W=4:V=0:Goto274
177?" !"N$"FG":Goto35
178?Chr$(34)+Chr$(34)+N$+Chr$(34)+Chr$(34):Goto35
179?"#$"N$"HI":Goto35
180?"%&"N$"JK":E(C)=P:E(C+1)=Q:E(C+2)=R:C=C+3:Goto35
181?"'("N$"LM":Goto35
182?")*"N$"NO":X=P:Y=Q:B=R:Goto35
183?"-."N$"RS":Goto35
184?"23"N$"XY":T=P:U=Q:A=R:S(A)=2:Goto35
185?"<="N$"bc":F=F+1:Goto35
186?"@A"N$"fg":O=O+1:Goto35
187?"DE"N$"jk":Goto35
188?"lm"N$+"lm":G=G+1:J(G)=R:H(G)=P:I(G)=Q:Goto35
189?"nn"N$"rr":G=G+1:J(G)=R:H(G)=P:I(G)=Q:Goto35
190?"pq"N$"tu":Goto35
191DATA36,0,2,2,1,9,14,0,2,2,1,0,1,10,1,2,1,9,1,6,8,0,1,9,1,2,1,9,1,2,1,8
192DATA1,9,2,2,8,0,4,2,1,0,2,2,9,0,1,9,1,2,1,9,1,2,1,0,1,2,2,9,13,0,1,9
193DATA1,2,1,9,36,0
194DATA20,0,1,1,6,0,1,1,5,0,1,2,1,9,1,2,1,3,7,0,1,2,1,9,1,2,3,0,1,2,1,0
195DATA1,1,1,0,1,2,1,9,1,2,1,9,1,0,1,1,1,0,1,2,3,0,1,2,2,9,1,0,6,2,1,0
196DATA3,2,1,0,1,2,1,9,1,8,6,2,2,9,3,2,1,10,1,18,1,0,1,9,1,2,1,9,1,0,2,2
197DATA1,9,2,2,1,9,1,0,3,2,3,0,1,2,3,0,4,2,3,0,1,2,3,0,1,2,1,9,1,2,8,0
198DATA1,2,1,6,1,2,17,0
199DATA21,0,6,1,10,0,1,1,1,8,1,2,1,9,1,2,1,1,6,0,6,1,2,2,6,1,2,0,1,1,1,10
200DATA2,2,1,5,1,2,1,9,2,2,1,1,1,6,2,2,1,1,2,0,1,1,2,2,1,4,1,1,3,2,1,9
201DATA1,5,3,2,1,1,2,0,5,1,1,9,3,2,5,1,6,0,1,1,3,2,1,4,1,1,10,0,6,1,21,0
202DATA17,0,1,2,1,10,4,2,1,9,1,1,1,6,5,2,2,0,1,2,1,0,4,2,1,11,2,1,1,8,2,2
203DATA1,3,1,2,18,0,1,2,1,0,1,9,8,2,1,9,1,0,1,2,2,0,1,2,1,0,1,9,1,2,1,3
204DATA3,2,1,0,2,2,1,9,1,0,1,2,18,0,1,2,1,3,2,2,1,0,1,2,1,1,1,2,1,3,3,2
205DATA1,0,1,2,2,0,6,2,1,1,1,2,1,9,3,2,1,9,1,2,17,0
206DATA2,0,1,1,8,0,1,1,5,0,1,4,1,3,9,0,1,2,2,9,2,0,1,2,1,9,2,2,1,9,5,0
207DATA1,10,2,2,1,9,2,0,1,9,3,2,1,9,5,0,1,9,1,2,1,9,1,2,2,0,1,2,1,3,3,2
208DATA2,5,1,9,8,0,1,5,6,0,1,5,1,0,1,9,3,2,1,6,2,0,1,2,1,0,2,2,3,0,1,9
209DATA1,5,2,2,1,9,2,2,2,0,1,2,1,9,1,2,1,9,5,0,2,2,2,9,1,2,2,0,1,9,2,2
210DATA1,9,5,0,1,8,3,2,1,4,17,0
211DATA19,0,1,1,2,0,1,6,1,2,2,9,8,0,1,1,1,3,3,0,2,2,1,9,2,5,1,9,5,0,1,2
212DATA1,0,1,2,1,0,2,2,1,4,1,9,2,0,1,5,5,0,1,2,1,3,1,2,2,0,1,5,3,0,3,2
213DATA4,0,3,2,2,0,1,5,3,0,1,2,1,3,1,2,5,0,1,5,2,0,2,9,1,2,1,10,1,0,1,2
214DATA1,0,1,2,5,0,1,9,2,5,2,9,1,2,3,0,1,3,1,1,8,0,1,2,1,4,1,2,1,8,2,0
215DATA1,1,19,0
216DATA17,0,1,8,6,5,1,9,6,5,2,0,5,5,1,4,4,5,1,9,1,5,1,9,1,5,2,0,1,9,1,5
217DATA1,9,2,5,1,9,1,5,1,2,1,4,5,5,2,0,2,5,1,2,2,5,1,3,8,5,2,0,2,5,1,9
218DATA4,5,1,9,6,5,2,0,5,5,1,9,2,5,1,9,1,5,1,9,3,5,2,0,1,9,4,5,1,2,6,5
219DATA1,9,1,5,2,0,5,5,1,10,7,5,1,6,17,0
220DATA1,0,2,1,3,0,1,10,2,2,1,6,2,0,3,2,2,0,1,1,1,3,3,0,1,5,1,2,1,0,1,3
221DATA3,0,1,2,1,9,7,0,1,2,2,0,1,1,2,0,1,2,1,3,1,9,7,0,2,9,1,3,1,2,1,0
222DATA2,2,4,0,1,2,1,3,1,2,2,0,3,2,1,3,2,0,1,2,4,0,1,2,1,9,1,3,3,0,2,9
223DATA1,2,1,8,1,9,1,2,1,0,1,1,2,0,1,2,1,5,1,2,2,0,1,2,1,3,2,2,1,0,1,5
224DATA1,0,2,1,2,0,1,1,1,5,3,0,1,1,4,0,1,5,5,0,1,1,4,0,1,3,1,9,3,5,1,9
225DATA5,0,2,1,3,0,1,1,9,0
226DATA17,0,1,8,8,2,2,9,2,2,1,9,2,0,1,2,12,5,1,2,2,0,1,2,1,5,3,2,1,9,6,2
227DATA1,5,1,9,2,0,1,2,1,5,1,2,8,5,1,2,1,5,1,2,2,0,1,2,1,5,1,2,8,5,1,2
228DATA1,5,1,2,2,0,1,9,1,5,7,2,2,9,1,2,1,5,1,9,2,0,1,2,12,5,1,2,2,0,1,9
229DATA4,2,1,9,1,2,1,6,5,2,1,10,17,0
230DATA3,0,1,9,8,5,1,1,6,0,1,5,5,0,6,1,2,0,6,1,2,0,1,1,1,2,1,11,2,2,1,7
231DATA2,0,1,1,1,11,1,9,2,2,4,1,4,13,1,1,2,0,1,1,1,2,1,9,2,2,1,12,2,5,1,12
232DATA1,9,1,2,2,9,1,1,2,0,1,1,1,11,1,2,1,8,1,9,1,12,2,5,1,12,3,2,1,9,1,1
233DATA2,0,1,1,4,13,4,1,2,2,1,9,1,2,1,1,2,0,1,1,1,11,1,10,2,2,1,1,2,0,6,1
234DATA2,0,6,1,5,0,1,5,6,0,1,6,8,2,1,9,3,0
235DATA37,0,1,6,2,2,1,9,1,2,1,9,10,0,1,2,1,9,2,14,2,2,10,0,1,10,1,14,1,8,1,5
236DATA1,2,1,9,10,0,1,2,2,14,1,9,2,2,10,0,1,2,1,9,4,2,53,0
237DATA17,0,14,1,2,0,1,1,11,5,2,1,2,0,1,1,1,5,9,1,1,9,1,5,1,1,2,0,1,1,10,5
238DATA1,11,1,5,1,1,2,0,2,1,1,5,1,10,1,2,1,1,1,2,4,0,1,3,1,2,1,1,2,0,1,1
239DATA1,8,1,1,1,6,2,5,1,9,1,1,3,5,1,9,1,5,1,1,2,0,1,1,4,5,1,1,4,5,1,1
240DATA2,5,1,1,2,0,14,1,17,0
241DATA36,0,1,2,1,10,5,2,1,9,8,0,3,1,2,14,1,1,2,2,8,0,1,2,1,14,4,2,1,14,1,11
242DATA8,0,1,11,1,14,1,2,1,8,2,2,1,14,1,2,8,0,2,2,1,1,2,14,3,1,8,0,6,2,1,6
243DATA1,2,36,0
244DATA17,1,1,2,1,9,3,2,1,5,3,2,1,4,1,9,2,1,1,9,2,1,2,13,6,1,2,2,1,14,1,12
245DATA1,10,1,2,2,1,2,2,1,1,1,11,1,2,1,1,1,2,3,1,1,2,1,12,2,2,2,1,2,2,1,1
246DATA1,7,1,1,1,11,1,2,1,5,1,8,1,1,1,2,1,12,1,9,1,2,2,1,2,2,1,1,1,4,1,2
247DATA2,14,1,5,1,6,1,1,1,2,1,12,2,2,2,1,2,2,1,1,1,9,1,2,2,9,3,1,1,2,1,12
248DATA1,2,1,9,2,1,2,13,6,1,1,2,2,14,1,12,2,2,2,1,1,2,1,9,2,2,1,1,1,12,2,2
249DATA1,9,1,2,1,14,1,12,1,9,1,2,17,1
250DATA16,0,1,6,3,5,1,1,2,2,1,10,1,2,1,9,2,2,2,5,1,9,5,0,1,9,4,2,1,9,1,2
251DATA1,8,1,0,1,1,1,5,2,0,1,9,3,5,1,9,2,2,1,9,2,2,1,9,1,0,1,5,1,9,2,0
252DATA1,5,1,0,1,9,1,1,1,5,1,1,1,0,1,5,1,0,1,1,2,5,1,9,3,0,1,5,1,0,1,2
253DATA1,0,1,9,2,5,1,9,2,5,1,1,5,0,1,5,1,0,1,2,6,0,1,5,6,0,1,9,1,5,1,9
254DATA5,0,1,1,1,5,7,0,1,1,1,3,6,0,1,11,8,0,1,1,5,0,1,1,6,0
255DATA17,0,2,9,1,2,2,0,4,1,2,0,1,9,1,2,1,9,2,0,1,9,1,2,9,0,1,3,1,10,1,2
256DATA2,0,1,2,1,3,1,9,1,0,1,2,1,9,3,2,1,9,1,0,1,2,1,0,1,9,5,0,1,4,3,2
257DATA1,9,3,2,8,0,1,9,5,2,1,9,1,6,5,0,1,2,1,0,1,9,1,0,1,2,1,9,1,2,1,9
258DATA2,2,1,9,1,5,1,3,1,9,2,0,1,9,1,2,1,3,9,0,1,9,1,2,2,0,2,9,1,2,2,0
259DATA4,1,2,0,1,4,1,9,1,8,17,0
260J0B=1
261Init0,0:Et3,1,0:CursorX8:CursorY9:?"CHECKING FOR JOYSTICK 1":CursorX8:CursorY10:?"CHECKING FOR JOYSTICK 1"
262CursorX7:CursorY11:?"DON'T MOVE DURING THE TEST":CursorX7:CursorY12:?"DON'T MOVE DURING THE TEST"
263K1C=0:L2D=0
264ifStickX(1)<>0OrStickY(1)<>0OrAction(1)<>0ThenK1C=K1C+1
265IfK1C=100then269
266L2D=L2D+1
267IfL2D=200then271
268Goto264
269J0B=2
270Return
271IfK1C>49ThenJ0B=2
272IfK1C<50ThenJ0B=1
273Return
274Gosub6:Gosub28:Goto39
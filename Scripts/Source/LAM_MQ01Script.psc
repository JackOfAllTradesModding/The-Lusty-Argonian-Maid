Scriptname LAM_MQ01Script extends Quest Conditional

Int Property DustToSweep = 6 Auto  

Int Property DustSwept = 0 Auto  

Bool Property Dust1Swept Auto Conditional
Bool Property Dust2Swept Auto Conditional
Bool Property Dust3Swept Auto Conditional
Bool Property Dust4Swept Auto Conditional
Bool Property Dust5Swept Auto Conditional
Bool Property Dust6Swept Auto Conditional

Bool Function SweepDust(Int WhichDust)

If WhichDust == 1
	Dust1Swept = True
ElseIf WhichDust == 2
	Dust2Swept = True
ElseIf WhichDust == 3
	Dust3Swept = True
ElseIf WhichDust == 4
	Dust4Swept = True
ElseIf WhichDust == 5
	Dust5Swept = True
ElseIf WhichDust == 6
	Dust6Swept = True
EndIf

EndFunction
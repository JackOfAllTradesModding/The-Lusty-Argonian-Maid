Scriptname LAM_SigilStoneScript extends ObjectReference  
{Triggers the Scene in the intro quest}

Actor Property PlayerREF Auto
Quest Property LAM_Intro  Auto  

Event OnActivate(ObjectReference akActionRef)
	If akActionRef as Actor == PlayerREF && LAM_Intro.GetStage() < 40; This condition ensures that only the player will trigger this code
		LAM_Intro.SetStage(40);
	EndIf
EndEvent

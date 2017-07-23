Scriptname LAM_TF_Scene_Trigger extends ObjectReference  

actor Property PlayerREF Auto
 
Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef as Actor == PlayerREF ; This condition ensures that only the player will trigger this code
		LAM_Intro.SetStage(30);
	EndIf
EndEvent
Quest Property LAM_Intro  Auto  

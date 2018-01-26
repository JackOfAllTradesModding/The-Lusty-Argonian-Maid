Scriptname LAM_TF_Scene_Trigger extends ObjectReference  

Actor Property PlayerREF Auto
 
Quest Property LAM_Intro  Auto  

Door Property LastDoor  Auto  

ObjectReference Property DoorToClose  Auto  

LAM_Util Property util Auto; Tracelogging 
 
Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef as Actor == PlayerREF ; This condition ensures that only the player will trigger this code
		util.Log("Player has entered the ritual room")
		LAM_Intro.SetStage(30);
		DoorToClose.SetOpen(False)
	EndIf
EndEvent


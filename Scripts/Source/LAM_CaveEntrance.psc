Scriptname LAM_CaveEntrance extends ObjectReference  
{Handles a Triggerbox upon entry to the cultist's cave to advance a quest stage}

Quest Property LAM_Intro  Auto  

Actor Property PlayerREF Auto;

LAM_Util Property util Auto;

Event OnTriggerEnter(ObjectReference akActionRef)

	If akActionRef == PlayerREF;
		util.Log("Player has entered the Mysterious Cave");
		LAM_Intro.SetStage(20);
	EndIf
EndEvent
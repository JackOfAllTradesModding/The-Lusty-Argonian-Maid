Scriptname LAM_BroomScript extends ObjectReference  
{Handles taking and placing the broom}

ObjectReference Property BroomBox  Auto  

ReferenceAlias Property Broom  Auto  

Actor Property PlayerRef  Auto  

ObjectReference Property BroomStatic  Auto  

Quest Property LAM_MQ01 Auto

LAM_Util Property util Auto;

Event OnActivate(ObjectReference akActionRef)

	;If akActionRef == PlayerREF
		If PlayerREF.GetItemCount(Broom.GetReference()) > 0
			;Put it back
			util.Log("Player putting down broom!")
			PlayerREF.RemoveItem(Broom.GetReference(), 1, False, BroomBox)
			BroomStatic.Enable()
		Else
			;Pick it up
			util.Log("Player picking up broom!")
			BroomBox.RemoveItem(Broom.GetReference(), 1, False, PlayerREF)
			BroomStatic.Disable()
			If LAM_MQ01.GetStage() == 10
				LAM_MQ01.SetStage(20)
			EndIf
		EndIf
		
	;EndIf

EndEvent 
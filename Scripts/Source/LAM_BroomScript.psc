Scriptname LAM_BroomScript extends ObjectReference  
{Handles taking and placing the broom}

ObjectReference Property BroomBox  Auto  

ReferenceAlias Property Broom  Auto  

Actor Property PlayerRef  Auto  

ObjectReference Property BroomStatic  Auto  

Quest Property LAM_MQ01 Auto

Event OnActivate(ObjectReference akActionRef)

	;If akActionRef == PlayerREF
		If PlayerREF.GetItemCount(Broom.GetReference()) > 0
			;Put it back
			PlayerREF.RemoveItem(Broom.GetReference(), 1, False, BroomBox)
			BroomStatic.Enable()
		Else
			;Pick it up
			BroomBox.RemoveItem(Broom.GetReference(), 1, False, PlayerREF)
			BroomStatic.Disable()
			If LAM_MQ01.GetStage() == 10
				LAM_MQ01.SetStage(20)
			EndIf
		EndIf
		
	;EndIf

EndEvent
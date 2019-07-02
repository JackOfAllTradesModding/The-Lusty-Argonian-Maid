Scriptname LAM_LaundryBag extends ObjectReference  
{Handles the taking of dirty laundry by the player, or the placing of clean laundry. One script, four instances}

Quest Property LAM_ChoreLaundry Auto;
Quest Property LAM_MQ01 Auto;

LAM_Util Property util Auto; For logging

Actor Property PlayerREF Auto;

Event OnActivate(ObjectReference akActionRef)

	;;FIXME - Wrap in check for laundry quest stage

	If (akActionRef == PlayerREF) 
		;Basically the broom static script, if the clean laundry is in the inventory, enable the static
		If (PlayerREF.GetItemCount(LAM_LaundryClean.GetReference()) > 0) && (LAM_ChoreLaundry.GetStage() == 60)
			util.Log("Player returning clean laundry, type " + LaundryType);
			PlayerREF.RemoveItem(LAM_LaundryClean.GetReference(), 1, False, LaundryBox);
			LaundryStatic.Enable();
			
			;Advance Stage if needed.
			SetLaundryStage();
			
		;If the dirty laundry is not in their inventory, add it, 
		ElseIf (PlayerREF.GetItemCount(LAM_LaundryDirty.GetReference()) == 0) && (LAM_ChoreLaundry.GetStage() == 10)
			util.Log("Player picking up dirty laundry, type " + LaundryType);
			LaundryBox.RemoveItem(LAM_LaundryDirty.GetReference(), 1, False, PlayerREF);
			LaundryStatic.Disable();
			
			;Advance Stage if needed.
			SetLaundryStage();
			
		EndIf
		
	Else
		;Someone who is not the player has activated this for some fucking reason
		util.Log(akActionRef.GetName() + " is activating laundry bag " + LaundryType, True);
	EndIf

EndEvent 

;If all of the laundry has been put where it needs to be, advance the quest stage
Function SetLaundryStage()
	;If stage 10, pick up all 4, advance to 20
	If (LAM_ChoreLaundry.GetStage() == 10) && (PlayerREF.GetItemCount(LAM_DirtyLaundry) == 4)
		LAM_ChoreLaundry.SetStage(20)
		
	;If Stage 60, put back all 4, advance to 70
	ElseIf (LAM_ChoreLaundry.GetStage() == 60) && (PlayerREF.GetItemCount(LAM_CleanLaundry) == 0)
		LAM_ChoreLaundry.SetStage(70)
		
	;Tutorial laundry script moved to quest alias to remove this
	;Check tutorial stage, only need player and orgnar's to advance from 70 to 80 to get, 110-120 to put back
	;ElseIf (LAM_MQ01.GetStage() == 70) && (PlayerREF.GetItemCount(LAM_DirtyLaundry) == 2)
		;If both are in inventory
	;	LAM_MQ01.SetStage(80)
	
	;ElseIf (LAM_MQ01.GetStage() == 110) && (PlayerREF.GetItemCount(LAM_CleanLaundry) == 0)
		;If neither are in inventory
	;	LAM_MQ01.SetStage(120)
	Else
	
	
	EndIf
EndFunction


;Properties

;Dirty laundry, to take
ReferenceAlias Property LAM_LaundryDirty Auto
{Set in CK, not specified here to streamline code}

;Cleaned laundry, to put back.
ReferenceAlias Property LAM_LaundryClean Auto;
{Set in CK, not specified here to streamline code}

Int Property LaundryType Auto;
{For logging, 0: player, 1: Orgnar, 2: Delphine, 3: Patron01, 4: Patron02}

;Hidden box for laundry items
ObjectReference Property LaundryBox  Auto; 

;Static of the bag sitting in the room.
ObjectReference Property LaundryStatic Auto;
{Set in CK, be sure it corresponds to the correct bag}

;Keywords to check inventory.
Keyword Property LAM_CleanLaundry Auto;
Keyword Property LAM_WetLaundry Auto;
Keyword Property LAM_DirtyLaundry Auto;
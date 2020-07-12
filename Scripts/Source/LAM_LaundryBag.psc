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
		;LAundry is available to return in both stage 65 and 70
		If (PlayerREF.GetItemCount(LAM_LaundryClean.GetReference()) > 0) && ((LAM_ChoreLaundry.GetStage() == 70) || (LAM_ChoreLaundry.GetStage() == 65))
			util.Log("Player returning clean laundry, type " + LaundryType);
			PlayerREF.RemoveItem(LAM_LaundryClean.GetReference(), 1, False, LaundryBox);
			LaundryStatic.Enable();
			
			;Advance Stage if needed.
			SetLaundryStage();
			
		;If the dirty laundry is not in their inventory, add it, 
		;Laundry can be collected in stage 0, 5, or 10
		ElseIf (PlayerREF.GetItemCount(LAM_LaundryDirty.GetReference()) == 0) && (LAM_ChoreLaundry.GetStage() <= 10)
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

	;If it's stage zero, set it to stage 5
	If LAM_ChoreLaundry.GetStage() == 0
		LAM_ChoreLaundry.SetStage(5);

	;If stage 5, pick up all, advance to 15
	ElseIf (LAM_ChoreLaundry.GetStage() == 5) && (PlayerREF.GetItemCount(LAM_DirtyLaundry) == (LAM_ChoreLaundry As LAM_ChoreLaundryScript).LaundryCount)
		LAM_ChoreLaundry.SetStage(15)

	;If it's stage 10, pick up all advance to 20
	ElseIf (LAM_ChoreLaundry.GetStage() == 10) && (PlayerREF.GetItemCount(LAM_DirtyLaundry) == (LAM_ChoreLaundry As LAM_ChoreLaundryScript).LaundryCount)
		LAM_ChoreLaundry.SetStage(20)

	;If Stage 65, put back all, advance to 75
	ElseIf (LAM_ChoreLaundry.GetStage() == 65) && (PlayerREF.GetItemCount(LAM_CleanLaundry) == 0)
		LAM_ChoreLaundry.SetStage(75)

	;If Stage 70, put back all, advance to 80
	ElseIf (LAM_ChoreLaundry.GetStage() == 70) && (PlayerREF.GetItemCount(LAM_CleanLaundry) == 0)
		LAM_ChoreLaundry.SetStage(80)

	;No need to advance stage in any other scenario
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
ScriptName LAM_WashBasin Extends ObjectReference
{Removes dirty laundry from your inventory to give you wet laundry}

Quest Property LAM_ChoreLaundry Auto;
Quest Property LAM_MQ01 Auto;

LAM_Util Property util Auto; For logging

LAM_InnManager Property manager Auto;
{Allows verification of guests}

Actor Property PlayerRef Auto;


Event OnActivate(ObjectReference akActionRef)
{Handles actually washing the laundry in the basin/tub}
	
	util.Log("Washbasin activated...");
	
	;If Laundry Quest is active || MQ01 stage is correct
	Int Stage = LAM_ChoreLaundry.GetStage();
	If Stage == 20 || Stage == 15
		util.Log("Player is doing generic laundry.");
		;It's time for laundry, remove the dirty laundry, show a message, add wet laundry corresponding to the dirty laundry.
		;To avoid disastrously repetitive and mind-numbingly boring gameplay this simply does all the laundry at once.
		
		;Remove all dirty laundry
		;PlayerREF.RemoveItem(LAM_DirtyLaundry, (LAM_ChoreLaundry As LAM_ChoreLaundryScript).LaundryCount, False, LaundryBox);
		;Due to issues in how the laundry is created, this elegant, single line, easily readable function is replaced with the below block of code. For now.
		PlayerREF.RemoveItem(LAM_LaundryDirtyPlayer.GetReference(), 1, False, LaundryBox)
		PlayerREF.RemoveItem(LAM_LaundryDirtyOrgnar.GetReference(), 1, False, LaundryBox)
		
		LAM_ChoreLaundryScript script = (LAM_ChoreLaundry As LAM_ChoreLaundryScript); Unfortuante that it came to this
		;This is being done this way and not with the count as before because it seems to be impossible to generate the laudnry by conditions, and as such removing a count is likely to give the player a random assortment
		; of laundry and not the specific onces they will need to complete the quest. Technically it would still function appropriately at this step, but not the next. Other laundry scripts are in the same position.
		
		;Delphine
		If Script.DelphineNeedsLaundry
			PlayerREF.RemoveItem(LAM_LaundryDirtyDelphine.GetReference(), 1, False, LaundryBox)
		EndIf
		
		;Patron01
		If manager.Patron01_b
			PlayerREF.RemoveItem(LAM_LaundryDirtyPatron01.GetReference(), 1, False, LaundryBox)
		EndIf
		
		;Patron02
		If manager.Patron02_b
			PlayerREF.RemoveItem(LAM_LaundryDirtyPatron02.GetReference(), 1, False, LaundryBox)
		EndIf
		
		;Display the flavortext for the player
		WashingMessage().Show();
		
		;Add All washed laundry
		;LaundryBox.RemoveItem(LAM_WetLaundry, (LAM_ChoreLaundry As LAM_ChoreLaundryScript).LaundryCount, False, PlayerREF);
		;Due to issues in how the laundry is created, this elegant, single line, easily readable function is replaced with the below block of code. For now.
		LaundryBox.RemoveItem(LAM_LaundryWashedPlayer.GetReference(), 1, False, PlayerREF)
		LaundryBox.RemoveItem(LAM_LaundryWashedOrgnar.GetReference(), 1, False, PlayerREF)
		
		LAM_ChoreLaundryScript script = (LAM_ChoreLaundry As LAM_ChoreLaundryScript); Unfortuante that it came to this
		;This is being done this way and not with the count as before because it seems to be impossible to generate the laudnry by conditions, and as such removing a count is likely to give the player a random assortment
		; of laundry and not the specific onces they will need to complete the quest. Technically it would still function appropriately at this step, but not the next. Other laundry scripts are in the same position.
		
		;Delphine
		If Script.DelphineNeedsLaundry
			LaundryBox.RemoveItem(LAM_LaundryWashedDelphine.GetReference(), 1, False, PlayerREF)
		EndIf
		
		;Patron01
		If manager.Patron01_b
			LaundryBox.RemoveItem(LAM_LaundryWashedPatron01.GetReference(), 1, False, PlayerREF)
		EndIf
		
		;Patron02
		If manager.Patron02_b
			LaundryBox.RemoveItem(LAM_LaundryWashedPatron02.GetReference(), 1, False, PlayerREF)
		EndIf	
		
		;Update laundry stage
		LAM_ChoreLaundry.SetStage(30);
		
	ElseIf LAM_MQ01.GetStage() == 80
		util.Log("Player is doing ORgnar's laundry for MQ01");
		;Tutorial Laundry, Will just be Orgnar's and the players
		
		;Remove the Dirty laundry
		PlayerRef.RemoveItem(LAM_LaundryDirtyOrgnar.GetReference(), 1, False, LaundryBox);
		
		;TODO: Play washing animation and wait.
			
		;Add the washed laundry
		LaundryBox.RemoveItem(LAM_LaundryWashedOrgnar.GetReference(), 1, False, PlayerRef);
		
		;Update the stage
		LAM_MQ01.SetStage(90);
	Else
		;Not time for laundry
		util.Log("But the player doesn't actually need to be doing Laundry");
	EndIf
	
EndEvent



Message Function WashingMessage()
{Selects a random message to display about the washing}
	
EndFunction


;Dirty Laundry Aliases
ReferenceAlias Property LAM_LaundryDirtyPlayer Auto;
ReferenceAlias Property LAM_LaundryDirtyOrgnar Auto;
ReferenceAlias Property LAM_LaundryDirtyDelphine Auto;
ReferenceAlias Property LAM_LaundryDirtyPatron01 Auto;
ReferenceAlias Property LAM_LaundryDirtyPatron02  Auto  

;Washed Laundry Aliases
ReferenceAlias Property LAM_LaundryWashedPlayer Auto;
ReferenceAlias Property LAM_LaundryWashedOrgnar Auto;
ReferenceAlias Property LAM_LaundryWashedDelphine Auto;
ReferenceAlias Property LAM_LaundryWashedPatron01 Auto;
ReferenceAlias Property LAM_LaundryWashedPatron02  Auto  

;Keywords to remove laundry from inventories
Keyword Property LAM_WetLaundry Auto;
Keyword Property LAM_DirtyLaundry Auto;

Message[] Property LAM_LaundryMessages Auto;
{Array holding the laundry messages to randomly select and play}

Message Property LAM_MQ01LaundryMessage01 Auto; Messages to display during the tutorial quest

;Hidden box for laundry items
ObjectReference Property LaundryBox  Auto; 


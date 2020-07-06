ScriptName LAM_WashBasin Extends Activator
{Removes dirty laundry from your inventory to give you wet laundry}

Quest Property LAM_ChoreLaundry Auto;
Quest Property LAM_MQ01 Auto;

LAM_Util Property util Auto; For logging

Actor Property PlayerRef Auto;


Event OnActivate(ObjectReference akActionRef)
{Handles actually washing the laundry in the basin/tub}
	
	util.Log("Washbasin activated...");
	
	;If Laundry Quest is active || MQ01 stage is correct
	If LAM_ChoreLaundry.GetStage() == 20 
		util.Log("Player is doing generic laundry.");
		;It's time for laundry, remove the dirty laundry, show a message, add wet laundry corresponding to the dirty laundry.
		;To avoid disastrously repetitive and mind-numbingly boring gameplay this simply does all the laundry at once.
		
		;Display the flavortext for the player
		WashingMessage().Show();
		
		;For each piece of dirty laundry, remove it and add the washed one
		
		;Update laundry stage
		LAM_ChoreLaundry.SetStage(30);
		
	ElseIf LAM_MQ01.GetStage() == 80
		util.Log("Player is doing ORgnar's laundry for MQ01");
		;Tutorial Laundry, Will just be Orgnar's and the players
		
		;Remove the Dirty laundry
		PlayerRef.RemoveItem(LAM_LaundryDirtyOrgnar.GetReference(), 1, False, LaundryBox);
		;PlayerRef.RemoveItem(LAM_LaundryDirtyPlayer.GetReference(), 1, False, LaundryBox);
		
		;TODO: Play washing animation and wait.
		
		;Show the message
		;LAM_MQ01LaundryMessage01.Show();
		
		;Add the washed laundry
		LaundryBox.RemoveItem(LAM_LaundryWashedOrgnar.GetReference(), 1, False, PlayerRef);
		;LaundryBox.RemoveItem(LAM_LaundryWashedPlayer.GetReference(), 1, False, PlayerRef);
		
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

;Washed Laundry Aliases
ReferenceAlias Property LAM_LaundryWashedPlayer Auto;
ReferenceAlias Property LAM_LaundryWashedOrgnar Auto;
ReferenceAlias Property LAM_LaundryWashedDelphine Auto;
ReferenceAlias Property LAM_LaundryWashedPatron01 Auto;

Message[] Property LAM_LaundryMessages Auto;
{Array holding the laundry messages to randomly select and play}

Message Property LAM_MQ01LaundryMessage01 Auto; Messages to display during the tutorial quest

;Hidden box for laundry items
ObjectReference Property LaundryBox  Auto; 
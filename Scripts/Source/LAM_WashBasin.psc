ScriptName LAM_WashBasin Extends Activator
{Removes dirty laundry from your inventory to give you wet laundry}

Quest Property LAM_ChoreLaundry Auto;
Quest Property LAM_MQ01 Auto;

Actor Property PlayerRef Auto;



Event OnActivate(ObjectReference akActionRef)
	;If Laundry Quest is active || MQ01 stage is correct
	If (LAM_ChoreLaundry.GetStage() == 20 || LAM_MQ01.GetStage() == 80)
		;It's time for laundry, remove the dirty laundry, show a message, add wet laundry corresponding to the dirty laundry.
	Else
	
	EndIf
	;Two Options:
		;A:
		;Check for the laundry items by keywords/ID 
			;Orgnars, Yours, Customers
		;Remove them, display message, animations if we have em, add "X's Wet Laundry"
		
		
		
	;If MQ01 in proper stage update to "Dry the Laundry", otherwise update the regular laundry quest
EndEvent



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

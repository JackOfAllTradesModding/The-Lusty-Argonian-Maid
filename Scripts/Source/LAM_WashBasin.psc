ScriptName LAM_WashBasin Extends Activator
{Removes dirty laundry from your inventory to give you wet laundry}


Event OnActivate(ObjectReference akActionRef)
	;If Laundry Quest is active || MQ01 stage is correct
	;Two Options:
		;A:
		;Check for the laundry items by keywords/ID 
			;Orgnars, Yours, Customers
		;Remove them, display message, animations if we have em, add "X's Wet Laundry"
		
		;B:
		;Display a message letting you select which one to clean if they're in your inventory
		;Easier on which to clean, may be more monotonous/boring/long for player.
		;When you clean it display simple message, remove dirty, add wet.
		;Update stage when no more dirty laundry in your inventory?
		
		;Prefer B
		
		
	;If MQ01 in proper stage update to "Dry the Laundry", otherwise update the regular laundry quest
EndEvent

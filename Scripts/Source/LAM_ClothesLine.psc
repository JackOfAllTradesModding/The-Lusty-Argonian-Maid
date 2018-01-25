ScriptName LAM_ClothesLine Extends Activator
{Removes wet laundry from your inventory to hang and dry}

;This one is a bit complicated compared to the others.

;General flow is this: You hang laundry, which tracks which ones you put there, and come back in 2-3 hours (More if it rains you silly girl) to get it, then you remove the laundry from the line, get the "X's Clean Laundry" and go put it back in their rooms


;EMPTY STATE: Some Functions/Events exist here and are left blank for a reason

Event OnActivate(ObjectReference akActionRef)
	;If Laundry Quest is in proper stage || MQ01 is
		;Take wet laundry, tag which ones were taken so the proper ones can be returned
		;Update appropriate objective.
		;GoToState("Running")
EndEvent

Event OnBeginState()
	;Clear all timers and flags, do nothing.
EndEvent

Event OnPlayerLoadGame()
	;Intentionally left blank
EndEvent

Event OnUpdateGameTime()
	;Intentionally left blank
EndEvent



;RUNNING STATE: Player has put laundry on the line
State Running

	Event OnActivate(ObjectReference akActionRef)
		;Display a message about the laundry not being dry yet
	EndEvent
	
	Event OnBeginState()
		;RegisterForUpdateGameTime - 2 hours
		;Alternatively, register for smaller updates, so if the game quits it doesn't take a theoretically infinite amount of time.
		;With small steps can also check the weather and reset the timer if it's raining.
	EndEvent

	Event OnPlayerLoadGame()
		;Register for update game time to keep the clock ticking.
	EndEvent

	Event OnUpdateGameTime()
		;If time is up, advance the quest, go to state Done
	EndEvent

EndState


;DONE STATE: Laundry is ready to be collected.
State Done

	Event OnActivate(ObjectReference akActionRef)
		;Check how long it's been done, if it's been there for a while certain events might happen. If you leave your laundry out all day it might get stolen.
		;Remove apparent laundry, add clean laundry to inventory, update quest to put it back in the room.
	EndEvent
	
	Event OnBeginState()
		;Start a timer to see how long it's done before the player picks it up.
	EndEvent

	Event OnPlayerLoadGame()
		;Restart timer to keep it rolling
	EndEvent

	Event OnUpdateGameTime()
		;Increment Timer
	EndEvent

EndState 
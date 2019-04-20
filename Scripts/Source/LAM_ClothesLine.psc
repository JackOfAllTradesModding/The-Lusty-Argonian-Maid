ScriptName LAM_ClothesLine Extends Activator
{Removes wet laundry from your inventory to hang and dry}

;This one is a bit complicated compared to the others.

;General flow is this: You hang laundry, which tracks which ones you put there, and come back in 2-3 hours (More if it rains you silly girl) to get it, then you remove the laundry from the line, get the "X's Clean Laundry" and go put it back in their rooms

;Properties
Quest Property LAM_ChoreLaundry Auto;
Quest Property LAM_MQ01 Auto;

LAM_Util Property util Auto;

Actor Property PlayerREF Auto;

Float Property UpdateInterval = 0.5 Auto;
{Interval of updates to laundry timer, to check for events}

Float Property TimerMAX = 2.0 Auto;
{Time until laundry is dry from start}

Float Property TimerCurrent = 0.0 Auto;
{Amount of time laundry has currently been drying}



;EMPTY STATE: Some Functions/Events exist here and are left blank for a reason

Event OnActivate(ObjectReference akActionRef)
	;If Laundry Quest is in proper stage || MQ01 is
	If LAM_ChoreLaundry.GetStage() == 30 ;Laundry Stage
		util.Log("Clothesline activated for laundry chore quest...")
		;Take wet laundry, all at once.
		PlayerREF.RemoveItem(LAM_WetLaundry, 4, False, LaundryBox);
		util.Log("Wet Laundry removed...");
		;Update appropriate objective.
		LAM_ChoreLaundry.SetStage(40);
		util.Log("Stage set, changing to \"Running\" State");
		
		GoToState("Running");
	
	ElseIf LAM_MQ01.GetStage() == 120 ;MQ Stage
		;Remove player and Orgnar's laundry specifically
		;Adv Stage
		;Running State
	Else
		util.Log("Clothesline activated in empty state but no quest for laundry is in the correct stage.")
		;Check inventory for washed laundry, could be state error
	EndIf
EndEvent

Event OnBeginState()
	;Returning here after laundry. Clear all timers and flags, do nothing.
	UnregisterForUpdateGameTime();In case they're still active for whatever reason
	TimerCurrent = 0.0;
	util.Log("Clothesline entering empty state, updates stopped, timer reset.")
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
		util.Log("Clothesline activated while laundry is still drying, message to be displayed");
	EndEvent
	
	Event OnBeginState()
		;RegisterForUpdateGameTime - 2 hours
		;Alternatively, register for smaller updates, so if the game quits it doesn't take a theoretically infinite amount of time.
		;With small steps can also check the weather and reset the timer if it's raining.
		util.Log("Clothesline entering \"Running\" state, registering for update");
		RegisterForSingleUpdateGameTime(UpdateInterval);
	EndEvent

	Event OnPlayerLoadGame()
		;Register for update game time to keep the clock ticking.
		util.Log("Player loading game with clothesline in \"Running\" state, registering for update");
		RegisterForSingleUpdateGameTime(UpdateInterval);
	EndEvent

	Event OnUpdateGameTime()
		;If time is up, advance the quest, go to state Done
		util.Log("Clothesline timer update in \"Running\" state, timer incremented...");
		TimerCurrent += UpdateInterval; Increment
		If TimerCurrent >= TimerMAX
			util.Log("Timer complete, move to \"Done\" State");
			GoToState("Done");
		Else
			util.Log("Not dry yet, registering for another update.");
			RegisterForSingleUpdateGameTime(UpdateInterval);
		EndIf
	EndEvent

EndState


;DONE STATE: Laundry is ready to be collected.
State Done

	Event OnActivate(ObjectReference akActionRef)
		;Check how long it's been done, if it's been there for a while certain events might happen. If you leave your laundry out all day it might get stolen.
		;Remove apparent laundry, add clean laundry to inventory, update quest to put it back in the room.
		
		If LAM_ChoreLaundry.GetStage() == 50
		
		ElseIf LAM_MQ01.GetStage() == 110
		
		EndIf
	EndEvent
	
	Event OnBeginState()
		;Advance Quest Stage so objective updates.
		
		;Start a timer to see how long it's done before the player picks it up.
		util.Log("Clothesline entering \"Done\" state, beginning update to see how long until the player got to it.");
		RegisterForSingleUpdateGameTime(UpdateInterval);
	EndEvent

	Event OnPlayerLoadGame()
		;Restart timer to keep it rolling
		util.Log("Player loading game with clothesline in \"Done\" state, registering for update");
		RegisterForSingleUpdateGameTime(UpdateInterval);
	EndEvent

	Event OnUpdateGameTime()
		;Increment Timer
		util.Log("Timer update on clothesline in \"Done\" State, inrementing timer.");
		TimerCurrent += UpdateInterval;
		RegisterForSingleUpdateGameTime(UpdateInterval);
	EndEvent

EndState 



;More Properties

;Washed Laundry Aliases
ReferenceAlias Property LAM_LaundryWashedPlayer Auto;
ReferenceAlias Property LAM_LaundryWashedOrgnar Auto;
KeyWord Property LAM_WetLaundry Auto;

;Clean/Dry Laundry Aliases
ReferenceAlias Property LAM_LaundryCleanPlayer Auto;
ReferenceAlias Property LAM_LaundryCleanOrgnar Auto;
KeyWord Property LAM_CleanLaundry Auto;

Message[] Property LAM_LaundryMessages Auto;
{Array holding the laundry messages to randomly select and play}

Message Property LAM_MQ01LaundryMessage01 Auto; Messages to display during the tutorial quest

;Hidden box for laundry items
ObjectReference Property LaundryBox  Auto; 
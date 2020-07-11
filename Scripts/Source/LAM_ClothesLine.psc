ScriptName LAM_ClothesLine Extends ObjectReference
{Removes wet laundry from your inventory to hang and dry}

;This one is a bit complicated compared to the others.

;General flow is this: You hang laundry, which tracks which ones you put there, and come back in 2-3 hours (More if it rains you silly girl) to get it, then you remove the laundry from the line, get the "X's Clean Laundry" and go put it back in their rooms

;Properties
Quest Property LAM_ChoreLaundry Auto;
Quest Property LAM_MQ01 Auto;

LAM_Util Property util Auto;
LAM_InnManager Property manager Auto;

Actor Property PlayerREF Auto;

Float Property UpdateInterval = 0.5 Auto;
{Interval of updates to laundry timer, to check for events}

Float Property TimerMAX = 2.0 Auto;
{Time until laundry is dry from start}

Float Property TimerCurrent = 0.0 Auto;
{Amount of time laundry has currently been drying}

Float Property TimerTotal = 0.0 Auto;
{Total time spent on clothesline, even if rain interfered}


;EMPTY STATE: Some Functions/Events exist here and are left blank for a reason

;Expected state of clothesline: no laundry, no timer
Event OnActivate(ObjectReference akActionRef)

	;If Laundry Quest is in proper stage || MQ01 is
	Int Stage = LAM_ChoreLaundry.GetStage();
	If (Stage == 30) || (Stage == 25) ;Laundry Stage
		util.Log("Clothesline activated for laundry chore quest...")
		;Take wet laundry, all at once.
		PlayerREF.RemoveItem(LAM_WetLaundry, (LAM_ChoreLaundry As LAM_ChoreLaundryScript).LaundryCount, False, LaundryBox);
		;The above line passes a keyword as the item to remove and the count is taken from another script as the number of laundry items active (2-5) per instance of this quest
		util.Log("Wet Laundry removed...");
		;Update appropriate objective.
		LAM_ChoreLaundry.SetStage(Stage + 10); This simplifies a lot of conditionals and handles both versions of this stage
		util.Log("Stage set, changing to \"Running\" State");
		
		GoToState("Running");
	
	ElseIf LAM_MQ01.GetStage() == 90 ;MQ Stage
		
		util.Log("Player washing Orgnar's laundry for MQ01.");
		
		LAM_MQ01LaundryMessage01.Show();
		;Remove Orgnar's laundry specifically
		;PlayerRef.RemoveItem(LAM_LaundryWashedOrgnar.GetReference(), 1, False, LaundryBox);
		;Due to issues in how the laundry is created, this elegant, single line, easily readable function is replaced with the below block of code. For now.
		PlayerREF.RemoveItem(LAM_LaundryWashedPlayer.GetReference(), 1, False, LaundryBox)
		PlayerREF.RemoveItem(LAM_LaundryWashedOrgnar.GetReference(), 1, False, LaundryBox)
		
		LAM_ChoreLaundryScript script = (LAM_ChoreLaundry As LAM_ChoreLaundryScript); Unfortuante that it came to this
		;This is being done this way and not with the count as before because it seems to be impossible to generate the laudnry by conditions, and as such removing a count is likely to give the player a random assortment
		; of laundry and not the specific onces they will need to complete the quest. Technically it would still function appropriately at this step, but not the next. Other laundry scripts are in the same position.
		
		;Delphine
		If Script.DelphineNeedsLaundry
			PlayerREF.RemoveItem(LAM_LaundryWashedDelphine.GetReference(), 1, False, LaundryBox)
		EndIf
		
		;Patron01
		If manager.Patron01_b
			PlayerREF.RemoveItem(LAM_LaundryWashedPatron01.GetReference(), 1, False, LaundryBox)
		EndIf
		
		;Patron02
		If manager.Patron02_b
			PlayerREF.RemoveItem(LAM_LaundryWashedPatron02.GetReference(), 1, False, LaundryBox)
		EndIf
		;Adv Stage
		LAM_MQ01.SetStage(100);
		;Running State
		GoToState("Running");
	Else
		util.Log("Clothesline activated in empty state but no quest for laundry is in the correct stage.")
		;Check inventory for washed laundry, could be state error
	EndIf
EndEvent

Event OnBeginState()
	;Returning here after laundry. Clear all timers and flags, do nothing.
	UnregisterForUpdateGameTime();In case they're still active for whatever reason
	TimerCurrent = 0.0;
	TimerTotal = 0.0;
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
;Expected State of Clothesline: Wet laundry placed, waiting to dry

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
		TimerTotal += UpdateInterval;
		;Check for Rain first
		If Weather.GetCurrentWeather().GetClassification() < 2 ;0 is sunny, 1 is cloudy,2 is Rainy 3 is Snow. So this ensures the quest can proceed	
			;Not Rainy, proceed
			
			If TimerCurrent >= TimerMAX
				util.Log("Timer complete, move to \"Done\" State");
				
				;Advance Stage:
				Int Stage = LAM_ChoreLaundry.GetStage();
				
				If Stage == 35 || Stage == 40
					;Increment by 20
					LAM_ChoreLaundry.SetStage(Stage + 20);
					
				ElseIf Stage == 45 || Stage == 50
					;Increment by 10
					LAM_ChoreLaundry.SetStage(Stage + 10);
					
				ElseIf LAM_MQ01.GetStage() == 100
					LAM_MQ01LaundryMessage02.Show();
					LAM_MQ01.SetStage(110);
				
				Else
					;FIXME THROW ERRER
				EndIf
				
				GoToState("Done");
				
			Else
				util.Log("Not dry yet, registering for another update.");
				RegisterForSingleUpdateGameTime(UpdateInterval);
			EndIf
			
		Else
			;It is rainy oh no!
			;Restart current timer, increment total, set stage to appropriate
			TimerCurrent = 0.0;
			Int Stage = LAM_ChoreLaundry.GetStage();
				
				If Stage == 35 || Stage == 40
					;Increment by 20
					LAM_ChoreLaundry.SetStage(Stage + 10);
					
				ElseIf LAM_MQ01.GetStage() == 100
					LAM_MQ01LaundryMessage02.Show();
					LAM_MQ01.SetStage(110);
					;I have opted to ignore Mq01 during the rain for now
					;FIXME: ADD STAGE 105 to mq01 to account for rain
				
				Else
					;Likely just a repeat of this stage, don't need to move anywhere special
				EndIf
		EndIf
		
	EndEvent

EndState


;DONE STATE: Laundry is ready to be collected.
State Done
;Expected state of clothesline: Laundry is finished drying, waiting to be collected

	Event OnActivate(ObjectReference akActionRef)
		;Check how long it's been done, if it's been there for a while certain events might happen. If you leave your laundry out all day it might get stolen.
		;Remove apparent laundry, add clean laundry to inventory, update quest to put it back in the room.
		util.Log("Player activating dried laundry...");
		
		Int Stage = LAM_ChoreLaundry.GetStage();
		If Stage == 55 || Stage == 60
			;Add all items to player, advance quest
			;LaundryBox.RemoveItem(LAM_CleanLaundry, (LAM_ChoreLaundry As LAM_ChoreLaundryScript).LaundryCount, False, PlayerREF);
			;Due to issues in how the laundry is created, this elegant, single line, easily readable function is replaced with the below block of code. For now.
			LaundryBox.RemoveItem(LAM_LaundryCleanPlayer.GetReference(), 1, False, PlayerREF)
			LaundryBox.RemoveItem(LAM_LaundryCleanOrgnar.GetReference(), 1, False, PlayerREF)
			
			LAM_ChoreLaundryScript script = (LAM_ChoreLaundry As LAM_ChoreLaundryScript); Unfortuante that it came to this
			;This is being done this way and not with the count as before because it seems to be impossible to generate the laudnry by conditions, and as such removing a count is likely to give the player a random assortment
			; of laundry and not the specific onces they will need to complete the quest. Technically it would still function appropriately at this step, but not the next. Other laundry scripts are in the same position.
			
			;Delphine
			If Script.DelphineNeedsLaundry
				LaundryBox.RemoveItem(LAM_LaundryCleanDelphine.GetReference(), 1, False, PlayerREF)
			EndIf
			
			;Patron01
			If manager.Patron01_b
				LaundryBox.RemoveItem(LAM_LaundryCleanPatron01.GetReference(), 1, False, PlayerREF)
			EndIf
			
			;Patron02
			If manager.Patron02_b
				LaundryBox.RemoveItem(LAM_LaundryCleanPatron02.GetReference(), 1, False, PlayerREF)
			EndIf	
			
			LAM_ChoreLaundry.SetStage(Stage + 10);
			GoToState("");
		ElseIf LAM_MQ01.GetStage() == 110
			LAM_MQ01LaundryMessage03.Show();
			;Return clothes
			LaundryBox.RemoveItem(LAM_LaundryCleanOrgnar.GetReference(), 1, False, PlayerRef);
			;Advance Quest
			LAM_MQ01.SetStage(120);
			GoToState("");
		Else
			;FIXME THROW ERROR
		EndIf
		
	EndEvent
	
	Event OnBeginState()
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
		TimerTotal += UpdateInterval;
		RegisterForSingleUpdateGameTime(UpdateInterval);
	EndEvent

EndState 



;More Properties

;Washed Laundry Aliases
ReferenceAlias Property LAM_LaundryWashedPlayer Auto;
ReferenceAlias Property LAM_LaundryWashedOrgnar Auto;
ReferenceAlias Property LAM_LaundryWashedDelphine Auto;
ReferenceAlias Property LAM_LaundryWashedPatron01 Auto;
ReferenceAlias Property LAM_LaundryWashedPatron02  Auto  
KeyWord Property LAM_WetLaundry Auto;

;Clean/Dry Laundry Aliases
ReferenceAlias Property LAM_LaundryCleanPlayer Auto;
ReferenceAlias Property LAM_LaundryCleanOrgnar Auto;
ReferenceAlias Property LAM_LaundryCleanDelphine Auto;
ReferenceAlias Property LAM_LaundryCleanPatron01 Auto;
ReferenceAlias Property LAM_LaundryCleanPatron02  Auto  
KeyWord Property LAM_CleanLaundry Auto;

Message[] Property LAM_LaundryMessages Auto;
{Array holding the laundry messages to randomly select and play}

Message Property LAM_MQ01LaundryMessage01 Auto; Messages to display during the tutorial quest
Message Property LAM_MQ01LaundryMessage02 Auto; Messages to display during the tutorial quest
Message Property LAM_MQ01LaundryMessage03 Auto; Messages to display during the tutorial quest

;Hidden box for laundry items
ObjectReference Property LaundryBox  Auto; 
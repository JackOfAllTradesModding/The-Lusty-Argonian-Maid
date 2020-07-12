ScriptName LAM_ChoreLaundryTimer Extends Quest
{Handles only restarting the repeatable laundry chore around the inn}

LAM_Util Property util Auto;
{Utility Script, primarily for tracelogging}

Quest Property LAM_ChoreLaundry Auto;
{The actual laundry chore quest}

Bool Property DelphineNeedsLaundry Auto 
{Delphine's laundry is every other time (once a week instead of every few days)}

Float Property TimerInterval = 2.0 Auto;
{Interval of updates to laundry timer, to check for events}

Float Property TimerMax = 72.0 Auto;
{Time until laundry is needed again}

Float Property TimerCurrent = 0.0 Auto;
{Amount of time Since laundry was last done}


Function StartTimer()
{Initiates the timer, called when laudry chore quest is completed}
	LAM_ChoreLaundryScript script = (LAM_ChoreLaundry as LAM_ChoreLaundryScript); The pros and cons of my naming convention in one convenient line
	;Flip the persistent one here
	DelphineNeedsLaundry = !DelphineNeedsLaundry;
	;Set the non-persistent one that can be used as a condition by quests and dialogue.
	script.DelphineNeedsLaundry = DelphineNeedsLaundry;
	util.Log("Timer until laundry needs to be done again started...");
	GoToState("Running");
EndFunction

Function EndTimer()
{Finishes the timer, starts Laundry chore quest}
	util.Log("Laundry timer expired starting quest.");
	LAM_ChoreLaundry.Start();
	;Invert Delphine's toggle for next time
	TimerCurrent = 0.0;
	GoToState("");
EndFunction

;Empty State Events---------------------------------------------------------------------------
Event OnUpdateGameTime()
	;Intentionally Left Blank
EndEvent

Event OnPlayerLoadGame()
	;Intentionalaly Left Blank
EndEvent

;Running State Events-------------------------------------------------------------------------
State Running

Event OnBeginState()
{Start Timer}
	RegisterForSingleUpdateGameTime(TimerInterval);
	util.Log("Laundry Timer successfully started")
EndEvent

Event OnUpdateGameTime()
{Increment Timer}
	TimerCurrent += TimerInterval
	util.Log("Laundry Timer updating, new time is " + TimerCurrent + " hours.");
	If TimerCurrent >= TimerMax
		util.Log("Laundry is ready.")
		EndTimer();
	Else
		util.Log("Laundry is not ready. Scheduling another update")
		RegisterForSingleUpdateGameTime(TimerCurrent);
	EndIF
EndEvent

Event OnPlayerLoadGame()
{Start Timer}
	RegisterForSingleUpdateGameTime(TimerInterval);
	util.Log("Laundry Timer successfully restarted")
EndEvent

EndState

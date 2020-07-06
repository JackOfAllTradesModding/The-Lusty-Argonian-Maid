Scriptname LAM_MQ01_DustPiles extends ObjectReference  

LAM_Util Property util Auto

Quest Property LAM_MQ01  Auto  

Actor Property PlayerREF Auto

Idle Property idleLooseSweepingStart Auto;

Int Property WhichDust Auto;

Event OnActivate(ObjectReference akActionRef)
	
	util.Log("Dustpile activated, force the sweeping animation");
	;Force camera to 3rd person
	Game.ForceThirdPerson()
	If PlayerREF.PlayIdle(idleLooseSweepingStart)
		;Disable controls
		Game.DisablePlayerControls(abCamSwitch = true)
		;Wait 2 seconds
		Utility.Wait(2.0)
		Self.Disable(True)
		;Re-enable controls
		Game.EnablePlayerControls()
		;EndAnimation
		PlayerREF.PlayIdle(idleLooseSweepingStart);Should end it
		(LAM_MQ01 as LAM_MQ01Script).DustSwept += 1;
		(LAM_MQ01 as LAM_MQ01Script).SweepDust(WhichDust)
		IF (LAM_MQ01 as LAM_MQ01Script).DustSwept == (LAM_MQ01 as LAM_MQ01Script).DustToSweep
			LAM_MQ01.SetStage(30)
		EndIf
	EndIf
EndEvent 
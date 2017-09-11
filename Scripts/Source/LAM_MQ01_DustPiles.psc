Scriptname LAM_MQ01_DustPiles extends ObjectReference  

Quest Property LAM_MQ01  Auto  

Actor Property PlayerREF Auto

Idle Property idleLooseSweepingStart Auto;

Event OnActivate(ObjectReference akActionRef)
	PlayerREF.PlayIdle(idleLooseSweepingStart)
	Self.Disable()
	(LAM_MQ01 as LAM_MQ01Script).DustSwept += 1;
	IF (LAM_MQ01 as LAM_MQ01Script).DustSwept == (LAM_MQ01 as LAM_MQ01Script).DustToSweep
		LAM_MQ01.SetStage(30)
	EndIf
EndEvent
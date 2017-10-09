Scriptname LAM_MQ01_BedMaking extends ReferenceAlias  
{Handles the first bed you have to make.}

Bool Property NeedsMaking = False Auto;
Message Property LAM_MQ01_BedMessage01 Auto;
Message Property LAM_MQ01_BedMessage02 Auto;
Message Property LAM_MQ01_BedMessage03 Auto;

Bool Function NeedsTidying(Bool Dirty)
	
	If Dirty
		;Blocks activation, and enables the onactivate event within this script to create the dialogue box.
		NeedsMaking = True;
		Self.GetReference().BlockActivation(True);
	Else
		NeedsMaking = False;
		Self.GetReference().BlockActivation(False);
	EndIf
	
	Return True;
EndFunction

Event OnActivate(ObjectReference akActionRef)
	If NeedsMaking
		;Show a messagebox with two options, clean or sleep.
		Int i = LAM_MQ01_BedMessage01.Show();
		If i == 0
			;If clean:
			;PlayAnimation...
			LAM_MQ01_BedMessage02.Show();
			;Display messagebox about making it.
			;Set it as cleaned. Advance MQ01
			NeedsTidying(False)
			;LAM_MQ01.SetStage()
		Else
			;If Sleep:
			LAM_MQ01_BedMessage03.Show();
			Self.GetReference().Activate(Game.GetPlayer(), True);
		EndIf
	Else
		;Do Nothing
	EndIf
EndEvent
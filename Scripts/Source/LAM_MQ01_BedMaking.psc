Scriptname LAM_MQ01_BedMaking extends ReferenceAlias  
{Handles the first bed you have to make.}

LAM_Util Property util Auto;

Bool Property NeedsMaking = False Auto;
Message Property LAM_MQ01_BedMessage01 Auto;
Message Property LAM_MQ01_BedMessage02 Auto;
Message Property LAM_MQ01_BedMessage03 Auto;

Quest Property LAM_MQ01 Auto;

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
	util.Log("Player activating the bed...")
	If NeedsMaking
		util.Log("the bed is dirty! clean it up!")
		;Show a messagebox with two options, clean or sleep.
		Int i = LAM_MQ01_BedMessage01.Show();
		If i == 0
			util.Log("Player chose to clean it, good girl.");
			;If clean:
			;PlayAnimation...
			LAM_MQ01_BedMessage02.Show();
			;Display messagebox about making it.
			;Set it as cleaned. Advance MQ01
			NeedsTidying(False)
			LAM_MQ01.SetStage(60);
		Else
			util.Log("Player chose to sleep, what a lazy maid.");
			;If Sleep:
			LAM_MQ01_BedMessage03.Show();
			Self.GetReference().Activate(Game.GetPlayer(), True);
		EndIf
	Else
		util.Log("The bed is already clean though.");
		;Do Nothing
	EndIf
EndEvent 
ScriptName LAM_PlayerTF Extends Quest
{Transforms the player into Lifts-Her-Tail}

Race Property PlayerRace Auto;	Whatever the player was
Race Property ArgonianRace Auto;	Argonian
Race Property ArgonianRaceVampire Auto;		

Actor Property PlayerREF Auto;

String Property PlayerName Auto;
Bool Property SexChanged = False Auto;

Explosion Property LAM_ExplosionTF Auto; The Hysteria Explosion effect (ExplosionIllusionMassiveDark) but with no force or damage, might shrink the radius too.
Explosion Property LAM_ExplosionRevert Auto; The Harmony Explosion effect (ExplosionIllusionMassiveLigh01)

LAM_TF_Timer Property Semaphore Auto;

Function Transform()
	;PlayerREF.PlaceAtMe(LAM_ExplosionTF)

	;Backup Name
	PlayerName = PlayerREF.GetName();
	
	;Sex
	If PlayerREF.GetActorBase().GetSex() != 1;
		ConsoleUtil.ExecuteCommand("Player.SexChange");
		SexChanged = True;
	EndIf
	
	;Height/Weight
	
	;Get/Backup AV's

	;Backup player Race and face
	PlayerRace = PlayerRef.GetRace();
	Chargen.SavePreset("LAM-" + PlayerName + "-Face");
	
	;Change player race and load face
	PlayerRef.SetRace(ArgonianRace);
	Utility.Wait(0.1);
	CharGen.LoadPreset("Lifts-Her-Tail");
	Utility.Wait(0.2);
	PlayerRef.SetRace(ArgonianRaceVampire);
	Utility.Wait(0.1)
	PlayerRef.SetRace(ArgonianRace);
	Utility.Wait(0.1)
	PlayerREF.QueueNiNodeUpdate(); Not sure if this is actually necessary

	;Get key for sheath
	Int RKey = Input.GetMappedKey("Ready Weapon"); May need to add support for gamepads later. Will wait for bug reports
	
	;Disable menus and then open and close RaceMenu, otherwise the normal and specular maps don't update properly for some reason and the heads gets plasticky and smooth.
	Debug.ToggleMenus();
	;Utility.WaitMenuMode(0.5);
	Game.ShowRaceMenu();
	Utility.WaitMenuMode(1.0); 
	Input.TapKey(RKey);Since R is only pressed once there's a chance that it gets stuck forever. testing is needed but this seems to work no problem
	While Semaphore.RaceMenuOpen ;Uses a semaphore to figure out when the menu is actually closed to avoid artificial latency
		Utility.WaitMenuMode(0.1)
		Input.TapKey(28);
	EndWhile
	Debug.ToggleMenus();
	
	;Change player name
	PlayerREF.SetName("Lifts-Her-Tail");
	
EndFunction 
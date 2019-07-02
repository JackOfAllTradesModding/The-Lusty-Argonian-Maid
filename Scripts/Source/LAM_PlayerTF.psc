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
LAM_Util Property util Auto;

Function Transform()
	;PlayerREF.PlaceAtMe(LAM_ExplosionTF)
	
	util.Log("Beginning Player TF code...")
	
	;Backup Name
	PlayerName = PlayerREF.GetActorBase().GetName();
	util.Log("Player name (" + PlayerName + ") saved!");
	
	;Sex
	If PlayerREF.GetActorBase().GetSex() != 1;
		ConsoleUtil.ExecuteCommand("Player.SexChange");
		SexChanged = True;
		util.Log("Player sex changed!");
	EndIf
	
	;Height/Weight
	
	;Get/Backup AV's

	;Backup player Race and face
	PlayerRace = PlayerRef.GetRace();
	util.Log("Player original race back up!")
	
	Chargen.SavePreset("LAM-" + PlayerName + "-Face");
	util.Log("Player original face backed up!")
	
	
	;Change player race and load face
	util.Log("Setting race to Argonian the first time...");
	PlayerRef.SetRace(ArgonianRace);
	Utility.Wait(0.2);
	While PlayerREF.GetRace() != ArgonianRace
		Utility.Wait(0.1);No idea if this is necessary
	EndWhile
	util.Log("Race set to Argonian!");
	
	
	util.Log("Loading Lifts-Her-Tail face Preset...");
	CharGen.LoadPreset("Lifts-Her-Tail");
	Utility.Wait(0.4);
	util.Log("Face loaded!");
	
	util.Log("Setting race to Argonian vampire to correct face issues...");
	PlayerRef.SetRace(ArgonianRaceVampire);
	Utility.Wait(0.2)
	While PlayerREF.GetRace() != ArgonianRaceVampire
		Utility.Wait(0.1);No idea if this is necessary
	EndWhile
	util.Log("Race set to ArgonianVampire!")
	
	util.Log("Setting race to Argonian for the second time...")
	PlayerRef.SetRace(ArgonianRace);
	Utility.Wait(0.2)
	While PlayerREF.GetRace() != ArgonianRace
		Utility.Wait(0.1);No idea if this is necessary
	EndWhile
	util.Log("Race set to Argonian!")
	
	PlayerREF.QueueNiNodeUpdate(); Not sure if this is actually necessary

	;Get key for sheath
	Int RKey = Input.GetMappedKey("Ready Weapon"); May need to add support for gamepads later. Will wait for bug reports
	
	;Disable menus and then open and close RaceMenu, otherwise the normal and specular maps don't update properly for some reason and the heads gets plasticky and smooth.
	util.Log("Hiding menus and opening the racemenu...");
	Debug.ToggleMenus();
	;Utility.WaitMenuMode(0.5);
	Game.ShowRaceMenu();
	Utility.WaitMenuMode(0.5); 
	Input.TapKey(RKey);Since R is only pressed once there's a chance that it gets stuck forever. So if the loop seems to be sticking it will press R.
	util.Log("R key press sent once.");
	int i = 0
	While Semaphore.RaceMenuOpen ;Uses a semaphore to figure out when the menu is actually closed to avoid artificial latency
		Utility.WaitMenuMode(0.1)
		Input.TapKey(28);
		util.Log("Enter key pressed " + (i+1) + " times...");
		i += 1
		If (i % 5 == 0)
			Input.TapKey(RKey)
			util.Log("R key pressed " + (i/5) + " times...");
		EndIf
	EndWhile
	util.Log("RaceMenu has closed, unhiding menus...")
	Debug.ToggleMenus();
	
	;Change player name
	PlayerREF.GetActorBase().SetName("Lifts-Her-Tail");
	util.Log("Player's name set to " + PlayerREF.GetActorBase().GetName() + "!");
	
	util.Log("TF Code done running, enjoy your time as a maid!")
	
EndFunction 
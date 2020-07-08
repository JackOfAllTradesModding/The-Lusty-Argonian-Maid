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

Message Property LAM_TF_Msg01 Auto;
Message Property LAM_TF_Msg02 Auto;

LAM_TF_Timer Property Semaphore Auto;
LAM_Util Property util Auto;

Function Transform()
	;PlayerREF.PlaceAtMe(LAM_ExplosionTF)
	
	util.Log("Beginning Player TF code...")
	Game.EnablePlayerControls();
	LAM_TF_Msg01.Show();
	;Backup Name
	PlayerName = PlayerREF.GetActorBase().GetName();
	util.Log("Player name (" + PlayerName + ") saved!");
	
	Debug.ToggleMenus();
	;Sex
	While PlayerREF.GetActorBase().GetSex() != 1;
		;ConsoleUtil.ExecuteCommand("Player.SexChange"); ;;FIXME: Insert check for ConsoleUtil in QoL update
		
		Input.TapKey(41); ~ (open console)
		Utility.WaitMenuMode(0.01)
		Input.TapKey(25); P
		Utility.WaitMenuMode(0.01)
		Input.TapKey(38); L
		Utility.WaitMenuMode(0.01)
		Input.TapKey(30); A
		Utility.WaitMenuMode(0.01)
		Input.TapKey(21); Y
		Utility.WaitMenuMode(0.01)
		Input.TapKey(18); E
		Utility.WaitMenuMode(0.01)
		Input.TapKey(19); R
		Utility.WaitMenuMode(0.01)
		Input.TapKey(52); .
		Utility.WaitMenuMode(0.01)
		Input.TapKey(31); S
		Utility.WaitMenuMode(0.01)
		Input.TapKey(18); E
		Utility.WaitMenuMode(0.01)
		Input.TapKey(45); X
		Utility.WaitMenuMode(0.01)
		Input.TapKey(46); C
		Utility.WaitMenuMode(0.01)
		Input.TapKey(35); H
		Utility.WaitMenuMode(0.01)
		Input.TapKey(30); A
		Utility.WaitMenuMode(0.01)
		Input.TapKey(49); N
		Utility.WaitMenuMode(0.01)
		Input.TapKey(34); G
		Utility.WaitMenuMode(0.01)
		Input.TapKey(18); E
		Utility.WaitMenuMode(0.02)
		
		Input.TapKey(28); Return
		Utility.WaitMenuMode(0.02)
		Input.TapKey(41); ~ (close console)
		
		SexChanged = True;
		util.Log("Player sex changed!");
	EndWhile
	;Input.TapKey(41); ~ (open console)
		
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
	;Int RKey = Input.GetMappedKey("Ready Weapon"); May need to add support for gamepads later. Will wait for bug reports
	
	;Disable menus and then open and close RaceMenu, otherwise the normal and specular maps don't update properly for some reason and the heads gets plasticky and smooth.
	;NOTE: cannot exit naming confirmation without "Better MessageBox Controls" Installed, rendering this code inoperational without requiring an unrelated utility. Solution: Show limited race menu, let player change it if they want.
	;Utility.WaitMenuMode(0.5);
	;Game.ShowRaceMenu();
	;Utility.WaitMenuMode(10.5); 
	;Input.TapKey(RKey);Since R is only pressed once there's a chance that it gets stuck forever. So if the loop seems to be sticking it will press R.
	
	;util.Log("RaceMenu Opened from TF script.");
	;int i = 0
	;While Semaphore.RaceMenuOpen ;Uses a semaphore to figure out when the menu is actually closed to avoid artificial latency
	;	Utility.WaitMenuMode(0.3)
	;	Input.TapKey(28);
	;	util.Log("Enter key pressed " + (i+1) + " times...");
	;	i += 1
	;	If (i % 5 == 0)
	;		Input.TapKey(RKey)
	;		util.Log("R key pressed " + (i/5) + " times...");
	;	EndIf
	;EndWhile
	;util.Log("RaceMenu has closed, unhiding menus...")
	
	util.Log("setting menus to visible...");
	Debug.ToggleMenus();
	
	;Change player name
	PlayerREF.GetActorBase().SetName("Lifts-Her-Tail");
	util.Log("Player's name set to " + PlayerREF.GetActorBase().GetName() + "!");
	
	util.Log("TF main Code done running, enjoy your time as a maid!")
	
EndFunction 

Function WrapUp()
	util.Log("Tf Wrap-up code called. Displaying flavortext/hint and opening limted race menu for both geometry correction and minor cosmetic adjustments if desired.");
	
	util.FadeFromBlack()
	Utility.Wait(2.5);
	
	LAM_TF_Msg02.Show();
	
	Game.ShowLimitedRaceMenu();
	;;FIXME: Test if possible in non DG game
	While Semaphore.RaceMenuOpen
		util.Log("TF Script halted by semaphore...");
		Utility.Wait(0.1);
	EndWhile
	util.Log("Semaphore released, TF script finished");
EndFunction

Function UnTransform()
	util.Log("Player Un-Tf Beginning");
	
	PlayerREF.PlaceAtMe(LAM_ExplosionRevert)
	;name
	PlayerREF.GetActorBase().SetName(PlayerName);
	;toggle menus
	Debug.ToggleMenus();
	;sex if needed
	If SexChanged == True
			While PlayerREF.GetActorBase().GetSex() != 0;
			;ConsoleUtil.ExecuteCommand("Player.SexChange"); ;;FIXME: Insert check for ConsoleUtil in QoL update
			
			Input.TapKey(41); ~ (open console)
			Utility.WaitMenuMode(0.01)
			Input.TapKey(25); P
			Utility.WaitMenuMode(0.01)
			Input.TapKey(38); L
			Utility.WaitMenuMode(0.01)
			Input.TapKey(30); A
			Utility.WaitMenuMode(0.01)
			Input.TapKey(21); Y
			Utility.WaitMenuMode(0.01)
			Input.TapKey(18); E
			Utility.WaitMenuMode(0.01)
			Input.TapKey(19); R
			Utility.WaitMenuMode(0.01)
			Input.TapKey(52); .
			Utility.WaitMenuMode(0.01)
			Input.TapKey(31); S
			Utility.WaitMenuMode(0.01)
			Input.TapKey(18); E
			Utility.WaitMenuMode(0.01)
			Input.TapKey(45); X
			Utility.WaitMenuMode(0.01)
			Input.TapKey(46); C
			Utility.WaitMenuMode(0.01)
			Input.TapKey(35); H
			Utility.WaitMenuMode(0.01)
			Input.TapKey(30); A
			Utility.WaitMenuMode(0.01)
			Input.TapKey(49); N
			Utility.WaitMenuMode(0.01)
			Input.TapKey(34); G
			Utility.WaitMenuMode(0.01)
			Input.TapKey(18); E
			Utility.WaitMenuMode(0.02)
			
			Input.TapKey(28); Return
			Utility.WaitMenuMode(0.02)
			Input.TapKey(41); ~ (close console)
			
			util.Log("Player sex changed!");
		EndWhile
	EndIf
	
	;Change player race and load face
	util.Log("Setting race to original race the first time...");
	PlayerRef.SetRace(PlayerRace);
	Utility.Wait(0.2);
	While PlayerREF.GetRace() != PlayerRace
		Utility.Wait(0.1);No idea if this is necessary
	EndWhile
	util.Log("Race set to original race!");
	
	;Load Face
	util.Log("Loading Original face Preset...");
	CharGen.LoadPreset("LAM-" + PlayerName + "-Face");
	Utility.Wait(0.4);
	util.Log("Face loaded!");
	
	;set to race+Vampire
	;;FIXME
	util.Log("There should be a second race set to a vampire race here, but it is skipped as I currently have no way of figuring it out, a plan is in the works but if this works without it we can streamine the code further");
	
	;Set to Race
	util.Log("Setting race to original race the second time...");
	PlayerRef.SetRace(PlayerRace);
	Utility.Wait(0.2);
	While PlayerREF.GetRace() != PlayerRace
		Utility.Wait(0.1);No idea if this is necessary
	EndWhile
	util.Log("Race set to original race!");
	
	;queueninodeupdate
	PlayerREF.QueueNiNodeUpdate(); Not sure if this is actually necessary

	;showmenus
	Debug.ToggleMenus();
	;limited racemenu
	Game.ShowLimitedRaceMenu();
	
	util.Log("Un-TF Finished!")
	
	Utility.Wait(0.1);
	Game.RequestSave();
EndFunction;
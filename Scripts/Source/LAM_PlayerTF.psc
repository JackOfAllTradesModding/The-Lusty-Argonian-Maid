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
	Chargen.SavePreset("LAM-CharacterFace");
	
	;Change player race and load face
	PlayerRef.SetRace(ArgonianRace);
	Utility.Wait(0.5);
	CharGen.LoadPreset("Lifts-Her-Tail");
	Utility.Wait(0.8);
	PlayerRef.SetRace(ArgonianRaceVampire);
	Utility.Wait(0.5)
	PlayerRef.SetRace(ArgonianRace);
	Utility.Wait(0.5)
	PlayerREF.QueueNiNodeUpdate();

	;Get key for sheath
	Int RKey = Input.GetMappedKey("Ready Weapon"); May need to add support for gamepads later. Will wait for bug reports
	
	;Disable menus and then open and close RaceMenu, otherwise the normal and specular maps don't update properly for some reason
	Debug.ToggleMenus();
	Utility.WaitMenuMode(0.1);
	Game.ShowRaceMenu();
	Utility.WaitMenuMode(0.4);
	Input.TapKey(RKey);
	Utility.WaitMenuMode(0.2);
	Input.TapKey(28);
	Utility.WaitMenuMode(0.4);
	Input.TapKey(28);
	Utility.WaitMenuMode(0.1);
	Debug.ToggleMenus();
	
	;Change player name
	PlayerREF.SetName("Lifts-Her-Tail");
	
EndFunction 
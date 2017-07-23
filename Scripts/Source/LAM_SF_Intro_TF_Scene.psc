;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname LAM_SF_Intro_TF_Scene Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
KassenScript.Transform()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
LAM_Intro.SetStage(50)
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
PlayerREF.PlaceAtMe(LAM_ExplosionTF)
util.FadeToBlackAndHold()
PlayerScript.Transform()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MagicWall.Enable()
Game.SetPlayerAIDriven(False);
Game.DisablePlayerControls(True, True, False, False, True, True, True, True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LAM_Util Property util  Auto  

LAM_KassenTF Property KassenScript  Auto  

LAM_PlayerTF Property playerScript  Auto  

Quest Property LAM_Intro  Auto  

ObjectReference Property MagicWall  Auto  

Actor Property PlayerRef  Auto  

Explosion Property LAM_ExplosionTF  Auto  

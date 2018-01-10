;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname LAM_SF_Intro_TF_Scene Extends Scene Hidden

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Teleport the cultists in.
MGTeleportInEffect.Play(CultLeaderAlias.GetReference(),3.6)
CultLeaderAlias.GetActorReference().SetAlpha(1, true)
MGTeleportInEffect.Play(Cultist01Alias.GetReference(),3.6)
Cultist01Alias.GetActorReference().SetAlpha(1, true)
MGTeleportInEffect.Play(Cultist02Alias.GetReference(),3.6)
Cultist02Alias.GetActorReference().SetAlpha(1, true)
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

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
MagicWall.Enable()
;Game.SetPlayerAIDriven(False);
Game.ForceThirdPerson()
Game.DisablePlayerControls(True, True, False, False, True, True, True, True)
Debug.Trace("LAM: SCENE phase1 fragment")
CultLeaderAlias.GetReference().Enable()
Cultist01Alias.GetReference().Enable()
Cultist02Alias.GetReference().Enable()
CultLeaderAlias.GetReference().MoveTo(CultistLeaderMarker.GetReference())
Cultist01Alias.GetReference().MoveTo(Cultist01Marker.GetReference())
Cultist02Alias.GetReference().MoveTo(Cultist02Marker.GetReference())
CultLeaderAlias.GetActorReference().SetAlpha(0)
Cultist01Alias.GetActorReference().SetAlpha(0)
Cultist02Alias.GetActorReference().SetAlpha(0)
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LAM_Util Property util  Auto  

LAM_KassenTF Property KassenScript  Auto  

LAM_PlayerTF Property playerScript  Auto  

Quest Property LAM_Intro  Auto  

ObjectReference Property MagicWall  Auto  

Actor Property PlayerRef  Auto  

Explosion Property LAM_ExplosionTF  Auto  

VisualEffect Property MGTeleportInEffect  Auto  

ReferenceAlias Property CultLeaderAlias  Auto  

ReferenceAlias Property Cultist01Alias  Auto  

ReferenceAlias Property Cultist02Alias  Auto  

ReferenceAlias Property Cultist01  Auto  ;Deprecated please ignore

ReferenceAlias Property Cultist01Marker Auto

ReferenceAlias Property Cultist02Marker Auto

ReferenceAlias Property CultistLeaderMarker Auto

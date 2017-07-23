Scriptname LAM_Util extends Quest  
{Handles some utility functions for The Lusty Argonian Maid}


ImageSpaceModifier Property FadeToBlackImod Auto;
ImageSpaceModifier Property FadeToBlackHoldImod Auto;
ImageSpaceModifier Property FadeToBlackBackImod Auto;

;FADE IN AND OUT, now using quick properties and exclusively vanillla assets.

; Fades the screen to black and holds it there.  Call FadeFromBlack() to reverse it.
Function FadeToBlackAndHold()
    FadeToBlackImod.Apply()
    Utility.Wait(2)
    FadeToBlackImod.PopTo(FadeToBlackHoldImod)
EndFunction

; Fades the screen from black back to normal.  Reverses the effects of FadeToBlackAndHold().
Function FadeFromBlack()
    Utility.Wait(2)
    FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
    FadeToBlackHoldImod.Remove()
EndFunction

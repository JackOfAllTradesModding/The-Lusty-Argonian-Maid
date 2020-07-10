ScriptName LAM_ChoreLaundryScript Extends Quest Conditional
{Stores some specfic data to be referenced by conditions in this quest and dialogue}

Bool Property OrgnarSpokeToPlayer Auto Conditional
{Determines if player did laundry by self or Orgnar thanked them for doing it}

Int Property LaundryCount Auto Conditional
{Keeps track of how many pieces of laundry actually need to be cleaned}
;TODO
;Properties for if laundry got wet
;Properties for if something else went wrong
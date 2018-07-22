Scriptname Davis:M60_Test:Setup extends Quest

Actor Player
bool Silent = true const

; Events
;---------------------------------------------

Event OnInit()
	Player = Game.GetPlayer()
EndEvent


Event OnQuestInit()
	Try(M60, M60Machinegun)
	Try(M60, Ammo308CaliberTracerRed, 600)
	Try(Fallout4, Ammo308Caliber, 600)
	Try(Fallout4, Ammo556, 600)
EndEvent


; Functions
;---------------------------------------------

Function Try(string plugin, int formID, int amount = 1)
	If (Game.IsPluginInstalled(plugin))
		Form item = Game.GetFormFromFile(formID, plugin)
		If (item)
			Player.AddItem(item, amount, Silent)
		EndIf
	EndIf
EndFunction


; Properties
;---------------------------------------------

Group Vanilla
	string Property Fallout4 = "Fallout4.esm" AutoReadOnly
	int Property Ammo308Caliber = 0x0001F66B AutoReadOnly
	{Ammo308Caliber ".308 Round" [AMMO:0001F66B]}
	int Property Ammo556 = 0x0001F278 AutoReadOnly
	{Ammo556 "5.56 Round" [AMMO:0001F278]}
EndGroup

Group M60
	string Property M60 = "M60.esp" AutoReadOnly
	int Property M60Machinegun = 0x00001F2D AutoReadOnly
	{M60Machinegun "M60 Light Machinegun" [WEAP:00001F2D]}
	int Property Ammo308CaliberTracerRed = 0x000088E4 AutoReadOnly
	{Ammo308CaliberTracerRed ".308 Round" [AMMO:000088E4]}
EndGroup

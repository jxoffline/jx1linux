----------------------------------------------------------------
--FileName:	npcdeath.lua
--Creater:	firefox
--Date:		2005-11-25
--Comment:	ÖÜÄ©»î¶¯£ºÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³Ç
--			¹¦ÄÜ£ºÊØ³Ç·½Ê¿±ø¡¢½«¾üËÀÍö½Å±¾
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")

function OnDeath(nNpcIndex)
	SetMissionV( MS_SHOUCHENGWEIBING, GetMissionV( MS_SHOUCHENGWEIBING ) - 1 )
	if (rank == 2) then
		SetMissionV( MS_SHOUCHENGJIANGJUN, GetMissionV( MS_SHOUCHENGJIANGJUN ) - 1)
		Msg2MSAll(MISSIONID, "Thñ thµnh chiÕn b¸o:<color=pink>1 tªn T­íng qu©n thñ thµnh bªn ta tö trËn.")
	end
	if (GetMissionV( MS_SHOUCHENGJIANGJUN ) <= 0) then
		Msg2MSAll(MISSIONID, "Thñ thµnh chiÕn b¸o:<color=pink>T­íng sÜ thñ thµnh cña ta ®Òu tö trËn.")
		CloseMission( MISSIONID )
	end
end
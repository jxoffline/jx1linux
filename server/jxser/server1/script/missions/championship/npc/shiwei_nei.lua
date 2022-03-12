Include("\\script\\missions\\championship\\head.lua")
--»á³¡ÊÌÎÀ
RUN_A_TIME = 5
UP_A_TIME = 15
function main()
	local mm = RUN_A_TIME - GetMissionV(5)
	if (mm < 0) then
		local mm = UP_A_TIME - GetMissionV(5)
		Say("<#> ThŞ vÖ héi tr­êng: Vßng thi ®Êu nµy cßn"..mm.."<#> phót, ng­¬i cßn viÖc g× kh«ng?", 3,"Hç trî thi ®Êu dù tuyÓn M«n ph¸i/help_tryout","Ta muèn rêi khái ®©y!/out_trap","Kh«ng cÇn!/OnCancel")
		return
	end
	Say("<#> ThŞ vÖ héi tr­êng: Vßng thi ®Êu nµy cßn"..mm.."<#> phót sÏ b¾t ®Çu, ng­¬i cßn viÖc g× kh«ng?", 3,"Hç trî thi ®Êu dù tuyÓn M«n ph¸i/help_tryout","Ta muèn rêi khái ®©y!/out_trap","Kh«ng cÇn!/OnCancel")
end

function out_trap()
	local mm = RUN_A_TIME - GetMissionV(5)
	if(mm < 0) then
		Say("<#> ThŞ vÖ héi tr­êng: B©y giê rêi khái th× ph¶i chê ®Õn ®ît, b¹n x¸c nhËn muèn rêi khái ®©y ­? ", 2, "Ta muèn rêi khái!/sure_trap", "Kh«ng cÇn!/OnCancel")
		return
	end
	Say("TrËn ®Êu vßng nµy lËp tøc b¾t ®Çu, b¹n cßn muèn bá ®i sao?", 2, "Ta muèn rêi khái!/sure_trap", "Kh«ng cÇn!/OnCancel")
end;

function sure_trap()
	if (nt_gettask(CP_TASKID_ENEMY) > 0) then
		return
	end
	camp = GetCamp();
	SetCurCamp(camp);
	SetLogoutRV(0);
	SetCreateTeam(1);
	SetFightState(0)
	SetPunish(1)
	ForbidChangePK(0);
	SetPKFlag(0)
	tryout_mapid = SubWorldIdx2ID(SubWorld)
	Msg2Player("B¹n ®· rêi khái trËn dù tuyÓn")
	DelMSPlayer(18, PlayerIndex, 1)
	NewWorld(tryout_mapid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
end

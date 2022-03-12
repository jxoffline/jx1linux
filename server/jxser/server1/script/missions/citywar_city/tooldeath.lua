Include("\\script\\missions\\citywar_city\\head.lua");

function OnDeath(DeathIndex)
	WriteLog(GetLoop().."C«ng cô nµo ®ã bÞ chÕt "..DeathIndex)
	for i  = 1, g_nMaxTscPerDoor * g_nDoorCount do 
		if ( DeathIndex == GetMissionV(MS_TSCBEGIN + i  - 1		)) then
			SetMissionV(MS_TSCBEGIN + i - 1, 0)
			Msg2MSAll(MISSIONID, "Dông cô c«ng thµnh Hçn Th¹ch LiÖt ®· bÞ phe thñ thµnh ph¸ hñy. ");
			WriteLog("Dông cô c«ng thµnh Hçn Th¹ch LiÖt ®· bÞ phe thñ thµnh ph¸ hñy. ")
			return
		end;
	end;
	
	for i  = 1, g_nMaxGccPerDoor * g_nDoorCount do 
		if ( DeathIndex == GetMissionV(MS_GCCBEGIN + i  - 1		)) then
			SetMissionV(MS_GCCBEGIN + i - 1, 0)
			Msg2MSAll(MISSIONID, "Dông cô c«ng thµnh NghiÖt Long Xung Xa ®· bÞ phe thñ thµnh ph¸ hñy. ");
			WriteLog("Dông cô c«ng thµnh NghiÖt Long Xung Xa ®· bÞ phe thñ thµnh ph¸ hñy. ");
			return
		end;
	end;
	
	for i  = 1, g_nMaxToolCount do 
		if (DeathIndex == GetMissionV(MS_TOOLBEGIN + i - 1 )) then
		SetMissionV(MS_TOOLBEGIN + i - 1, 0)
		Msg2MSAll(MISSIONID, "Mét binh sÜ phô trî thñ thµnh ®· anh dòng hy sinh. ");
		WriteLog("Mét binh sÜ phô trî thñ thµnh ®· anh dòng hy sinh. ")
		return
		end;
	end;
end;
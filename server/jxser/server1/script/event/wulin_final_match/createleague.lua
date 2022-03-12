Include("\\script\\event\\wulin_final_match\\ticketinfo.lua")
Include("\\script\\event\\wulin_final_match\\query.lua")
IncludeLib("LEAGUE")

function wl_OnCreateLeague(leaguename, membername, result)
	if (result == 0) then
		Say("Xin lçi! LËp nhãm chiÕn ®Êu ®· thÊt b¹i. Vui lßng bè trÝ l¹i!",0)
	else
		Say("Chóc mõng ng­¬i lËp nhãm chiÕn ®Êu thµnh c«ng!",0)
	end
end

function wl_createfactionleague()
	if (GetLastFactionNumber() == 0) then
		Say("Xin lçi! TuyÓn thñ kh«ng cã m«n ph¸i kh«ng thÓ tham gia tû ®Êu nµo.",0)
		return 
	end
	wl_createleague(GetLastFactionNumber())
end

function wl_createleague(matchtype)
	local zoneid = wl_zonename2zoneid(GetTong())
	if (zoneid == 0) then
		Say("Xin lçi! Ph¶i lµ tuyÓn thñ cña khu vùc thi ®Êu míi cã thÓ b¸o danh tham gia tû ®Êu!",0)
		return
	end
	local szParam = GetName().." "..matchtype.." "..GetTong().." "..(GetLastFactionNumber()+1)
	LG_ApplyDoScript(matchtype, "", GetName(), "\\script\\wulin_relay_createleague.lua", "main", szParam , "\\script\\event\\wulin_final_match\\createleague.lua", "wl_OnCreateLeague")
end


function wl_sureaddmember(matchtype)
	local leadertong = GetTong()
	local zoneid = wl_zonename2zoneid(leadertong)
	if (zoneid == 0) then
		Say("Xin lçi! Ph¶i lµ tuyÓn thñ cña khu vùc thi ®Êu míi cã thÓ b¸o danh tham gia tû ®Êu!",0)
		return
	end
	local lid = LG_GetLeagueObjByRole(matchtype + 10, GetName() )
	if (FALSE(lid)) then
		return
	end
	leaguename, time, count = LG_GetLeagueInfo(lid)
	print(count .. "   "..TAB_TICKETINFO[matchtype][4])
	if (count >= TAB_TICKETINFO[matchtype][4]) then
		Say("Xin lçi! Sè ng­êi trong ®éi cña b¹n ®· ®ñ, kh«ng thÓ thªm ng­êi n÷a!",0)
		return
	end
	
	OldPlayer= PlayerIndex
	for i= 2 , GetTeamSize() do 
		 PlayerIndex = GetTeamMember(i) 
		 local membertong = GetTong()
		 if (leadertong ~= membertong) then
		 	local membername = GetName()
		 	PlayerIndex = OldPlayer
		 	Say("Xin lçi! Thµnh viªn: "..membername.." kh¸c khu vùc nªn kh«ng thÓ gia nhËp ®éi! Thao t¸c thÊt b¹i!", 0)
		 	return
		end
	end
	
	for i= 2 , GetTeamSize() do 
		 PlayerIndex = GetTeamMember(i) 
		 local szParam = GetName().." "..matchtype.." "..GetTong().." "..GetLastFactionNumber().." "..leaguename
  	 	LG_ApplyDoScript(matchtype, "", GetName(), "\\script\\wulin_relay_createleague.lua", "wl_relay_addmembermain", szParam, "\\script\\event\\wulin_final_match\\createleague.lua", "wl_OnCreateLeague")
	end
	
	PlayerIndex = OldPlayer
end

function wl_league_addmember()
	if (IsCaptain() ~= 1) then
		Say("Xin lçi! Ph¶i lµ ®éi tr­ëng míi cã thÓ mêi ®éi viªn gia nhËp chiÕn ®éi.",0)
		return
	end
	
	local bDouble = 0
	local lid = 0;
--	if (GetTask(TK_WL_ISDOUBLELEADER) > 0 ) then
		lid = LG_GetLeagueObjByRole(TAB_TICKETINFO[11][7], GetName())
		if (lid > 0) then
			for m = 1, LG_GetMemberCount(lid) do 
				name, job = LG_GetMemberInfo(lid , m - 1)--?
				if (name == GetName() ) then
					if (job == 1) then
						bDouble = 1
					else
						bDouble = 0
						break
					end
				end
			end	
		end	
--	end
	
	local bFive = 0;
--	if (GetTask(TK_WL_ISFIVELEADER) > 0) then
		lid = LG_GetLeagueObjByRole(TAB_TICKETINFO[12][7], GetName())
		print("find find five")
		if (lid > 0) then
			print("five")
			for m = 1, LG_GetMemberCount(lid) do 
				name, job = LG_GetMemberInfo(lid , m - 1)--?
				if (name == GetName() ) then
					if (job == 1) then
						bFive = 1
						print("job1")
					else
						bFive = 0
						print("job0")
						break
					end
				end
			end
		end
--	end
	
	local bTen = 0;
--	if (GetTask(TK_WL_ISTENLEADER) > 0) then
		lid = LG_GetLeagueObjByRole(TAB_TICKETINFO[13][7], GetName())
		if (lid > 0) then
			for m = 1, LG_GetMemberCount(lid) do 
				name, job = LG_GetMemberInfo(lid , m - 1)--?
				if (name == GetName() ) then
					if (job == 1) then
						bTen = 1
					else
						bTen = 0
						break
					end
				end
			end
		end
--	end
	
	local bSixTeen = 0;
--	if (GetTask(TK_WL_ISSIXTEEN) > 0) then
		lid = LG_GetLeagueObjByRole(TAB_TICKETINFO[14][7], GetName())
		if (lid > 0) then
			for m = 1, LG_GetMemberCount(lid) do 
				name, job = LG_GetMemberInfo(lid , m - 1)--?
				if (name == GetName() ) then
					if (job == 1) then
						bSixTeen = 1
					else
						bSixTeen = 0
						break
					end
				end
			end
		end
--	end
	
	if (bDouble == 0 and bFive == 0 and bTen == 0 and bSixTeen == 0) then
		Say("Xin lçi! B¹n ch­a x©y dùng bÊt cø chiÕn ®éi nµo, kh«ng thÓ mêi ng­êi ch¬i kh¸c gia nhËp", 0)
		return 
	end
	
	local teamsize = GetTeamSize()
	if (teamsize < 2) then
		Say("§éi cña ng­¬i kh«ng cã thµnh viªn. Muèn mêi ai gia nhËp vËy?",0)
		return
	end

	
	local str = "Ng­¬i cã muèn "..(GetTeamSize()-1).." gia nhËp vµo ®éi ngò thi ®Êu cña m×nhkh«ng?";
	OldPlayer= PlayerIndex
	for i= 2 , GetTeamSize() do 
		 PlayerIndex = GetTeamMember(i)
		 str = str .."<color=yellow> "..GetName();
	end
	PlayerIndex = OldPlayer
	local tableague = {};
	local ncurcount = 1;
	if (bDouble > 0) then
		tableague[ncurcount] = "§ång ý! Mêi tham gia Song ®Êu./#wl_sureaddmember(11)"
		ncurcount = ncurcount + 1
	end
	if (bFive > 0) then
		tableague[ncurcount] = "§ång ý! Mêi tham gia Ngò hµnh ®Êu./#wl_sureaddmember(12)"
		ncurcount = ncurcount + 1
	end
	if (bTen > 0) then
		tableague[ncurcount] = "§ång ý! Mêi tham gia ThËp toµn ®Êu./#wl_sureaddmember(13)"
		ncurcount = ncurcount + 1
	end
	if (bSixTeen > 0) then
		tableague[ncurcount] = "§ång ý! Mêi tham gia ThËp lôc ®Êu./#wl_sureaddmember(14)"
		ncurcount = ncurcount + 1
	end
		
		tableague[ncurcount] = "Kh«ng cÇn!/OnCancle";
	 
	
	Say(str, getn(tableague), tableague)

end
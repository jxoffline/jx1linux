Include("\\script\\missions\\freshman_match\\head.lua")
LINAN = 176
function CallFaction5List()
	if (SubWorldID2Idx(LINAN) < 0) then
		return
	end
	local deadline = tonumber(date("%y%m%d%H"))
	if (deadline >= CP_END_TRYOUT) then
		OnCreateFaction5List()
	end
end
function OnCreateFaction5List()
	local tabname = {}
	for j = 1, 10 do
		biwu_loadfile(FactionData[j][1])
		name = biwu_getdata(FactionData[j][1], FactionData[j][2], "Top"..1);
		if(name == "") then
			tabname = SetFactionTop5( 10130+j, FactionData[j][1], FactionData[j][2]);
			if (tabname ~= nil) then
				local strtalk = "Chóc mõng"..FactionData[j][3].."5 tuyÓn thñ ®øng ®Çu thi ®Êu kiÖt xuÊt m«n ph¸i:"..tabname[1]..","..tabname[2]..","..tabname[3]..","..tabname[4]..","..tabname[5]
				AddGlobalNews(strtalk)
				strtalk = date("%Y-%m-%d-%H:%M")..","..strtalk
				WriteLog(strtalk)
			end
		end
	end
end

function SetFactionTop5(LadderId, FileName, Section)
	local factop_name = {}
	local ncount = 0
	for i = 1, 5 do
		RoleName, Data = Ladder_GetLadderInfo(LadderId, i);
		if (RoleName ~= "" ) then
			factop_name[i] = RoleName
			biwu_setdata(FileName, Section, "Top"..i, RoleName);
			biwu_save(FileName);
			ncount = ncount + 1
		else
			factop_name[i] = ""
		end
	end

	if (ncount == 0) then
		return nil
	end
	return factop_name
end

Include("\\script\\missions\\championship\\head.lua")
LINAN = 176
function CallBest10List()
	if (SubWorldID2Idx(LINAN) < 0) then
		return
	end
	local deadline = tonumber(date("%y%m%d%H"))
	if (deadline >= CP_BEGIN_BID_DATE) then
		OnCreateBest10List()
	end
end
function OnCreateBest10List()
	local tabname = {}
	biwu_loadfile(LEVELTOP10)
	name, value = biwu_getdata(LEVELTOP10,"LevelTop10","Top1")
	if (name ~= "" ) then
		return
	end
	
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(1, i);
		if ( RoleName ~= "" and Data > 0) then
			tabname[i] = RoleName
			biwu_setdata(LEVELTOP10, "LevelTop10", "Top"..i, RoleName);
			biwu_setdata(LEVELTOP10, "LevelTop10", tostring("Top"..i.."Level"), Data);
			biwu_save(LEVELTOP10);
		end
	end
	local strtalk = "Chóc mõng Vâ l©m ®¹i héi xuÊt hiÖn ThËp ®¹i cao thñ:"..tabname[1]..", "..tabname[2]..", "..tabname[3]..", "..tabname[4]..", "..tabname[5]..", "..tabname[6]..", "..tabname[7]..", "..tabname[8]..", "..tabname[9]..", "..tabname[10]
	AddGlobalCountNews(strtalk, 3)
	strtalk = date("%Y-%m-%d-%H:%M")..","..strtalk
	WriteLog(strtalk)
end
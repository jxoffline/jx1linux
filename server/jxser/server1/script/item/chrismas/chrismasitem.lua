Include("\\script\\lib\\common.lua")
Include("\\script\\missions\\racegame\\lib.lua")
TAB_ACTION = 
{--{地图、missionid、grouptaskid、maxplayercount、是否为打年兽活动、{经验倍数、经验时间}、遁地符乾坤挪移符文件}
	{583, 28, 2330, 10, {0}, 10, {2331, 2332}, [[\settings\maps\chrismas\player.txt]], 12},
	{822, 38, 2399, 10, {0}, 10, {2400, 2401}, [[\settings\maps\chrismas\player.txt]], 12},
	{824, 40, 2399, 10, {1, 19}, 10, {2410, 2411}, [[\settings\maps\springfestival2006\player.txt]], 19},
	-- LLG_ALLINONE_TODO_20070802
	{585, 31, 1130, 10, {1, 19}, 10, {1131, 1132}, [[\settings\maps\springfestival2006\player.txt]], 19},
	{828, 45, 2399, 10, {0}, 10, {0, 0}, [[\settings\maps\dragonboatfestival_06\player.txt]], 23},
	{826, 43, 2430, 10, {0}, 10, {0, 0}, [[\settings\maps\dragonboatfestival_06\player.txt]], 23},
}

RACE_TAB_ACTION =
{
	{nMapId = 863, nMissionId = 53, pPosList = [[\settings\battles\maps\river\outside.txt]]}
}


--检查道具是否可以被使用
function itemmapcheck(TAB_ACTION)
	if (TAB_ACTION == nil or type(TAB_ACTION) ~= "table") then
		return 0;
	end;
    local ww, xx, yy = GetWorldPos();
    for i = 1, getn(TAB_ACTION) do
	    if (TAB_ACTION[i][1] == ww) then
	    	return i;
	    end;
	end;
    return 0;
end;

--新表查询
function race_ItemMapCheck()
	if (RACE_TAB_ACTION == nil or type(RACE_TAB_ACTION) ~= "table") then
		return 0;
	end;
    local ww, xx, yy = GetWorldPos();
    for i = 1, getn(RACE_TAB_ACTION) do
	    if (RACE_TAB_ACTION[i].nMapId == ww) then
	    	return i;
	    end;
	end;
    return 0;
end


--检查该玩家是否仍在游戏中，成功返回PlayerIndex否则返回nil
function check_pl(szPlayName, nMissionID)
	local nPlIdx = SearchPlayer(szPlayName)	--玩家是否在当前服务器
	if (nPlIdx > 0) then
		local nPlMsIdx = PIdx2MSDIdx(nMissionID, nPlIdx)	--玩家是否在指定Mission中
		if (nPlMsIdx > 0) then
			return nPlIdx
		end
	end
end

--生成一个相对于当前玩家的选项
function make_option(szFunName)
	local szName = GetName()
	return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
end

--找到对立阵营，年兽——>玩家，玩家——>年兽
function getgroupid(nGroupId, SMALLMAPCOUNT)
    if (nGroupId < 1) then
        return nil
    end;
    
    if (nGroupId > SMALLMAPCOUNT) then
        return nGroupId - SMALLMAPCOUNT;
    else
        return nGroupId + SMALLMAPCOUNT;
    end;
end;
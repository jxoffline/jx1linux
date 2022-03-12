IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua");

function main(battleid, mapid, ruleid, level, seriesid)
oldSubWorld = SubWorld
	if (GetGlbValue(GLB_FORBIDBATTLE) == 1) then 
		print("any battle would be forbided, so this battle is ignored.");
		return
	end

	SetGlbValue(GLB_BATTLESTATE, 1) --设置该全局变量为1，标志当前服务器正处于宋金战役阶段，此时襄阳或朱仙镇的出口点自动设在宋金战役的报名点，否则则设在原宋金战场地图
	idx = SubWorldID2Idx(mapid);
	if (idx == -1) then 
		return
	end;
	if (level < 1 or level > 3) then
		print("battle level must 1 to 3, but now is "..level..", so it is error!");
		return
	end;
	battlekey = random(100000)
	signidx = SubWorldID2Idx(tbGAME_SIGNMAP[level]);

	SubWorld = idx
	round = BT_GetGameData(GAME_ROUND)

	if (signidx >= 0) then
		SubWorld = signidx
		BT_SetGameData(GAME_KEY, battlekey) --存放本次战役的Key号
		BT_SetGameData(GAME_BATTLEID, battleid);
		BT_SetGameData(GAME_MAPID, mapid);
		BT_SetGameData(GAME_RULEID, ruleid);
		BT_SetGameData(GAME_LEVEL, level)
		BT_SetGameData(GAME_BATTLESERIES, seriesid)
		BT_SetGameData(GAME_ROUND, round)
	end
		
	SubWorld = idx;
	--设置该战局的数据
	BT_SetGameData(GAME_KEY, battlekey) --存放本次战役的Key号
	BT_SetGameData(GAME_BATTLEID, battleid);
	BT_SetGameData(GAME_MAPID, mapid);
	BT_SetGameData(GAME_RULEID, ruleid);
	BT_SetGameData(GAME_LEVEL, level);
	BT_SetGameData(GAME_BATTLESERIES, seriesid)
	OpenMission(ruleid);
	local logstr_d = "Battle Start :"..battleid.."rule"..ruleid.."Issue"..seriesid;
	print(logstr_d);
	WriteLog(logstr_d);
	SubWorld = oldSubWorld
end;

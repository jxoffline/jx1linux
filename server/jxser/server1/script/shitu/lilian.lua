Include ("\\script\\shitu\\shitu_head.lua")
Include ("\\script\\lib\\player.lua")
Include ("\\script\\lib\\string.lua")
Include ("\\script\\shitu\\lilianappbonus.lua")
Include ("\\script\\shitu\\lilianmasterbonus.lua")

--ºÏ≤È¿˙¡∑±Ìlilian÷–£¨¿˙¡∑œÓtagLilian «∑Ò“—æ≠ÕÍ≥…
function CheckLilianItem(tagLilian,lilian)
	if(not tagLilian) then
		return
	end
	local seg,off = floor(tagLilian/32)+1,mod(tagLilian,32)+1
	if(not lilian[seg]) then
		return nil
	end
	if(GetBit(lilian[seg],off)==1) then
		return 1;
	end

	if (getLilianLeagueMemTask(GetName(),tagLilian) == 1) then
		return 1;
	end;

	return nil
end

--…Ë÷√¿˙¡∑±Ìlilian÷–£¨¿˙¡∑œÓtagLilian“—æ≠ÕÍ≥…
function SetLilianItem(tagLilian,lilian)
	print("Call SetLilianItem("..tostring(tagLilian)..","..tostring(lilian)..")")
	local seg,off = floor(tagLilian/32)+1,mod(tagLilian,32)+1
	if(not lilian[seg]) then
		lilian[seg] = 0
	end
	lilian[seg] = SetBit(lilian[seg],off,1)
	
	return lilian
end

--º∆À„¿˙¡∑±Ìlilian÷–ÕÍ≥…µƒ¿˙¡∑ ˝
function ComputeLilianCount(lilian)
	local ret = 0
	for k,v in LILIAN_ITEM do
		if(CheckLilianItem(k,lilian)) then
			ret = ret + 1
		end
	end
	return ret
end

function GetLilianCount()
	return GetPlayerLilianCount(PlayerIndex)
end

function GetPlayerLilianCount(pid)
	local ptask = {}
	for i=1,CONST_LILIAN_MEM_WIDTH do
		ptask[i] = TKID_SELF_LILIAN+i-1
	end
	local player = getPlayerInfo(pid,nil,ptask)
	local lilian = {}
	for i=1,CONST_LILIAN_MEM_WIDTH do
		lilian[i] = player.task[TKID_SELF_LILIAN+i-1]
	end
	return ComputeLilianCount(lilian)
end

function GetMasterLilianCount()
	return GetPlayerMasterLilianCount(PlayerIndex)
end

function GetPlayerMasterLilianCount(pid)
	local ptask = {}
	for i=1,CONST_LILIAN_MEM_WIDTH do
		ptask[i] = TKID_MASTER_LILIAN+i-1
	end
	local player = getPlayerInfo(pid,nil,ptask)
	local lilian = {}
	for i=1,CONST_LILIAN_MEM_WIDTH do
		lilian[i] = player.task[TKID_MASTER_LILIAN+i-1]
	end
	return ComputeLilianCount(lilian)
end

function PayLilianBonus(appIdx,masterIdx)
	if(FALSE(appIdx) or FALSE(masterIdx)) then
		sendMessage(appIdx,"Kh´ng bi’t tung t›ch ÆËi ph≠¨ng.")
		sendMessage(masterIdx,"Kh´ng bi’t tung t›ch ÆËi ph≠¨ng.")
		return
	end
	local masterLilian,bonusLilian = GetPlayerMasterLilian(appIdx),GetPlayerBonusLilian(appIdx)
	for k,v in LILIAN_ITEM do
		if(CheckLilianItem(k,masterLilian) and not CheckLilianItem(k,bonusLilian)) then
			--ø…“‘∑¢Ω±
			sendMessage(appIdx,"ChÛc mıng bπn hoµn thµnh<color=>"..toColor(0,255,255)..">"..LILIAN_ITEM[k].."<color>nhi÷m vÙ kinh nghi÷m giang hÂ.")
			PayApprenticeBonus(appIdx,k)
			sendMessage(masterIdx,"ChÛc mıng!"..callPlayerFunction(appIdx,GetName).."Bπn Æ∑ hoµn thµnh<color=>"..toColor(0,255,255)..">"..LILIAN_ITEM[k].."<color>nhi÷m vÙ kinh nghi÷m giang hÂ.")
			PayMasterBonus(appIdx, masterIdx,k)
			bonusLilian = SetLilianItem(k,bonusLilian)
			setLilianLeagueMemTask(callPlayerFunction(appIdx,GetName), k);
		end
	end
	SetPlayerBonusLilian(appIdx,bonusLilian)
	return
end

--∏¸–¬ÕÊº“pidµƒ¿˙¡∑
function UpdatePlayerLilian(pid)
	print("Call UpdatePlayerLilian("..pid..").")
	if(FALSE(pid)) then
		print("pid == 0")
		return
	end
	local selfLilian,masterLilian = GetPlayerLilian(pid),GetPlayerMasterLilian(pid)
	for k,v in LILIAN_ITEM do
		if(not CheckLilianItem(k,selfLilian) and CheckPlayerLilian(pid,k)) then
			selfLilian = SetLilianItem(k,selfLilian)
			masterLilian = SetLilianItem(k,masterLilian)
		end
	end
	SetPlayerLilian(pid,selfLilian)
	SetPlayerMasterLilian(pid,masterLilian)
	return
end

--≤Èø¥pid µƒ¿˙¡∑tagLilian  «∑ÒÕÍ≥…
function CheckPlayerLilian(pid,tagLilian)
	if(FALSE(pid)) then
		return nil
	end
	if(tagLilian == CONST_LLITEM_JOINPARTY) then --º”»Î√≈≈…
		local player = getPlayerInfo(pid,{"faction"})
		if(player.faction ~= -1) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_YESOUTASK) then --“∞€≈»ŒŒÒ10¥Œ“‘…œ
		local player = getPlayerInfo(pid,nil,{1035,1020})
		if(player.task[1035]>0 or GetByte(GetTask(player.task[1020],3))>0 ) then
			return 1
		end
		if(GetByte(player.task[1020],1) >9) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_ZHENGPAI20) then
		local player = getPlayerInfo(pid,nil,{1001})
		if(player.task[1001] >= 60) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_ZHONGLI20) then
		local player = getPlayerInfo(pid,nil,{1002})
		if(player.task[1002] >= 60) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_XIEPAI20) then
		local player = getPlayerInfo(pid,nil,{1003})
		if(player.task[1003] >= 100) then
			return 1
		end
		return nil
	end
	--30÷˜œﬂ»ŒŒÒ
	if(tagLilian == CONST_LLITEM_ZHENGPAI30) then
		local player = getPlayerInfo(pid,nil,{1001})
		if(player.task[1001] >= 130) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_ZHONGLI30) then
		local player = getPlayerInfo(pid,nil,{1002})
		if(player.task[1002] >= 110) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_XIEPAI30) then
		local player = getPlayerInfo(pid,nil,{1003})
		if(player.task[1003] >= 170) then
			return 1
		end
		return nil
	end
	--40÷˜œﬂ»ŒŒÒ
	if(tagLilian == CONST_LLITEM_ZHENGPAI40) then
		local player = getPlayerInfo(pid,nil,{1001})
		if(player.task[1001] >= 200) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_ZHONGLI40) then
		local player = getPlayerInfo(pid,nil,{1002})
		if(player.task[1002] >= 180) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_XIEPAI40) then
		local player = getPlayerInfo(pid,nil,{1003})
		if(player.task[1003] >= 230) then
			return 1
		end
		return nil
	end
	--50º∂÷˜œﬂ
	if(tagLilian == CONST_LLITEM_ZHENGPAI50) then
		local player = getPlayerInfo(pid,nil,{1001})
		if(player.task[1001] >= 270) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_ZHONGLI50) then
		local player = getPlayerInfo(pid,nil,{1002})
		if(player.task[1002] >= 240) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_XIEPAI50) then
		local player = getPlayerInfo(pid,nil,{1003})
		if(player.task[1003] >= 360) then
			return 1
		end
		return nil
	end
	--60º∂÷˜œﬂ
	if(tagLilian == CONST_LLITEM_ZHENGPAI60) then
		local player = getPlayerInfo(pid,nil,{1001})
		if(player.task[1001] >= 320) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_ZHONGLI60) then
		local player = getPlayerInfo(pid,nil,{1002})
		if(player.task[1002] >= 310) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_XIEPAI60) then
		local player = getPlayerInfo(pid,nil,{1003})
		if(player.task[1003] >= 430) then
			return 1
		end
		return nil
	end
	--ÀŒΩ
	if(tagLilian == CONST_LLITEM_SONGJIN) then
		local player = getPlayerInfo(pid,nil,{747})
		if(player.task[747]>999) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_LEVEL60) then
		local player = getPlayerInfo(pid,{"level"})
		if(player.level >=60) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_LEVEL65) then
		local player = getPlayerInfo(pid,{"level"})
		if(player.level >=65) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_LEVEL70) then
		local player = getPlayerInfo(pid,{"level"})
		if(player.level >=70) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_LEVEL75) then
		local player = getPlayerInfo(pid,{"level"})
		if(player.level >=75) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_LEVEL76) then
		local player = getPlayerInfo(pid,{"level"})
		if(player.level >=76) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_LEVEL77) then
		local player = getPlayerInfo(pid,{"level"})
		if(player.level >=77) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_LEVEL78) then
		local player = getPlayerInfo(pid,{"level"})
		if(player.level >=78) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_LEVEL79) then
		local player = getPlayerInfo(pid,{"level"})
		if(player.level >=79) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_LEVEL80) then
		local player = getPlayerInfo(pid,{"level"})
		if(player.level >=80) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_SKILL10UP5) then-- "±æ√≈10º∂Œ‰π¶Ã·…˝µΩ5º∂“‘…œ",
		local party = callPlayerFunction(pid,GetLastFactionNumber)
		if(party ==-1) then
			return nil
		end
		for i=1,getn(SKILLS[party+1][10]) do
			local lvl = callPlayerFunction(pid,HaveMagic,SKILLS[party+1][10][i])
			if(lvl >=5) then
				return 1
			end
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_SKILL10UP15) then-- "±æ√≈10º∂Œ‰π¶Ã·…˝µΩ15º∂“‘…œ",
		local party = callPlayerFunction(pid,GetLastFactionNumber)
		if(party ==-1) then
			return nil
		end
		for i=1,getn(SKILLS[party+1][10]) do
			local lvl = callPlayerFunction(pid,HaveMagic,SKILLS[party+1][10][i])
			if(lvl >=15) then
				return 1
			end
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_GETSKILL30) then-- "œ∞µ√±æ√≈30º∂Œ‰π¶",
		local party = callPlayerFunction(pid,GetLastFactionNumber)
		if(party ==-1) then
			return nil
		end
		for i=1,getn(SKILLS[party+1][30]) do
			local lvl = callPlayerFunction(pid,HaveMagic,SKILLS[party+1][30][i])
			if(lvl ~= -1) then
				return 1
			end
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_GETSKILL40) then-- "œ∞µ√±æ√≈40º∂Œ‰π¶",
		local party = callPlayerFunction(pid,GetLastFactionNumber)
		if(party ==-1) then
			return nil
		end
		for i=1,getn(SKILLS[party+1][40]) do
			local lvl = callPlayerFunction(pid,HaveMagic,SKILLS[party+1][40][i])
			if(lvl ~= -1) then
				return 1
			end
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_GETSKILL50) then-- "œ∞µ√±æ√≈50º∂Œ‰π¶",
		local party = callPlayerFunction(pid,GetLastFactionNumber)
		if(party ==-1) then
			return nil
		end
		for i=1,getn(SKILLS[party+1][50]) do
			local lvl = callPlayerFunction(pid,HaveMagic,SKILLS[party+1][50][i])
			if(lvl ~= -1) then
				return 1
			end
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_GETSKILL60) then-- "œ∞µ√±æ√≈60º∂Œ‰π¶",
		local party = callPlayerFunction(pid,GetLastFactionNumber)
		if(party ==-1) then
			return nil
		end
		for i=1,getn(SKILLS[party+1][60]) do
			local lvl = callPlayerFunction(pid,HaveMagic,SKILLS[party+1][60][i])
			if(lvl ~= -1) then
				return 1
			end
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_SKILL60UP3) then-- "œ∞µ√±æ√≈60º∂Œ‰π¶",
		local party = callPlayerFunction(pid,GetLastFactionNumber)
		if(party ==-1) then
			return nil
		end
		for i=1,getn(SKILLS[party+1][60]) do
			local lvl = callPlayerFunction(pid,HaveMagic,SKILLS[party+1][60][i])
			if(lvl >=3 ) then
				return 1
			end
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_JOINTONG) then --º”»ÎµΩ“ª∏ˆ∞Ô≈…
		local tong,ret = callPlayerFunction(pid,GetTong)
		if(tong == "") then
			return nil
		end
		return 1
	end
	if(tagLilian == CONST_LLITEM_SHENGWANG) then --ªÒµ√200µ„“‘…œµƒ…˘Õ˚
		local rep = callPlayerFunction(pid,GetRepute)
		if(rep >=200) then
			return 1
		end
		return nil
	end
	if(tagLilian == CONST_LLITEM_SHANHESHEJI) then -- = "ªÒµ√500∏ˆ“‘…œµƒ…Ω∫”…Á¢Õº≤–∆¨",
		local num = callPlayerFunction(pid,GetTask,1027)
		if(num >=500) then
			return 1
		end
		return nil
	end
	return nil
end

function GetNewLLInfo(lilian)
	local info = {}
	for k,v in LILIAN_ITEM do
		if(CheckLilianItem(k,lilian)) then
			tinsert(info,LILIAN_ITEM[k])
		end
	end
	if(getn(info)<1) then
		return nil
	end
	return info
end

function GetLLFinishedInfo(lilian)
	local info = {}
	for k,v in LILIAN_ITEM do
		if(CheckLilianItem(k,lilian)) then
			tinsert(info,LILIAN_ITEM[k])
		end
	end
	if(getn(info)<1) then
		return nil
	end
	return info
end

function GetLLUnfinishedInfo(lilian)
	local info = {}
	for k,v in LILIAN_ITEM do
		if(not CheckLilianItem(k,lilian)) then
			tinsert(info,LILIAN_ITEM[k])
		end
	end
	if(getn(info)<1) then
		return nil
	end
	return info
end

function GetPlayerLilian(pid)
	print("Call GetPlayerLilian("..tostring(pid)..")")
	local tab = {}
	for i=1,CONST_LILIAN_MEM_WIDTH do
		tab[i] = callPlayerFunction(pid,GetTask,TKID_SELF_LILIAN+i-1)
	end
	return tab
end

function GetPlayerMasterLilian(pid)
	print("Call GetPlayerMasterLilian("..tostring(pid)..")")
	local tab = {}
	for i=1,CONST_LILIAN_MEM_WIDTH do
		tab[i] = callPlayerFunction(pid,GetTask,TKID_MASTER_LILIAN+i-1)
	end
	return tab
end

function GetPlayerBonusLilian(pid)
	local tab = {}
	for i=1,CONST_LILIAN_MEM_WIDTH do
		tab[i] = callPlayerFunction(pid,GetTask,TKID_BONUS_LILIAN+i-1)
	end
	return tab
end

function SetPlayerLilian(pid,lilian)
	print("Call SetPlayerLilian("..tostring(pid)..","..tostring(lilian)..")")
	for i=1,CONST_LILIAN_MEM_WIDTH do
		callPlayerFunction(pid,SetTask,TKID_SELF_LILIAN+i-1,lilian[i])
	end
	return
end

function SetPlayerMasterLilian(pid,lilian)
	print("Call SetPlayerMasterLilian("..tostring(pid)..","..tostring(lilian)..")")
	for i=1,CONST_LILIAN_MEM_WIDTH do
		callPlayerFunction(pid,SetTask,TKID_MASTER_LILIAN+i-1,lilian[i])
	end
	return
end

function SetPlayerBonusLilian(pid,lilian)
	for i=1,CONST_LILIAN_MEM_WIDTH do
		callPlayerFunction(pid,SetTask,TKID_BONUS_LILIAN+i-1,lilian[i])
	end
	return
end

function UpdatePlayerSelfLilian(pid)
	if(FALSE(pid)) then
		print("pid == 0")
		return
	end
	local selfLilian = GetPlayerLilian(pid)
	for k,v in LILIAN_ITEM do
		if(CheckPlayerLilian(pid,k)) then
			selfLilian = SetLilianItem(k,selfLilian)
		end
	end
	SetPlayerLilian(pid,selfLilian)
	return
end

function HaveNewLilian(pid)
	print("Call HaveNewLilian("..pid..")")
	if(FALSE(pid)) then
		print("pid == 0")
		return 0
	end
	local ret = 0
	local selfLilian = GetPlayerLilian(pid)
	for k,v in LILIAN_ITEM do
		if(not CheckLilianItem(k,selfLilian) and CheckPlayerLilian(pid,k)) then
			ret = ret + 1
		end
	end
	return ret
end

function GetPlayerNewLilian(pid)
	if(FALSE(pid)) then
		return nil
	end
	local tab = {}
	for i=1,CONST_LILIAN_MEM_WIDTH do
		tab[i]=0
	end
	local selfLilian = GetPlayerLilian(pid)
	for k,v in LILIAN_ITEM do
		if(not CheckLilianItem(k,selfLilian) and CheckPlayerLilian(pid,k)) then
			tab = SetLilianItem(k,tab)
		end
	end
	return tab
end

function getLilianLeagueMemTask(szPlayerName, nTaskId)
	local lid = GetShituLeagueId(szPlayerName)
	if(FALSE(lid)) then
		return nil
	end
	local szLgName = LG_GetLeagueInfo(lid);
	return LG_GetMemberTask(CONST_LEAGUETYPE_SHITU, szLgName, szPlayerName, nTaskId);
end;

function setLilianLeagueMemTask(szPlayerName, nTaskId)
	local lid = GetShituLeagueId(szPlayerName)
	if(FALSE(lid)) then
		return nil
	end
	local szLgName = LG_GetLeagueInfo(lid);
	if (LG_GetMemberTask(CONST_LEAGUETYPE_SHITU, szLgName, szPlayerName, nTaskId) ~= 1) then
		return LG_ApplySetMemberTask(CONST_LEAGUETYPE_SHITU, szLgName, szPlayerName, nTaskId, 1);
	end;
end;

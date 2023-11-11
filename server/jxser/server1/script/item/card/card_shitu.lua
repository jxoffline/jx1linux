IncludeLib("SETTING")
Include ("\\script\\lib\\player.lua")
Include ("\\script\\shitu\\shitu.lua")

Include("\\script\\task\\newtask\\map_index.lua")
Include("\\script\\lib\\common.lua")

tb_teaminfo_master = {"pid","level","name"}
tb_teamtask_master = {TKID_DICHUAN_APPRENTICE_COUNT}

function CheckAndAddMaster(masters, player)
	local degree = GetPlayerDegree(player.pid)
	if(degree == CONST_DEGREE_MASTER or degree == CONST_DEGREE_PREMASTER) then
		local num = GetApprenticeNum(player.name)
		if(not num) then
			return
		end
		if (num < ComputeMasterLoad(player.task[TKID_DICHUAN_APPRENTICE_COUNT])) then
			masters[getn(masters) + 1] = player.name
		end
	end
end

--²éÕÒ¿ÉÒÔ³ÉÎªÊ¦¸¸µÄÈË
function FindMaster()
	print("Call FindMaster")
	local masters = {}
	/*
	local _,others = getTeamInfo(PlayerIndex,{"pid","level","name"},{TKID_DICHUAN_APPRENTICE_COUNT})
	if(not others) then
		return nil
	end
	for i=1,getn(others) do
		local degree = GetPlayerDegree(others[i].pid)
		if(degree == CONST_DEGREE_MASTER or degree == CONST_DEGREE_PREMASTER) then
			local num =GetApprenticeNum(others[i].name)
			if(not num) then
				return nil
			end
			if(num < ComputeMasterLoad(others[i].task[TKID_DICHUAN_APPRENTICE_COUNT])) then
				tinsert(masters,others[i].name)
			end
		end
	end
	*/
	traversalTeam(PlayerIndex, CheckAndAddMaster, masters, tb_teaminfo_master, tb_teamtask_master)
	if (getn(masters) < 1) then
		return nil
	else
		return masters
	end
end

tb_teaminfo_apprentice = {"level","name"}

function CheckAndAddApprentice(apps, player)
	if (player.level < 80) then
		local job = GetLeagueJob(player.name)
		if(not job) then
			apps[getn(apps) + 1] = player.name
		end
	end
end

--²éÕÒ¿ÉÒÔ³ÉÎªÍ½µÜµÄÈË
function FindApprentice()
	print("Call FindApprentice")
	/*
	local _,others = getTeamInfo(PlayerIndex,{"level","name"})
	if(not others) then
		return nil
	end
	local apps = {}
	for i=1,getn(others) do
		if(others[i].level < 80) then
			local job = GetLeagueJob(others[i].name)
			if(not job) then
				tinsert(apps,others[i].name)
			end
		end
	end
	*/
	local apps = {}
	traversalTeam(PlayerIndex, CheckAndAddApprentice, apps, tb_teaminfo_apprentice)
	
	if (getn(apps) < 1) then
		return nil
	else
		return apps
	end
end

--µÃµ½Í½µÜÁĞ±í½çÃæ
function ShoutuList(apps)
	local str = "Xem t×nh h×nh cña ng­êi ch¬i, chän 1 ng­êi thİch hîp lµm ®å ®Ö cña b¹n:"
	local btn = {}
	-- local apps = FindApprentice()
	if(not apps) then
		Msg2Player("Kh«ng cã ®å ®Ö thİch hîp.")
		return
	end
	for i=1,getn(apps) do
		tinsert(btn,"Xem tin tøc  "..safeshow(apps[i]).." tin tøc cña/#XuanTudi('"..safestr(apps[i]).."')")
	end
	tinsert(btn," §ãng/Quit")
	Say(str,getn(btn),btn)
	return
end

function CallBack_ShoutuList()
	local apps = FindApprentice()
	ShoutuList(apps)
end

--µÃµ½¿ÉÒÔ×öÊ¦¸¸µÄÈËÔ±ÁĞ±í
function BaishiList(masters)
	print("Call BaishiList()")
	local str = "Tra xem t×nh h×nh cña ng­êi ch¬i, chän 1 ng­êi thİch hîp lµm s­ phô cña b¹n:"
	local btn = {}
	-- local masters = FindMaster()
	if(not masters) then
		print("Master can not found.")
		return
	end
	for i=1,getn(masters) do
		tinsert(btn,"Xem tin tøc  "..safeshow(masters[i]).." tin tøc cña/#XuanShifu('"..safestr(masters[i]).."')")
	end
	tinsert(btn," §ãng/Quit")
	Say(str,getn(btn),btn)
	return
end

function CallBack_BaishiList()
	local masters = FindMaster()
	BaishiList(masters)
end

tb_playerinfo_tudi = {"level","sex"}
tb_playertask_tudi = {TKID_MASTER_COUNT}
tb_playertemp_tudi = {TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG}

--ÁË½âÄÜ¹»³ÉÎªÍ½µÜµÄÈËÑ¡µÄĞÅÏ¢
function XuanTudi(playerName)
	local pid = SearchPlayer(playerName)
	if(FALSE(pid)) then
		Msg2Player(playerName.."HiÖn kh«ng biÕt tung tİch.")
		return
	end
	-- local app = getPlayerInfo(pid,{"level","sex"},{TKID_MASTER_COUNT},{TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG})
	local app = getPlayerInfo(pid, tb_playerinfo_tudi, tb_playertask_tudi, tb_playertemp_tudi)
	local str = safeshow(playerName)..":"..sex2Word(app.sex).."<enter>"
	if(app.level <= 25) then
		str = str.."HiÖn ®¼ng cÊp ë cÊp d­íi 26"
	elseif(app.level < 50) then
		str = str.."HiÖn ®¼ng cÊp ë cÊp d­íi 50 "
	elseif(app.level < 65) then
		str = str.."HiÖn ®¼ng cÊp ë cÊp d­íi 65 "
	elseif(app.level < 75) then
		str = str.."HiÖn ®¼ng cÊp ë cÊp d­íi 75 "
	elseif(app.level < 80) then
		str = str.."HiÖn ®¼ng cÊp ë cÊp d­íi 80"
	else
		str = str.."HiÖn ®¼ng cÊp ë cÊp 80 trë lªn, "
	end
	if(app.task[TKID_MASTER_COUNT] ==0) then
		str = str.."ch­a b¸i qua s­ phô, "
	else
		str = str.."®· b¸i s­ "..tostring(app.task[TKID_MASTER_COUNT]).." s­ phô, "
	end
	if(FALSE(GetShituLeagueId(playerName))) then
		UpdatePlayerSelfLilian(pid)
	end
	if(GetPlayerLilianCount(pid)==0) then
		str = str.."tr­íc nay ch­a tr·i qua nhiÖm vô thİ luyÖn giang hå nµo."
	else
		str = str.."®· hoµn thµnh"..tostring(GetPlayerLilianCount(pid)).." viÖc thİ luyÖn giang hå."
	end
	if(app.tasktmp[TTKID_APPRENTICE_FLAG]==FileName2Id(GetName())) then
		str = str.."<enter> hiÖn ®· b¸i b¹n lµm s­ phô. H·y sö dông chøc n¨ng <color=yellow>Thu nhËn ®Ö tö<color> trong <color=green>S­ ®å thiÕp<color> ®Ó tr¶ lêi."
	end
	if(app.tasktmp[TTKID_RECRUIT_FLAG] == FileName2Id(GetName())) then
		str = str.."<enter> hiÖn ®· nhËn  lµm ®å ®Ö, ®ang ®îi sù tr¶ lêi cña "
	end
	/*
	local btn = {
		"nhËn "..safeshow(playerName).." lµm ®å ®Ö/#Shoutu('"..safestr(playerName).."')",
		"Trë l¹i/CallBack_ShoutuList",
		" §ãng/Quit"
	}
	Say(str,getn(btn),btn)
	*/
	Say(str,
		3,
		"nhËn "..safeshow(playerName).." lµm ®å ®Ö/#Shoutu('"..safestr(playerName).."')",
		"Trë l¹i/CallBack_ShoutuList",
		" §ãng/Quit")	
	return
end

tb_playerinfo_shifu = {"sex"}
tb_playertask_shifu = {TKID_APPRENTICE_COUNT, TKID_DICHUAN_APPRENTICE_COUNT, TKID_ZHIXI_APPRENTICE_COUNT, TKID_NORMAL_APPRENTICE_COUNT}

function XuanShifu(playerName)
	local pid = SearchPlayer(playerName)
	if(FALSE(pid)) then
		Msg2Player(playerName.."HiÖn kh«ng biÕt tung tİch.")
		return
	end
	-- local master = getPlayerInfo(pid,{"sex"},{TKID_APPRENTICE_COUNT,TKID_DICHUAN_APPRENTICE_COUNT,TKID_ZHIXI_APPRENTICE_COUNT,TKID_NORMAL_APPRENTICE_COUNT})
	local master = getPlayerInfo(pid, tb_playerinfo_shifu, tb_playertask_shifu)
	local btn = {
		"b¸i "..safeshow(playerName).."lµm s­ phô /#Baishi('"..safestr(playerName).."')",
		"Trë l¹i/CallBack_BaishiList",
		" §ãng/Quit"
	}
	local str = safeshow(playerName)..":"..sex2Word(master.sex).."<enter>"
	st_print("XuanShifu(): "..GetName().."master: "..str);
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid) and FALSE(master.task[TKID_APPRENTICE_COUNT])) then
		str = str.."§Õn nay, ch­a lµm qua s­ phô."
		Say(str,getn(btn),btn)
		return
	end
	str = str.."§Õn nay, ®· thu nhËn "..tostring(master.task[TKID_APPRENTICE_COUNT]).." ®å ®Ö,"
	str = str.." trong ®ã huÊn luyÖn thµnh c«ng "..tostring(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).." ®İch truyÒn ®Ö tö, "
	str = str..tostring(master.task[TKID_ZHIXI_APPRENTICE_COUNT]).." trùc hÖ ®Ö tö, "
	str = str..tostring(master.task[TKID_NORMAL_APPRENTICE_COUNT]).." phæ th«ng ®Ö tö."
	str = str.."HiÖn t¹i, "..playerName.."tæng cã thÓ dÉn d¾t "..ComputeMasterLoad(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).." ®å ®Ö,"
	str = str.." H¬n n÷a, hiÖn ®· thu nhËn "..tostring(GetApprenticeNum(playerName)).." ®å ®Ö."
	Say(str,getn(btn),btn)
	return
end

function Baishi(master) --Í½µÜ´¥·¢
	print("Call Baishi("..tostring(master)..").")
	local pid = SearchPlayer(master)
	if(FALSE(pid)) then
		Msg2Player(" Xin lçi! "..master.."HiÖn kh«ng biÕt tung tİch.")
		return
	end
	SetTaskTemp(TTKID_APPRENTICE_FLAG,FileName2Id(master))
	if(GetTaskTemp(TTKID_APPRENTICE_FLAG)==GetTaskTemp(TTKID_RECRUIT_FLAG)) then
		SetTaskTemp(TTKID_APPRENTICE_FLAG,0)
		SetTaskTemp(TTKID_RECRUIT_FLAG,0)
		--¼ì²éÊ¦¸¸µÄÍÁµØÈİÁ¿
		local load = ComputeMasterLoad(callPlayerFunction(pid,GetTask,TKID_DICHUAN_APPRENTICE_COUNT))
		local appNum = GetApprenticeNum(master)
		if(not appNum) then
			print(" kh¸c th­êng, master ®ét nhiªn ch­a b¸i s­.")
			return
		end
		if(load <= appNum) then --ÈËÊıÒÑÂú£¬²»ÄÜÔÙ°İÊ¦
			Msg2Player(master.."HiÖn ®· dÉn ®Õn qu¸ nhiÒu ®Ö tö, kh«ng liÖu næi b¹n råi.")
			sendMessage(pid,"B¹n hiÖn ®· thu nhËn qu¸ nhiÒu ®Ö tö, ®· lo kh«ng xuÓ "..GetName().." ")
			return
		end
		Msg2Player(master.." ®· ®ång ı thu nhËn b¹n lµm ®å ®Ö, ®îi hÖ thèng x©y dùng quan hÖ s­ ®å cña c¸c b¹n.")
		sendMessage(pid,"B¹n ®· ®ång ı thu nhËn "..GetName().." lµm ®å ®Ö, ®îi hÖ thèng x©y dùng quan hÖ s­ ®å cña c¸c b¹n.")
		SetTaskTemp(TTKID_RECRUIT_FLAG,0)
		SetTaskTemp(TTKID_APPRENTICE_FLAG,0)
		--AddGlobalNews("¹§Ï²"..GetName().."°İÈë"..master.."µÄÃÅÏÂ£¬³ÉÎª"..master.."µÄµÜ×Ó¡£")
		UpdatePlayerSelfLilian(PlayerIndex)
		BuildRelationship(GetName(),master)
		return
	end
	Msg2Player("B¹n ®Şnh b¸i "..master.." lµm s­ phô, ®ang ®îi tr¶ lêi...")
	sendMessage(pid,GetName().." ®Şnh b¸i b¹n lµm s­ phô, xin sö dông chøc n¨ng <color=yellow>thu nhËn ®Ö tö<color> trong <color=green>S­ ®å thiÕp<color> ®Ó tr¶ lêi.")
	return
end

tb_playertemp_shoutu = {TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG}

function Shoutu(apprentice) --Ê¦¸¸´¥·¢
	print("Call Shoutu("..tostring(apprentice)..").")
	local pid = SearchPlayer(apprentice)
	if(FALSE(pid)) then
		Msg2Player(" Xin lçi! "..apprentice.."HiÖn kh«ng biÕt tung tİch.")
		return
	end
	
	if checkTudiLimit()~=1 then
		Say("Xin lçi! Néi trong 7 ngµy mçi ng­êi chØ cã thÓ nhËn 5 ®å ®Ö!", 0);
		return
	end;
	
	setPlayerTaskTemp(pid,{[TTKID_RECRUIT_FLAG]=FileName2Id(GetName())})
	-- local appinfo = getPlayerInfo(pid,nil,nil,{TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG})
	local appinfo = getPlayerInfo(pid,nil,nil,tb_playertemp_shoutu)
	if(not appinfo) then
		return
	end
	if(appinfo.tasktmp[TTKID_APPRENTICE_FLAG]==appinfo.tasktmp[TTKID_RECRUIT_FLAG]) then
		callPlayerFunction(pid,SetTask,TTKID_APPRENTICE_FLAG,0)
		callPlayerFunction(pid,SetTask,TTKID_RECRUIT_FLAG,0)
		print("thu nhËn ®Ö tö ")
		local load = ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT))
		local appNum = GetApprenticeNum(GetName())
		if(not appNum) then
			print("kh¸c th­êng, ng­êi nµy ®ét nhiªn kh«ng b¸i s­ ")
			return
		end
		if(load <= appNum) then --ÈËÊıÒÑÂú£¬²»ÄÜÔÙ°İÊ¦
			Msg2Player("B¹n hiÖn ®· thu nhËn qu¸ nhiÒu ®Ö tö, ®· lo kh«ng xuÓ "..apprentice.." ")
			sendMessage(pid,GetName().."HiÖn ®· dÉn ®Õn qu¸ nhiÒu ®Ö tö, kh«ng liÖu næi b¹n råi.")
			return
		end
		
		-- Ğ´ÈëÍ½µÜÊı¾İ
		writeTudiLimit();
		
		Msg2Player("B¹n ®· ®ång ı thu nhËn "..apprentice.." lµm ®å ®Ö, ®îi hÖ thèng x©y dùng quan hÖ s­ ®å cña c¸c b¹n.")
		sendMessage(pid,GetName().." ®· ®ång ı thu nhËn b¹n lµm ®å ®Ö, ®îi hÖ thèng x©y dùng quan hÖ s­ ®å cña c¸c b¹n.")
		callPlayerFunction(pid,SetTaskTemp,TTKID_APPRENTICE_FLAG,0)
		callPlayerFunction(pid,SetTaskTemp,TTKID_RECRUIT_FLAG,0)
		--AddGlobalNews("¹§Ï²"..apprentice.."°İÈë"..GetName().."µÄÃÅÏÂ£¬³ÉÎª"..GetName().."µÄµÜ×Ó¡£")
		UpdatePlayerSelfLilian(pid)
		BuildRelationship(apprentice,GetName())
		return
	end
	
	-- Ğ´ÈëÍ½µÜÊı¾İ
	writeTudiLimit();
	
	Msg2Player("B¹n ®Şnh thu nhËn"..apprentice.." lµm ®å ®Ö, ®ang ®îi tr¶ lêi...")
	sendMessage(pid,GetName().."®Şnh thu nhËn b¹n lµm ®å ®Ö. H·y sö dông chøc n¨ng <color=green>B¸i s­<color> trong <color=green>S­ ®å thiÕp"..GetName().." tr¶ lêi.")
	return
end

function MasterDialog()
	local btn = {}
	local masterName = GetName()
	local num = GetApprenticeNum(masterName)
	if(not num) then 
		print("B¹n ®· lµ S­ phô råi! Cßn b¸i s­ g× n÷a chø!")
		return
	end
	if(FindApprentice() and 
		num < ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT))) then
		tinsert(btn,"thu nhËn ®Ö tö /CallBack_ShoutuList")
	end
	if(GetEnableChushiApps(masterName)) then
		tinsert(btn,"§å ®Ö xuÊt s­ /ChushiList")
	end
	if(GetHaveNewLilianApps(masterName)) then
		tinsert(btn,"Tra xem rÌn luyÖn giang hå cña ®å ®Ö/LilianList")
	end
	if(num > 0 ) then
		tinsert(btn,"Tra tin tøc ®å ®Ö/TudiInfoList")
		tinsert(btn,"Hñy bá quan hÖ ®å ®Ö/BreakTuList")
	end
	tinsert(btn,"Xem th«ng tin c¸ nh©n/SfChaShifu")
	tinsert(btn,"T×m hiÓu S­ ®å thiÕp/AboutShituCard")
	tinsert(btn," §ãng/Quit")
	local str = "H·y chän thao t¸c t­¬ng quan cña s­ phô:"
	Say(str,getn(btn),btn)
	return
end

function BreakTuList()
	local apps = GetApprentice(GetName())
	if(not apps) then
		Msg2Player("B¹n kh«ng cã bÊt cø s­ ®å nµo.")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,"Hñy bá quan hÖ s­ ®å víi "..safeshow(apps[i]).."./#ShiConform('"..safestr(apps[i]).."')")
	end
	tinsert(btn,"Trë l¹i/MasterDialog")
	tinsert(btn," §ãng/Quit")
	local str = "B¹n muèn hñy bá quan hÖ s­ ®å víi ®å ®Ö nµo?"
	Say(str,getn(btn),btn)
	return
end

function ShiConform(appName)
	Say("B¹n muèn hñy bá "..safeshow(appName).."quan hÖ s­ ®å gi÷a  ? ",
		2,
		"X¸c nhËn/#BreakShituLeague('"..safestr(appName).."')",
		" Hñy bá /BreakTuList")
	return
end

function TuConform()
	local playerName = GetName();
	local btn = {
		"X¸c nhËn/#BreakShituLeague('"..safestr(playerName).."')",
		" Hñy bá /ApprenticeDialog"
	}
	
	local masterName = GetMaster(playerName)
	if (masterName == nil) then
		local lid = GetShituLeagueId(playerName)
		if(TRUE(lid)) then -- Ê¦¸¸²»´æÔÚ£¬µ«Õ½¶Ó´æÔÚ
			Say("S­ phô cña b¹n ®· mÊt tİch, b¹n quyÕt ®Şnh hñy bá quan hÖ s­ ®å víi s­ phô?",getn(btn),btn)
		else
			print("Quan hÖ S­ ®å kh«ng tån t¹i.")
		end
	else		
		Say("B¹n muèn hñy bá "..safeshow(masterName).."quan hÖ s­ ®å cña ??",getn(btn),btn)
	end
	return
end

function TudiInfoList()
	local apps = GetApprentice(GetName())
	if(not apps) then
		Msg2Player("B¹n kh«ng cã bÊt cø s­ ®å nµo.")
		return
	end
	local btn={}
	local pid = 0;
	local state = 0;
	for i=1,getn(apps) do
		pid = SearchPlayer(apps[i])
		if (pid > 0) then
			state = callPlayerFunction(pid,GetTask,TKID_GOLD_APPRENTICE);
			if (state == 1 or state == 2) then
				tinsert(btn,"Xem tin tøc  "..safeshow(apps[i]).."Tin tøc t­¬ng quan cña (§Ö tö Hoµng Kim) /#TudiInfo('"..safestr(apps[i]).."')")
			else
				tinsert(btn,"Xem tin tøc  "..safeshow(apps[i]).."./#TudiInfo('"..safestr(apps[i]).."')")
			end
		end
	end
	tinsert(btn,"Trë l¹i/MasterDialog")
	tinsert(btn," §ãng/Quit")
	local str = "B¹n muèn xem tin tøc cña ®å ®Ö nµo?"
	Say(str,getn(btn),btn)
	return
end

--²é¿´Í½µÜÀúÁ·Ê±µÄÍ½µÜÁĞ±í
function LilianList()
	local apps = GetHaveNewLilianApps(GetName())
	if(not apps) then
		Msg2Player("Cho ®Õn nay, ch­a cã s­ ®å nµo tr·i qua rÌn luyÖn giang hå míi.")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,safeshow(apps[i][1]).."§· hoµn thµnh míi!"..apps[i][2].."nhiÖm vô rÌn luyÖn!/#ChaLilian('"..safestr(apps[i][1]).."')")
	end
	tinsert(btn,"Trë l¹i/MasterDialog")
	tinsert(btn," §ãng/Quit")
	local str = "B¹n muèn xem rÌn luyÖn giang hå cña ®å ®Ö nµo?"
	Say(str,getn(btn),btn)
	return
end

tb_playerinfo_lilian = {TTKID_SELF_LILIAN_FLAG,TTKID_MASTER_LILIAN_FLAG}

function ChaLilian(appName) --Ê¦¸¸´¥·¢
	local appIdx = SearchPlayer(appName)
	if(FALSE(appIdx)) then
		Msg2Player(appName.."Kh«ng biÕt tung tİch.")
		return
	end
	setPlayerTaskTemp(appIdx,{[TTKID_MASTER_LILIAN_FLAG]=1})
	-- local appinfo = getPlayerInfo(appIdx,nil,nil,{TTKID_SELF_LILIAN_FLAG,TTKID_MASTER_LILIAN_FLAG})
	local appinfo = getPlayerInfo(appIdx, nil, nil, tb_playerinfo_lilian)
	if(not appinfo) then
		return
	end
	if(appinfo.tasktmp[TTKID_SELF_LILIAN_FLAG]==appinfo.tasktmp[TTKID_MASTER_LILIAN_FLAG] and appinfo.tasktmp[TTKID_SELF_LILIAN_FLAG]~=0) then
		Msg2Player("B¹n tr¶ lêi b¾t ®Çu tra xem "..appName.."rÌn luyÖn giang hå cña")
		sendMessage(appIdx,GetName().."tr¶ lêi b¾t ®Çu tra xem rÌn luyÖn giang hå cña b¹n.")
		setPlayerTaskTemp(appIdx,{[TTKID_SELF_LILIAN_FLAG]=0,[TTKID_MASTER_LILIAN_FLAG]=0})
		UpdatePlayerLilian(appIdx)
		PayLilianBonus(appIdx,PlayerIndex)
		return
	end
	Msg2Player("B¹n muèn tra xem "..appName.." rÌn luyÖn giang hå cña  , ®ang ®îi phôc mÖnh")
	sendMessage(appIdx,GetName().."CÇn tra xem rÌn luyÖn giang hå cña, xin sö dông chøc n¨ng <color=green>Phôc mÖnh s­ phô<color> trong <color=yellow>S­ ®å thiÕp<color> ®Ó tr¶ lêi.")
	return
end

function FuLilian(masterName) --Í½µÜµ÷ÓÃ
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Msg2Player(masterName.."Kh«ng biÕt tung tİch.")
		return
	end
	SetTaskTemp(TTKID_SELF_LILIAN_FLAG,1)
	if(GetTaskTemp(TTKID_SELF_LILIAN_FLAG)==GetTaskTemp(TTKID_MASTER_LILIAN_FLAG) and GetTaskTemp(TTKID_SELF_LILIAN_FLAG)~=0) then
		Msg2Player("B¹n cÇn phôc mÖnh víi "..masterName..", ®Ó b¹n ch¬i xem rÌn luyÖn giang hå cña b¹n")
		sendMessage(masterIdx,GetName().."cÇn phôc mÖnh víi b¹n, b¹n b¾t ®Çu tra xem rÌn luyÖn giang hå cña b¹n ch¬i!")
		setPlayerTaskTemp(PlayerIndex,{[TTKID_SELF_LILIAN_FLAG]=0,[TTKID_MASTER_LILIAN_FLAG]=0})
		UpdatePlayerLilian(PlayerIndex)
		PayLilianBonus(PlayerIndex,masterIdx)
		return
	end
	Msg2Player("B¹n cÇn phôc mÖnh víi"..masterName..", ®ang ®îi b¹n ch¬i tra xem rÌn luyÖn giang hå cña b¹n.")
	sendMessage(masterIdx,GetName().."cÇn phôc mÖnh víi b¹n. H·y sö dông chøc n¨ng <color=green>Tra xem rÌn luyÖn giang hå cña ®å ®Ö<color> trong <color=yellow >S­ ®å thiÕp<color>®Ó tr¶ lêi.")
	return
end

function SendBaiShiBidding()
	local mapid, x, y = GetWorldPos();
	local myMapName, myMapX, myMapY = tl_getMapInfo(mapid);
	local str = "ng­êi ch¬i míi ["..GetName().."] t­ chÊt h¬n ng­êi! XuÊt s­ nhí ®õng lµm hæ danh s­ phô nhĞ!"
	if (myMapName ~= 0) then
		x = floor(x / 8);
		y = floor(y / 16);
		AddLocalNews(str.."ng­êi cã ı h·y ®Õn ["..myMapName.."]("..x..", "..y..")");
	else
		AddLocalNews(str.."ng­êi quan t©m, xin liªn hÖ víi ");
	end
	
	-- ±ê¼Ç£º2 - ·¢¹ı°İÊ¦¹«¸æ
	SetTask(TKID_GOLD_APPRENTICE, 2);
end

function ApprenticeDialog()
	print("Call ApprenticeDialog")
	local btn = {}
	
	local lvl = GetLevel()
	if (lvl < 80 and GetTask(TKID_GOLD_APPRENTICE) == 1) then
		tinsert(btn,"Ph¸t th«ng b¸o b¸i s­ trªn tÇn sè thÕ giíi/SendBaiShiBidding")
	end
	
	if(lvl < 80) then
		tinsert(btn,"nhËn ®­îc n¨ng lùc s­ phô cho b¹n/GetAbility")
	else
		local master = GetMaster(GetName())
		if(TRUE(SearchPlayer(master))) then
			tinsert(btn,"xuÊt s­ /TudiChushi")
		end
	end
	if(TRUE(HaveNewLilian(PlayerIndex))) then
		tinsert(btn,"phôc mÖnh víi s­ phô /Fuming")
	end
	tinsert(btn,"Xem t×nh h×nh häc nghÖ /ChaSelfInfo")
	tinsert(btn,"T×m hiÓu tin tøc s­ phô /TdChaShifu")
	tinsert(btn,"Hñy bá quan hÖ ®å ®Ö/TuConform")
	tinsert(btn,"T×m hiÓu S­ ®å thiÕp/AboutShituCard")
	-- VN_MODIFY_20060427
	-- ¹Ø±Õ»Æ½ğÊ¦Í½¿¨(ËµÃ÷)
	-- tinsert(btn,"ÁË½â»Æ½ğÊ¦Í½¿¨(ÌØĞÔËµÃ÷)/AboutShituGoldCard")
	tinsert(btn," §ãng/Quit")
	local str = "H·y lùa chän thao t¸c liªn quan cña ®å ®Ö:"
	Say(str,getn(btn),btn)
	return	
end

function ChushiList()
	local apps = GetEnableChushiApps(GetName())
	if(not apps) then
		Msg2Player("HiÖn kh«ng cã ®Ö tö thİch hîp cã thÓ xuÊt s­.")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,safeshow(apps[i][1]).."["..apps[i][2].."cÊp] HiÖn ®· cã thÓ xuÊt s­ /#ShiChushi('"..safestr(apps[i][1]).."')")
	end
	tinsert(btn,"Trë l¹i/MasterDialog")
	tinsert(btn," §ãng/Quit")
	local str = "B¹n muèn ®å ®Ö nµo xuÊt s­?"
	Say(str,getn(btn),btn)
	return
end

function ShiChushi(appName)
	local appIdx = SearchPlayer(appName)
	if(FALSE(appIdx)) then
		Msg2Player(appName.."Kh«ng biÕt tung tİch, xem ra t¹m thêi kh«ng thÓ ®Ó ®å ®Ö xuÊt s­.")
		return
	end
	local app = getPlayerInfo(appIdx,{"level"})
	if(app.level <80) then
		Msg2Player(appName.."n¨ng lùc cña   ch­a ®ñ tr×nh ®é xuÊt s­. Hay lµ ®îi 2 n¨m sau nhĞ!")
		return
	end
	setPlayerTaskTemp(appIdx,{[TTKID_MASTER_CHUSHI]=1})
	app = getPlayerInfo(appIdx,nil,nil,{TTKID_APPRENTICE_CHUSHI,TTKID_MASTER_CHUSHI})
	if(app.tasktmp[TTKID_MASTER_CHUSHI]== app.tasktmp[TTKID_APPRENTICE_CHUSHI] and app.tasktmp[TTKID_APPRENTICE_CHUSHI]~=0) then
		Msg2Player(appName.."®· v­ît tréi h¬n thÇy, b¹n v« cïng vui mõng, quyÕt ®Şnh cho "..appName.." xuÊt s­.")
		sendMessage(appIdx,GetName().." ®· ®ång ı ®Ó b¹n xuÊt s­, cuèi cïng b¹n còng cã thÓ lµm nªn chuyÖn lÉy lõng!")
		--AddGlobalNews("¹§Ï²"..appName.."Ñ§ÒÕÒÑ³É£¬´Ó"..GetName().."ÃÅÏÂ³öÊ¦¡£")
		OutShituLeague(appName,GetName())
		return
	end
	Msg2Player("B¹n c¶m thÊy"..appName.."Th«ng minh lanh lîi, chíp m¾t ®· kh«ng cßn g× d¹y ®Ö tö n÷a, quyÕt ®Şnh ®Ó ®Ö tö xuÊt s­,"..appName.."trong lóc suy nghÜ...")
	sendMessage(appIdx,GetName().."c¶m thÊy b¹n ®· ­u tó h¬n thÇy chíp m¾t ®· kh«ng cßn g× d¹y b¹n n÷a, quyÕt ®Şnh ®Ó b¹n xuÊt s­, ®ang ®îi quyÕt ®Şnh cña b¹n...")
	return
end

function TudiChushi() --Í½µÜ¼¤»î
	local masterName = GetMaster(GetName())
	if(not masterName) then --Ê¦¸¸²»ÔÚ
		Msg2Player("B¹n kh«ng cã s­ phô, xuÊt s­ g× chø?")
		return
	end
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Msg2Player("S­ phô ®· ®i mÊt, kh«ng thÓ xuÊt s­.")
		return
	end
	if(GetLevel() <80) then
		Msg2Player("N¨ng lùc cña b¹n ch­a ®ñ ®Ó xuÊt s­! H·y tiÕp tôc khæ luyÖn thªm 2 n¨m.")
		return
	end
	SetTaskTemp(TTKID_APPRENTICE_CHUSHI,1)
	if(GetTaskTemp(TTKID_APPRENTICE_CHUSHI)==GetTaskTemp(TTKID_MASTER_CHUSHI) and GetTaskTemp(TTKID_MASTER_CHUSHI)~=0) then
		Msg2Player("®­îc s­ phô båi d­ìng nhiÒu n¨m, cuèi cïng b¹n häc ®· thµnh, dù ®Şnh ra ngoµi tù lËp!")
		sendMessage(masterIdx,GetName().."®­îc s­ phô båi d­ìng nhiÒu n¨m, cuèi cïng häc ®· thµnh, dù ®Şnh ra ngoµi tù lËp!")
		--AddGlobalNews("¹§Ï²"..GetName().."Ñ§ÒÕÒÑ³É£¬´Ó"..masterName.."ÃÅÏÂ³öÊ¦¡£")
		OutShituLeague(GetName(),masterName)
		return
	end
	Msg2Player("B¹n c¶m thÊy häc nghÖ ®· thµnh xin"..masterName.."xuÊt s­, ®ang ®îi s­ phô tr¶ lêi...")
	sendMessage(masterIdx,GetName().."c¶m thÊy häc nghÖ ®· thµnh, xin b¹n xuÊt s­. H·y sö dông chøc n¨ng <color=green>§å ®Ö xuÊt s­<color> trong <color=yellow>S­ ®å thiÕp<color> tr¶ lêi.")
	return	
end

function Fuming()
	local masterName = GetMaster(GetName())
	FuLilian(masterName)
	return
end

function GetAbility()
	if(GetLevel()>80) then
		Msg2Player("B¶n lÜnh cña b¹n ®· häc ®­îc kha kh¸, kh«ng cÇn dùa dÉm vµo s­ phô n÷a!")
		return
	end
	AddSkillState(531,10,1,30*60*18)
	AddSkillState(461,1, 1,30*60*18)
	Msg2Player("B¹n ®· sö dông n¨ng lùc t¨ng ®«i ®iÓm kinh nghiÖm mµ s­ phô cho b¹n!")
	return
end

function TudiInfo(appName)  --Ê¦¸¸²éÍ½µÜĞÅÏ¢
	local pid = SearchPlayer(appName)
	if(FALSE(pid)) then
		Msg2Player(appName.."Kh«ng biÕt tung tİch, kh«ng thÓ nhËn ®­îc tin tøc cña")
		return
	end
	local sex = callPlayerFunction(pid,GetSex)
	local str
	if(FALSE(sex)) then --ÄĞ
		str = "<link=image[0,0]:\\spr\\Ui3\\Íæ¼ÒĞ¤Ïñ\\Ğ¤Ïñ\\001.spr>"
	else
		str = "<link=image[0,0]:\\spr\\Ui3\\Íæ¼ÒĞ¤Ïñ\\Ğ¤Ïñ\\003.spr>"
	end
	str = str..appName.."<link>:"..sex2Word(sex).."<enter>"
	local joinLvl = callPlayerFunction(pid,GetTask,TKID_ENTER_LEVEL)
	str = str.."Khi b¹n ë "..tostring(joinLvl).."cÊp...cña..., thu nhËn b¹n ch¬i lµm ®å ®Ö, "
	local masterCount = callPlayerFunction(pid,GetTask,TKID_MASTER_COUNT)
	if(masterCount<=1) then
		str = str.."B¹n ®· lµ ng­êi thÇy ®Çu tiªn cña b¹n ch¬i, "
		if(joinLvl<=25) then
			str = str.."B¹n ch¬i lµ ®Ö tö <color=yellow>§İch truyÒn<color> cña b¹n."
		else
			str = str.."B¹n ch¬i lµ ®Ö tö <color=green>trùc hÖ<color>cña b¹n."
		end
	else
		str = str.."Lóc tr­íc, b¹n ch¬i ®· b¸i "..tostring(masterCount-1).." lµm s­ phô, "
	end
	local appLvl = callPlayerFunction(pid,GetLevel)
	if(appLvl<80) then
		str = str.."HiÖn t¹i ®¼ng cÊp cña b¹n ch¬i ®¹t"..tostring(appLvl).."cÊp.<enter>"
	else
		str = str.."HiÖn t¹i b¹n ch¬i ®¹t"..tostring(appLvl).."cÊp. B¹n cã thÓ b¶o ®Ö tö tù m×nh phiªu b¹t giang hå.<enter>"
	end
	local lilianCount = GetPlayerLilianCount(pid)
	local newllc = HaveNewLilian(pid)
	if(lilianCount<1) then
		if(TRUE(newllc)) then
			str = str..appName.."®· hoµn thµnh nh­ sau<color=yellow>"..newllc.."<color> NhiÖm vô thİ luyÖn giang hå, ®ang ®îi b¹n kiÓm tra:<enter>"
			local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
			for i=1,getn(newll) do
				str = str.."  "..newll[i].."<enter>"
			end
		else
			str = str.."®Õn nay, "..appName.."cßn 1 viÖc ch­a thµnh."
		end
	else
		local masterllCount = GetPlayerMasterLilianCount(pid)
		if(FALSE(masterllCount)) then --»¹Ã»¸´ÃüÈÎºÎÀúÁ·
			if(TRUE(newllc)) then
				str = str.." hiÖn t¹i"..appName.."®· hoµn thµnh nh­ sau<color=yellow>"..newllc.."<color> NhiÖm vô thİ luyÖn giang hå, ®ang ®îi b¹n kiÓm tra:<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."Tr­íc kia, "..appName.."®· hoµn thµnh."..lilianCount.."nhiÖm vô thİ luyÖn giang hå, "
			str = str.."nh­ng ë tªn tuæi cña b¹n, ch­a hoµn thµnh nhiÖm vô thİ luyÖn giang hå nµo.<enter>"
		else
			if(TRUE(newllc)) then
				str = str..appName.."®· hoµn thµnh nh­ sau<color=yellow>"..newllc.."<color> NhiÖm vô thİ luyÖn giang hå, ®ang ®îi b¹n kiÓm tra:<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."Tr­íc kia, "..appName.."cßn hoµn thµnh"..lilianCount.."nhiÖm vô thİ luyÖn giang hå, "
			str = str.."Trong sè nhiÖm vô hoµn thµnh mµ b¹n cã nh­<color=green>"..masterllCount.."<color> nhiÖm vô thİ luyÖn giang hå:<enter>"
			local masterLilian = GetLLFinishedInfo(GetPlayerMasterLilian(pid))
			for i=1,getn(masterLilian) do
				str = str.."  "..masterLilian[i].."<enter>"
			end
		end
	end
	local unfinishedLilian = GetLLUnfinishedInfo(GetPlayerLilian(pid))
	if(unfinishedLilian) then
		str = str.."b¹n ch¬i hiÖn cßn<color=red>"..getn(unfinishedLilian).."<color>viÖc ch­a phôc mÖnh víi b¹n, ph©n biÖt lµ:<enter>"
		for i=1,getn(unfinishedLilian) do
			str = str.."  "..unfinishedLilian[i].."<enter>"
		end
	else
		str = str.."§Ö tö ®· hoµn thµnh tÊt c¶ nhiÖm vô thİ luyÖn giang hå!"
	end
	local btn = {
		"Trë l¹i/TudiInfoList",
		" §ãng/Quit"
	}
	if(TRUE(newllc)) then
		tinsert(btn,1,"Tra xem"..appName..", §Ö tö ®· hoµn thµnh"..newllc.."nhiÖm vô /#ChaLilian('"..safestr(appName).."')")
	end
	Describe(str,getn(btn),btn)
	return
end

function ChaSelfInfo() --Í½µÜ²é×Ô¼ºµÄĞÅÏ¢
	local str
	if(FALSE(GetSex())) then --ÄĞ
		str = "<link=image[0,0]:\\spr\\Ui3\\Íæ¼ÒĞ¤Ïñ\\Ğ¤Ïñ\\001.spr>"
	else
		str = "<link=image[0,0]:\\spr\\Ui3\\Íæ¼ÒĞ¤Ïñ\\Ğ¤Ïñ\\003.spr>"
	end
	str = str..GetName().."<link>:"..sex2Word(GetSex()).."<enter>"
	
	local master = GetMaster(GetName())
	master = master or ""
	str = str.."Khi b¹n ®¹t "..tostring(GetTask(TKID_ENTER_LEVEL)).."cÊp, b¸i nhËp l­¬ng s­ "..master.."s­ m«n cña, "
	local masterCount = GetTask(TKID_MASTER_COUNT)
	if(masterCount<=1) then
		str = str.."B¹n ch¬i lµ ng­êi thÇy ®Çu tiªn cña b¹n."
	else
		str = str.."Tr­íc kia, b¹n ®· b¸i "..tostring(masterCount-1).." lµm s­ phô "
	end
	local myLvl = GetLevel()
	if(myLvl<80) then
		str = str.."HiÖn t¹i ®¼ng cÊp cña b¹n ®­îc n©ng ®Õn"..tostring(myLvl).."cÊp.<enter>"
	else
		str = str.."HiÖn t¹i b¹n ®¹t"..tostring(myLvl)..". §¹t yªu cÇu xuÊt s­.<enter>"
	end
	local lilianCount = GetLilianCount()
	local newllc = HaveNewLilian(PlayerIndex)
	if(lilianCount<1) then
		if(TRUE(newllc)) then
			str = str.."b¹n ®· hoµn thµnh <color=yellow>"..newllc.."<color> nhiÖm vô thİ luyÖn giang hå, ®ang chêphôc mÖnh víi s­ phô:<enter>"
			local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
			for i=1,getn(newll) do
				str = str.."  "..newll[i].."<enter>"
			end
		else
			str = str.."®Õn nay, b¹n cßn 1 viÖc ch­a thµnh."
		end
	else
		local masterllCount = GetMasterLilianCount()
		if(FALSE(masterllCount)) then --Î´ÔÚÎÒÃûÏÂÍê³ÉÁËÈÎÎñ  
			if(TRUE(newllc)) then
				str = str.."HiÖn b¹n ®· hoµn thµnh <color=yellow>"..newllc.."<color> nhiÖm vô thİ luyÖn giang hå, ®ang chêphôc mÖnh víi s­ phô:<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."Tr­íc kia, b¹n ®· hoµn thµnh."..lilianCount.."nhiÖm vô thİ luyÖn giang hå, "
			str = str.."nh­ng d­íi tªn tuæi cña s­ phô, b¹n ch­a hoµn thµnh nhiÖm vô thİ luyÖn giang hå nµo.<enter>"
		else
			if(TRUE(newllc)) then
				str = str.."b¹n ®· hoµn thµnh <color=yellow>"..newllc.."<color> nhiÖm vô thİ luyÖn giang hå, ®ang chêphôc mÖnh víi s­ phô:<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."Tr­íc kia, b¹n ®· hoµn thµnh."..lilianCount.."nhiÖm vô thİ luyÖn giang hå, "
			str = str.."trong sè nhiÖm vô hoµn thµnh nh­ sau<color=green>"..masterllCount.."<color> nhiÖm vô thİ luyÖn giang hå:<enter>"
			local masterLilian = GetLLFinishedInfo(GetPlayerMasterLilian(PlayerIndex))
			for i=1,getn(masterLilian) do
				str = str.."  "..masterLilian[i].."<enter>"
			end
		end
	end
	local unfinishedLilian = GetLLUnfinishedInfo(GetPlayerLilian(PlayerIndex))
	if(unfinishedLilian) then
		str = str.."B¹n cßn<color=red>"..getn(unfinishedLilian).."<color>viÖc ch­a phôc mÖnh, ph©n biÖt lµ:<enter>"
		for i=1,getn(unfinishedLilian) do
			str = str.."  "..unfinishedLilian[i].."<enter>"
		end
	else
		str = str.."B¹n ®· hoµn thµnh tÊt c¶ nhiÖm vô thİ luyÖn giang hå!"
	end
	local btn = {
		"Trë l¹i/ApprenticeDialog",
		" §ãng/Quit"
	}
	if(TRUE(newllc)) then
		tinsert(btn,1,"Cã "..newllc.."viÖc thİ luyÖn cã thÓ phôc mÖnh víi s­ phô /Fuming")
	end
	Describe(str,getn(btn),btn)
	return
end

function SfChaShifu()
	local btn = {
		"Trë l¹i/MasterDialog",
		" §ãng/Quit"
	}
	local str = safeshow(GetName())..":"..sex2Word(GetSex()).."<enter>"
	local lid = GetShituLeagueId(GetName())
	if(FALSE(lid) and FALSE(GetTask(TKID_APPRENTICE_COUNT))) then
		str = str.."§Õn nay, ch­a lµm qua s­ phô."
		Say(str,getn(btn),btn)
		return
	end
	str = str.."§Õn nay, ®· thu nhËn "..GetTask(TKID_APPRENTICE_COUNT).." ®å ®Ö,"
	str = str.." trong ®ã huÊn luyÖn thµnh c«ng "..GetTask(TKID_DICHUAN_APPRENTICE_COUNT).." ®İch truyÒn ®Ö tö, "
	str = str..GetTask(TKID_ZHIXI_APPRENTICE_COUNT).." trùc hÖ ®Ö tö, "
	str = str..GetTask(TKID_NORMAL_APPRENTICE_COUNT).." phæ th«ng ®Ö tö."
	str = str.."HiÖn t¹i, b¹n cã thÓ dÉn d¾t"..ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT)).." ®å ®Ö,"
	str = str.." H¬n n÷a, hiÖn ®· thu nhËn "..tostring(GetApprenticeNum(GetName())).." ®å ®Ö."
	Say(str,getn(btn),btn)
	return
end

function TdChaShifu()
	local masterName = GetMaster(GetName())
	if(not masterName) then
		Msg2Player("HiÖn b¹n ch­a cã s­ phô.")
		return
	end
	local btn = {
		"Trë l¹i/ApprenticeDialog",
		" §ãng/Quit"
	}
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Say("S­ phô cña b¹n"..safeshow(masterName).." hiÖn ®· mÊt tİch, b¹n kh«ng thÓ t×m hiÓu t×nh h×nh cña s­ phô.",getn(btn),btn)
		return
	end
	local master = getPlayerInfo(masterIdx,{"sex"},{TKID_APPRENTICE_COUNT,
		TKID_DICHUAN_APPRENTICE_COUNT,TKID_ZHIXI_APPRENTICE_COUNT,TKID_NORMAL_APPRENTICE_COUNT})
	local str = safeshow(masterName)..":"..sex2Word(master.sex).."<enter>"
	str = str.."§Õn nay, ®· thu nhËn "..master.task[TKID_APPRENTICE_COUNT].." ®å ®Ö,"
	str = str.." trong ®ã huÊn luyÖn thµnh c«ng "..master.task[TKID_DICHUAN_APPRENTICE_COUNT].." ®İch truyÒn ®Ö tö, "
	str = str..master.task[TKID_ZHIXI_APPRENTICE_COUNT].." trùc hÖ ®Ö tö, "
	str = str..master.task[TKID_NORMAL_APPRENTICE_COUNT].." phæ th«ng ®Ö tö."
	str = str.."HiÖn t¹i, "..safeshow(masterName).."tæng cã thÓ dÉn d¾t "..ComputeMasterLoad(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).." ®å ®Ö,"
	str = str.." H¬n n÷a, hiÖn ®· thu nhËn "..tostring(GetApprenticeNum(masterName)).." ®å ®Ö."
	Say(str,getn(btn),btn)
	return
end

--µÃµ½ÓĞĞÂÀúÁ·µÄÍ½µÜÁĞ±í
function GetHaveNewLilianApps(playerName)
	local apps = GetApprentice(playerName)
	if(not apps) then return nil end
	local tab = {}
	for i=1 ,getn(apps) do
		local pid = SearchPlayer(apps[i])
		if(TRUE(pid)) then
			local num = HaveNewLilian(pid)
			if(TRUE(num)) then
				tab[getn(tab) + 1] = {apps[i],num}
			end
		end
	end
	if(getn(tab)<1) then
		return nil
	end
	return tab
end

--µÃµ½¿ÉÒÔ³öÊ¦µÄÍ½µÜµÄÁĞ±í
function GetEnableChushiApps(playerName)
	local apps = GetApprentice(playerName)
	if(not apps) then return nil end
	local tab = {}
	for i=1 ,getn(apps) do
		local pid = SearchPlayer(apps[i])
		if(TRUE(pid)) then
			local lvl = callPlayerFunction(pid,GetLevel)
			if(lvl>=80) then
				tinsert(tab,{apps[i],lvl})
			end
		end
	end
	if(getn(tab)<1) then
		return nil
	end
	return tab
end

function DefaultDialog()
	local btn = {}
	local szOp = {
		"T×m hiÓu S­ ®å thiÕp/AboutShituCard",
		"T×m hiÓu S­ ®å thiÕp hoµng kim (thuyÕt minh ®Æc tİnh) /AboutShituGoldCard",
		" §ãng/Quit"
	};
	
	local lvl = GetLevel()
	if (lvl < 80 and GetTask(TKID_GOLD_APPRENTICE) == 1) then
		tinsert(btn,"Ph¸t th«ng b¸o b¸i s­ trªn tÇn sè thÕ giíi/SendBaiShiBidding")
	end
	
	tinsert(btn, szOp[1])
	-- VN_MODIFY_20060427
	-- ¹Ø±Õ»Æ½ğÊ¦Í½¿¨(ËµÃ÷)
	--tinsert(btn, szOp[2])
	tinsert(btn, szOp[3])
	
	local str = "S­ ®å thiÕp dïng ®Ó g¾n kÕt quan hÖ s­ ®å, h¬n n÷a cã thÓ sö dông chøc n¨ng s­ ®å t­¬ng quan. NÕu b¹n ch­a cã quan hÖ s­ ®å, h·y lËp ®éi nhãm víi ng­êi ch¬i kh¸c råi míi sö dông S­ ®å thiÕp!"
	Say(str,getn(btn),btn)
	return
end

Quit = function() end

function AboutShituCard()
	local str =
		"Trong thÕ giíi kiÕm hiÖp, ng­êi ch¬i tõ cÊp 80 trë xuèng (kh«ng gåm cÊp 80) , sö dông <color=green>S­ ®å thiÕp<color> cã thÓ b¸i ng­êi ch¬i cÊp 80 trë lªn (gåm c¶ cÊp 80) lµm s­ phô.<enter>"..
		"Mét khi sö dông quan hÖ s­ ®å gi÷a ng­êi ch¬i, s­ phô cÇn cã chøc tr¸ch nhÊt ®Şnh, chØ ®¹o hoÆc gióp ®ì ®Ö tö hoµn thµnh hÖ thèng nhiÖm vô <color=yellow>thİ luyÖn giang hå<color>, vµ cho ®å ®Ö sau khi d¹t ®­îc cÊp 80 xuÊt s­, s­ phô ®ã ®­îc xem nh­ dÉn d¾t 1 ®å ®Ö thµnh c«ng.<enter>"..
		"Trong thÕ giíi kiÕm hiÖp, 1 ®å ®Ö ®ång thêi chØ cã 1 s­ phô vµ 1 s­ phô cã thÓ ®ång thêi thu nhËn nhiÒu ®å ®Ö. NÕu ng­êi ch¬i tõ cÊp 25 trë xuèng (bao gåm cÊp 25) vµ ch­a bao giê b¸i s­, sau khi b¸i nhËp thµnh c«ng 1 s­ phô, ng­êi ch¬i ®ã chİnh lµ <color=yellow>§İchtruyÒn ®Ö tö<color> cña s­ phô;NÕu ng­êi ch¬i tõ cÊp 25 trë lªn (kh«ng bao gåm cÊp 25) b¸i nhËp 1 s­ phô, ng­êi ch¬i lµ <color=yellow>®Ö tö trùc hÖ<color> cña s­ phô;NÕu ng­êi ch¬i tr­íc kia ®· b¸i s­ nh­ng ®· chÊm døt quan hÖ s­ ®å víi tiÒn s­, b¸i nhËn 1 s­ phô, ng­êi ch¬i sÏ lµ <color=yellow>phæ th«ng ®Ö tö<color> cña s­ phô.<enter>"..
		"<enter>§iÒu kiÖn trë thµnh ®å ®Ö:<enter>"..
		"1, Ng­êi ch¬i tõ cÊp 80 trë xuèng (kh«ng gåm cÊp 80)<enter>"..
		"2, Kh«ng lµ ®å ®Ö cña mét s­ phô nµo ®ã<enter>"..
		"<enter>§iÒu kiÖn trë thµnh s­ phô:<enter>"..
		"1, Ng­êi ch¬i tõ cÊp 80 trë lªn (bao gåm cÊp 80)<enter>"..
		"2, Kh«ng lµ ®å ®Ö cña mét s­ phô nµo ®ã<enter>"..
		"<enter>C¸ch nhËn ®­îc S­ ®å thiÕp:<enter>"..
		"1, nh©n vËt ®­îc t¹o míi: cã s½n S­ ®å thiÕp trong hµnh trang<enter>"..
		"2, Nh©n vËt ®· t¹o: mua S­ ®å thiÕp ë c¸c tiÖm t¹p hãa, gi¸ b¸n lµ 100 l­îng<enter>"
	Describe(str,2,"Trë l¹i/main"," §ãng/Quit")
	return
end

function AboutShituGoldCard()
	local str =
		"<color=yellow>S­ ®å thiÕp Hoµng Kim<color>ngoµi chøc n¨ng lµ S­ ®å thiÕp b×nh th­êng ra, nã cßn mang nh÷ng ®Æc tİnh d­íi ®©y:<enter>"..
		" 1. Cã thÓ ph¸t th«ng b¸o 1 lÇn lªn tÇn sè thÕ giíi, t×m thÇy xin b¸i s­<enter>"..
		" 2. Khi phôc mÖnh víi s­ phô ®å ®Ö sÏ nhËn ®­îc 50%, s­ phô 20% phÇn th­ëng ®iÓm kinh nghiÖm<enter>"..
		" 3. PhÇn th­ëng bÊt ngê S­ ®å thiÕp Hoµng Kim chØ cã hiÖu lùc khi ®å ®Ö sö dông<enter>"..
		" 4. S­ ®å thiÕp Hoµng Kim kh«ng thÓ ®Ó r¬i xuèng ®Êt, kh«ng thÓ giao dŞch víi ng­êi ch¬i kh¸c<enter>"..
		"<enter>C¸ch nhËn S­ ®å thiÕp Hoµng Kim:<enter>"..
		" 1. Sö dông cd-key kİch ho¹t vµo sè tµi kho¶n gia nhËp <color=green>hÖ thèng Qu¶ng c¸o<color>, lµ cã thÓ nhËn ®­îc 1 tÊm <color=yellow>S­ ®å thiÕp Hoµng Kim<color><enter>"..
		" 2. Sö dông mét tµi kho¶n chØ cã 1 nh©n vËt cã thÓ nhËn ®­îc <color=yellow>S­ ®å thiÕp Hoµng Kim<color>"
		
	Describe(str,2,"Trë l¹i/main"," §ãng/Quit")
	return
end


-- ¼ì²âÆßÌìÖ®ÄÚÊÇ·ñÒÑ¾­ÊÕÁË 5 ¸öÍ½µÜ
function checkTudiLimit()
	
	-- ÔÚ´ËÅĞ¶ÏÊÇ·ñ³¬¹ıÁË 7 Ìì 5 ¸öÍ½µÜµÄÏŞÖÆ
	local nNowTime = GetCurServerTime();
	local nOldTime = GetTask(ID_SHITU_LIMIT_DATE);  -- µÚÒ»´ÎÊÕÍ½µÜµÄ¼ÇÂ¼
	local nNowCount = GetTask(ID_SHITU_LIMIT_NUM);
	
		if nNowTime - nOldTime<CONST_SHITU_LIMIT_TIME then
			-- Èç¹û³¬¹ıÁË´ÎÊıÏŞÖÆ
			if nNowCount>=5 then
				return 0;
			else
				return 1;
			end;
		else
			-- Èç¹û³¬¹ıÁË 7 Ìì£¬ÔòÖØÖÃ±äÁ¿
			SetTask(ID_SHITU_LIMIT_NUM, 0);
			return 1;
		end;
end;


-- Ğ´ÈëÊÕÍ½µÜµÄÏŞÖÆ
function writeTudiLimit()
	
	-- ÔÚ´Ë¼ÓÈëÊÕÍ½µÜµÄÏŞÖÆ¼ÇÂ¼
	SetTask(ID_SHITU_LIMIT_NUM, GetTask(ID_SHITU_LIMIT_NUM) + 1);	
	
	-- Èç¹ûÊÇµÚÒ»´ÎÊÕÍ½µÜÔò¼ÇÂ¼ÈÕÆÚ
	if GetTask(ID_SHITU_LIMIT_NUM)==1 then
		SetTask(ID_SHITU_LIMIT_DATE, GetCurServerTime());
	end;
	
end;


function main()
	if (ST_IsTransLife() == 1 and GetLevel() < 80) then
		Say("LÜnh héi B¾c §Èu Tr­êng Sinh ThuËt - T©m Ph¸p Thiªn xong, ë cÊp 80 vÒ tr­íc kh«ng thÓ sö dông S­ §å ThiÕp.", 0);
		return 1
	end;
	local degree = GetPlayerDegree(PlayerIndex)
	
	if(degree == CONST_DEGREE_PREAPPRENTICE) then
		local masters = FindMaster()
		if(not masters) then
			DefaultDialog()
			return 1
		end
		BaishiList(masters)
		return 1
	end
	if(degree == CONST_DEGREE_PREMASTER) then	
		local apps = FindApprentice()
		if(not apps) then
			DefaultDialog()
			return 1
		end
		ShoutuList(apps)
		return 1
	end
	if(degree == CONST_DEGREE_MASTER) then
		MasterDialog()
		return 1
	end
	if(degree == CONST_DEGREE_APPRENTICE) then
		ApprenticeDialog()
		return 1
	end
	return 1
end

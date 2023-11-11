Include ("\\script\\shitu\\shitu_head.lua")
Include ("\\script\\lib\\player.lua")
Include ("\\script\\shitu\\lilian.lua")
Include ("\\script\\shitu\\chushibonus.lua")

IncludeLib("LEAGUE")
IncludeLib("TITLE")
function validateName(name)
	return not strfind(name,");")
end

function GetName()
	local name = %GetName()
	if(not validateName(name)) then
		return ""
	end
	return name
end

--------------------
function st_print(str)
	print(str)
end

--------------------
--½¨Á¢apprenticeIdx,ÓëmasterIdxµÄÊ¦Í½¹ØÏµ qilei use it 
function BuildRelationship(apprenticeName,masterName)
	
	print("Call BuildRelationship("..tostring(apprenticeName)..","..tostring(masterName)..").")
	local masteridx = SearchPlayer(masterName)
	local apprenticeidx = SearchPlayer(apprenticeName)
	if (masteridx <= 0 or apprenticeidx <= 0) then
		print("player not online")
		return 0
	end
	if (haveLastShituOperation(masteridx) > 0 or haveLastShituOperation(apprenticeidx) > 0) then
		st_print("haveLastShituOperation... fail.");
		return 0
	end

	local lid,mid = GetShituLeagueId(masterName),LGM_CreateMemberObj()
	if(FALSE(lid)) then
		
		lid = LG_CreateLeagueObj()
		LG_SetLeagueInfo(lid, CONST_LEAGUETYPE_SHITU, masterName)
		print(masterName)
		LGM_SetMemberInfo(mid, masterName, CONST_LEAGUEJOB_MASTER,CONST_LEAGUETYPE_SHITU, masterName)
		LG_AddMemberToObj(lid, mid)
		LGM_SetMemberInfo(mid, apprenticeName, CONST_LEAGUEJOB_APPRENTICE,CONST_LEAGUETYPE_SHITU, masterName)
		LG_AddMemberToObj(lid, mid)
		
		--¼ÇÂ¼½¨Ê¦Í½µÄ²Ù×÷
		setPlayerLastShituOperation(masteridx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
		setPlayerLastShituOperation(apprenticeidx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
		
		LG_ApplyAddLeague(lid, "\\script\\shitu\\shitu.lua", "OnBuildShituLeague")
		LGM_FreeMemberObj(mid)	
		LG_FreeLeagueObj(lid)
		return 1
	end

	LGM_SetMemberInfo(mid, apprenticeName, CONST_LEAGUEJOB_APPRENTICE,CONST_LEAGUETYPE_SHITU, masterName)
	setPlayerLastShituOperation(masteridx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
	setPlayerLastShituOperation(apprenticeidx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
	LGM_ApplyAddMember(mid, "\\script\\shitu\\shitu.lua", "OnJoinShituLeague")
	LGM_FreeMemberObj(mid)
	return 1
end

function setPlayerLastShituOperation(lplayeridx, operation, data1, data2)
	oldPly = PlayerIndex
	PlayerIndex = lplayeridx
	SetTask(TKID_LAST_SHITU_OPERATION, operation)
	SetTask(TKID_LAST_SHITU_DATA1, data1)
	SetTask(TKID_LAST_SHITU_DATA2, data2)
	st_print("setOperation: "..GetName().."(op:"..operation..") (data1:"..data1..") (data2"..data2..")");
	PlayerIndex = oldPly
end

function haveLastShituOperation(lplayeridx)
	if (lplayeridx == nil) then
		return 0
	end
	oldPly = PlayerIndex
	PlayerIndex = lplayeridx 
	bResult = GetTask(TKID_LAST_SHITU_OPERATION)
	if (bResult > 0) then
		print("last operation is "..bResult)
	end
	PlayerIndex = oldPly
	return bResult
end

function OnBuildShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	print("Call OnBuildShituLeague("..tostring(nLeagueType)..","..tostring(szLeagueName)..","..tostring(szMemberName)..","..tostring(bSucceed)..").")
	local lid = GetShituLeagueId(szLeagueName)
	if(nLeagueType ~= CONST_LEAGUETYPE_SHITU) then
		print("League type error on build shitu relationship.")
		return 0
	end
	
	if(FALSE(bSucceed)) then
		print("LËp ®éi nhãm kh«ng thµnh c«ng!")
		local pappid = SearchPlayer(szMemberName)
		if (pappid > 0) then
				clearLastShituOperation(pappid)
		end
		
		local pmasterid = SearchPlayer(szLeagueName)
		if (pmasterid > 0) then
				clearLastShituOperation(pmasterid)
		end
		return 0
	end

		local num = LG_GetMemberCount(lid)
		if (num == 2) then
			for i=0,num -1 do
				local name,job = LG_GetMemberInfo(lid, i)
				if(job == CONST_LEAGUEJOB_APPRENTICE) then --Í½µÜÊÇÒ²
					JoinShituSuccess(nLeagueType, szLeagueName, name)	
					return
				end
			end
		end

	JoinShituSuccess(nLeagueType, szLeagueName, szMemberName)	

end

function JoinShituSuccess(nLeagueType, szLeagueName, szMemberName)
	local lid = LG_GetLeagueObj(CONST_LEAGUETYPE_SHITU, szLeagueName)
	if(FALSE(lid)) then
		print("§éi nhãm kh«ng tån t¹i")
		return 0
	end

	local num = LG_GetMemberCount(lid)
	for i=0,num -1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(job == CONST_LEAGUEJOB_APPRENTICE and name == szMemberName) then --Í½µÜÊÇÒ²
			mastername = szLeagueName
			local pappid = SearchPlayer(name)
			local pmastid = SearchPlayer(mastername)
			
			if(pappid > 0) then
				setApprenticeEnterData(pappid)
				clearLastShituOperation(pappid)
			end
			if (pmastid > 0) then
				setMasterWhenNewApprentice(pmastid)
				clearLastShituOperation(pmastid)
			end
			
			-- ÎªÍ½µÜÌí¼Ó³ÆºÅ
			--callPlayerFunction(pappid, Title_AddTitle, CONST_SHITU_TU_TITLEID, 0, -1);
			--callPlayerFunction(pappid, Title_ActiveTitle, CONST_SHITU_TU_TITLEID);
			
			return 1
		end
	end
	
	return 0
end

function FindLeagueMember(szLeagueName, nameid)
	local lid = LG_GetLeagueObj(CONST_LEAGUETYPE_SHITU, szLeagueName)
	if(FALSE(lid)) then
		print("§éi nhãm kh«ng tån t¹i")
		return "",0
	end

	local num = LG_GetMemberCount(lid)
	for i=0,num -1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if (FileName2Id(name) == nameid) then
			return name, job
		end
	end
	return "", 0
end


function OnJoinShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	print("Call OnJoinShituLeague("..tostring(nLeagueType)..","..tostring(szLeagueName)..","..tostring(szMemberName)..","..tostring(bSucceed)..").")
	
	if(nLeagueType ~= CONST_LEAGUETYPE_SHITU) then
		print("League type error on build shitu relationship.")
		return 0
	end
	
	if(FALSE(bSucceed)) then
		print("LËp ®éi nhãm kh«ng thµnh c«ng!")
		local pappid = SearchPlayer(szMemberName)
		if (pappid > 0) then
				clearLastShituOperation(pappid)
		end
		
		local pmastid = SearchPlayer(szLeagueName)
		if (pmastid > 0) then
			clearLastShituOperation(pmastid)
		end
		
		return 0
	end
	return JoinShituSuccess(nLeagueType, szLeagueName, szMemberName)
end

tb_playerinfo_setapprdata = {"name","level"}
tb_playertask_setapprdata = {TKID_MASTER_COUNT}

--³õÊ¼»¯Í½µÜ¼ÓÈëÊ¦Í½ÉçÍÅÖÐµÄÊý¾Ý
function setApprenticeEnterData(apprenticeIdx)
--´Ëº¯ÊýÓÃµ½Êý¾ÝÐÞÕýÖÐ
	print("Call setApprenticeJoinData("..tostring(apprenticeIdx)..").")
	-- local apprentice = getPlayerInfo(apprenticeIdx, {"name","level"}, {TKID_MASTER_COUNT})
	local apprentice = getPlayerInfo(apprenticeIdx, tb_playerinfo_setapprdata, tb_playertask_setapprdata)

	if (FALSE(haveLastShituOperation(apprenticeIdx))) then
		print("TKID_OPERATION hiÖn ch­a thÓ x¸c nhËn")
	end
	print("§¼ng cÊp lóc b¸i s­:"..apprentice.level)
	print(apprentice.task[TKID_MASTER_COUNT])
------------Í½µÜ³É¹¦°ÝÊ¦ÒÔºó£¬Êý¾ÝÔÚÕâÀïÉèÖÃ yfeng
	local tab = {
		[TKID_MASTER_LILIAN] = 0, --Í½µÜÔÚÉÏÒ»¸öÊ¦¸µµÄ´øÁìÏÂµÄ½­ºþÀúÁ·Çå¿Õ
		[TKID_ENTER_LEVEL] = apprentice.level,  --¼ÇÂ¼°ÝÊ¦Ê±ºòµÄµÈ¼¶
		[TKID_MASTER_COUNT] = apprentice.task[TKID_MASTER_COUNT]+1 --°ÝÊ¦ÊýÁ¿+1
	}
	
	setPlayerTask(apprenticeIdx,tab)
	clearLastShituOperation(apprenticeIdx)
	
	local masterName = GetMaster(apprentice.name)
	if(not masterName) then
		print("S­ phô kh«ng tån t¹i")
		return
	end
	
	sendMessage(apprenticeIdx,"Chóc mõng b¹n ®· b¸i thµnh c«ng"..masterName.." lµm s­ phô.")
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then --Ê¦¸µ²»ÔÚÏß
		print("X©y dùng thµnh c«ng quan hÖ S­ ®å nh­ng S­ phô kh«ng cã trªn m¹ng.")
		return
	end
	
	sendMessage(masterIdx,"Chóc mõng b¹n ®· ®­îc th©u nhËn"..apprentice.name.." lµm ®å ®Ö.")
	return
end


--´Ë´¦±àÐ´Ê¦¸¶ÐÂ¼ÓÍ½µÜÊ±ÐèÒªµÄ¼ÇÂ¼ qilei
--Add
function setMasterWhenNewApprentice(masterIdx)
--´Ëº¯ÊýÓÃµ½Êý¾ÝÐÞÕýÖÐ
--to add
---Í½µÜ³É¹¦°ÝÊ¦ÒÔºó£¬Ê¦¸µµÄÊý¾ÝÔÚÕâÀïÉèÖÃ yfneg
	--ÊÕÍ½µÜÊý¶à1
	print("setMasterWhenNewApprentice",masterIdx)
	print(callPlayerFunction(masterIdx,GetTask,TKID_APPRENTICE_COUNT))
	callPlayerFunction(masterIdx,SetTask,TKID_APPRENTICE_COUNT,
		callPlayerFunction(masterIdx,GetTask,TKID_APPRENTICE_COUNT)+1)
	print(callPlayerFunction(masterIdx,GetTask,TKID_APPRENTICE_COUNT))	
	clearLastShituOperation(masterIdx)
end

--½â³ýÊ¦Í½¹ØÏµ qilei use it 
function BreakShituLeague(apprentice)
	pidx = SearchPlayer(apprentice)
	
	if (pidx > 0) then 
		if (haveLastShituOperation(pidx) > 0) then
			print("no end last oper")
			return 
		end
	end
	
	print("Call BreakShituLeague("..apprentice..").")
	local lid = GetShituLeagueId(apprentice)
	if(FALSE(lid)) then
		print("Quan hÖ S­ ®å kh«ng tån t¹i.")
		return
	end
	
	local leagueName = LG_GetLeagueInfo(lid)
	
	local joinTime = LG_GetMemberJoinTime(CONST_LEAGUETYPE_SHITU, leagueName, apprentice);
	local curTime = GetCurServerTime();
	if (curTime - joinTime < CONST_BREAKSHITU_PROTECTEDTIME) then
		Say("B¹n vµ "..safeshow(apprentice).."quan hÖ S­ ®å kh«ng ®ñ 24 giê, kh«ng thÓ xãa bá!", 0);
		Msg2Player("B¹n vµ "..apprentice.."quan hÖ S­ ®å kh«ng ®ñ 24 giê, kh«ng thÓ xãa bá!");
		return
	end
	--×îºóÒ»¸ö²ÎÊý1±íÊ¾£¬Èç¹ûÇå³ýÊ¦Í½¶ÓÎéµÄ³ÉÔ±Ê±£¬Èç¹û×îÖÕÖ»Ê£Ò»¸ö³ÉÔ±£¨Ê¦¸¶£©Ê±£¬ÔòÏµÍ³×Ô¶¯É¾³ý¸ÃÊ¦Í½League
	LGM_ApplyRemoveMember(CONST_LEAGUETYPE_SHITU, leagueName, apprentice, "\\script\\shitu\\shitu.lua", "OnBreakShituLeague", 1)
end

function OnBreakShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	print("Call OnBreakShituLeague("..tostring(nLeagueType)..","..tostring(szLeagueName)..","..tostring(szMemberName)..","..tostring(bSucceed)..").")
	if(nLeagueType ~= CONST_LEAGUETYPE_SHITU) then
		print("Lo¹i quan hÖ S­ ®å kh¸c th­êng")
		return
	end
	
	local appIdx = SearchPlayer(szMemberName)
	local masterIdx = SearchPlayer(szLeagueName)

	if (appIdx > 0) then
		sendMessage(appIdx,"B¹n ®· cïng"..szLeagueName.."Xãa bá quan hÖ S­ ®å.")
		clearLastShituOperation(appIdx)	
	end

	if (masterIdx > 0) then
		sendMessage(masterIdx,"B¹n ®· cïng"..szMemberName.."Xãa bá quan hÖ S­ ®å.")
		clearLastShituOperation(masterIdx)
	end
end

--ÓÐÍ½µÜÔÚ³öÊ¦×´Ì¬£¬Ôò²»ÄÜ³öÊ¦
function IsGraduateInLeague(playerIdx)
	local apprentice = getPlayerInfo(playerIdx,nil,{TKID_APPLY_GRADUATE},nil)
	PlayerIndex = playeridx

	local lid = GetShituLeagueId(GetName())
	local num = LG_GetMemberCount(lid)
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid,i)
		if(apprentice.task[TKID_APPLY_GRADUATE] ==FileName2Id(name)) then
			return 1
		end
	end
	return nil 
end

--³öÊ¦qilei use it
tb_playertask_chushimaster = {
	TKID_LAST_SHITU_OPERATION,
	TKID_CHUSHI_MASTER_BONUS,
	TKID_DICHUAN_APPRENTICE_COUNT,
	TKID_ZHIXI_APPRENTICE_COUNT,
	TKID_NORMAL_APPRENTICE_COUNT
}

tb_playerinfo_chushiapprentice = {"name"}
tb_playertask_chushiapprentice = {
	TKID_LAST_SHITU_OPERATION,
	TKID_ENTER_LEVEL,
	TKID_CHUSHI_APPRENTICE_BONUS,
	TKID_CHUSHI_DICHUAN_BONUS,
	TKID_CHUSHI_ZHIXI_BONUS,
	TKID_MASTER_COUNT
}

function OutShituLeague(apprenticeName, masterName)
	print("Call OutShituLeague("..apprenticeName..","..masterName..").")
	local appIdx = SearchPlayer(apprenticeName)
	local masterIdx = SearchPlayer(masterName)
	
	if(FALSE(appIdx)) then
		print("§å ®Ö kh«ng lªn m¹ng")
		sendMessage(masterIdx,apprenticeName.."HiÖn kh«ng biÕt tung tÝch.")
		return
	end
	if(FALSE(masterIdx)) then
		print("S­ phô kh«ng lªn m¹ng")
		sendMessage(appIdx,masterName.."HiÖn kh«ng biÕt tung tÝch.")
		return
	end
	
	local lidApp = GetShituLeagueId(apprenticeName)
	local lidMaster = GetShituLeagueId(masterName)
	if(FALSE(lidApp) or FALSE(lidMaster) or lidApp ~= lidMaster) then
		print("Quan hÖ S­ ®å 2 ng­êi nµy kh¸c l¹ ")
		return
	end
	
	--ÉèÖÃÊ¦¸µµÄ³öÊ¦±êÊ¶ºÍ½±Àø
	--Èç¹û³öÊ¦±êÊ¶²»Îª0£¬Ôò±íÊ¾£¬ÒÑÓÐÍ½µÜÉêÇë³öÊ¦£¬µ«ÉÐÎ´³É¹¦£¬´ËÊ±²»ÐíÆäËûÍ½µÜÔÙ³öÊ¦
	/*
	local master = getPlayerInfo(masterIdx,nil,
																					{TKID_LAST_SHITU_OPERATION,
																						TKID_CHUSHI_MASTER_BONUS,
																						TKID_DICHUAN_APPRENTICE_COUNT,
																						TKID_ZHIXI_APPRENTICE_COUNT,
																						TKID_NORMAL_APPRENTICE_COUNT})																						
	local apprentice = getPlayerInfo(appIdx,
																	{"name"},
																	{TKID_LAST_SHITU_OPERATION,
																	TKID_ENTER_LEVEL,
																	TKID_CHUSHI_APPRENTICE_BONUS,
																	TKID_CHUSHI_DICHUAN_BONUS,
																	TKID_CHUSHI_ZHIXI_BONUS,
																	TKID_MASTER_COUNT})
	*/
	local master = getPlayerInfo(masterIdx, nil, tb_playertask_chushimaster)
	local apprentice = getPlayerInfo(appIdx, tb_playerinfo_chushiapprentice, tb_playertask_chushiapprentice)

	if (apprentice.task[TKID_LAST_SHITU_OPERATION] ~= 0 or master.task[TKID_LAST_SHITU_OPERATION] ~= 0) then
		print("thao t¸c lÇn tr­íc kh«ng thµnh c«ng,   kh«ng thÓ thùc hiÖn thao t¸c kh¸c!")
		return
	end
																	
	if(FALSE(apprentice.task[TKID_MASTER_COUNT])) then
		print("mastercount no right")
--		return
	end
	
	--ÉèÖÃ³öÊ¦×´Ì¬
	local apprenticeTab = {
		[TKID_LAST_SHITU_OPERATION] = CONST_OPER_GRADUATE,
		[TKID_LAST_SHITU_DATA1] = FileName2Id(apprentice.name),						--¼ÇÂ¼×ÔÒÑµÄÐÕÃû£¬±íÊ¾×ÔÒÑÒª³öÊ¦
		[TKID_LAST_SHITU_DATA2] = 0,
		[TKID_CHUSHI_APPRENTICE_BONUS] = CONST_BONUS_COUNT_APPRENTICE				--¼ÇÂ¼×ÔÒÑ³öÊ¦³É¹¦µÄ»°¿ÉÒÔµÃµ½Ê²Ã´ÑùµÄ½±Àø
	}

	if(apprentice.task[TKID_MASTER_COUNT]==1) then --µÕ´«/Ö±Ïµ
		if(apprentice.task[TKID_ENTER_LEVEL]>25) then --Ö±Ïµ
			apprenticeTab[TKID_CHUSHI_ZHIXI_BONUS] = apprentice.task[TKID_CHUSHI_ZHIXI_BONUS]+1
		else --µÕ´«
			apprenticeTab[TKID_CHUSHI_DICHUAN_BONUS] = apprentice.task[TKID_CHUSHI_DICHUAN_BONUS]+1
		end
	else
		apprenticeTab[TKID_CHUSHI_APPRENTICE_BONUS]=0
	end
	
	
	setPlayerTask(appIdx,apprenticeTab)
	
	local masterTab =
	{
		[TKID_LAST_SHITU_OPERATION] = CONST_OPER_GRADUATE,
		[TKID_LAST_SHITU_DATA1] = FileName2Id(apprentice.name),									--¼ÇÂ¼½«Òª³öÊ¦µÄÍ½µÜÐÕÃû
		[TKID_LAST_SHITU_DATA2] = 0,
	}
		
	if(apprentice.task[TKID_MASTER_COUNT]==1) then
		if(apprentice.task[TKID_ENTER_LEVEL]<=25) then
			masterTab[TKID_DICHUAN_APPRENTICE_COUNT] = master.task[TKID_DICHUAN_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 5
		elseif(apprentice.task[TKID_ENTER_LEVEL]<50) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 4
		elseif(apprentice.task[TKID_ENTER_LEVEL]<65) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 3
		elseif(apprentice.task[TKID_ENTER_LEVEL]<75) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 2
		elseif(apprentice.task[TKID_ENTER_LEVEL]<80) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 1
		end
	else
		masterTab[TKID_NORMAL_APPRENTICE_COUNT] = master.task[TKID_NORMAL_APPRENTICE_COUNT]+1
	end
	setPlayerTask(masterIdx, masterTab)
	print("apply remove member")
	
	--×îºóÒ»¸ö²ÎÊý1±íÊ¾£¬Èç¹ûÇå³ýÊ¦Í½¶ÓÎéµÄ³ÉÔ±Ê±£¬Èç¹û×îÖÕÖ»Ê£Ò»¸ö³ÉÔ±£¨Ê¦¸¶£©Ê±£¬ÔòÏµÍ³×Ô¶¯É¾³ý¸ÃÊ¦Í½League
	LGM_ApplyRemoveMember(CONST_LEAGUETYPE_SHITU, masterName, apprenticeName, "\\script\\shitu\\shitu.lua", "OnOutShituLeague", 1)
	return
end


function OnOutShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	local mastername = szLeagueName
	if (mastername ~= nil or mastername ~= "") then
		local masterIdx = SearchPlayer(mastername)
		if (masterIdx > 0) then
			if (bSucceed == 1) then		--½±ÀøÊ¦¸¶
				graduateForMaster(masterIdx)
			end
			clearGraduateData(masterIdx)
		end		
	end
	
	local apprenticeIdx = SearchPlayer(szMemberName)
	if (apprenticeIdx > 0) then
		if (bSucceed == 1) then			--½±ÀøÍ½µÜ
			graduateForApprentice(apprenticeIdx)
		end
		clearGraduateData(apprenticeIdx)
	end
end

function patchShituProcess(lplayeridx)
	if (lplayeridx <= 0) then
		return
	end
	oldplayer = PlayerIndex
	PlayerIndex = lplayeridx
	local nApply_Operation = GetTask(TKID_LAST_SHITU_OPERATION)
	local nApply_Data1 = GetTask(TKID_LAST_SHITU_DATA1)
	local nApply_Data2 = GetTask(TKID_LAST_SHITU_DATA2)
	
	if (nApply_Operation == 0) then
		return
	end
	
	if (TABFUNS_PATCHSHITU[nApply_Operation] ~= nil) then
		TABFUNS_PATCHSHITU[nApply_Operation](lplayeridx,nApply_Data1, nApply_Data2)
	else
		print("have no patch funcs"..nApply_Operation)
	end
	PlayerIndex = oldplayer
end

function patchShitu_Join(lplayeridx, nData1, nData2)
	oldplayer = PlayerIndex
	
	PlayerIndex = lplayeridx
	print("Call patchShitu_Join")
	--Èç¹ûÍæ¼ÒÊÇÊ¦¸¶µÄ»°£¬²éÕÒµ±Ç°ÊÇ·ñÒÑ¾­ÓÐ¸ÃÍ½µÜÔÚ¶ÓÎéÖÐÁË£¬Èç¹ûÓÐËµÃ÷³É¹¦£¬Èç¹ûÃ»ÓÐÔò²»³É¹¦¡£
	--Èç¹ûÍæ¼ÒÊÇÍ½µÜµÄ»°£¬²éÕÒµ±Ç°ÊÇ·ñÒÑ¾­ÔÚ¸ÃÊ¦¸¶µÄ¶ÓÎéÖÐÁË£¬Èç¹ûÓÐËµÃ÷³É¹¦£¬Ã»ÓÐÔò²»³É¹¦¡£
	if (FileName2Id(GetName()) == nData1) then
			local lid = GetShituLeagueId(GetName())
			bSuccess = 0
			if(FALSE(lid)) then
				bSuccess = 0
			else
				if (GetMaster(GetName()) == GetName()) then
					local num = LG_GetMemberCount(lid)
					for i = 0, num - 1 do
						local name,job = LG_GetMemberInfo(lid, i)
						if (FileName2Id(name) == nData2) then
							bSuccess = 1
							break
						end
					end
				end
			
			end		
			
			if (bSuccess == 1) then
				setMasterWhenNewApprentice(lplayeridx)
			end
	elseif(FileName2Id(GetName()) == nData2) then
			local lid = GetShituLeagueId(GetName())
			bSuccess = 0
			
			if(FALSE(lid)) then
				bSuccess = 0
			else
				if (FileName2Id(GetMaster(GetName())) == nData1) then
					bSuccess = 1
				end
			end
			
			if (bSuccess == 1) then
				setApprenticeEnterData(lplayeridx)
			end
	end
	
	clearLastShituOperation(lplayeridx)
	
	PlayerIndex = oldplayer
end


function patchShitu_Graduate(lplayeridx, nData1, nData2)
	oldplayer = PlayerIndex
	--Èç¹û×ÔÒÑÊôÓÚÐèÒª³öÊ¦µÄÍ½µÜµÄ»°
	if (FileName2Id(GetName()) == nData1) then 
		-----------------------------------------------------------------
		--if (¼ì²éµ±Ç°ÊÇ·ñÒÑ¾­²»ÔÚÈÎºÎµÄÊ¦Í½¶ÓÎéÖÐÁË£¬»òÕßÏÖÔÚÒÑ¾­ÊÇÊ¦¸¶ÁË) then
		--	Èç¹ûÊÇµÄ»°£¬ÄÇÃ´ËµÃ÷ÉÏÒ»´ÎµÄ³öÊ¦²Ù×÷ÒÑ¾­³É¹¦ÁË£¬Ôò»òµÃÏàÓ¦µÄ½±Àø
		--else
		--Èç¹û²»ÊÇµÄ»°£¬ÄÇÃ´ËµÃ÷ÉÏÒ»´ÎµÄ³öÊ¦²Ù×÷²¢Ã»ÓÐ³É¹¦£¬ÔòÇå¿Õ²Ù×÷
		--end
		------------------------------------------------------------------
		curjob = GetLeagueJob(GetName())
		if (FALSE(curjob) or curjob == CONST_LEAGUEJOB_MASTER) then
			graduateForApprentice(lplayeridx)
		end
		clearGraduateData(lplayeridx)
	else
		------------------------------------------------------------------
		--if (¼ì²éµ±Ç°Íæ¼ÒµÄÊ¦Í½¶ÓÎéÖÐ²»´æÔÚ¸ÃÍ½µÜ»òÕß×ÔÒÑÒÑ¾­²»´øÍ½µÜÁË£¿)
		--	Èç¹ûÊÇµÄ»°£¬ÄÇÃ´ËµÃ÷ÉÏÒ»´ÎµÄÍ½µÜ³öÊ¦²Ù×÷ÒÑ³É¹¦ÁË£¬ÔòµÃµ½ÏàÓ¦µÄ½±Àø
		--else
		--	Èç¹û²»ÊÇµÄ»°£¬ÄÇÃ´ËµÃ÷ÉÏÒ»´ÎµÄ³öÊ¦²Ù×÷²¢Ã»³É¹¦£¬ÔòÇå¿Õ²Ù×÷
		--end
		-----------------------------------------------------------------

		local lid = GetShituLeagueId(GetName())
		local bSuccess = 1
		if(FALSE(lid)) then
			bSuccess = 1
		else
			local num = LG_GetMemberCount(lid)
			for i = 0, num - 1 do
				local name,job = LG_GetMemberInfo(lid, i)
				if (FileName2Id(name) == nData1) then
					bSuccess = 0
					break
				end
			end
		end
		if (bSuccess == 1) then
			graduateForMaster(PlayerIndex)
		end			
		clearGraduateData(PlayerIndex)
	end	

	PlayerIndex = oldplayer
end

function clearGraduateData(lplayeridx)
	--local graduateDataTab = {
		--[TKID_APPLY_GRADUATE] = 0,
		--[TKID_CHUSHI_APPRENTICE_BONUS] = 0,
		--[TKID_TKID_CHUSHI_MASTER_BONUS] = 0,
	--}
	--setPlayerTask(lplayeridx,graduateDataTab)
	setPlayerLastShituOperation(lplayeridx, 0, 0, 0)
end

function clearLastShituOperation(lplayeridx)
	setPlayerLastShituOperation(lplayeridx, 0, 0, 0)
end


--ÔÚ´Ë´¦±àÐ´Í½µÜ³öÊ¦ºó£¬Í½µÜ×ÔÒÑµÃµ½µÄ½±Àø
--¸ºÔð½±ÉÍÍ½µÜµÄº¯Êý   qilei 
function graduateForApprentice(appIdx)
	print("graduateforApprentice"..appIdx)
	--Í½µÜ³É¹¦³öÊ¦ÒÔºó£¬Í½µÜµÄÊý¾ÝºÍ½±ÀøÔÚÕâÀï´¦Àí yfeng
	--ÕâÀïÖ÷Òª·¢½±
--Õâ±»ÓÃµ½ÐÞÕýÀïÃæ
	local num = callPlayerFunction(appIdx,GetTask,TKID_CHUSHI_APPRENTICE_BONUS)
	callPlayerFunction(appIdx,SetTask,TKID_CHUSHI_APPRENTICE_BONUS,0)
	if(FALSE(num)) then
		return
	end
	if (num > 0) then
		PayHongbao(appIdx,num)
		sendMessage(appIdx,"Chóc mõng b¹n ®· xuÊt s­ vµ nhËn ®­îc ThÇn bÝ §¹i Hång Bao"..num.."c¸i.")
		name = callPlayerFunction(appIdx,GetName);
		WriteLog(name.."Chóc mõng b¹n ®· xuÊt s­ vµ nhËn ®­îc ThÇn bÝ §¹i Hång Bao"..num.."c¸i.")
	end
	return
	
end


--¸ºÔð½±ÉÍÊ¦¸¶µÄº¯Êý   qilei
--ÔÚ´Ë´¦±àÐ´Í½µÜ³öÊ¦ºó£¬Ê¦¸¶µÃµ½µÄ½±Àø
function graduateForMaster(masterIdx)
--Í½µÜ³É¹¦³öÊ¦ÒÔºó£¬Ê¦¸µµÄÊý¾ÝºÍ½±ÀøÔÚÕâÀï´¦Àí yfeng
--ÕâÀïÖ÷Òª·¢½±
--Õâ±»ÓÃµ½ÐÞÕýÀïÃæ
	print("graduateforMaster"..masterIdx)
	local num = callPlayerFunction(masterIdx,GetTask,TKID_CHUSHI_MASTER_BONUS)
	callPlayerFunction(masterIdx,SetTask,TKID_CHUSHI_MASTER_BONUS,0)
	
	if (FALSE(num)) then
		return
	end
	if (num > 0) then
		PayHongbao(masterIdx,num)
		sendMessage(masterIdx,"Chóc mõng b¹n ®· ®µo t¹o ®­îc 1 ®å ®Ö, nhËn ®­îc ThÇn bÝ §¹i Hång Bao"..num.."c¸i.")
		name = callPlayerFunction(masterIdx,GetName);
		WriteLog(name.."Chóc mõng b¹n ®· xuÊt s­ vµ nhËn ®­îc ThÇn bÝ §¹i Hång Bao"..num.."c¸i.")
	end
	return
end;

-----------------------------------------------------------------------------------------------
--»ñÈ¡Ê¦Í½¹ØÏµµÄÉçÍÅID
function GetShituLeagueId(playerName)
	local lid = LG_GetLeagueObjByRole(CONST_LEAGUETYPE_SHITU,playerName)
	return lid
end

tb_playerinfo_degree = {"name","level"}
tb_playertask_degree = {TKID_APPRENTICE_COUNT}

function GetPlayerDegree(playerIdx)
	print("Call GetPlayerDegree("..tostring(playerIdx)..").")
	-- local player = getPlayerInfo(playerIdx,{"name","level"},{TKID_APPRENTICE_COUNT})
	local player = getPlayerInfo(playerIdx, tb_playerinfo_degree, tb_playertask_degree)
	local job = GetLeagueJob(player.name)
	if(job) then
		return job
	end
	if(player.level >= 80) then
		if(TRUE(player.task[TKID_APPRENTICE_COUNT])) then
			return CONST_DEGREE_MASTER
		end
		return CONST_DEGREE_PREMASTER
	end
	return CONST_DEGREE_PREAPPRENTICE
	
end
function GetLeagueJob(player)
	print("Call GetLeagueJob("..tostring(player)..").")
	local lid = GetShituLeagueId(player)
	if(FALSE(lid)) then
		return nil
	end
	local num = LG_GetMemberCount(lid)
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(name == player) then
			return job
		end
	end
	return nil
end

function GetMaster(playerName)
	print("Call GetMaster("..tostring(playerName)..").")
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid)) then
		print("§éi ngò kh«ng tån t¹i.")
		return nil
	end
	local num = LG_GetMemberCount(lid)
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(job == CONST_LEAGUEJOB_MASTER) and validateName(name) then
			return name
		end
	end
	print("Trong ®éi ngò kh«ng cã s­ phô ")
	return nil
end

--µÃµ½playerIdx ËùÔÚµÄÊ¦Í½ÉçÍÅÖÐµÄÍ½µÜ¸öÊý
function GetApprenticeNum(playerName)
	print("GetApprenticeNum("..playerName..")")
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid)) then --player ²»ÔÚÉçÍÅÖÐ
		local pid = SearchPlayer(playerName)
		if(FALSE(pid)) then
			return nil
		end
		if(callPlayerFunction(pid,GetTask,TKID_APPRENTICE_COUNT)>0) then --playerName ÊÇÊ¦¸¸
			return 0
		elseif(callPlayerFunction(pid,GetLevel)>=80) then --player¿ÉÒÔ×öÊ¦¸¸
			return 0
		end
		--»¹Ã»°ÝÊ¦µÄÈË
		print("return nil")
		return nil
	end
	local num = LG_GetMemberCount(lid)
	return num -1
end

--µÃµ½playerNameËùÔÚÊ¦Í½¹ØÏµÖÐµÄËùÓÐÍ½µÜÁÐ±í
function GetApprentice(playerName)
	print("Call GetApprentice("..playerName..").")
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid)) then
		print("Quan hÖ s­ ®å kh«ng tån t¹i")
		return nil
	end
	local num = LG_GetMemberCount(lid)
	local tab = {}
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(job == CONST_LEAGUEJOB_APPRENTICE) and validateName(name) then
			tab[getn(tab) + 1] = name
		end
	end
	if(getn(tab)==0) then
		print("Trong ®éi ngò kh«ng cã ®å ®Ö")
		return nil
	end
	return tab
end

function ShowLeague()
			local lid = GetShituLeagueId(GetName())
			bSuccess = 0
			if(FALSE(lid)) then
				print(GetName().." no in league")
			else
				local num = LG_GetMemberCount(lid)
				for i = 0, num - 1 do
					local name,job = LG_GetMemberInfo(lid, i)
					print(name..", job"..job)
				end
			end		
end

--¼ÆËãÊ¦¸µ¿ÉÒÔ´øµÄÍ½µÜÊý
function ComputeMasterLoad(dichuan)
	if(dichuan < 0) then dichuan = 0 end
	if(dichuan < 5) then 
		return 3
	end
	if(dichuan < 7) then
		return 4
	end
	if(dichuan < 10) then
		return 5
	end
	if(dichuan < 13) then
		return 6
	end
	if(dichuan < 17) then
		return 7
	end
	if(dichuan < 21) then
		return 8
	end
	if(dichuan < 26) then
		return 9
	end
	return 10
end

TABFUNS_PATCHSHITU = 
{
	patchShitu_Join,
	patchShitu_Graduate,
	patchShitu_Leave,
}

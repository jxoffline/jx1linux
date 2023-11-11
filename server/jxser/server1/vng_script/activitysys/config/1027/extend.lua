Include("\\vng_script\\activitysys\\config\\1027\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1027\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1027\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\vng_script\\activitysys\\config\\1027\\write_to_file.lua")

pActivity.nPak = curpack()

if not tbCayThongInfo then 
	tbCayThongInfo = {} 
end

function pActivity:OnServerStart()
	local tbNpcInfo ={								
								{2004,78,1567,3237,"Ng­êi TuyÕt"},
								{2151,78,1572,3237,"Ng­êi tuyÕt nhá"},
								{2155,78,1563,3239,"TuÇn léc"},						
							}	
	for i=1,getn(tbNpcInfo) do
		local nNpcID = tbNpcInfo[i][1]
		local nMapID = tbNpcInfo[i][2]
		local nX = tbNpcInfo[i][3]
		local nY =tbNpcInfo[i][4] 
		local szName = tbNpcInfo[i][5]	
		local nNpcIdx=AddNpcEx(nNpcID,0,1,SubWorldID2Idx(nMapID),nX*32,nY*32,1,szName,0)
		SetNpcScript(nNpcIdx, "\\vng_script\\activitysys\\vng_npcdailog.lua")
		if  GetNpcSettingIdx(nNpcIdx) == 2004 then		
			local nTimeOut = 60*18
			local nTimerId =  AddTimer(nTimeOut, "OnTime_HoaTuyet", nNpcIdx)				
		end		
	end	
end
function OnTime_HoaTuyet(nNpcIdx,nTimeOut )		
	if not nNpcIdx  then
			return 0,0
	end	
	local tbPos = {
		{1561,3236},
		{1566,3237},
		{1572,3235},
	}
	for i = 1, getn(tbPos) do		
		NpcCastSkill(nNpcIdx,681, 1, tbPos[i][1]*32,  tbPos[i][2]*32)	
		--print("=====OnTime_HoaTuyet")		
	end
	return 50*18,nNpcIdx
end


function pActivity:CheckUseInMap()
	local nCheck = PlayerFunLib:CheckInMap("53,20,99,100,101,121,153,174,11,78,1,162,37,80,176", "")
	if nCheck == 1 and GetFightState() == 0 then		
		Talk(1,"","ChØ sö dông ®­îc ngoµi c¸c b¶n ®å luyÖn c«ng.")
		return nil
	end
	local nCheck1 = PlayerFunLib:CheckInMap("927,930,929,926,931,928,932,65575,65605", "")
	if nCheck1 == 1 then		
		Talk(1,"","Kh«ng ®­îc sö dông ë b¶n ®å nµy.")
		return nil
	end
	return 1
end

--add cay thong
function pActivity:Add_CayThong(nNpcID)	
	local szNpcName = TB_TREE_NAME[nNpcID].szName	
	if not nNpcID then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE, "Error_CallNpcFail_NotID")
	end
	local nMapId, nX, nY = GetWorldPos()
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then
		local szPlayerName = GetName()
		local szTreeName = szPlayerName.."-"..szNpcName
		local nNpcIdx = AddNpcEx(nNpcID,1,random(0,4),nMapIndex, nX*32, nY*32,1,szTreeName,1)		
		if  nNpcIdx >= 0 then	
			SetNpcDeathScript(nNpcIdx,"\\vng_script\\activitysys\\config\\1027\\extend.lua")				
			tbLog:PlayerActionLog(EVENT_LOG_TITLE, "Use_Item_CallNpc: "..szNpcName)			
			tbCayThongInfo[nNpcIdx] = szPlayerName	
			local nTimeOut = TIMER_TREE
			local nTimerId =  AddTimer(nTimeOut, "OnTime_CayThong", nNpcIdx)				
	end	
		tbLog:PlayerActionLog(EVENT_LOG_TITLE, "Error_CallNpcFail_NotMapIdx")
	end
end
function OnTime_CayThong(nNpcIdx,nTimeOut )		
	if nNpcIdx < 0 then
			return 0,0
	end	
	tbCayThongInfo[nNpcIdx] = nil	
	DelNpc(nNpcIdx)
	return 0,0
end

 --boss Death
 function OnDeath(nNpcIdx) 	
 	local nNpcID = GetNpcSettingIdx(nNpcIdx) 
 	local nNpcName = GetNpcName(nNpcIdx)
 	local szPlayerName = GetName()
 	local nPlayerIdx = SearchPlayer(nPlayerName)
 	local szTreeName = tbCayThongInfo[nNpcIdx] 
 	tbCayThongInfo[nNpcIdx] = nil
 	if not tbAward_Tree[nNpcID] then
 		tbLog:PlayerActionLog(EVENT_LOG_TITLE, "Error_KillRecAwardBossFail_NotIDNpc") 		
 		return
 	end
 	if szPlayerName ~= szTreeName then
 		Msg2Player("H¹ c©y th«ng cña ng­êi kh¸c kh«ng nhËn ®­îc phÇn th­ëng.")
 		return
 	end 	
 	tbAwardTemplet:Give(tbAward_Tree[nNpcID],1,{EVENT_LOG_TITLE,"KillBossID: "..nNpcID}) 	 	
 end
 
function pActivity:GetAwardTop5()
	local nLatsNumAward = tbTop5GetAward:CheckCanGetAward()
	if  not nLatsNumAward then
		return Talk(1,"","ThËt ®¸ng tiÕc, c¸c h¹ ®· chËn ch©n, phÇn th­ëng ®· cã ng­êi nhËn hÕt råi.")
	end
	tbTop5GetAward:SaveToFile()		
	local nIDtbAward = nLatsNumAward + 1
	if nIDtbAward >= 1 and nIDtbAward <= 2 then
		nIDtbAward = 1
	elseif nIDtbAward >=3 and nIDtbAward <= 5 then
		nIDtbAward = 2
	else
		tbLog:PlayerActionLog(EVENT_LOG_TITLE, "LoiNhanThuongTop-nIDtbAward khong hop le: "..nIDtbAward) 		
		return
	end
	print("=====GetAwardTop5 nIDtbAward:"..nIDtbAward)
	tbVNG_BitTask_Lib:addTask(tbBITTSK_RECV_TOP_5, 1)
	tbAwardTemplet:Give(tbAward_Top5[nIDtbAward],1,{EVENT_LOG_TITLE,"NhanPhanThuongTop5ID: "..nIDtbAward}) 	
end
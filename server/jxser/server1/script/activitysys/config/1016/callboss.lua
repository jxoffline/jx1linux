-- CallTreeBoss, by ThanhLD 20130627
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\config\\1016\\variables.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

TreeBossOwner = {}
TreeBossOwner.PlayerName ={}
TreeBossOwner.TreeName ={}
TreeBossOwner.Timer ={}

function checkfightstate()
	if ( GetFightState() == 0 ) then
		Talk(1,"","Sö dông t¹i ngoµi c¸c thµnh thi lín, t©n thñ th«n")
		return 0
	end
	return 1
end

function checkmap()
	local ACTIVITY_MAP = {1,11,37,176,162,78,80, 174,121,153,101,99,100,20,53, 586,587,588,589,590,591,593,594,595,596,597}
	local W,X,Y = GetWorldPos()
	local nMapId = W
	local nIsInMap = 0
	
	for i = 1, getn(ACTIVITY_MAP) do
		if nMapId == ACTIVITY_MAP[i] and GetFightState() == 1 then
			nIsInMap = 1
			break	
		end
	end
	
	if nIsInMap == 0 then
		Talk(1,"","CÇn ph¶i sö dông t¹i c¸c b¶n ®å ngoµi c¸c thµnh thi lín, t©n thñ th«n")
		return 0
	end
	return 1
end


function getbossinfo(nItemIdx)
	local tbBossInfomation = {
		-- bossid, bosslvl, bossname
		[30455] = {1322,0,"Méc Lam B¨ng Tinh","\\script\\activitysys\\config\\1016\\extend.lua"},		
		[30457] = {1322,0,"Méc Hoµng B¨ng Tinh","\\script\\activitysys\\config\\1016\\extend.lua"},		
		[30459] = {1322,0,"Méc HuyÒn B¨ng Tinh","\\script\\activitysys\\config\\1016\\extend.lua"},		
	}
	local G,D,P = GetItemProp(nItemIdx)
	local szBossname = tbBossInfomation[P][3]
	local nBossLevel = tbBossInfomation[P][2]
	local nBossId = tbBossInfomation[P][1]
	local szDeathScript =  tbBossInfomation[P][4]
	return szBossname, nBossLevel, nBossId, szDeathScript
end

function callboss(szBossname, nBossLevel, nBossId,szDeathScript)
	local nMapId,nPosX,nPosY = GetWorldPos()
	local tbTreeBoss = 
	{
		szName = szBossname, 
		nLevel = nBossLevel,
		nNpcId = nBossId,
		nIsboss = 1,
		tbNpcParam = {nBossId,},
		szDeathScript = szDeathScript
	}
	nMapId, x, y = GetWorldPos()	
	local nMapIndex = SubWorldID2Idx(nMapId)
	local nNpcIdx = basemission_CallNpc(tbTreeBoss, nMapId, nPosX * 32, nPosY * 32)
	if  nNpcIdx  then
		--SetNpcTimer(nNpcIdx, 5*60*18)
		local nTimeOut =5*60*18
		nTimerId =  AddTimer(nTimeOut, "OnTime", nNpcIdx)
		TreeBossOwner.Timer[nNpcIdx] = 	nTimerId
		TreeBossOwner.PlayerName[nNpcIdx] = GetName()		
		TreeBossOwner.TreeName[nNpcIdx] = szBossname		
		tbLog:PlayerActionLog(LOG_TITLE,"Gäi ra thµnh c«ng ",szBossname )	
		Msg2Player("B¹n ®· gäi ra : "..szBossname);
		return 1
	end
	DelNpc(nNpcIdx)
	return 0
end

function main(nItemIdx)
	if checkfightstate() ~= 1 then
		return 1
	end
	
	if checkmap() ~= 1 then
		return 1
	end
	--Kiem tra gioi han su dung
	local nG,nD,nP = GetItemProp(nItemIdx)
	if (nG ==6 and nD ==1 and nP == 30455 ) then		
		if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbBITTSK_LIMIT_1,%tbBITTSK_LIMIT_1.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<") then
			return 1
		end
		tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_1, 1)
	end
	
	if (nG ==6 and nD ==1 and nP == 30457 ) then		
		if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbBITTSK_LIMIT_2,%tbBITTSK_LIMIT_2.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<") then
			return 1
		end
		tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_2, 1)
	end
	
	if (nG ==6 and nD ==1 and nP == 30459 ) then
		if ( CalcFreeItemCellCount() < 30) then
			Talk (1,"","V× an toµn, Hµnh trang cÇn 30 « trèng míi cã thÓ sö dông vËt phÈm nµy ")
			return 1
		end
		if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbBITTSK_LIMIT_3,%tbBITTSK_LIMIT_3.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<") then
			return 1
		end
		tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_3_COUNT, 1)
	end
	
	local szBossname, nBossLevel, nBossId,szDeathScript = getbossinfo(nItemIdx)
	
	if callboss(szBossname, nBossLevel, nBossId,szDeathScript) ~= 1 then
		Msg2Player("TriÖu håi Boss thÊt b¹i, xin thö l¹i")
		return 1
	end
	
	return 0
end

function OnTime(nNpcIdx,nTimeOut )	
	DelNpc(nNpcIdx)
	nTimerId =  TreeBossOwner.Timer[nNpcIdx]
	DelTimer(nTimerId)	
	TreeBossOwner.PlayerName[nNpcIdx] =nil	
	TreeBossOwner.TreeName[nNpcIdx] = nil 
	TreeBossOwner.Timer[nNpcIdx] = nil
end
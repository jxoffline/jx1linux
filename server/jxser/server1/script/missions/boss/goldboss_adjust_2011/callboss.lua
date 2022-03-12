-- 文件名　：callboss.lua
-- 创建者　：wangjingjun
-- 内容　　：gs call boss
-- 创建时间：2011-08-29 10:11:26
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\objbuffer_head.lua")

function getParamValue(nHandle)
	if (OB_IsEmpty(nHandle) == 1) then
		return
	end
	return ObjBuffer:PopObject(nHandle)
end

function gbAdjust_MakeBoss(ParamHandle)
	if (OB_IsEmpty(ParamHandle) == 1) then
		return
	end
	
	local nBossId = getParamValue(ParamHandle)
	local nBossLevel = getParamValue(ParamHandle)
	local nSeries = getParamValue(ParamHandle)
	local nMapId = getParamValue(ParamHandle)
	local nPosX = getParamValue(ParamHandle)
	local nPosY = getParamValue(ParamHandle)
	local szBossname = getParamValue(ParamHandle)
	local szWorldMsg = getParamValue(ParamHandle)
	
	if (not nBossId) or (not nBossLevel) or (not nSeries) or (not nMapId)
		or (not nPosX) or (not nPosY) or (not szBossname)  or (not szWorldMsg) then
		WriteLog("Add goldboss with wrong infomation")	
		return
	end
	
--	print(nBossId, nBossLevel, nSeries, nMapId, nPosX, nPosY, szBossname)
	local nMapidx = SubWorldID2Idx(nMapId)
	if (nMapidx < 0) then
		return
	end
	
	local tbGoldBoss = 
	{
		szName = szBossname, 
		nLevel = nBossLevel,
		nNpcId = nBossId,
		nIsboss = 1,
		nTime =  24 * 60 * 60,		-- 存在时间 24小时
		szScriptPath = "\\script\\missions\\boss\\goldboss_adjust_2011\\goldboss.lua",
		tbNpcParam = {nBossId,},
	}
	if basemission_CallNpc(tbGoldBoss, nMapId, nPosX * 32, nPosY * 32) then
		WriteLog(date("%H:%M")..","..nBossId..","..nBossLevel..","..nSeries..","..nMapId..","..nPosX..","..nPosY..","..szBossname)
		AddGlobalCountNews(szWorldMsg, 1)
	end
end


function gbCallBossTest()
	local nBossId = 1873
	local nBossLevel = 95
	local nSeries = 0
	local nMapId = 176
	local nPosX = 1754
	local nPosY = 2799
	local szBossname = "Trng Tuy猲"
	local szWorldMsg = "this is a test boss"
	
	if (not nBossId) or (not nBossLevel) or (not nSeries) or (not nMapId)
		or (not nPosX) or (not nPosY) or (not szBossname)  or (not szWorldMsg) then
		WriteLog("Add goldboss with wrong infomation")	
		return
	end
	
--	print(nBossId, nBossLevel, nSeries, nMapId, nPosX, nPosY, szBossname)
	local nMapidx = SubWorldID2Idx(nMapId)
	if (nMapidx < 0) then
		return
	end
	
	local tbGoldBoss = 
	{
		szName = szBossname, 
		nLevel = nBossLevel,
		nNpcId = nBossId,
		nIsboss = 1,
		nTime =  24 * 60 * 60,		-- 存在时间 24小时
		szScriptPath = "\\script\\missions\\boss\\goldboss_adjust_2011\\goldboss.lua",
		tbNpcParam = {nBossId,},
	}
	if basemission_CallNpc(tbGoldBoss, nMapId, nPosX * 32, nPosY * 32) then
		WriteLog(date("%H:%M")..","..nBossId..","..nBossLevel..","..nSeries..","..nMapId..","..nPosX..","..nPosY..","..szBossname..",".."call test boss")
		AddGlobalCountNews(szWorldMsg, 1)
	end
end
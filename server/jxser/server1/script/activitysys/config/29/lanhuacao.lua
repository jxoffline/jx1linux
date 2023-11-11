Include("\\script\\lib\\progressbar.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\29\\head.lua")

--Fix bug missing LanHuan positions - Modified by DinhHQ - 20110425
tbLanHuanCaoPos = 
	{
		{153,1745,3213,},
		{153,1724,3192,},
		{153,1757,3197,},
	}
tbLanHuaCao = {
		szName = "Bôi Hoa Lan Rõng", 
		nLevel = 95,
		nNpcId = 1782,
		nIsboss = 0,
		tbNpcParam = {},
		szScriptPath = "\\script\\activitysys\\config\\29\\lanhuacao.lua",
	}

local _Limit = function(nNpcIdx)
	local tbAllowTime = {
		{123000,130000},
		{200000,203000},
	}
	
	if not pActivity:CheckDate() then
		Msg2Player(format("Thêi gian ho¹t ®éng ®· qua, kh«ng thÓ tiÕp tôc thu thËp n÷a."))
		return
	end
	
	if (not PlayerFunLib:CheckTotalLevel(120,"§¼ng cÊp cña ng­¬i ch­a ®ñ 120",">=")) then
		return
	end
	
	if (not lib:CheckTime(tbAllowTime,"HiÖn t¹i kh«ng ph¶i thêi gian thu thËp, mçi ngµy vµo lóc 12:30 ®Õn 13:00 vµ 20:00 ®Õn 20:30 h½ng ®Õn nhÐ.")) then
		return
	end
	
	return 1
end

local _GetFruit = function(nNpcIdx, dwNpcId)
	
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end
	local nLimit = %_Limit(nNpcIdx)
	
	if not nLimit then
		return 0
	end

	local nNpcParam = GetNpcParam(nNpcIdx, 1)
	--Ò»·ÖÖÓºóÖØÉú
	--HideNpc(nNpcIdx, 60*18)--²»ÖªµÀÎªÊ²Ã´£¬ÕâÀïÒþ²ØµôNPCºóNPC¾Í²»»áÔÙ³öÏÖÁË,¸Ä³ÉÉ¾µôÔÙcallµÄ·½Ê½
	DelNpc(nNpcIdx)
	DynamicExecute("\\script\\activitysys\\config\\29\\lanhuacao.lua","AddTimer", 60*18, "_GenLanHuaCao", nNpcParam)
	--print(nNpcIdx)
	--print(dwNpcId)
	
	AddStatData("jiefangri_zhailanhua")
	
	tbAwardTemplet:Give({tbProp={6,1,1977,1,0,0},nBindState = -2,nExpiredTime=10080}, 1, {"EventTangHoa042011", "NhanDuocHoaLan"});
	
	local nCount = CalcItemCount(-1, 6, 1, 1977, -1)
	if nCount > 2 then
		Msg2Player(format("Mçi ngµy chØ ®­îc phÐp tÆng 2 Hoa Lan Rõng cho Ng­êi LÝnh, trªn ng­êi ng­¬i ®· ®¹t ®Õn %d c¸i råi.",nCount))
	end
	--Msg2Player("ÄãµÃµ½ÁËÒ»¶äÀ¼»¨¡£");
end

function _GenLanHuaCao(nNpcParam)
--Fix bug missing LanHuan positions - Modified by DinhHQ - 20110425
	for i=1, 1 do
		local nMapId, nPosX, nPosY = unpack(%tbLanHuanCaoPos[nNpcParam])
		%tbLanHuaCao.tbNpcParam[1] = nNpcParam
		%basemission_CallNpc(%tbLanHuaCao, nMapId, nPosX*32, nPosY*32)	
	end
	--%tbLanHuanCaoPos[nNpcIdx] = nil
	return 0--·µ»Ø0±íÊ¾²»ÐèÒªÔÙ¶¨Ê±
end

local _OnBreak = function()
	Msg2Player("Thu thËp ®øt ®o¹n")
end

function main()
	local nNpcIdx = GetLastDiagNpc();
	local dwNpcId = GetNpcId(nNpcIdx)
	
	if not %_Limit(nNpcIdx) then
		return
	end
	--¿ªÆô½ø¶ÈÌõ
	tbProgressBar:OpenByConfig(7, %_GetFruit, {nNpcIdx, dwNpcId}, %_OnBreak)
end;
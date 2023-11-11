-- ============================================

--§Òn bï gamer Chinh §å
--Created by DinhHQ - 20130107

-- ======================================================

Include("\\script\\vng_event\\20130107_den_bu_chinh_do\\head.lua")
Include("\\script\\vng_feature\\getskills.lua")
IncludeLib("SETTINGS")
Include("\\script\\lib\\awardtemplet.lua")
tbItemSkillAward = {}
tbItemSkillAward.tbFaction_Skill_List = {
	[0] = {[90] = {318, 319, 321}, [120] = {709}, [150] = {1055, 1056, 1057},},
	[1] = {[90] = {322, 325, 323}, [120] = {708}, [150] = {1058, 1059, 1060},},
	[2] = {[90] = {339, 302, 342, 351,}, [120] = {710}, [150] = {1069, 1070, 1071, 1110},},
	[3] = {[90] = {353, 355, 390}, [120] = {711}, [150] = {1066, 1067},},
	[4] = {[90] = {380, 328, 332}, [120] = {712}, [150] = {1061, 1062, 1114},},
	[5] = {[90] = {336, 337}, [120] = {713}, [150] = {1063, 1065},},
	[6] = {[90] = {357, 359}, [120] = {714}, [150] = {1073, 1074}},
	[7] = {[90] = {361, 362, 391}, [120] = {715}, [150] = {1075, 1076},},
	[8] = {[90] = {365, 368}, [120] = {716}, [150] = {1078, 1079},},
	[9] = {[90] = {372, 375, 394}, [120] = {717}, [150] = {1080, 1081},},
}
tbItemSkillAward.tbExcludeSkill90 = {[351] = 1, [332] = 1, [391] = 1, [394] = 1, [390] = 1}
tbItemSkillAward.tbExcludeSkill150 = {[1110] = 1}
tbItemSkillAward.tbItemAward = {
	[1] = 
	{
		{szName="Bé trang bÞ B¹ch Hæ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={11,1,0,0,0,0}, nBindState = -2},
		{szName="Phiªn Vò",tbProp={0,10,7,1,0,0},nCount=1, nBindState = -2},
		{szName="Hé M¹ch §¬n LÔ Bao",tbProp={6,1,30358,1,0,0},nCount=1,tbParam={10000,1,0,0,0,0}, nBindState = -2},
		{pFun = function (nItemCount, szLogTitle)	
			SetTask(4000, GetTask(4000) + 20000)
			Msg2Player(format("NhËn ®­îc %d ®iÓm Ch©n Nguyªn", 20000))
		 end},
		{szName="LÔ Bao Hoµng Kim Ên (cÊp 7)",tbProp={6,1,30359,1,0,0},nCount=1,tbParam={7,1,0,0,0,0}, nBindState = -2},		
	},
	[2] = 
	{
		{szName="Bé trang bÞ B¹ch Hæ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={11,1,0,0,0,0}, nBindState = -2},
		{szName="Phiªn Vò",tbProp={0,10,7,1,0,0},nCount=1, nBindState = -2},
		{szName="Hé M¹ch §¬n LÔ Bao",tbProp={6,1,30358,1,0,0},nCount=1,tbParam={20000,1,0,0,0,0}, nBindState = -2},
		{pFun = function (nItemCount, szLogTitle)	
			SetTask(4000, GetTask(4000) + 40000)
			Msg2Player(format("NhËn ®­îc %d ®iÓm Ch©n Nguyªn", 40000))
		 end},
		{szName="LÔ Bao Hoµng Kim Ên (cÊp 8)",tbProp={6,1,30359,1,0,0},nCount=1,tbParam={8,1,0,0,0,0}, nBindState = -2},
		{szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=129600, nBindState = -2},
	},
	[3] = 
	{
		{szName="Bé trang bÞ B¹ch Hæ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={11,1,0,0,0,0}, nBindState = -2},
		{szName="Phiªn Vò",tbProp={0,10,7,1,0,0},nCount=1, nBindState = -2},
		{szName="Hé M¹ch §¬n LÔ Bao",tbProp={6,1,30358,1,0,0},nCount=1,tbParam={30000,1,0,0,0,0}, nBindState = -2},
		{pFun = function (nItemCount, szLogTitle)	
			SetTask(4000, GetTask(4000) + 60000)
			Msg2Player(format("NhËn ®­îc %d ®iÓm Ch©n Nguyªn", 60000))
		 end},
		{szName="LÔ Bao Hoµng Kim Ên (cÊp 8)",tbProp={6,1,30359,1,0,0},nCount=1,tbParam={8,1,0,0,0,0}, nBindState = -2},
		{szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=129600, nBindState = -2},
		{szName="LÔ Bao Phi Phong (cÊp 6)",tbProp={6,1,30360,1,0,0},nCount=1,tbParam={6,1,129600,0,0,0}, nBindState = -2, nExpiredTime = 10080},
	},
	[4] = 
	{
		{szName="Bé trang bÞ B¹ch Hæ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={33,1,0,0,0,0}, nBindState = -2},
		{szName="XÝch Long C©u",tbProp={0,10,9,1,0,0},nCount=1, nBindState = -2},
		{szName="Hé M¹ch §¬n LÔ Bao",tbProp={6,1,30358,1,0,0},nCount=1,tbParam={50000,1,0,0,0,0}, nBindState = -2},
		{pFun = function (nItemCount, szLogTitle)	
			SetTask(4000, GetTask(4000) + 100000)
			Msg2Player(format("NhËn ®­îc %d ®iÓm Ch©n Nguyªn", 100000))
		 end},
		{szName="LÔ Bao Hoµng Kim Ên (cÊp 9)",tbProp={6,1,30359,1,0,0},nCount=1,tbParam={9,1,0,0,0,0}, nBindState = -2},
		{szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=129600, nBindState = -2},
		{szName="LÔ Bao Phi Phong (cÊp 6)",tbProp={6,1,30360,1,0,0},nCount=1,tbParam={6,1,259200,0,0,0}, nBindState = -2, nExpiredTime = 10080},
	},
}

function tbItemSkillAward:CanGetSkill()	
	if not tbZhengtuCompensate:IsActive() then
		Talk(1, "", "HiÖn t¹i ®· qu¸ thêi gian nhËn th­ëng, xin ®¹i hiÖp th«ng c¶m.")
		return nil
	end
	if tbVNG_BitTask_Lib:getBitTask(tbZhengtuCompensate.tbBitTSKGetItem) == 1 then
		Talk(1, "", "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi cßn muèn nhËn n÷a sao?")
		return nil
	elseif not tbZhengtuCompensate:Get_ItemSkill_AccType() then
		Talk(1, "", "Xin lçi, c¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
		return nil
	end	
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "§Ó b¶o ®¶m tµi s¶n, xin vui lßng dän trèng hµnh trang tr­íc khi nhËn th­ëng.")
		return nil
	end
	if GetLastFactionNumber()==-1 then	
		Talk(1, "", "<color=yellow>Ch­a gia nhËp m«n ph¸i, kh«ng thÓ häc kü n¨ng!<color>");
		return nil
	end;
	if ST_GetTransLifeCount() < 4 or GetLevel() < 150 then
		Talk(1, "", "Tu luyÖn kh«ng ®ñ, cÊp cÇn ph¶i trªn 150 vµ trïng sinh lÇn 4 trë lªn míi ®­îc phÐp nhËn phÇn th­ëng nµy. Xin h·y nhËn ®¼ng cÊp tr­íc")
		return nil
	end	
	return 1
end

function tbItemSkillAward:Skill90_SelectSkillMax()
	if not self:CanGetSkill() then
		return
	end	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local nLastFaction = GetLastFactionNumber()
	local tbSkill90 = self.tbFaction_Skill_List[nLastFaction][90]
	for i = 1, getn(tbSkill90) do
		if not self.tbExcludeSkill90[tbSkill90[i]] then
			tbMainDialog:AddOptEntry(GetSkillName(tbSkill90[i]), tbItemSkillAward.Skill150_SelectSkillMax, {tbItemSkillAward, tbSkill90[i]})
		end
	end	
	tbMainDialog.szTitleMsg = "PhÇn th­ëng kü n¨ng cÊp 90, xin h·y chän 1 kü n¨ng ®¹t cÊp ®é tèi ®a trong c¸c kü n¨ng sau:"	
	tbMainDialog:Show()
end

function tbItemSkillAward:Skill150_SelectSkillMax(nSkill90ID)
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local nLastFaction = GetLastFactionNumber()
	local tbSkill150 = self.tbFaction_Skill_List[nLastFaction][150]
	for i = 1, getn(tbSkill150) do
		if not self.tbExcludeSkill150[tbSkill150[i]] then
			tbMainDialog:AddOptEntry(GetSkillName(tbSkill150[i]), tbItemSkillAward.Get_Item_Skill, {tbItemSkillAward, nSkill90ID, tbSkill150[i]})
		end
	end	
	tbMainDialog.szTitleMsg = "PhÇn th­ëng kü n¨ng cÊp 150, xin h·y chän 1 kü n¨ng ®¹t cÊp ®é tèi ®a trong c¸c kü n¨ng sau:"	
	tbMainDialog:Show()
end

function tbItemSkillAward:Get_Item_Skill(nSkill90ID, nSkill150ID)
	if not self:CanGetSkill() then
		return
	end
	tbZhengtuCompensate:UpdateBitTSKValue()
	local nAccType = tbZhengtuCompensate:Get_ItemSkill_AccType()
	if not nAccType then
		Talk(1, "", "C¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
		return
	end	
	tbVNG_BitTask_Lib:setBitTask(tbZhengtuCompensate.tbBitTSKGetItem, 1)
	local tbTmpAward = self.tbItemAward[nAccType]
	tbAwardTemplet:Give(tbTmpAward, 1, {"DenBuChinhDo", "NhanPhanThuongItem"..nAccType})
	local szFaction = GetFaction()			
	if GetTask(tbFaction[szFaction]) < 70*256 and tbFaction[szFaction] ~= nil then
		SetAllTasks(szFaction)
		GiveAllAwards(szFaction)
	end
	local tbSkill90 = self.tbFaction_Skill_List[GetLastFactionNumber()][90]	
	for i = 1, getn(tbSkill90) do
		if HaveMagic(tbSkill90[i]) == -1 then		
			if not self.tbExcludeSkill90[tbSkill90[i]]  then
				AddMagic(tbSkill90[i], 1)
			else
				AddMagic(tbSkill90[i])
			end
		end
	end
	local Skill90Max = HaveMagic(nSkill90ID)
	if Skill90Max ~= -1 and Skill90Max ~= 20 then
		AddMagic(nSkill90ID, 20)
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\task\\lv120skill\\item\\lv120skillbook.lua", "main")	
	local Skill120Max = HaveMagic(self.tbFaction_Skill_List[GetLastFactionNumber()][120][1])
	if Skill120Max ~= -1 and Skill120Max ~= 20 then
		AddMagic(self.tbFaction_Skill_List[GetLastFactionNumber()][120][1], 20)
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\task\\150skilltask\\item\\lv150skillbook.lua", "main")
	local Skill150Max = HaveMagic(nSkill150ID)
	if Skill150Max ~= -1 and Skill150Max ~= 20 then
		AddMagic(nSkill150ID, 20)
	end
	KickOutSelf()
	tbLog:PlayerActionLog("DenBuChinhDo", "NhanKyNangThanhCong", "KyNangToiDaDaChon: "..GetSkillName(nSkill90ID)..", "..GetSkillName(nSkill150ID))	
end
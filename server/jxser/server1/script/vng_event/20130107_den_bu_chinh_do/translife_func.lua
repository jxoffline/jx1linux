-- ============================================

--§Òn bï gamer Chinh §å
--Created by DinhHQ - 20130107

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\task\\metempsychosis\\translife_4.lua")
Include("\\script\\task\\metempsychosis\\translife_5.lua")
Include("\\script\\vng_event\\20130107_den_bu_chinh_do\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_feature\\getskills.lua")

tbPreTransLifeLevel = {
	[1] = {190,190,200,200,150},
	[2] = {190,190,200,200,160},
	[3] = {190,200,200,200,170},
	[4] = {200,200,200,200,180},
}

function ZhTCompensate_Translife_Begin()
	if not tbZhengtuCompensate:CheckGetTransLife() then
		Talk(1, "", "C¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng")
		return
	end
	local n_transcount = ST_GetTransLifeCount()
	
	if (n_transcount >= 4) then
		CreateTaskSay({"<dec><npc>".."§· ®¹t tèi ®a phÇn th­ëng chuyÓn sinh.", 
			"KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end

	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("Ng­¬i ®· nhËn nhiÖm vô kü n¨ng 150, xin h·y hoµn thµnh nhiÖm vô råi h·y ®Õn gÆp ta")
		return 
	end

	if (ZhTCompensate_Check_Zhuansheng() == 0) then
		return 0;
	end
	
	if (n_transcount == 0) then
		CreateTaskSay({"<dec><npc>".."LÇn chuyÓn sinh thø nhÊt 5 lo¹i phßng ngù sÏ gia t¨ng.", 
			"§­îc, ta muèn häc ngay./#ZhTCompensate_Sure_Learn(-1)", "KÕt thóc ®èi tho¹i/OnCancel"});
	elseif (n_transcount < 0 or n_transcount >=5) then
		Say("Tr¹ng th¸i bÊt th­êng xin mêi liªn l¹c víi nhµ ®iÒu hµnh xö lý.", 0);
	else
		local tbOpp = {"<dec><npc>".."Xin mêi chän ®iÓm phßng ngù muèn t¨ng:"};
		
		for k, sz in TB_BASE_RESIST do
			tinsert(tbOpp, format("%s%s/#ZhTCompensate_Sure_Learn(%d)", "+", sz, k));
		end
		tinsert(tbOpp, "KÕt thóc ®èi tho¹i/OnCancel")
		CreateTaskSay(tbOpp);
		
	end
end

function ZhTCompensate_Sure_Learn(n_resist)
	if (ZhTCompensate_Check_Zhuansheng() == 0) then
		return 0;
	end
	
	local n_transcount = ST_GetTransLifeCount();
	
	if (n_transcount >= 2) then
		for i = 2, n_transcount do
			local n_translevel, n_transresist = zhuansheng_get_gre(i);
			if (n_translevel ~= 0 and n_transresist == n_resist) then
				CreateTaskSay({"<dec><npc>"..format("§©y lµ lÇn chuyÓn sinh thø %d vµ ®· chän %s kh«ng thÓ chän nhiÒu lÇn 1 ®iÓm phßng ngù, xin mêi h·y chän l¹i.", i, TB_BASE_RESIST[n_resist]),
								"Ta muèn chän l¹i/ZhTCompensate_Translife_Begin",
								"KÕt thóc ®èi tho¹i/OnCancel"});
				return 0;
			end
		end
	end
	tbZhengtuCompensate:UpdateBitTSKValue()
	local nAccType = tbZhengtuCompensate:Get_TL_AccType_By_BitTSK()
	if not nAccType or not tbPreTransLifeLevel[nAccType] then
		Talk(1, "", "C¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
		return
	end
	SetTaskTemp(TSKM_ZHUANSHENG_RESISTID, n_resist);
	if (n_transcount == 2 and GetLevel() >= 190) then
		SetTask(TSK_ZHUANSHENG_AWARD, 1);
	end
	local nlevel = GetLevel();	
	LeaveTeam();		
	
	local nPreLvl = tbPreTransLifeLevel[nAccType][n_transcount+1]
	if nlevel < nPreLvl then
		ST_LevelUp(nPreLvl-nlevel);
	end
	
	ST_DoTransLife();	
	CreateTaskSay({"<dec><npc>Trïng sinh thµnh c«ng, xin h·y tiÕp tôc ®Õn khi ®¹t ®Õn trïng sinh lÇn 4", "Ta biÕt råi/OnCancel"});
end

function ZhTCompensate_Check_Zhuansheng()

	local ntranscount = ST_GetTransLifeCount();
	
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[1], "§­îc råi./OnCancel"});
		return 0;
	end
	
	if ntranscount < 3 and (check_zhuansheng_league(LG_WLLSLEAGUE) == 1) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[6], "§­îc råi./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_KILLER_ID) ~= 0) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[8], "§­îc råi./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_MESSENGER_FENG) ~= 0 or GetTask(TSK_MESSENGER_SHAN) ~= 0 or GetTask(TSK_MESSENGER_QIAN) ~= 0 ) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[9], "§­îc råi./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_TASKLINK_STATE) ~= 3 and GetTask(TSK_TASKLINK_STATE) ~= 0) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[10], "§­îc råi./OnCancel"});
		return 0;
	end
	
	if GetTask(TSK_TASKLINK_CancelTaskLevel) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp1) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp2) ~= 0 then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[11], "§­îc råi./OnCancel"});
		return 0;
	end
	
	if GetLevel()==200 and GetExp()<0 then 
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[20], "§­îc råi./OnCancel"})
		return 0
	end

	return 1;
end

function ZhTCompensate_Translife_Check()
	local n_transcount = ST_GetTransLifeCount();
	local nmgpoint, nprop, nskill = 0,0,0;
	local tbresist = {0, 0, 0, 0, 0};
	local sz_msg = "";
	
	if (n_transcount ~= 0) then
		for i = 1, n_transcount do
			nlevel, nresistid = zhuansheng_get_gre(i);
			
			nmgpoint = TB_LEVEL_REMAIN_PROP[nlevel][i][1] + nmgpoint;
			nprop  = TB_LEVEL_REMAIN_PROP[nlevel][i][2] + nprop;
			nskill = TB_LEVEL_REMAIN_PROP[nlevel][i][4] + nskill;
			if (nresistid >= 0 and nresistid <= 4) then
				tbresist[nresistid+1] = tbresist[nresistid+1] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				sz_msg = sz_msg.."<enter>"..format("Trïng sinh lÇn %d ®¼ng cÊp: %d; chän kh¸ng tÝnh: %s", i, nlevel, TB_BASE_RESIST[nresistid]);
			elseif (nresistid == 255) then
				tbresist[1] = tbresist[1] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[2] = tbresist[2] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[3] = tbresist[3] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[4] = tbresist[4] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[5] = tbresist[5] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				sz_msg = sz_msg.."<enter>"..format("Trïng sinh lÇn %d ®¼ng cÊp: %d; chän kh¸ng tÝnh: %s", i, nlevel, "TÊt c¶ kh¸ng tÝnh");
			end
		end
	end
	
	CreateTaskSay({format("%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s%s", 
					"<dec><npc>",
					format("Sè lÇn chuyÓn sinh: %d", n_transcount),
					format("Thu ®­îc ®iÓm kü n¨ng: %d", nmgpoint),
					format("Thu ®­îc ®iÓm tiÒm n¨ng: %d", nprop),
					format("§iÓm kü n¨ng cao nhÊt t¨ng thªm: %d", nskill),
					format("Háa phßng t¨ng: %d", tbresist[1]),
					format("B¨ng phßng t¨ng: %d", tbresist[2]),
					format("§éc phßng t¨ng: %d", tbresist[3]),
					format("L«i phßng t¨ng: %d", tbresist[4]),
					format("Phæ phßng t¨ng: %d", tbresist[5]),
					sz_msg
					), 			
			"§­îc råi./OnCancel"});
end

function ZhTCompensate_Translife4_GetLevel()
	if not tbZhengtuCompensate:Get_ItemSkill_AccType() then
		ZhTCompensate_Translife4_Do_Ge_ExtraItem_SelectSkill90Max()
	else
		ZhTCompensate_Translife4_Do_GetLevel()
	end
end

function ZhTCompensate_Translife4_Do_GetLevel()
	local nTransCount = ST_GetTransLifeCount()
	if nTransCount ~= 4 then
		Talk(1, "", "ChØ nh©n vËt trïng sinh lÇn 4 míi ®­îc nhËn th­ëng.")
		return
	end
	tbZhengtuCompensate:UpdateBitTSKValue()
	local nCurLevel = GetLevel()
	local nAccType = tbZhengtuCompensate:Get_TL_AccType_By_BitTSK()
	if not nAccType then
		Talk(1, "", "C¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
		return
	end
	local nAddLevel = tbPreTransLifeLevel[nAccType][5]
	if nCurLevel < nAddLevel then
		ST_LevelUp(nAddLevel-nCurLevel);
		tbLog:PlayerActionLog("DenBuChinhDo", "NhanLevelTS4")
	else
		Talk(1, "", "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return
	end	
	return 1
end

function ZhTCompensate_Translife4_Check_Get_ExtraItem()
	if not tbZhengtuCompensate:IsActive() then
		Talk(1, "", "HiÖn t¹i ®· qu¸ thêi gian nhËn th­ëng, xin ®¹i hiÖp th«ng c¶m.")
		return nil
	end
	if tbVNG_BitTask_Lib:getBitTask(tbZhengtuCompensate.tbBitTSKGetItem2) == 1 then
		Talk(1, "", "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi cßn muèn nhËn n÷a sao?")
		return nil
	end
	if ST_GetTransLifeCount() ~= 4 then
		Talk(1, "", "ChØ nh©n vËt trïng sinh lÇn 4 míi ®­îc nhËn th­ëng.")
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
	return 1
end

local tbFaction_Skill_List = {
	[0] = {[90] = {318, 319, 321}, [120] = {709}, },
	[1] = {[90] = {322, 325, 323}, [120] = {708},},
	[2] = {[90] = {339, 302, 342, 351,}, [120] = {710},},
	[3] = {[90] = {353, 355, 390}, [120] = {711},},
	[4] = {[90] = {380, 328, 332}, [120] = {712},},
	[5] = {[90] = {336, 337}, [120] = {713},},
	[6] = {[90] = {357, 359}, [120] = {714},},
	[7] = {[90] = {361, 362, 391}, [120] = {715}, },
	[8] = {[90] = {365, 368}, [120] = {716}, },
	[9] = {[90] = {372, 375, 394}, [120] = {717},},
}
local tbExcludeSkill90 = {[351] = 1, [332] = 1, [391] = 1, [394] = 1, [390] = 1}

function ZhTCompensate_Translife4_Do_Ge_ExtraItem_SelectSkill90Max()
	if not ZhTCompensate_Translife4_Check_Get_ExtraItem() then
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local nLastFaction = GetLastFactionNumber()
	local tbSkill90 = %tbFaction_Skill_List[nLastFaction][90]
	for i = 1, getn(tbSkill90) do
		if not %tbExcludeSkill90[tbSkill90[i]] then
			tbMainDialog:AddOptEntry(GetSkillName(tbSkill90[i]), ZhTCompensate_Translife4_Do_Get_Level_ExtraItem, {tbSkill90[i]})
		end
	end	
	tbMainDialog.szTitleMsg = "PhÇn th­ëng kü n¨ng cÊp 90, xin h·y chän 1 kü n¨ng ®¹t cÊp ®é tèi ®a trong c¸c kü n¨ng sau:"	
	tbMainDialog:Show()
end

function ZhTCompensate_Translife4_Do_Get_Level_ExtraItem(nSkill90ID)
	if not ZhTCompensate_Translife4_Do_GetLevel() then
		return
	end
	if not ZhTCompensate_Translife4_Check_Get_ExtraItem() then
		return
	end
	tbVNG_BitTask_Lib:setBitTask(tbZhengtuCompensate.tbBitTSKGetItem2, 1)
	local tbTmpAward = {
		{szName="Bé trang bÞ Kim ¤ - Tù chän hÖ ph¸i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={11,1,259200,0,0,0}, nBindState = -2},
		{szName="B«n Tiªu",tbProp={0,10,6,1,0,0},nCount=1, nBindState = -2},
		{szName="LÔ Bao Phi Phong (cÊp 5)",tbProp={6,1,30360,1,0,0},nCount=1,tbParam={5,1,43200,0,0,0}, nBindState = -2, nExpiredTime = 10080},
		{szName="LÔ Bao Hoµng Kim Ên (cÊp 5)",tbProp={6,1,30359,1,0,0},nCount=1,tbParam={5,1,0,0,0,0}, nBindState = -2},
		{szName="Hé M¹ch §¬n LÔ Bao",tbProp={6,1,30358,1,0,0},nCount=1,tbParam={2000,1,0,0,0,0}, nBindState = -2},
		{pFun = function (nItemCount, szLogTitle)	
			SetTask(4000, GetTask(4000) + 5000)
			Msg2Player(format("NhËn ®­îc %d ®iÓm Ch©n Nguyªn", 5000))
		 end},
		
	}
	tbAwardTemplet:Give(tbTmpAward, 1, {"DenBuChinhDo", "NhanPhanThuongItemLevelTS4"})
	local szFaction = GetFaction()			
	if GetTask(tbFaction[szFaction]) < 70*256 and tbFaction[szFaction] ~= nil then
		SetAllTasks(szFaction)
		GiveAllAwards(szFaction)
	end
	local tbSkill90 = %tbFaction_Skill_List[GetLastFactionNumber()][90]	
	for i = 1, getn(tbSkill90) do
		if HaveMagic(tbSkill90[i]) == -1 then		
			if not %tbExcludeSkill90[tbSkill90[i]]  then
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
	local Skill120Max = HaveMagic(%tbFaction_Skill_List[GetLastFactionNumber()][120][1])
	if Skill120Max ~= -1 and Skill120Max ~= 20 then
		AddMagic(%tbFaction_Skill_List[GetLastFactionNumber()][120][1], 20)
	end	
	KickOutSelf()
	tbLog:PlayerActionLog("DenBuChinhDo", "NhanKyNangLevelTS4ThanhCong", "KyNangToiDaDaChon: "..GetSkillName(nSkill90ID))
end
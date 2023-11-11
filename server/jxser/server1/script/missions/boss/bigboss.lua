Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\sharedata.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
--Fix bug missing lib - modified by DinhHQ - 20110425
Include("\\script\\lib\\droptemplet.lua")
IncludeLib("LEAGUE")

BigBoss = {}

BigBoss.TSK_PLAYER_BOSSKILLED = 2598; -- ÕÊº“ª˜…±BOSS ˝¡øÕ≥º∆
BigBoss.TSK_BIGBOSS_REWARD = 2661; -- º«¬ºÕÊº“µ±ÃÏ «∑Ò¡ÏΩ±∫Õ¡ÏΩ±¿‡–Õ »’∆⁄ | ªÒµ√¥≥πÿ∑≠±∂ | ªÒµ√ÀŒΩ∑≠±∂ |ªÒµ√æ≠—È∑≠±∂Ω±¿¯ |  «∑Ò¡ÏΩ±
BigBoss.CAN_GET_REWARD_BIT = 1;
BigBoss.EXP_REWARD_BIT = 2;
BigBoss.SONGJIN_REWARD_BIT = 3;
BigBoss.CHUANGGUAN_REWARD_BIT = 4;

BigBoss.tbKillRecord = {};
BigBoss.IsBigBossDead = 0;
BigBoss.CallBackParam = {}
--Change big boss reward - modified By DinhHQ - 20130802
BigBoss.tbGlobalReward = 
{
	{szName="H´m nay trÀn TËng Kim 21:00, Æi”m t›ch lÚy sœ Æ≠Óc nh©n Æ´i", nRate=50, pFun=function() PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.SONGJIN_REWARD_BIT, 1); Msg2Player(format("ßπi hi÷p nhÀn Æ≠Óc ph«n th≠Îng <color=yellow>%s<color>","H´m nay trÀn TËng Kim 21:00, Æi”m t›ch lÚy sœ Æ≠Óc nh©n Æ´i"))end},
	{szName="H´m nay v≠Ót ∂i ÆÓt 21:00, Æi”m kinh nghi÷m sœ Æ≠Óc nh©n Æ´i", nRate=50, pFun=function() PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CHUANGGUAN_REWARD_BIT, 1); Msg2Player(format("ßπi hi÷p nhÀn Æ≠Óc ph«n th≠Îng <color=yellow>%s<color>","H´m nay v≠Ót ∂i ÆÓt 21:00, Æi”m kinh nghi÷m sœ Æ≠Óc nh©n Æ´i"))end},
	--{szName="Nh©n Æ´i kinh nghi÷m khi Æ∏nh qu∏i trong 1 giÍ", nRate=25, pFun=function() AddSkillState(967, 1, 1, 64800); PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.EXP_REWARD_BIT, 1); Msg2Player(format("ßπi hi÷p nhÀn Æ≠Óc ph«n th≠Îng <color=yellow>%s<color>","Nh©n Æ´i kinh nghi÷m khi Æ∏nh qu∏i trong 1 giÍ"))end},
	--{nExp = 10000000, nRate=25},
}
--doc co thien phong
BigBoss.tbKillerReward = 
{
	{tbProp = {6,1,2127,1,0,0}, nCount=1, nExpiredTime=43200},
	{tbProp = {4,239,1,1,0,0}, nCount=10},
	{tbProp = {4,238,1,1,0,0}, nCount=10},
	{tbProp = {4,240,1,1,0,0}, nCount=10},
	{tbProp = {4,353,1,1,0,0}, nCount=20},
	{tbProp = {0,11,450,1,0,0}, nCount=1, nExpiredTime=10080},
	{tbProp = {6,1,907,1,0,0}, nCount=8, nExpiredTime=10080},
	{tbProp = {6,1,1075,1,0,0}, nCount=8},
	{tbProp = {6,1,2126,1,0,0}, nCount=1, nExpiredTime=10080},
}

BigBoss.tbNormalDrop = 
{
	{tbProp = {6,1,1075,1,0,0}, nCount=3},
	{tbProp = {4,239,1,1,0,0}, nCount=20},
	{tbProp = {4,238,1,1,0,0}, nCount=20},
	{tbProp = {4,240,1,1,0,0}, nCount=20},
	{tbProp = {4,353,1,1,0,0}, nCount=20},
	{tbProp = {6,1,1672,1,0,0}, nCount=10},
	{tbProp = {0,11,450,1,0,0}, nCount=1, nExpiredTime=10080},
	{tbProp = {6,1,2115,1,0,0}, nCount=10},
	{tbProp = {6,1,2117,1,0,0}, nCount=10},
	{tbProp = {6,0,6,1,0,0}, nCount=20},
	{tbProp = {6,0,3,1,0,0}, nCount=20},
	{tbProp = {6,1,71,1,0,0}, nCount=20},
	{tbProp = {6,1,1765,1,0,0}, nCount=10},
	{tbProp = {6,1,26,1,0,0}, nCount=10},
	{tbProp = {6,1,22,1,0,0}, nCount=10},
}

-- ßi“u chÿnh ph«n th≠Îng rÌt ra - Modified by ThanhLD -20130417
BigBoss.tbVngNewAward = 
{

	------------------------------------test--------------\

 	[1]={{szName="B∏nh Trung Thu ßÀu Xanh",tbProp={6,1,891,1,0,0},nCount=1,nRate=100},},

	-- [1]={{szName="V‚ L©m MÀt Tﬁch",tbProp={6,1,26,1,0,0},nCount=1,nRate=1},},
	-- [2]={{szName="T»y TÒy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=1},},
 -- 	[3]={{szName="Thi’t La H∏n",tbProp={6,1,23,1,0,0},nCount=1,nRate=10},},	
	-- [4]={{szName="Tˆ ThÒy Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=5},},
	-- [5]={{szName="Lam ThÒy Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=5},},
	-- [6]={{szName="LÙc ThÒy Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=5},},
	-- [7]={{szName="Tinh HÂng B∂o Thπch",tbProp={4,353,1,1,0,0},nCount=1,nRate=3},},
	-- [8]={{szName="B∏ch Qu∂ LÈ",tbProp={6,1,73,1,0,0},nCount=1,nRate=10},},
	-- [9]={{szName="Phi Phong",tbProp={6,1,15,1,0,0},nCount=1,nRate=20},},
	-- [10]={{szName="PhÛc Duy™n (ti”u)",tbProp={6,1,122,1,0,0},nCount=1,nRate=30},},
	-- [11]={{szName="PhÛc Duy™n (trung)",tbProp={6,1,123,1,0,0},nCount=1,nRate=30},},
	-- [12]={{szName="PhÛc Duy™n (Æπi)",tbProp={6,1,124,1,0,0},nCount=1,nRate=10},},
	-- [13]={{szName="ßπi l˘c hoµn",tbProp={6,0,3,1,0,0},nCount=1,nRate=9},},
	-- [14]={{szName="ßπi l˘c hoµn",tbProp={6,0,6,1,0,0},nCount=1,nRate=10},},




	-- [1] = {{szName="X›ch L©n L÷nh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.4},},
	-- [2] = {{szName="M∂nh X›ch L©n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=3},},
	-- [3] = {{szName="X›ch L©n Kim Bµi",tbProp={6,1,3392,1,0,0},nCount=1,nRate=4},},
	-- [4] = {{szName="X›ch L©n Tr∂o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=7},},
	-- [5] = {{szName="X›ch L©n Gi∏c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=4},},
	-- [6] = {{szName="X›ch L©n T◊nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=2.5},},
	-- [7] = {{szName="Bπch HÊ Ph∏t Qu∏n - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={2,0,0,0,0,0}},},
	-- [8] = {{szName="Bπch HÊ Kim Kh∂i - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.3,tbParam={6,0,0,0,0,0}},},
	-- [9] = {{szName="Bπch HÊ Y™u ß∏i - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={5,0,0,0,0,0}},},
	-- [10] = {{szName="Bπch HÊ Hπng Li™n - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={1,0,0,0,0,0}},},
	-- [11] = {{szName="Bπch HÊ Ng‰c BÈi - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={9,0,0,0,0,0}},},
	-- [12] = {{szName="Bπch HÊ Hµi - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={8,0,0,0,0,0}},},
	-- [13] = {{szName="Bπch HÊ HÈ Uy”n - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={4,0,0,0,0,0}},},
	-- [14] = {{szName="Bπch HÊ Th≠Óng GiÌi Chÿ - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={3,0,0,0,0,0}},},
	-- [15] = {{szName="Bπch HÊ Hπ GiÌi Chÿ - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={10,0,0,0,0,0}},},
	-- [16] = {{szName="Bπch HÊ Kh› GiÌi - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.2,tbParam={7,0,0,0,0,0}},},
	-- [17] = {{szName="X›ch L©n Ph∏t Qu∏n - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0}},},
	-- [18] = {{szName="X›ch L©n Kim Kh∂i - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={6,0,0,0,0,0}},},
	-- [19] = {{szName="X›ch L©n Y™u ß∏i - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={5,0,0,0,0,0}},},
	-- [20] = {{szName="X›ch L©n Hπng Li™n - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={1,0,0,0,0,0}},},
	-- [21] = {{szName="X›ch L©n Ng‰c BÈi - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0}},},
	-- [22] = {{szName="X›ch L©n Hµi - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={8,0,0,0,0,0}},},
	-- [23] = {{szName="X›ch L©n HÈ Uy”n - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={4,0,0,0,0,0}},},
	-- [24] = {{szName="X›ch L©n Th≠Óng GiÌi Chÿ - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={3,0,0,0,0,0}},},
	-- [25] = {{szName="X›ch L©n Hπ GiÌi Chÿ - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={10,0,0,0,0,0}},},
	-- [26] = {{szName="X›ch L©n Kh› GiÌi - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.03,tbParam={7,0,0,0,0,0}},},
	-- [27] = {{szName="Cµn Kh´n Song Tuy÷t BÈi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.6,nExpiredTime=43200},},
	-- [28] = {{szName="CËng Hi’n L‘ bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [29] = {{szName="Ki’n Thi’t L‘ Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [30] = {{szName="Chi’n Bﬁ L‘ Bao",tbProp={6,1,30218,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [31] = {{szName="Bao D≠Óc hoµn ",tbProp={6,1,910,1,0,0},nCount=1,nRate=15,nExpiredTime=20160},},
	-- [32] = {{szName="Bπch HÊ TrÔng Luy÷n Ng‰c",tbProp={6,1,3187,1,0,0},nCount=1,nRate=3},},
	-- [33] = {{szName="Mπc Bæc Truy“n TËng L÷nh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},},
	-- [34] = {{szName="V‚ L©m MÀt Tﬁch",tbProp={6,1,26,1,0,0},nCount=1,nRate=5},},
	-- [35] = {{szName="T»y TÒy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=5},},
	-- [36] = {{szName="Thi™n Linh ß¨n",tbProp={6,1,3022,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
	-- [37] = {{szName="ßπi l˘c hoµn l‘ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
	-- [38] = {{szName="Phi tËc hoµn l‘ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
	-- [39] = {{szName="Qu∂ Hoµng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},

}

function AddKillRecord_CallBack(Param, ResultHandle)
	szName = BigBoss.CallBackParam[Param][1];
	nSecondes = BigBoss.CallBackParam[Param][2];
	BigBoss.CallBackParam[Param] = nil;
	if (OB_IsEmpty(ResultHandle) == 0) then
		BigBoss.tbKillRecord = ObjBuffer:PopObject(ResultHandle);
	end
	
	local nIdx = 0;
	
	local nIdx = 0;
	for i=1,getn(BigBoss.tbKillRecord) do
		if (BigBoss.tbKillRecord[i][2] > nSecondes) then
			nIdx = i;
			break;
		end
	end
	
	if (nIdx == 0) then
		nIdx = getn(BigBoss.tbKillRecord) + 1;
	end
	
	tinsert(BigBoss.tbKillRecord, nIdx, {szName, nSecondes});
	
	local nCount = 0;
	
	-- ±£¡Ù◊Ó∫√≥…º®
	for i=1,getn(BigBoss.tbKillRecord) do
		if (BigBoss.tbKillRecord[i] and BigBoss.tbKillRecord[i][1] == szName) then
			nCount = nCount + 1;
			if (nCount > 1) then
				tremove(BigBoss.tbKillRecord, nIdx);
			end
		end
	end
	
	SaveShareData("FUNC_BIGBOSS_LADDER", 0, 0, BigBoss.tbKillRecord);
end

function BigBoss:AddKillRecord(szName, nSecondes)
	self.CallBackParam[getn(self.CallBackParam)+1] = {szName, nSecondes};
	
	LoadShareData("FUNC_BIGBOSS_LADDER", 0, 0, "AddKillRecord_CallBack", getn(self.CallBackParam));
end

function BigBoss:GetKillRecord(szCallBack, nParam)
	nParam = nParam or 0;
	LoadShareData("FUNC_BIGBOSS_LADDER", 0, 0, szCallBack, nParam);
end

function BigBoss:BigBossGlobalReward()
	self.CallBackParam[getn(self.CallBackParam) + 1] = PlayerIndex;
	RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "IsBigBossDead", 0, "BigBossGlobalReward_CallBack", getn(self.CallBackParam));
end

function BigBossGlobalReward_CallBack(Param, ResultHandle)
	local Index = BigBoss.CallBackParam[Param]
	if (Index and Index > 0) then
		local OldPlayerIndex = PlayerIndex
		PlayerIndex = Index
		if (OB_IsEmpty(ResultHandle) == 0) then
			IsBigBossDead = ObjBuffer:PopObject(ResultHandle);
			if (IsBigBossDead == 1) then
				PlayerFunLib:AddTaskDaily(BigBoss.TSK_BIGBOSS_REWARD, 0);	-- ÷ÿ÷√±‰¡ø,“‘∑¿“‚Õ‚
				if (PlayerFunLib:CheckTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CAN_GET_REWARD_BIT, 1, "H´m nay Æπi hi÷p Æ∑ nhÀn th≠Îng rÂi!") == 1) then
					PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CAN_GET_REWARD_BIT, 0);
					tbAwardTemplet:GiveAwardByList(BigBoss.tbGlobalReward, format("[%s] big boss global reward",date("%Y%m%d")));
				end
			else
				Talk(1, "", format("H´m nay v…n ch≠a Æ∏nh bπi <color=red>%s<color>","ßÈc C´ Thi™n Phong"));
			end
		end
		--
		PlayerIndex = OldPlayerIndex
		BigBoss.CallBackParam[Param] = nil
	end
end

function BigBoss:BigBossDeath(nNpcIndex)
	Msg2Player("HNT TEST BBBBBBBBBBBBBBBBBBBBBBBBB")
	-- º«¬º ±º‰
	local nTime = tonumber(GetLocalDate("%H%M%S"))-194500; -- À¿Õˆ ±º‰ - ’ŸªΩ ±º‰
	
	-- ∏¯◊Ó∏ﬂ…À∫¶µƒ»ÀªÚ∂”ŒÈΩ±¿¯
	local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, 5000000, 0, format("%s ph«n th≠Îng","Ph«n th≠Îng kinh nghi÷m cho ÆÈi c„ c´ng k›ch mπnh nh t vµo ßÈc C´ Thi™n Phong"));
		end
	else -- “ª∏ˆ»À
		szName = GetName();
		PlayerFunLib:AddExp(10000000, 0, format("%s ph«n th≠Îng","Ph«n th≠Îng kinh nghi÷m cho ng≠Íi c„ c´ng k›ch mπnh nh t vµo ßÈc C´ Thi™n Phong"));
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, 10000000, 0, format("%s ph«n th≠Îng","Ph«n th≠Îng kinh nghi÷m cho ng≠Íi Æ¯ng g«n khi Æ∂ bπi ßÈc C´ Thi™n Phong"));
	end
	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbKillerReward, format("%s rÌt","ßÈc C´ Thi™n Phong"), 1);
	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, -1, self.tbNormalDrop, format("%s rÌt","ßÈc C´ Thi™n Phong"), 1);
	
	--DC Ph«n th≠Îng - Modified By DinhHQ - 20111010
	--item
--	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbVngNewDropItem, format("%s rÌt","ßÈc C´ Thi™n Phong"), 1);
	--trang bﬁ
--	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbVngNewDropEquip, format("%s rÌt","ßÈc C´ Thi™n Phong"), 1);

-- ßi“u chÿnh ph«n th≠Îng rÌt ra - Modified by ThanhLD -20130417
--admin edit
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbVngNewAward, format("%s rÌt","ßÈc C´ Thi™n Phong"), 1);
	-- BOSSª˜…±Õ≥º∆
	local nCount = GetTask(self.TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(self.TSK_PLAYER_BOSSKILLED, nCount);
	
	-- BIGBOSSÀ¿Õˆ
	local Handle = OB_Create()
	if (Handle > 0) then
		ObjBuffer:PushObject(Handle, 1)
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "SetBigBossDead", Handle);
		OB_Release(Handle)
	end
	
	local szNews = format("TÊ ÆÈi <color=yellow>%s<color> Æ∑ ti™u di÷t thµnh c´ng  <color=yellow>ßÈc C´ Thi™n Phong<color>, h∑y nhanh ch„ng Æ’n l‘ quan nhÀn th≠Îng!",szName);
	AddGlobalNews(szNews);
	LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
	
	self:AddKillRecord(szName, nTime);
end

function BigBoss:RemoveSongJinBonus()
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- ÷ÿ÷√±‰¡ø,“‘∑¿“‚Õ‚
	PlayerFunLib:SetTaskBit(self.TSK_BIGBOSS_REWARD, self.SONGJIN_REWARD_BIT, 0);
end

function BigBoss:RemoveChuangGuanBonus()
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- ÷ÿ÷√±‰¡ø,“‘∑¿“‚Õ‚
	PlayerFunLib:SetTaskBit(self.TSK_BIGBOSS_REWARD, self.CHUANGGUAN_REWARD_BIT, 0);
end

function BigBoss:AddSongJinPoint(nBasePoint)
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- ÷ÿ÷√±‰¡ø,“‘∑¿“‚Õ‚
	local nType = GetBit(PlayerFunLib:GetActivityTask(self.TSK_BIGBOSS_REWARD), self.SONGJIN_REWARD_BIT);
	if (nType == 1) then
		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour <= 22) then -- 21µ„µƒÀŒΩ22:30Ω· ¯
			nBasePoint = nBasePoint * 2;
		end
		
	end
	--Lunar new year 2011 - Bobus award - Modified By DinhHQ - 20120103
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate >= 201201200000 and nNowDate < 201201252400 and nType ~= 1 then
		nBasePoint = nBasePoint * 2;
	end
	return nBasePoint;
end

function BigBoss:AddChuangGuanPoint(nBasePoint)
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- ÷ÿ÷√±‰¡ø,“‘∑¿“‚Õ‚
	local nType = GetBit(PlayerFunLib:GetActivityTask(self.TSK_BIGBOSS_REWARD), self.CHUANGGUAN_REWARD_BIT);
	if (nType == 1) then
		nBasePoint = nBasePoint * 2;
	end
	--Lunar new year 2011 - Bobus award - Modified By DinhHQ - 20120103
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate >= 201201200000 and nNowDate < 201201252400 and nType ~= 1 then
		nBasePoint = nBasePoint * 2;
	end
	return nBasePoint;
end

function BigBoss:MakeAllPlayerCanGetReward()
	local nIdx = GetFirstPlayerAtServer();
	while(nIdx > 0) do
		doFunByPlayer(nIdx, PlayerFunLib.AddTaskDaily, PlayerFunLib, self.TSK_BIGBOSS_REWARD, 0);
		doFunByPlayer(nIdx, PlayerFunLib.SetTaskBit, PlayerFunLib, self.TSK_BIGBOSS_REWARD, self.CAN_GET_REWARD_BIT, 1);
		nIdx = GetNextPlayerAtServer();
	end
end
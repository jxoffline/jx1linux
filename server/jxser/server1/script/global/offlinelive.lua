-- 根据玩家级别,增加用户的经验、扣除离线托管时间、增加福缘
-- 经验每5分钟增加一次；离线时间每侦减少1，福缘一小时增加一次
IncludeLib("PARTNER");
IncludeLib("TONG");
Include( "\\script\\global\\fuyuan.lua" );
Include( "\\script\\global\\baijuwanhead.lua" );

-- 2008圣诞活动在线托管获得红色礼盒的头文件
--Include("\\script\\item\\shengdan_jieri\\200811\\red_box.lua");

-- 2006 年国庆节活动头文件
Include("\\script\\event\\nationalday_2006\\main.lua");


Include("\\script\\event\\funv_jieri\\200903\\tuoguan.lua")

Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");

--tinhpn 20100805: VLMC
Include("\\script\\bonusvlmc\\head.lua");

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")


BAIJU_DOUBLEEXP_TIME = 051008
-- 定义的供外部函数调用的脚本

-- 得到定时器的数量
function gettimercount()
	return 4
end

-- 得到定时器的函数
function gettimername(index)
	if (index == 0) then
		return "addofflineexp"
	elseif (index == 1) then
		return "reduceofflinetime"
	elseif (index == 2) then
		return "addoofflinefuyuna"
	elseif (index == 3) then
		return "addofflineskillexp"
	end
	return ""
end

-- 得到执行时间间隔（帧数）
function gettimerinterval(index)
	if (index == 0) then
		return AEXP_INTERVAL 	    --加经验：5分钟
	elseif (index == 1) then
		return 60 * FRAME2TIME		--减时间：每分钟
	elseif (index == 2) then
		return 60 * 60 * FRAME2TIME	--领福源：1小时
	elseif (index == 3) then
		return AEXP_INTERVAL 	    --加技能熟练度：5分钟
	end
	return AEXP_INTERVAL
end

-- 获取定时器选项，0表示第0周期开始执行，1表示第1周期开始执行
function gettimeroption(index)
	if (index == 0) then
		return 1 	                --加经验：5分钟以后
	elseif (index == 1) then
		return 1		            --减时间：1分钟以后
	elseif (index == 2) then
		return 0	                --领福源：立即领取
	elseif (index == 3) then
		return 1 	                --加技能熟练度：5分钟
	end
	return 0
end

-- 获取超时检查间隔（帧数）
function gettimeoutinterval()
	return 60 * FRAME2TIME  -- 是否超时的检查间隔时间为60s
end

function IsTimeValid()
	if IsIPBonus() == 1 then
		IpBonus_Close()
	end;
	
	--tinhpn 20100817: Online Award
	if (OnlineAward_StartDate()==1 and OnlineAward_Check_TransferLife() ~= 0) then
		OnlineAward_SummaryOnlineTime()
	end	
	
	if GetSkillState(451) > 0 and GetTask(TSK_Active_x2EXP) ~= 1 then
			RemoveSkillState(451)
	end
	local szHour = date("%H");
	local nDay = tonumber(date("%y%m%d"))
	local nHour = tonumber(szHour);
	-- if (nHour >= 18 and nHour < 24) then
	-- 	return 0
	-- else
	-- 	return 1
	-- end
	if (nDay < BAIJU_DOUBLEEXP_TIME) then
		return 2
	else
	 	return 1
	end
end;


-- 技能大白的经验是否双倍
function skillBaijuEffect()
	local nHour = tonumber(GetLocalDate("%H"));  -- 获取小时
	return 1;
end;

--根据级别得到经验
function getofflinevalue(nLevel, bPartner)

local nHour = tonumber(GetLocalDate("%H"));  -- 获取小时

	nExp = 0;
	-- 一小时挂机经验：e={3.5w+floor[(lv-50)/5]*0.5w}*1.2
	if (nLevel == 50) then 	-- 50
		nExp = 700; -- 每分钟获得的经验值
	elseif (nLevel < 100) then 	-- 51~99
		nExp = 700 + floor((nLevel - 50)/5)*100; -- 每分钟获得的经验值
	else -- 100级及100级以上
		nExp = 1700; -- 每分钟获得的经验值[700 + floor((100 - 50)/5)*100]
	end
	
	if (bPartner and nLevel < 50) then
		nExp = 175;	--如果是同伴，50级下获得经验为50级获得经验的1/4
	end
	
	if (GetProductRegion() ~= "vn") then

		-- 如果是 2006 春节则凌晨 0 点到晚上 6 点 2 倍
		if isSpringTime()==1 and nHour>=0 and nHour<18 then
			nExp = nExp * 2;
		end;
		
		if (IsTimeValid() == 2) then
			nExp = nExp * AEXP_FREQ * 12;  -- 每天0：00-12：00 白驹丸经验翻倍
		else
			nExp = nExp * AEXP_FREQ * 6; -- (5)分钟获得的经验值(桃花岛经验的6倍)
		end
		
	else
		nExp = nExp * AEXP_FREQ * 7; -- (5)分钟获得的经验值()
	end
	--是否有大还丹效果，则有经验加成
	if (IsDaHuanDanValid() == 1) then
		--给与大还丹经验加成
		return nExp, GetTask(1741)
	end

	return nExp
end;

--增加经验
function addofflineexp()
	if (IsTimeValid() == 0) then
		return 
	end
	local nSpecialD = 0;
	if (GetTask(AEXP_TIANXING_TIME_TASKID) > 0) then
		nSpecialD = 5;
	elseif (GetTask(AEXP_SPECIAL_TIME_TASKID) > 0) then
		if (GetProductRegion() == "vn" and GetLevel() >= 130) then
			nSpecialD	= 4;
		else
			nSpecialD = 2;
		end
	elseif (GetTask(AEXP_TASKID) > 0) then
		if (GetProductRegion() == "vn" and GetLevel() >= 130) then
			nSpecialD	= 2.5;
		else
			nSpecialD = 1.5;
		end
	elseif (GetTask(AEXP_SMALL_TIME_TASKID) > 0) then
		if (GetProductRegion() == "vn" and GetLevel() >= 130) then
			nSpecialD	= 1.5;
		else
			nSpecialD = 1;
		end
	else
		nSpecialD = 0.5*0.5;		-- UNDONE by zbl	为什么要设成0.25?
	end;
	--getredbox(nSpecialD);	-- 圣诞节活动在线托管获得红色礼盒
	tbFunv0903:GetItemByTuoGuan(nSpecialD)
	-- 增加玩家经验
	local nPlayerLevel = GetLevel();
	if (nPlayerLevel >= AEXP_NEEDLEVEL) then
		local nExp, nAddExp = getofflinevalue(nPlayerLevel);
		nExp = floor(nSpecialD * nExp);
		local nEnExp = CalcEnhanceExp(nExp) -- 计算经验加成
		if (GetNpcExpRate() > 100) then
			nEnExp = floor((nEnExp * 100) / GetNpcExpRate());
		end
		if (nAddExp and nSpecialD ~= 0.5) then
			nEnExp = nEnExp + nAddExp
		end
		AddOwnExp(nEnExp); -- 加经验
	end
	
	-- 增加同伴经验
	local nPartnerIdx, bPartnerCallOut = PARTNER_GetCurPartner();
	if (nPartnerIdx > 0 and bPartnerCallOut == 1) then
		local nPartnerLevel = PARTNER_GetLevel(nPartnerIdx);
		if (nPartnerLevel >= AEXP_NEEDLEVEL_PARTNER) then
			local nExp = 0;
			nExp = getofflinevalue(nPartnerLevel,1);
			nExp = floor(nSpecialD * nExp);
			PARTNER_AddExp(nPartnerIdx, nExp); -- 加经验
		end
	end
	
	
end

--其他功能需要增加托管经验，写入此
function getAddExpValue(nExp)
	return 0
end;

--减少时间
function reduceofflinetime()
	if (IsTimeValid() == 0) then
		return 
	end
	local nInterval = 60 * FRAME2TIME;	
	local nAexp_OwnExp_id;
	local nAexp_Skill_id;
	
	local tbAexpTask_Exp = {AEXP_SMALL_TIME_TASKID, AEXP_TASKID, AEXP_SPECIAL_TIME_TASKID, AEXP_TIANXING_TIME_TASKID};
	local tbAexpTask_Skill = {AEXP_SMALL_SKILL_TASKID, AEXP_SKILL_TIME_TASKID, AEXP_SPECIAL_SKILL_TASKID};
	for i = 1, getn(tbAexpTask_Exp) do
		if (GetTask(tbAexpTask_Exp[i]) > 0) then
			nAexp_OwnExp_id = tbAexpTask_Exp[i];
		end
	end
	for i = 1, getn(tbAexpTask_Skill) do
		if (GetTask(tbAexpTask_Skill[i]) > 0) then
			nAexp_Skill_id = tbAexpTask_Skill[i];
		end;
	end;
	
	if (GetTask(AEXP_SKILL_ID_TASKID) == 0) then
		nAexp_Skill_id = nil;
	end;
	
	local arynOfflineTimeTaskID = { nAexp_OwnExp_id, nAexp_Skill_id };
	
	for i = 1, getn(arynOfflineTimeTaskID) do
		local nSpareTime = GetTask(arynOfflineTimeTaskID[i]);
		if (nSpareTime < nInterval) then
			nSpareTime = 0;
		else
			nSpareTime = nSpareTime - nInterval;
		end
		SetTask(arynOfflineTimeTaskID[i], nSpareTime);
	end
	reduceAddExpTime();
end
function reduceAddExpTime()
return 0
end

--增加福缘
function addoofflinefuyuna()
	if (IsTimeValid() == 0) then
		return 
	end
	
	nRet = FuYuan_Gain();
	-- return nRet
end

--增加技能熟练度
function addofflineskillexp()
	if (IsTimeValid() == 0 or (GetTask(AEXP_SKILL_TIME_TASKID) <= 0 and GetTask(AEXP_SPECIAL_SKILL_TASKID) <= 0 and GetTask(AEXP_SMALL_SKILL_TASKID) <= 0)) then
		return 
	end
	
	local nSpecialD = 1;																--技能白驹 1倍
	if (GetTask(AEXP_SPECIAL_SKILL_TASKID) > 0) then		--特效技能白驹 2倍
		nSpecialD = 2;
	elseif (GetTask(AEXP_SKILL_TIME_TASKID) > 0) then		--技能大白驹 是1.5
		nSpecialD = 1.5
	end;
	
	local nSkillID = GetTask(AEXP_SKILL_ID_TASKID);
	local nSkillLevel = GetCurrentMagicLevel(nSkillID, 0);
	local bUp = 0;
	if (nSkillLevel >= 1 and nSkillLevel <= getn(ARY_UPGRADE_SKILL_EXP_PERCENT)) then
		if (nSkillID >= ARY_120SKILLID[1] and nSkillID <= ARY_120SKILLID[10]) then
		--如果为120技能，则挂机经验为定值
			bUp = AddSkillExp(nSkillID, floor(nSpecialD * AEXP_120SKILL_UPGRADE_EXP), 1);
		else
			local fAddSkillExpPercent = floor(nSpecialD * ARY_UPGRADE_SKILL_EXP_PERCENT[nSkillLevel] * 10000 * skillBaijuEffect());
			bUp = AddSkillExp(nSkillID, fAddSkillExpPercent, 1, 1);
		end;
		if (bUp == 1 and GetCurrentMagicLevel(nSkillID, 0) > getn(ARY_UPGRADE_SKILL_EXP_PERCENT)) then
			autosetupgradeskill();
		end
	else
		autosetupgradeskill();
	end
end

function IsDaHuanDanValid()
	if (GetTask(1742) > 0) then
			return 1
	end
end
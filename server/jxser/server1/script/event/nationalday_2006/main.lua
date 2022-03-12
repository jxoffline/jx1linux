
-- ====================== 文件信息 ======================

-- 剑侠情缘online 2006 年国庆节活动Npc对话文件
-- Edited by peres
-- 2006/09/26 PM 14:52

-- 就如同她的笑从来都不是代表快乐，
-- 她的哭泣也没有任何意味。
-- 她说，好了。
-- 我们说会儿话吧。
-- 拿了裙子和内衣，非常沉静地一件一件穿上。
-- 态度有明显的生疏，仿佛想退回到她的世界里去。

-- ======================================================

-- 读入国庆节活动头文件
Include("\\script\\event\\nationalday_2006\\head.lua");

-- 读入对话字符处理文件
Include("\\script\\task\\system\\task_string.lua");

-- 2006 年国庆节对话入口
function nationalday_2006_main()

	local aryTalk = {
			"<dec><npc>当今武林，人杰辈出，各大门派砺精图强。当此乱世，各位仍为武林盟尽心竭力。恰逢佳节，独孤盟主特为各位侠士侠女送上节日贺礼，大家可以在<color=yellow>10月01日至10月03日<color>领取，最后祝合家安康，万事如意！",
			"领取每日的经验奖励/getMoreExp_Confirm",
			"关于随机任务触发概率翻倍的消息/getRandomTaskInfo",
			"关于各种白驹丸效用翻倍的消息/getBaijuInfo",
			"结束对话/OnExit",
		};
	
	CreateTaskSay(aryTalk);
	
	return 1;

end;

function getDoubleExp()

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- 如果日期不对，直接返回
	if isNationalDay()==0 then
		Say("现在已经不是国庆节的前三天了哦！", 0);
		return
	end;

	-- 如果等级未达到 80 级
	if GetLevel()<80 then
		Say("只有 80 级以上的人才能领取双倍经验哦！", 0);
		return
	end;

	if nDate~= GetTask(ID_GETDOUBLEEXP_DATE) then
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);	
		
	elseif GetTask(ID_GETDOUBLEEXP_NUM)>=1 then
	
		Say("你今天已经领取过了双倍经验了哦！", 0);
		return
		
	else
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);
			
	end;
	
	-- 80 级以上的人每天可以领取一次 8 小时经验双倍
	if GetLevel()>=80 then
	
		AddSkillState(531,10,1,8*60*60*18);
		AddSkillState(461,1, 1,8*60*60*18);
		
		Msg2Player("您得到了<color=green> 8 小时的双倍经验！<color>");
		WriteTaskLog("得到了 8 小时的双倍经验！");
		
	else
		Say("只有 80 级以上的人才能领取双倍经验哦！", 0);
	end;

end;


function getTaskBook()

local nRandomTaskID, nRandomItemIndex = 0, 0;

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- 如果日期不对，直接返回
	if isNationalDay()==0 then
		Say("现在已经不是国庆节的前三天了哦！", 0);
		return
	end;
	
	-- 如果是非冲卡用户
	if IsCharged()==0 then
		Say("本次国庆节活动只有冲卡用户才能参与哦！", 0);
		return
	end;
	
	-- 如果等级未达到 80 级
	if GetLevel()<80 then
		Say("只有 80 级以上的人才能领取这个任务卷轴哦！", 0);
		return
	end;
	
	if nDate~= GetTask(ID_GETTASKBOOK_DATE) then
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	elseif GetTask(ID_GETTASKBOOK_NUM)>=1 then
	
		Say("你今天已经领取过了一个任务卷轴哦！", 0);
		return
		
	else
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	end;
	
	-- 选择一个第二层的随机任务
	nRandomTaskID = TaskNo(selectNextTask());
		
	-- 生成一个任务卷轴
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	
	-- 同步物品魔法属性
	SyncItem(nRandomItemIndex);

	Msg2Player("您得到了<color=green>任务卷轴一个！<color>");
	
	WriteTaskLog("得到了一个任务卷轴，编号为："..nRandomTaskID);
	
end;


-- 询问玩家是否领取经验
function getMoreExp_Confirm()
	Say("您在<color=yellow>2006年10月01日至2006年10月03日<color>期间，每日上线都会获得独孤盟主赠送的大批经验。<color=yellow>这三天之内每天能领一次<color>，但两次领取经验之间相隔需要<color=yellow>在线超过1小时<color>。你要现在领取吗？",2,
		"好啊，我要领取/getMoreExpMain",
		"还是再等一下吧/OnExit");
	return
end;


-- 领取每日的经验
function getMoreExpMain()

local nExp = countMoreExpNum();

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- 如果日期不对，直接返回
	if isNationalDay()==0 then
		Say("现在已经不是国庆节的前三天了哦！", 0);
		return
	end;
	
	-- 如果是非冲卡用户
	if IsCharged()==0 then
		Say("本次国庆节活动只有冲卡用户才能参与哦！", 0);
		return
	end;
	
	if canGetMoreExp()==1 then
		if GetLevel()<50 then
			addPlayerExpForLimit(nExp, 5); -- 限制只能升 5 级
		else
			addPlayerExpForLimit(nExp, 0); -- 不限制
		end;
		
		Msg2Player("您得到了元旦活动的经验奖励：<color=yellow>"..nExp.."<color> 点经验！");
		
		writeMoreExpData();  -- 记录领取经验的相关数据
	
		WriteTaskLog("得到每日的奖励经验："..nExp);
		
	else
		Say("你现在的条件不能够领取每日的经验，在10月01日至10月03日期间，每日上线都会获得独孤盟主赠送的大批经验。<color=yellow>这三天之内每天能领一次<color>，但两次领取经验之间相隔需要<color=yellow>在线超过1小时<color>哦！", 0);
		return
	end;


end;


function getRandomTaskInfo()

	Say("您在 <color=yellow>2006年10月01日至2006年10月03日<color> 获得了随机任务触发概率翻倍的贺礼！", 0);
	return

end;


function getBaijuInfo()

	Say("您在 <color=yellow>2006年10月01日至2006年10月03日<color>，使用白驹丸挂机获得的经验、技能白驹丸挂机获得熟练度将翻 1.5 倍。但是<color=yellow>免费托管的经验不在此列<color>。", 0);
	return

end;
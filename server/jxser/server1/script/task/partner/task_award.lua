
-- ====================== 文件信息 ======================

-- 剑侠情缘online 情义江湖同伴剧情奖励脚本头文件
-- Edited by peres
-- 2005/09/09 PM 11:19

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================

-- 同伴系统的头文件
IncludeLib("PARTNER");

-- 读入 DEBUG 输出处理文件
Include("\\script\\task\\system\\task_debug.lua");

-- 载入辉煌之章的头文件
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua");

Include([[\script\tong\tong_award_head.lua]]);--帮会周目标贡献度by志山
-- 记录剧情篇奖励发放的 ID

ARY_MASTER_AWARD = {
	[1] = 50,
	[2] = 51,
	[3] = 52,
	[4] = 53,
	[5] = 54,
}

-- 记录修炼篇奖励发放的 ID
ARY_REWIND_AWARD = {
	[1] = 55,
	[3] = 56,
	[4] = 57,
}

ARY_SKILLBOOK = {849,850,851,853,854,855,859,861,862,863,864,868,870}

-- 同伴系统的头文件
IncludeLib("PARTNER")

aryMasterAward = {	
	-- 侍朗之死
	[1] = function(nState)		
		-- 龙五处领取任务后发放奖励
		if nState==1 then
			AddOwnExp(20000);
			AddPartnerExp(5000);
		end;
		
		-- 静岳师太处决定去拿草药后发放奖励
		if nState==2 then
			AddOwnExp(20000);
			AddPartnerExp(5000);		
		end;
		
		-- 干掉神秘山贼获得的奖励
		if nState==3 then
			AddOwnExp(2000);
			AddPartnerExp(1000);
		end;
		
		-- 干掉贼婆子获得的奖励
		if nState==4 then
			AddOwnExp(2000);
			AddPartnerExp(1000);
		end;

		-- 干掉左右寨主获得的奖励
		if nState==5 then
			AddOwnExp(20000);
			AddPartnerExp(5000);
		end;
		
		-- 干掉山贼王获得的奖励
		if nState==6 then
			AddOwnExp(100000);
			AddPartnerExp(20000);
			skillbook_select(2)
		end;

		-- 完成山贼岭所有条件后，回来静岳师太处发放的奖励
		if nState==7 then
			AddOwnExp(20000);
			AddPartnerExp(5000);
		end;

		-- 侍郎之死任务完成，龙五处发放的奖励
		if nState==8 then
			AddOwnExp(20000);
			AddPartnerExp(5000);
			skillbook_select(1)
		end;
				
	end,
	
	
	-- 控蛇人之秘
	[2] = function(nState)
	
		-- 龙五处领取任务后发放奖励
		if nState==1 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
		end;
		
		-- 茶博士处获得线索后发放奖励
		if nState==2 then
			AddOwnExp(40000);
			AddPartnerExp(10000);		
		end;

		-- 驿官处三个信使关卡全部过关后发放奖励
		if nState==3 then
			AddOwnExp(400000);
			AddPartnerExp(400000);
			skillbook_select(2)
		end;

		-- 茶博士处回复后发放的奖励
		if nState==4 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
		end;
		
		-- 龙五处交任务后得到的奖励
		if nState==5 then
			AddOwnExp(100000);
			AddPartnerExp(10000);
			skillbook_select(1)
		end;					
	end,

	
	-- 珠宝商人
	[3] = function(nState)
	
		-- 龙五处领取任务后发放奖励
		if nState==1 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
		end;
		
		-- 答应丁磊营救丁利后发放的奖励
		if nState==2 then
			AddOwnExp(20000);
			AddPartnerExp(10000);		
		end;

		-- 干掉一个枪骑兵获得的奖励
		if nState==3 then
			AddOwnExp(4000);
			AddPartnerExp(5000);
		end;

		-- 干掉一个弓骑兵获得的奖励
		if nState==4 then
			AddOwnExp(4000);
			AddPartnerExp(5000);
		end;
		
		-- 干掉一个带刀将领获得的奖励
		if nState==5 then
			AddOwnExp(20000);
			AddPartnerExp(50000);
		end;
		
		-- 干掉一个刷出怪获得的奖励
		if nState==6 then
			AddOwnExp(40000);
			AddPartnerExp(80000);
		end;

		-- 营救出丁利后发放的奖励
		if nState==7 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
		end;
		
		-- 龙五处交任务后得到的奖励
		if nState==8 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
			skillbook_select(1)
		end;
	end,

	
	-- 异族武士
	[4] = function(nState)
	
		-- 龙五处领取任务后发放奖励
		if nState==1 then
			AddOwnExp(40000);
			AddPartnerExp(20000);
		end;

		-- 打败梁猫猫后获得的奖励
		if nState==2 then
			AddOwnExp(60000);
			AddPartnerExp(80000);
		end;

		-- 打败李猩后获得的奖励
		if nState==3 then
			AddOwnExp(60000);
			AddPartnerExp(80000);
		end;
		
		-- 打败佩公子后获得的奖励
		if nState==4 then
			AddOwnExp(60000);
			AddPartnerExp(80000);
		end;

		-- 打败唐鱼后获得的奖励
		if nState==5 then
			AddOwnExp(60000);
			AddPartnerExp(80000);
		end;

		-- 打败刘啸阔后获得的奖励
		if nState==8 then
			AddOwnExp(60000);
			AddPartnerExp(80000);
		end;

		-- 打败5个boss后与王一对话获得的奖励
		if nState==6 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
		end;
		
		-- 龙五处交任务后得到的奖励
		if nState==7 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
			skillbook_select(1)
		end;					
	end,

	
	-- 隐藏任务
	[5] = function(nState)
		
		-- 玩家所带同伴的前4个同伴剧情任务全完成
		if nState==1 then
			AddOwnExp(5000000);
			AddPartnerExp(1000000);
		end;

	end,
}



-- 修炼篇任务的奖励数组
aryRewindAward = {
	
	-- 侍朗之死
	[1] = function(nState)
	
		-- 龙五处领取任务后发放奖励
		if nState==1 then
			AddOwnExp(CountDoubleMode(10000));
			AddPartnerExp(CountDoubleMode(1000));
		end;
		
		-- 静岳师太处决定去拿草药后发放奖励
		if nState==2 then
			AddOwnExp(CountDoubleMode(10000));
			AddPartnerExp(CountDoubleMode(1000));		
		end;
		
		-- 干掉神秘山贼获得的奖励
		if nState==3 then
			AddOwnExp(CountDoubleMode(1000));
			AddPartnerExp(CountDoubleMode(200));		
		end;
		
		-- 干掉贼婆子获得的奖励
		if nState==4 then
			AddOwnExp(CountDoubleMode(1000));
			AddPartnerExp(CountDoubleMode(200));
		end;

		-- 干掉左右寨主获得的奖励
		if nState==5 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(2000));
		end;
		
		-- 干掉山贼王获得的奖励
		if nState==6 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(2000));
		end;

		-- 完成山贼岭所有条件后，回来静岳师太处发放的奖励
		if nState==7 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(500));
		end;

		-- 侍郎之死任务完成，龙五处发放的奖励
		if nState==8 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(1000));
			skillbook_select(3)
			tongaward_partner_juqing(1);--帮会周目标by志山
		end;
				
	end,
	
	
	-- 珠宝商人
	[3] = function(nState)
	
		-- 龙五处领取任务后发放奖励
		if nState==1 then
			AddOwnExp(CountDoubleMode(30000));
			AddPartnerExp(CountDoubleMode(2000));
		end;
		
		-- 答应丁磊营救丁利后发放的奖励
		if nState==2 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(500));		
		end;

		-- 干掉一个枪骑兵获得的奖励
		if nState==3 then
			AddOwnExp(CountDoubleMode(2000));
			AddPartnerExp(CountDoubleMode(500));
		end;

		-- 干掉一个弓骑兵获得的奖励
		if nState==4 then
			AddOwnExp(CountDoubleMode(2000));
			AddPartnerExp(CountDoubleMode(500));
		end;
		
		-- 干掉一个带刀将领获得的奖励
		if nState==5 then
			AddOwnExp(CountDoubleMode(10000));
			AddPartnerExp(CountDoubleMode(2000));
		end;
		
		-- 干掉一个刷出怪获得的奖励
		if nState==6 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(2000));
		end;

		-- 营救出丁利后发放的奖励
		if nState==7 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(2000));
		end;
		
		-- 龙五处交任务后得到的奖励
		if nState==8 then
			AddOwnExp(CountDoubleMode(30000));
			AddPartnerExp(CountDoubleMode(2000));
			skillbook_select(3)
			tongaward_partner_juqing(1);--帮会周目标by志山
		end;
	end,

	
	-- 异族武士
	[4] = function(nState)
	
		-- 龙五处领取任务后发放奖励
		if nState==1 then
			AddOwnExp(CountDoubleMode(30000));
			AddPartnerExp(CountDoubleMode(2000));
		end;

		-- 打败梁猫猫后获得的奖励
		if nState==2 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(3000));
		end;

		-- 打败李猩后获得的奖励
		if nState==3 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(3000));
		end;
		
		-- 打败佩公子后获得的奖励
		if nState==4 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(3000));
		end;

		-- 打败唐鱼后获得的奖励
		if nState==5 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(3000));
		end;

		-- 打败刘啸阔后获得的奖励
		if nState==8 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(3000));
		end;

		-- 打败5个boss后与王一对话获得的奖励
		if nState==6 then
			AddOwnExp(CountDoubleMode(30000));
			AddPartnerExp(CountDoubleMode(2000));
		end;
		
		-- 龙五处交任务后得到的奖励
		if nState==7 then
			AddOwnExp(CountDoubleMode(30000));
			AddPartnerExp(CountDoubleMode(3000));
			skillbook_select(3)
			tongaward_partner_juqing(0);--帮会周目标by志山
		end;					
	end,
}

-- select_item:返回值为1表示奖励随机1级技能书，为2表示随机奖励技能书，为3表示10%几率奖励随机技能书
function skillbook_select(select_item)
		local i = random(199,599)
		local SKILLBOOK_LEVEL = floor(i/100)
		local j = getn(ARY_SKILLBOOK)
		local SKILLBOOK_NAME = ARY_SKILLBOOK[random(1,j)]
		if ( select_item == 1 ) then
			AddItem(6,1,SKILLBOOK_NAME,1,0,0)
			Msg2Player("<color=yellow>你得到了一本同伴技能书！<color>");
		elseif ( select_item == 2 ) then
			AddItem(6,1,SKILLBOOK_NAME,SKILLBOOK_LEVEL,0,0)
			Msg2Player("<color=yellow>你得到了一本同伴技能书！<color>");
		elseif ( select_item == 3 ) then
			local w = random(1,100)
			if ( w <= 30 ) then
				AddItem(6,1,SKILLBOOK_NAME,SKILLBOOK_LEVEL,0,0)
				Msg2Player("<color=yellow>你得到了一本同伴技能书！<color>");
			end
		end;
end

function PayMasterAward(nTask, nState)
	if CheckMasterAwardState(nTask, nState)==1 then
		aryMasterAward[nTask](nState);
	end;
end;


function PayRewindAward(nTask, nState)
	if CheckRewindAwardState(nTask, nState)==1 then
		aryRewindAward[nTask](nState);
	end;
end;


-- 检查剧情篇的奖励是否能给予发放
function CheckMasterAwardState(nTask, nState)

local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
local NpcCount = PARTNER_Count();

local nValue = 0;
local nBit = 0;

	-- 如果没有带同伴或者没有召唤同伴则直接返回 nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	nValue = PARTNER_GetTaskValue(partnerindex, ARY_MASTER_AWARD[nTask]);
	nBit = GetBit(nValue, nState);

	if nBit==0 then
		nValue = SetBit(nValue, nState, 1);
		PARTNER_SetTaskValue(partnerindex, ARY_MASTER_AWARD[nTask], nValue);
		CDebug:MessageOut("检查剧情第 "..nTask.." 个任务的第 "..nState.." 种状态是否能发奖：成功");
		return 1;
	else
		CDebug:MessageOut("检查剧情第 "..nTask.." 个任务的第 "..nState.." 种状态是否能发奖：失败");
		return 0;
	end;

end;

-- 检查修炼篇的奖励是否能给予发放
function CheckRewindAwardState(nTask, nState)

local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
local NpcCount = PARTNER_Count();

local nValue = 0;
local nBit = 0;

	-- 如果没有带同伴或者没有召唤同伴则直接返回 nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	nValue = PARTNER_GetTaskValue(partnerindex, ARY_REWIND_AWARD[nTask]);
	nBit = GetBit(nValue, nState);
	
	if nBit==0 then
		nValue = SetBit(nValue, nState, 1);
		PARTNER_SetTaskValue(partnerindex, ARY_REWIND_AWARD[nTask], nValue);
		CDebug:MessageOut("检查修炼第 "..nTask.." 个任务的第 "..nState.." 种状态是否能发奖：成功");
		return 1;
	else
		CDebug:MessageOut("检查修炼第 "..nTask.." 个任务的第 "..nState.." 种状态是否能发奖：失败");
		return 0;
	end;

end;


-- 设置一个任务的奖励状态
function SetTaskAwardState(nTask, nState, nBit)

local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
local NpcCount = PARTNER_Count();

local nValue = PARTNER_GetTaskValue(partnerindex, nTask);

	nValue = SetBit(nValue, nState, nBit);
	
	PARTNER_SetTaskValue(partnerindex, nTask, nValue);
	
end;


function GetTaskAwardState(nTask, nState)

local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
local NpcCount = PARTNER_Count();

local nBit = GetBit(PARTNER_GetTaskValue(partnerindex, nTask), nState);

	CDebug:MessageOut("Get Bit："..nBit, 2);

end;

-- 增加同伴的经验
function AddPartnerExp(nExp)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count();
	
	-- 如果没有带同伴或者没有召唤同伴则直接返回 nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	PARTNER_AddExp(partnerindex, nExp, 1);
	
end;


-- 双倍活动的模式
-- 传入参数：int:nValue 所要计算的价值量
function CountDoubleMode(nValue)

local nDoubleMode = greatnight_huang_event(5);

	if nDoubleMode~=0 or nDoubleMode~=nil then
		return nValue*nDoubleMode;
	else
		return nValue;
	end;

end;

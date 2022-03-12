
-- ====================== 文件信息 ======================

-- 剑侠情缘online 9-1 经验补偿活动头文件
-- Edited by peres
-- 2006/10/30 PM 11:19

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

Include("\\script\\event\\remedy\\remedy_head.lua");
Include("\\script\\task\\task_addplayerexp.lua");

_CRemedy = inherit(CRemedy, {
	
	payProcess = function(self)
		local nExp = GetLevel() * 10 * 20000;
		tl_addPlayerExp(nExp);
		Msg2Player("您得到了补偿的经验：<color=yellow>"..nExp.."<color> 点！");
		return 1;
	end,
	
});

CMyRemedy = new(_CRemedy,
				0,
				61031,
				61106,
				2516,
				50,
				"9 区 1 停机维护补偿经验");

function Remedy_20061031_Main()
	Say("礼官：您要领取10月份 9 区 1 停机维护的补偿经验吗？此次经验补偿的领取日期为 <color=yellow>2006年10月31日 至 2006年11月06日，50级以上每人限领一次<color>。", 
		2,
		"是的/Remedy_20061031_Get",
		"不了/onExit");
end;


function Remedy_20061031_Get()
	local nResult = CMyRemedy:payForPlayer();
	local szErrotMsg = "";

		if nResult==1 then
			Say("礼官：您已经成功领取了 9 区 1 停机维护补偿经验，此类经验是<color=yellow>升级之后仍然叠加<color>的，祝您今天有个好运气。", 0);
			return 1;
		else
			for i=1, getn(nResult) do
				szErrotMsg = szErrotMsg..nResult[i];
			end;
			
			Say("礼官：对不起，您无法领取补偿的经验，原因有：<enter>"..szErrotMsg, 0);
			return 0;
		end;	
end;


function onExit()
	Say("礼官：这世界上真是一样米养百样人啊……白送的经验都不要。", 0);
end;
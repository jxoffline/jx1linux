
-- ====================== 文件信息 ======================

-- 剑侠情缘online 情义江湖同伴剧情脚本实体处理文件 - 异族武士
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
IncludeLib("PARTNER")

-- 同伴剧情任务头文件
Include ("\\script\\task\\partner\\task_head.lua");

-- 修炼篇头文件
Include ("\\script\\task\\partner\\rewind\\partner_reward_main_04.lua");


PARID_MASTER04_BOSS_01 = 25;  -- 粱猫猫
PARID_MASTER04_BOSS_02 = 26;  -- 李猩
PARID_MASTER04_BOSS_03 = 27;  -- 佩公子
PARID_MASTER04_BOSS_04 = 28;  -- 唐鱼


taskProcess_004_Main = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SelectDescribe({"<npc>{临安}的{珠宝商人丁利}近日送来了一封书信。信上说那颗镶在侍郎手臂内的宝石价值连城，乃是真正入火不化的稀世珍宝天智玉。他当年获得玉胚后，以重金请来回族匠人里一等一的高手雕制，花了整整一年的时间才研磨出两颗光润剃透的宝珠。这两颗玉珠，都是被一位王姓商人买去了，据说他隐居在一处叫百花谷的地方。那个地方我是听说过的，有门徒经过那里，说谷内剑气直冲霄汉，祥云笼罩，定然有高人居住。只是这样的事情发生以后，那个地方更显得神秘了。",
						"剧情篇[针对没有做过该任务的同伴]/#taskProcess_004_01:doTaskEntity()",
						"修练篇[针对已经做过该任务的同伴]/#rewindProcess_004_01:doTaskEntity()",
						"我想去百花谷游览一下/#taskProcess_004_GotoWorld:doTaskEntity()",
						"我都不想接，迟些再来吧/OnTaskExit"
						});
		return 1;
	end,

});


-- 开始任务时的对话
taskProcess_004_01 = inherit(CProcess, {

	checkCondition = function(self)
	
		local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出		
		
		-- 检查玩家和同伴的等级
		if GetLevel()<100 or PARTNER_GetLevel(partnerindex)<40 then return 4; end;
	
		if GetMasterTaskState(PARID_TASK_MASTER_004)==nil then  -- 没有带同伴
			return 0;
		elseif GetMasterTaskState(PARID_TASK_MASTER_004)==0 then -- 第一次开始做
			return 1;
		elseif GetMasterTaskState(PARID_TASK_MASTER_004)>=1 and GetMasterTaskState(PARID_TASK_MASTER_004)<3 then -- 已经开始做了 
			return 2;
		elseif GetMasterTaskState(PARID_TASK_MASTER_004)>=3 then -- 已经完成了
			return 3;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SelectDescribe({"<npc>我料定你此行必将有所收获，不过还需做好准备啊。到了谷里找到那个叫王一的商人。",
							"接受任务/#taskProcess_004_Accept:doTaskEntity()",
							"我再考虑一下/OnTaskExit",
							});
			return 1;
		elseif nCondition==2 then
			SelectDescribe({"<npc>你完成了我给你的任务了吗？",
							"请送我去百花谷吧/#taskProcess_004_GotoWorld:doTaskEntity()",
							"完成任务/#taskProcess_004_Finish:doTaskEntity()",
							"我还没有完成/OnTaskExit"
							});
			return 1;
		elseif nCondition==3 then
			SelectDescribe({"<npc>你在这次任务中表现很好，辛苦你了！",
							"结束对话/OnTaskExit",
							});
			return 1;
		elseif nCondition==4 then
			SelectDescribe({"<npc>这次任务需要你的等级在 {100 级}以上，并且你的同伴等级要在 {40 级}以上！",
							"结束对话/OnTaskExit",
							});	
			return 1;
		elseif nCondition==0 then
			SelectDescribe({"<npc>你还没有召唤出同伴，我无法给你指定任务！",
							"结束对话/OnTaskExit"
							});	
			return 1;
		end;
		return 0;
	end,

});


-- 接受任务，任务进程为 1
taskProcess_004_Accept = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SelectDescribe({"<npc>你现在想去百花谷吗？我可以送你一程。",
						"是的，麻烦你了/#taskProcess_004_GotoWorld:doTaskEntity()",
						"让我再准备准备吧/OnTaskExit"});
		Msg2Player("你接到了异族武士的同伴剧情任务！");
		SetMasterTaskState(PARID_TASK_MASTER_004, 1);
		
		-- 发放奖励
		PayMasterAward(4, 1);
		
		return 1;
	end,
});


-- 传送到百花谷的过程
taskProcess_004_GotoWorld = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		NewWorld(513,1500,3158);
		SetFightState(1);
	end,
	
});


-- 完成任务，任务进程为 3
taskProcess_004_Finish = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_004)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
	
		if nCondition==1 then
			SelectDescribe({"<npc>好样的！你真的拿到了天下英雄帖。如此一来，我们便可以参加天下英雄会，真正揭开天煌龙器之迷了。等待了这么久，赔了那么多人的性命，终归是位了还国家一个安定。在这个乱世里，大家流的血都太多太多了，希望到时是一个结束吧，能够马放南山，刀枪入库，我龙五也到塞外寻一片草场，和马儿做伴，看着蓝蓝的天空白白的云彩，就这样了此残生。现在距离英雄会还有一段时间，你可以回去先做些休整了。过不了几个月，我自然会再找你，保重！",
							"结束对话/OnTaskExit"});
			SetMasterTaskState(PARID_TASK_MASTER_004, 3);
			
			Msg2Player("你已经完成了异族武士的剧情任务！");
			
			-- 发放奖励
			PayMasterAward(4, 7);
			
			return 1;
		else
			SelectDescribe({"<npc>我交给你的任务你还没有完成哦，加油吧。",
							"结束对话/OnTaskExit"});
			return 1;
		end;
	end,
});


-- 杀死粱猫猫的处理
taskProcess_004_Boss_01 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_004)==1 then
			return 1;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		if nCondition==1 then
			
			SetPartnerTask(PARID_MASTER04_BOSS_01, 1);
			Msg2Player("你已经杀死了梁猫猫！");
			
			-- 发放奖励
			PayMasterAward(4, 2);
					
			return 1;
		end;
		return 0;
	end,
});


-- 杀死李猩的处理
taskProcess_004_Boss_02 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_004)==1 then
			return 1;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SetPartnerTask(PARID_MASTER04_BOSS_02, 1);
			Msg2Player("你已经杀死了李猩！");
			
			-- 发放奖励
			PayMasterAward(4, 3);
						
			return 1;
		end;
		return 0;
	end,
});


-- 杀死佩公子的处理
taskProcess_004_Boss_03 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_004)==1 then
			return 1;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SetPartnerTask(PARID_MASTER04_BOSS_03, 1);
			Msg2Player("你已经杀死了佩公子！");
			
			-- 发放奖励
			PayMasterAward(4, 4);
						
			return 1;
		end;
		return 0;
	end,
});


-- 杀死唐鱼的处理
taskProcess_004_Boss_04 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_004)==1 then
			return 1;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SetPartnerTask(PARID_MASTER04_BOSS_04, 1);
			Msg2Player("你已经杀死了唐鱼！");
			
			-- 发放奖励
			PayMasterAward(4, 5);
						
			return 1;
		end;
		return 0;
	end,
});


-- 杀死刘啸阔的处理
taskProcess_004_Boss_05 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_004)==1 then
			return 1;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SetPartnerTask(PARID_MASTER04_BOSS_04, 1);
			Msg2Player("你已经杀死了刘啸阔！");
			
			-- 发放奖励
			PayMasterAward(4, 8);
						
			return 1;
		end;
		return 0;
	end,
});


-- 与王一的对话，如果条件符合则任务进程为 2
taskProcess_004_02 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		
		local nNum_1 = GetPartnerTask(PARID_MASTER04_BOSS_01);
		local nNum_2 = GetPartnerTask(PARID_MASTER04_BOSS_02);
		local nNum_3 = GetPartnerTask(PARID_MASTER04_BOSS_03);
		local nNum_4 = GetPartnerTask(PARID_MASTER04_BOSS_04);
		
		if nNum_1==1 and nNum_2==1 and nNum_3==1 and nNum_4==1 and GetMasterTaskState(PARID_TASK_MASTER_004)==1 then
			SelectDescribe({"<npc>谢谢你替我解除了危险。既然是五爷的人，我这里有一样东西交托给你。侍郎是我的好友，当初他嘱托我代为保管，如今他人也死了，这张帖子我留之无用，反是个大麻烦。你就拿去吧。对了，既然你是爱武之人，我这谷内还隐居了一位旧时名扬天下的高手，不过他戒武已久。你若能说得动他，说不定会传一门绝技予你吧。",
							"还是先将我送回去吧/#taskProcess_004_02_SendMan:doTaskEntity()",
							"结束对话/OnTaskExit"});
			SetMasterTaskState(PARID_TASK_MASTER_004, 2);

			-- 发放奖励
			PayMasterAward(4, 6);

			return 1;
		elseif GetMasterTaskState(PARID_TASK_MASTER_004)==2 then
			taskProcess_004_02_SendMan:doTaskEntity();
			return 1;
		else
			SelectDescribe({"<npc>现在有五名高手正狂攻我王家堡，你若无法打败他们，我们是出不去的。",
							"结束对话/OnTaskExit"
							});
			return 0;
		end;
		return 0;
	end,
		
});


taskProcess_004_02_SendMan = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SelectDescribe({"<npc>你要离开这里了吗？",
						"是的，请送我走吧/#taskProcess_004_02_Send:doTaskEntity()",
						"再等等/OnTaskExit"
						});
		return 1;
	end,
});



taskProcess_004_02_Send = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		NewWorld(176,1376,3333);
		SetFightState(0);
	end,
});

-- ====================== 文件信息 ======================

-- 剑侠情缘online 情义江湖同伴剧情脚本实体处理文件 - 侍朗之死
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

-- 同伴剧情任务头文件
Include ("\\script\\task\\partner\\task_head.lua");

Include ("\\script\\task\\partner\\rewind\\partner_reward_main_01.lua");

ID_PARMASTER_TALK_01 = 1256;  -- 是否开启与南岳镇的居民对话的开关

PARID_TASK_ITEM_001 = 7;    -- 地黄草
PARID_TASK_ITEM_002 = 8;    -- 费叶
PARID_TASK_ITEM_003 = 9;    -- 左钥匙
PARID_TASK_ITEM_004 = 10;   -- 染胛骨
PARID_TASK_ITEM_005 = 12    -- 右钥匙

PARID_TASK_WAITTIME = 13;   -- 5分钟的等待时间


taskProcess_001 = inherit(CProcess, {

	checkCondition = function(self)
		return 1;
	end,
	
	taskEntity = function(self, nCondition)
	
		local strMain = {
			"<npc>近来，门下弟子告诉了我一件奇怪的事情。不久前，南岳镇上来了一个额有刺青，佩带铁匣的老年犯人，此人目光矍铄，看上去相貌非凡。所以我们暗藏在南岳客栈中的高手对他多有照顾。有一个雷雨交加的夜里，老人忽然神色惊恐的找到了那个弟子，说出来一个关于藏宝图碎片的莫大秘密。原来这位老人居然是当朝兵部侍郎，因力主抗击金国，被流放南疆戍边。更奇怪的是，第二日早晨侍郎大人忽然无疾暴毙！联系最近江湖上传闻的武林客栈在江湖广发英雄贴，约定来年召集天下英雄解开与天煌龙器相关的藏宝图之秘这件事，我觉得背后也许有个莫大的阴谋。一张小小的金泥秋枫笺，成了江湖英雄个个欲得之后快的宝贝。而真正流传江湖的，似乎只有十大门派掌门人手中的十张，另外十张英雄贴却不知所踪。我相信侍郎的死与之有关，想请你找出其中破绽。化解中原武林的一场浩劫！",
			"剧情篇[针对没有做过该任务的同伴]/#taskProcess_001_01:doTaskEntity()",
			"修练篇[针对已经做过该任务的同伴]/#rewindProcess_001_01:doTaskEntity()",
			"我都不想接，迟些再来吧/OnTaskExit"
		}
		
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		end;
		return 0;
	
	end,

});


-- 选择侍郎之死剧情篇[针对没有做过该任务的同伴]
taskProcess_001_01 = inherit(CProcess, {

	checkCondition = function(self)
		
		local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
		
		-- 检查玩家和同伴的等级
		if GetLevel()<70 or PARTNER_GetLevel(partnerindex)<10 then return 4; end;
		
		if GetMasterTaskState(PARID_TASK_MASTER_001)==nil then -- 没有CALL同伴出来返回0
			return 0;
		elseif GetMasterTaskState(PARID_TASK_MASTER_001)>=1 and GetMasterTaskState(PARID_TASK_MASTER_001)<5 then -- 已经开始了任务的返回1
			return 1;
		elseif GetMasterTaskState(PARID_TASK_MASTER_001)==5 then -- 已经完成过任务的返回2
			return 2;
		elseif GetMasterTaskState(PARID_TASK_MASTER_001)==0 then -- 从来没有做过这个任务的返回3
			return 3;
		end;
	end,
	
	taskEntity = function(self, nCondition)
	
		-- 开始任务时的对话
		local strMain = {
			"<npc>你可从南岳着手调查，镇民们应该知道一些消息。",
			"我愿意接受任务/#taskProcess_001_Accept:doTaskEntity()",
			"我要取消任务/#taskProcess_001_Cancel:doTaskEntity()",
			"容我再想想吧/OnTaskExit"
		}
		
		-- 没有完成任务的对话
		local strMain_01 = {
			"<npc>你还没有完成任务吧？请捉紧时间吧！",
			"结束对话/OnTaskExit",
		}
		
		-- 已经完成任务的对话
		local strMain_02 = {
			"<npc>你已经完成过此任务了哦，",
			"结束对话/OnTaskExit",		
		}

		if nCondition==1 then
			if GetMasterTaskState(PARID_TASK_MASTER_001)==4 then
				taskProcess_001_Pay:doTaskEntity();
			else
				SelectDescribe(strMain_01);
			end;
			return 1;
		elseif nCondition==2 then
			SelectDescribe(strMain_02);
			return 1;
		elseif nCondition==3 then
			SelectDescribe(strMain);
			return 1;
		elseif nCondition==4 then
			SelectDescribe({"<npc>这次任务需要你的等级在 {70 级}以上，并且你的同伴等级要在 {10 级}以上！",
							"结束对话/OnTaskExit",
							});	
			return 1;
		elseif nCondition==0 then
			SelectDescribe({"<npc>你还没有带做这个任务的同伴来哦！",
							"结束对话/OnTaskExit"});
			return 1;
		end;
		
		return 0;
	
	end,

});


-- 侍郎之死剧情任务接受任务，任务进度为 1
taskProcess_001_Accept = inherit(CProcess, {
	
	-- 给予信息并发予第一步的奖励
	taskEntity = function(self, nCondition)
		
		if nCondition==1 then
			SetTask(ID_PARMASTER_TALK_01, 1);  -- 设置对话临时变量
			Msg2Player("你接受了侍郎之死的剧情任务！");
			SetMasterTaskState(PARID_TASK_MASTER_001, 1);
			
			-- 发放奖励
			PayMasterAward(1, 1);

			return 1; 
		end;
		return 0;
	end,

});

-- 侍郎之死剧情任务交任务
taskProcess_001_Pay = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_001)==4 then
			return 1;
		elseif GetMasterTaskState(PARID_TASK_MASTER_001)==nil then
			return 2;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		
		strMain = {
			"<npc>静岳也被毒镖所伤吗？近来我派去各地调查英雄贴下落的高手纷纷遇害，一同抗战的老兄弟，却被自家人所伤，哎……不说这些了，这里是你应得的奖励，迟些时候再来找我吧。我需要安静一下。",
			"领取奖励/#taskProcess_001_PayAward:doTaskEntity()"
		}
		
		if nCondition==1 then 
			SelectDescribe(strMain);
			return 1;
		elseif nCondition==2 then
			SelectDescribe({"<npc>你还没有带做这个任务的同伴来哦！",
							"结束对话/OnTaskExit"});
			return 1;
		end;
		return 0;
	end,

});


-- 侍朗之死发与奖励，任务进程为 5
taskProcess_001_PayAward = inherit(CProcess, {

	-- 给予信息并发的奖励
	taskEntity = function(self, nCondition)
		Msg2Player("你已经完成了侍郎之死的剧情任务！");
		SetMasterTaskState(PARID_TASK_MASTER_001, 5);
		SetTask(ID_PARMASTER_TALK_01, 0); -- 清空与村民对话的变量

		-- 发放奖励
		PayMasterAward(1, 8);

		return 1;
	end,
	
});


-- 侍郎之死剧情任务取消任务
taskProcess_001_Cancel = inherit(CProcess, {

	-- 给予取消任务的提示
	taskEntity = function(self, nCondition)
		Say("你确定要取消侍郎之死的剧情任务吗？",2,
			"是的，我太疲惫了/#taskProcess_001_Cancel_Confirm:doTaskEntity()",
			"让我再考虑一下/OnTaskExit");
		return 1;
	end,

});

-- 侍郎之死剧情任务取消任务确认
taskProcess_001_Cancel_Confirm = inherit(CProcess, {

	-- 给予取消任务的提示
	taskEntity = function(self, nCondition)
		SetTask(ID_PARMASTER_TALK_01, 0); -- 清空与村民对话的变量
		Msg2Player("你已经取消了侍郎之死的剧情任务！");
		return 1; 
	end,
	
});


-- 与静岳师太处对话，任务进展为 2
taskProcess_001_02 = inherit(CProcess, {

	checkCondition = function(self)
		-- 任务进展为 1，并且已经从村民处获得信息，才能通过
		if GetMasterTaskState(PARID_TASK_MASTER_001)==1 and GetTask(ID_PARMASTER_TALK_01)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		strMain = {
			"<npc>施主，你终于还是来拉。贫尼早间起了一卦，卦像成祥，是吉兆。也许这五岳之一的灵山，能免除一场血光之灾了。侍郎死于一种非常奇怪的湿热。而且镇上不只一人患了重病而亡。那种湿热是由一种丛林金线蛇引起的，它常常在半夜的时候从梁木上爬下来，偷偷在睡梦中咬人的脑袋，因为头发遮蔽，所以看不出痕迹。可惜它非常狡猾，贫尼没有办法捉到。这种蛇绝非南岳镇所有，我怀疑是有人指使。所以需要找到能将{金线蛇}熏出来的{地黄草}，{费叶}和{染胛根}。这些东西都产于北面的山贼洞。那里凶险万分，一般武林高手进去，都是有去无回，你愿意去吗？",
			"是的，我已经准备好了/#taskProcess_001_02_Accept:doTaskEntity()",
			"不，我还需要准备一下/OnTaskExit"
		}
		
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1; 
		end;
		return 0;
	end,

});


-- 传送去任务地图的确认
taskProcess_001_02_Accept = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		strMain = {
			"<npc>山贼洞内强匪云集，在神秘山贼身上藏有地黄草，贼婆子身上藏着费叶。你需要各取五十株。然后去洞上方分别杀掉看守钥匙的山贼左寨主和山贼右寨主，得到两把钥匙然后去地图中央的镇岳之门，找开锁人打开它。从山贼王手中夺到唯一的一支染胛骨。这样才能成功配制成药材，清楚了吗？如果清楚的话，贫尼这就送你上山。",
			"清楚了，送我去吧/#taskProcess_001_02_01:doTaskEntity()",
			"我再准备准备/OnTaskExit"
		}
		SetMasterTaskState(PARID_TASK_MASTER_001, 2);
		SelectDescribe(strMain);
		
		-- 发放奖励
		PayMasterAward(1, 2);
		
		return 1;
	end,

});


-- 传去任务所在地图的过程
taskProcess_001_02_01 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		NewWorld(514, 1552, 3308);
		SetFightState(1);
		return 1;
	end,

});


-- 杀死神秘山贼的处理过程
taskProcess_001_02_02 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_001)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	-- 有 1/2 的概率得到地黄草，无上限
	taskEntity = function(self, nCondition)
	
		local nItemNum = GetPartnerTask(PARID_TASK_ITEM_001);
		
		-- 发放奖励
		-- PayMasterAward(1, 3);

		if nCondition==1 and nItemNum<50 then

			AddOwnExp(2000);
			AddPartnerExp(1000);
		
			SetPartnerTask(PARID_TASK_ITEM_001, 
								 nItemNum + 1);
								 
			Msg2Player("你得到了一株地黄草！你现在共有 "..(nItemNum + 1).." 株！");
			return 1;
		end;
		return 0;
	end

});


-- 杀死贼婆子的处理过程
taskProcess_001_02_03 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_001)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	-- 有 1/2 的概率得到费叶，无上限
	taskEntity = function(self, nCondition)
	
		local nItemNum = GetPartnerTask(PARID_TASK_ITEM_002);

		-- 发放奖励
		-- PayMasterAward(1, 4);
	
		if nCondition==1 and nItemNum<50 then
		
			AddOwnExp(2000);
			AddPartnerExp(1000);
		
			SetPartnerTask(PARID_TASK_ITEM_002, 
								 nItemNum + 1);
								 
			Msg2Player("你得到了一株费叶！你现在共有 "..(nItemNum + 1).." 株费叶！");
			
			return 1;
		end;
		return 0;
	end

});


-- 杀死左寨主得到一把钥匙
taskProcess_001_02_04 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_001)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	-- 得到一把钥匙
	taskEntity = function(self, nCondition)
	
		local nItemNum = GetPartnerTask(PARID_TASK_ITEM_003);
		
		if nCondition==1 then

			-- 发放奖励
			PayMasterAward(1, 5);
			
			-- AddOwnExp(250000);
			-- AddPartnerExp(100000);
		
			if nItemNum>=1 then return 0; end;
			
			SetPartnerTask(PARID_TASK_ITEM_003, 
								 nItemNum + 1);
								 
			Msg2Player("你得到了一把右弯月形状的钥匙！");
			return 1;
		end;

		return 0;	
	end

});


-- 杀死右寨主得到一把钥匙
taskProcess_001_02_05 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_001)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	-- 得到一把钥匙
	taskEntity = function(self, nCondition)
	
		local nItemNum = GetPartnerTask(PARID_TASK_ITEM_005);
	
		if nCondition==1 then

			-- 发放奖励
			PayMasterAward(1, 5);
			
			-- AddOwnExp(250000);
			-- AddPartnerExp(100000);

			if nItemNum>=1 then return 0; end;
				
			SetPartnerTask(PARID_TASK_ITEM_005, 
								 nItemNum + 1);
								 
			Msg2Player("你得到了一把左弯月形状的钥匙！");
			return 1;
		end;
		return 0;
	end

});


-- 杀死山贼王得到染胛骨
taskProcess_001_02_KillBoss = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_001)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	-- 得到染胛骨
	taskEntity = function(self, nCondition)
	
		local nItemNum = GetPartnerTask(PARID_TASK_ITEM_004);
		
		if nCondition==1 then

			-- 发放奖励
			PayMasterAward(1, 6);

			if nItemNum>=1 then return 0; end;
			
			SetPartnerTask(PARID_TASK_ITEM_004, 
								 nItemNum + 1);
								 
			Msg2Player("你得到了一根染胛骨！");
			return 1;
		end;
		return 0;	
	end

});


-- 与开锁人一的对话
taskProcess_001_02_UnLock = inherit(CProcess, {
	checkCondition = function(self)
	
		local nKey_1 = GetPartnerTask(PARID_TASK_ITEM_003);
		local nKey_2 = GetPartnerTask(PARID_TASK_ITEM_005);
		
		if nKey_1==nil or nKey_2==nil then return end;
		
		if nKey_1>=1 and nKey_2>=1 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)

		if nCondition==1 then
			SelectDescribe({"<npc>你手上拿着的钥匙就是你实力的凭证，我这就送你进去接受挑战吧！",
							"好，请送我进去吧/#taskProcess_001_02_Inside:doTaskEntity()",
							"我再准备一下/OnTaskExit"
							});
		else
			SelectDescribe({"<npc>等你从左右两位寨主里拿到两半钥匙后再来找我吧！",
							"结束对话/OnTaskExit"
							});
		end;
		return 1;
	end,

});


-- 传送进去的过程
taskProcess_001_02_Inside = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetPos(1816,3227);
		SetFightState(1);
		return 1;
	end,
});


-- 与开锁人二的对话
taskProcess_001_02_SendMan = inherit(CProcess, {

	checkCondition = function(self)
		return 1;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then	
			SelectDescribe({"<npc>你现在想出去了吗？",
							"请送我出去吧/#taskProcess_001_02_Outside:doTaskEntity()",
							"再等等/OnTaskExit",
							});
		end;
		return 1;
	end,

});


-- 传送出去的过程
taskProcess_001_02_Outside = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetPos(1794,3193);
		SetFightState(0);
		return 1;
	end,
});


-- 回来与静岳师太处对话
taskProcess_001_02_06 = inherit(CProcess, {
	checkCondition = function(self)
		
		local nTaskState = GetMasterTaskState(PARID_TASK_MASTER_001);
		local nItem_01 = GetPartnerTask(PARID_TASK_ITEM_001);
		local nItem_02 = GetPartnerTask(PARID_TASK_ITEM_002);
		local nItem_03 = GetPartnerTask(PARID_TASK_ITEM_003);
		local nItem_04 = GetPartnerTask(PARID_TASK_ITEM_004);
		local nItem_05 = GetPartnerTask(PARID_TASK_ITEM_005);
		
		if nTaskState==2 and nItem_01>=50 and nItem_02>=50 and nItem_04>=1 then
			return 1;
		elseif nTaskState==2 then
			return 2;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		strMain = {
			"<npc>阿弥陀佛，施主此行血光盈目，料来是因了贫尼又多造下几番杀孽，罪过罪过。这样的乱世，民不聊生，若是能以霹雳手段救民于水火，就让贫尼先下了九层阿鼻地狱吧。药材都已齐备，施主且{过上些时间再来}，贫尼先准备熏出毒蛇的事情了。",
			"结束对话/#taskProcess_001_02_07:doTaskEntity()"
		}
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		elseif nCondition==2 then
			taskProcess_001_02_Accept:doTaskEntity();
			return 1;
		end;
		return 0;
	end

});

-- 开始五分钟的变量储存，任务进展为 3
taskProcess_001_02_07 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SetPartnerTask(PARID_TASK_WAITTIME, GetGameTime());
		SetMasterTaskState(PARID_TASK_MASTER_001, 3);
		return 1;
	end,

});

-- 五分钟之后回来的对话，如果符合条件则任务进展为 4
taskProcess_001_02_08 = inherit(CProcess, {

	checkCondition = function(self)
		-- 大约经过 5 分钟，并非准确的系统时间
		if GetMasterTaskState(PARID_TASK_MASTER_001)==3 and GetGameTime() - GetPartnerTask(PARID_TASK_WAITTIME) >= 350 then
			return 1;
		elseif GetMasterTaskState(PARID_TASK_MASTER_001)==3 then
			return 2;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		strMain = {
			"<color=green>静岳师太<color>：果然，果然是那条蛇，头顶有火焰的烙印。只有苗疆……有暗器！",
			"刚刚一枚银白色的钢镖旋转着打过来，速度之快简直不可思议。现在静岳师太左肋已被打透，根本无法说话了。你先回{龙五}处交了任务吧，迟些再来问她。"
		}
		
		if nCondition==1 then
			SetMasterTaskState(PARID_TASK_MASTER_001, 4);
			TalkEx("", strMain);

			-- 发放奖励
			PayMasterAward(1, 7);
			
			return 1;
		elseif nCondition==2 then
			SelectDescribe({"<npc>熬毒这种事情须得万分的小心，施主莫急，还是稍等片刻吧！",
							"结束对话/OnTaskExit"
							});
			return 1;
		end;
		return 0;
	end,

});





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

PARID_MASTER05_TIMES = 68;  -- 玩家每日完成的修炼任务计数

-- 最后奖励技能书的数组
ARY_AWARD_BOOKS = {
	
	-- 金系
	[0] = {{839, "镇狱破天劲", "金系同伴无上心法，能缩短主人的中毒时间"}, 
		   {840, "大悲咒", "金系同伴无上心法，能增加主人的毒防"}},
	
	-- 木系
	[1] = {{841, "炼狱腐蛊", "木系同伴无上心法，能增加主人的雷防"}, 
		   {842, "蚀骨血仞", "木系同伴无上心法，能使主人尽快从眩晕状态恢复"}},

	-- 水系
	[2] = {{843, "逆转心经", "水系同伴无上心法，能使主人移动速度更快"}, 
		   {844, "玄冰阴气", "水系同伴无上心法，能增加主人的火防"}},
	
	-- 火系
	[3] = {{845, "尘空梵烬", "火系同伴无上心法，能增加主人的普防"}, 
		   {846, "火凤轻吟", "火系同伴无上心法，能使主人移动速度更快"}},

	-- 土系
	[4] = {{847, "纯阳无极", "土系同伴无上心法，能使主人尽快从迟缓状态恢复"}, 
		   {848, "云生结海", "土系同伴无上心法，能增加主人的冰防"}},

}

-- 进入百花谷时的判断
taskProcess_005_01 = inherit(CProcess, {

	checkCondition = function(self)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count();
	
		-- 如果没有带同伴或者没有召唤同伴则直接返回 0
		if NpcCount==0 or partnerstate~=1 then return 0; end;
		
		-- 判断四个主线任务是否已经完成
		local nState_1 = GetMasterTaskState(PARID_TASK_MASTER_001);
		local nState_2 = GetMasterTaskState(PARID_TASK_MASTER_002);
		local nState_3 = GetMasterTaskState(PARID_TASK_MASTER_003);
		local nState_4 = GetMasterTaskState(PARID_TASK_MASTER_004);
		
		if nState_1>=5 and nState_2>=6 and nState_3>=5 and nState_4>=3 then
			return 1;
		else
			return 2;
		end;
		
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SetPos(1535, 3021); -- 弹到第一点
			SetFightState(0);
			return 1;
		elseif nCondition==2 or nCondition==0 then
			Say("前方云雾缭绕，剑气冲霄。似乎不是你现在可以去的地方。",0);
			SetPos(1516, 3069); -- 弹到第二点
			SetFightState(1);
			return 0;
		end;
	end,

});


-- 踩到出去时的点的处理
taskProcess_005_Outside = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetPos(1516, 3069); -- 弹到第二点
		SetFightState(1);
		return 1;
	end,
});

-- 与剑皇对话
taskProcess_005_02 = inherit(CProcess, {

	checkCondition = function(self)
		local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
		local NpcCount = PARTNER_Count();

			-- 检查玩家和同伴的等级
			if GetLevel()<90 or PARTNER_GetLevel(partnerindex)<80 then return 4; end;
		
			-- 如果没有带同伴或者没有召唤同伴则直接返回 0
			if NpcCount==0 or partnerstate~=1 then return 0; end;
			
			-- 判断四个主线任务是否已经完成
			local nState_1 = GetMasterTaskState(PARID_TASK_MASTER_001);
			local nState_2 = GetMasterTaskState(PARID_TASK_MASTER_002);
			local nState_3 = GetMasterTaskState(PARID_TASK_MASTER_003);
			local nState_4 = GetMasterTaskState(PARID_TASK_MASTER_004);
			
			if nState_1==5 and nState_2==6 and nState_3==5 and nState_4==3 and GetMasterTaskState(PARID_TASK_MASTER_005)==0 then
				return 1;
			elseif GetMasterTaskState(PARID_TASK_MASTER_005)==1 then -- 已经接了任务
				return 2;
			else
				return 3;
			end;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SelectDescribe({"<npc>你是怎么找到这里来的？一入江湖，想退出竟这样的难吗？楚某这辈子一切的一切都被这个江湖夺去了，还不满足吗？好吧，只要你不说出我的藏身之处，我便传你那小同伴一式绝学如何？不过要学楚某的武功，没有一个好的基础，只会走火入魔，自焚而亡。如果你一定要让小同伴学，就先带着他（她）完成{十五日}的{同伴修练任务}吧。记得，每日的任务都必须全部完成，不可偷懒。到功成之日再来找我，我便将绝艺倾囊相授。",
							"接受任务/#taskProcess_005_03:doTaskEntity()"
							});
		elseif nCondition==2 then
			SelectDescribe({"<npc>你已经完成了十五天的同伴修炼任务了吗？",
							"我已经完成了/#taskProcess_005_Finish:doTaskEntity()",
							"暂时还没有/OnTaskExit"});
		elseif nCondition==4 then
			SelectDescribe({"<npc>记住，当你的同伴到了 <color=yellow>80<color> 级时便可来找我，我便将绝艺倾囊相授。不可偷懒。",
							"结束对话/OnTaskExit"
							});	
		else
			SelectDescribe({"<npc>少年听雨歌楼上，红烛昏罗帐。壮年听雨客舟中，江阔云低，断雁叫西风。而今听雨僧庐下，鬓已星星也。悲欢离合总无情，一任阶前点滴到天明。",
							"结束对话/OnTaskExit"
							});	
		end;
		return 1;
	end,

});


-- 接收任务，任务进展为 1
taskProcess_005_03 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_005, 1);
		Msg2Player("你现在需要带领你的同伴完成 15 日的修炼任务！");
		return 1;
	end,
	
});


-- 完成任务的过程
taskProcess_005_Finish = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_MASTER05_TIMES);
		if nNum>=15 then
			SelectDescribe({"<npc>很好，你已经完成了十五天的同伴修炼，这是给你的奖励！",
							"领取奖励/#taskProcess_005_AwardSelect:doTaskEntity()"
							});
			return 1;
		else
			SelectDescribe({"<npc>你还没有完成十五天的同伴修炼任务吧！？",
							"结束对话/OnTaskExit"
							});
			return 1;
		end;
		return 0;
	end,
});


-- 领取隐藏任务的奖励，设置任务进程为 2
taskProcess_005_AwardSelect = inherit(CProcess, {
	taskEntity = function(self, nCondition)
	
		local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
		local NpcCount = PARTNER_Count();
		local nSeries = 0;
		
		-- 如果没有带同伴或者没有召唤同伴则直接返回 nil
		if NpcCount==0 or partnerstate~=1 then
			SelectDescribe({"<npc>你还没有召出同伴来哦！",
							"结束对话/OnTaskExit"
							});	
			return 0;
		end;
		
		nSeries = PARTNER_GetSeries(partnerindex);

		SelectDescribe({"<npc>我这里有两本技能书适合你现在的同伴，你想要领取哪个技能书奖励呢？<enter><enter><color=green>"..
						ARY_AWARD_BOOKS[nSeries][1][2].."<color>："..ARY_AWARD_BOOKS[nSeries][1][3].."<enter><color=green>"..
						ARY_AWARD_BOOKS[nSeries][2][2].."<color>："..ARY_AWARD_BOOKS[nSeries][2][3].."<enter>",
						"我选"..ARY_AWARD_BOOKS[nSeries][1][2].."/#taskProcess_005_AwardPayBook("..nSeries..", 1)",
						"我选"..ARY_AWARD_BOOKS[nSeries][2][2].."/#taskProcess_005_AwardPayBook("..nSeries..", 2)",
						});	

		return 1;
	end,
});


-- 每日完成后累加的过程
taskProcess_005_AddTimes = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_005)==1 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_MASTER05_TIMES);
		if nCondition==1 then
			if nNum<15 then
				SetPartnerTask(PARID_MASTER05_TIMES, nNum + 1);
				return 1;
			elseif nNum==15 then
				Msg2Player("你已经完成了十五天的同伴修炼任务，你现在可以回百花谷去找剑皇了！");
				return 1;
			end;
		end;
		return 0;
	end,

});


-- 给同伴发技能书的过程，任务进展为 2
function taskProcess_005_AwardPayBook(nSeries, nBook)

	AddItem(6, 1, ARY_AWARD_BOOKS[nSeries][nBook][1], 1, 0, 0);
	
	SetMasterTaskState(PARID_TASK_MASTER_005, 2);
	PayMasterAward(5, 1);

end;



-- ====================== 文件信息 ======================

-- 剑侠情缘online 情义江湖同伴剧情脚本实体处理文件 - 控蛇人之秘
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

ID_PARTASK_PASSED = 1262;

BIT_PASSED_001 = 1;
BIT_PASSED_002 = 2;
BIT_PASSED_003 = 3;

BIT_PASSED_STATE = 5; -- 记录是否打开信使任务的监控

-- 开始任务时的对话
taskProcess_002_01 = inherit(CProcess, {

	checkCondition = function(self)
		
		local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
		
		-- 检查玩家和同伴的等级
		if GetLevel()<80 or PARTNER_GetLevel(partnerindex)<20 then return 4; end;
		
		if GetMasterTaskState(PARID_TASK_MASTER_002)==nil then  -- 没有带同伴
			return 0;
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)==0 then -- 第一次开始做
			return 1;
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)>=1 and GetMasterTaskState(PARID_TASK_MASTER_002)<=5 then -- 已经开始做了 
			return 2;
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)>=6 then -- 已经完成了
			return 3;
		end;
	end,
	
	taskEntity = function(self, nCondition)

		-- 开始任务时的对话
		local strMain = {
			"<npc>前阵子南岳镇静岳师太受的伤经过调理已渐渐好了起来，她所抓住的那条蛇头上有火焰标记，天下这么多种异蛇，惟独苗疆控蛇人才能养出头顶附着火焰纹的蛇王。你应该去{大理}看一看，也许会有所发现。据说{大理城内的茶博士}对这些控蛇制毒的家伙甚为了解，你可以找他帮忙查探，不过现在藏匿起来的那伙势力行事歹毒，你自己要多加小心。",
			"接受任务/#taskProcess_002_Accept:doTaskEntity()",
			"我再考虑一下/OnTaskExit",
		}
		
		local strMain_01 = {
			"<npc>前阵子南岳镇静岳师太受的伤经过调理已渐渐好了起来，她所抓住的那条蛇头上有火焰标记，天下这么多种异蛇，惟独苗疆控蛇人才能养出头顶附着火焰纹的蛇王。你应该去{大理}看一看，也许会有所发现。据说{大理城内的茶博士}对这些控蛇制毒的家伙甚为了解，你可以找他帮忙查探，不过现在藏匿起来的那伙势力行事歹毒，你自己要多加小心。",
			"我已经完成了任务/#taskProcess_002_Pay:doTaskEntity()",	
			"我还没有完成/OnTaskExit"		
		}
		
		local strMain_02 = {
			"<npc>你在这次任务中表现很好，辛苦你了！",
			"结束对话/OnTaskExit",
		}
		
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		elseif nCondition==2 then
			SelectDescribe(strMain_01);	
			return 1;
		elseif nCondition==3 then
			SelectDescribe(strMain_02);
			return 1;
		elseif nCondition==4 then
			SelectDescribe({"<npc>这次任务需要你的等级在 {80 级}以上，并且你的同伴等级要在 {20 级}以上！",
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

-- 接受任务时的处理，任务进展为 1
taskProcess_002_Accept = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 1);
		Msg2Player("你接到了控蛇人之秘的同伴剧情任务！");
		
		-- 发放奖励
		PayMasterAward(2, 1);
		
		return 1;
	end,

});


-- 交任务时的处理
taskProcess_002_Pay = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_002)>=5 then
			return 1;
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)==nil then
			return 2;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SelectDescribe({
				"<npc>嗯，既然是这样，那么你暂且休息吧。难为了笑图，这么些年了，他还记着那些小事情。哦，笑图是你在大理见到的那位茶博士，他原来是云贵一带令人闻风丧胆的独行大盗，名字可以拿来止小儿夜哭的，呵呵。",
				"领取奖励/#taskProcess_002_PayAward:doTaskEntity()"
			});
		elseif nCondition==2 then
			SelectDescribe({"<npc>你还没有召唤出做这个任务的同伴哦！",
				"结束对话/OnTaskExit"
			});
			return 1;
		else
			SelectDescribe({
				"<npc>你还没有完成我给你的任务吧？",
				"结束对话/OnTaskExit"
			});
		end;
		return 1;
	end,

});


-- 领取任务奖励，任务进展为 6
taskProcess_002_PayAward = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 6);
		Msg2Player("你已经完成了控蛇人之秘的任务！");
		
		-- 发放奖励
		PayMasterAward(2, 5);
		
		return 1;
	end;
});


-- 与茶博士的对话
taskProcess_002_02 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_002)==1 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		local strMain = {
			"<npc>您是龙五爷派来的吗？恩，我们大理苗族中，有些家族确实有养蛇的传统。不过额头上有火焰标记的倒是没有听说过，那是，那是祖宗规矩里禁止的秘火之眼啊。上一次有火焰纹毒蛇现身大理的时候，城里起了场百年难遇的干旱，那次死了多少人啊。嘘，当心隔墙有耳，我们屋里谈。"..
			"这个东西毒得很，邪得很，他们苗族人自己胆子向来就大，也不敢提的。如今既然是五爷的吩咐，我不能不办。当年他老人家救过我全家性命。可要是办了，在下这条命也就搭进去了。我帮你查没有问题，不过我这里写了{三封信}，分别是给我的妻儿与家乡的老父母。只要他们平安，我也就没了牵挂。你只要到{各城市}找{驿站官员}，通过接送信任务，分别从{风之骑}，{山神庙}，{千宝库}这三处地方将信送达我家小所在地的驿官处，再回来找我就好。你去吧，我还需要做些准备，看来这些年在大理打下的关系都得用上咯。",
			"结束对话/#taskProcess_002_03:doTaskEntity()",
		}
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		end;
		return 0;
	end,
	
});


-- 与茶博士对话后的变量处理，任务进展为 2
taskProcess_002_03 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 2);
		
		-- 发放奖励
		PayMasterAward(2, 2);
	
	end,

});


-- 与驿官的对话
taskProcess_002_04 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_002)==2 then
			return 1;
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)==3 then
			return 2
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)==4 then
			return 3
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)==nil then
			return 4;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
	
		local nPassed_1 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
		local nPassed_2 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
		local nPassed_3 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);
		
		if nCondition==1 then
			SelectDescribe({"<npc>哦，原来是龙五的手下。这些年他帮着朝廷抵抗外敌，是立了大功之人。好吧，即刻从我这里将信分别从风之骑，山神庙和千宝库这三处地图送过去。",
							"结束对话/#taskProcess_002_05:doTaskEntity()"
							});
			return 1;
		elseif nCondition==2 then
		
			if nPassed_1>=1 and nPassed_2>=1 and nPassed_3>=1 then
				SelectDescribe({"<npc>恩，你已经将茶博士给家人的三封信都送到了，马上回去找他吧。珍重。",
								"结束对话/#taskProcess_002_10:doTaskEntity()"
								});
			else
				SelectDescribe({"<npc>你还没有把那三封信送到吗？加油吧！",
								"结束对话/OnTaskExit"
								});
			end;
			
			return 1;
		elseif nCondition==3 then
			SelectDescribe({"<npc>恩，你已经将茶博士给家人的三封信都送到了，马上回去找他吧。珍重。",
							"结束对话/OnTaskExit"
							});
			return 1;
		elseif nCondition==4 then
			SelectDescribe({"<npc>似乎你还没有召唤出同伴哦！",
							"结束对话/OnTaskExit"
							});
			return 1;			
		end;
		return 0;
	end,
		
});

-- 与驿官对话结束后，任务进展为 3
taskProcess_002_05 = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 3);
		
		-- 设置状态，开始监控信使任务的完成情况		
		SetTask(ID_PARTASK_PASSED, 
				SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_STATE, 1)
				);

		return 1;
	end,
});


-- 送完信与驿官的对话结束，改变任务进程为：4
taskProcess_002_10 = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 4);
		Msg2Player("你已经完成了送信任务，可以回去找茶博士了！");

		-- 发放奖励
		PayMasterAward(2, 3);
		
		-- 设置状态，结束监控信使任务的完成情况		
		SetTask(ID_PARTASK_PASSED, 
				SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_STATE, 0)
				);
				
		-- 清空之前的任务状态
		SetTask(ID_PARTASK_PASSED, 
				SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001, 0)
				);
		SetTask(ID_PARTASK_PASSED, 
				SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002, 0)
				);
		SetTask(ID_PARTASK_PASSED, 
				SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003, 0)
				);
		return 1;	
	end,
});



-- 风之骑任务的完成
taskProcess_002_06 = inherit(CProcess, {

	checkCondition = function(self)
		
		local nState = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_STATE);
		local nBit = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
		
		if nState==1 and nBit==0 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		local nPassed_1 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
		local nPassed_2 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
		local nPassed_3 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);

		if nCondition==1 then
			Msg2Player("你已经完成了茶博士所给你的风之骑送信任务！");
			
			-- 设置位数为 1，表示已经完成
			SetTask(ID_PARTASK_PASSED, 
					SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001, 1)
					);
			SyncTaskValue(ID_PARTASK_PASSED);

			local nPassed_1 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
			local nPassed_2 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
			local nPassed_3 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);
					
			if nPassed_1>=1 and nPassed_2>=1 and nPassed_3>=1 then
				Msg2Player("<color=yellow>你已经完成了所有的信使任务，请召唤出同伴向大理的驿官交任务吧！<color>");
			end;
			
		end;
	end,

});

-- 山神庙任务的完成
taskProcess_002_07 = inherit(CProcess, {

	checkCondition = function(self)
		local nState = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_STATE);
		local nBit = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
		
		if nState==1 and nBit==0 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)

		if nCondition==1 then
			Msg2Player("你已经完成了茶博士所给你的山神庙送信任务！");
			
			-- 设置位数为 1，表示已经完成
			SetTask(ID_PARTASK_PASSED, 
					SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002, 1)
					);
			SyncTaskValue(ID_PARTASK_PASSED);

			local nPassed_1 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
			local nPassed_2 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
			local nPassed_3 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);
			
			if nPassed_1>=1 and nPassed_2>=1 and nPassed_3>=1 then
				Msg2Player("<color=yellow>你已经完成了所有的信使任务，请召唤出同伴向大理的驿官交任务吧！<color>");
			end;
			
		end;
	end,

});


-- 千宝库任务的完成
taskProcess_002_08 = inherit(CProcess, {

	checkCondition = function(self)
		
		local nState = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_STATE);
		local nBit = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);
		
		if nState==1 and nBit==0 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
	
		if nCondition==1 then
			Msg2Player("你已经完成了茶博士所给你的千宝库送信任务！");
			
			-- 设置位数为 1，表示已经完成
			SetTask(ID_PARTASK_PASSED, 
					SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003, 1)
					);
					
			SyncTaskValue(ID_PARTASK_PASSED);

			local nPassed_1 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
			local nPassed_2 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
			local nPassed_3 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);

			if nPassed_1>=1 and nPassed_2>=1 and nPassed_3>=1 then
				Msg2Player("<color=yellow>你已经完成了所有的信使任务，请召唤出同伴向大理的驿官交任务吧！<color>");
			end;
					
		end;
	end,

});

-- 回到茶博士处的对话
taskProcess_002_11 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_002)==4 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		local strMain = {
			"<npc>哎，你回来拉。咳咳，那种毒蛇是城南高家镇高氏一族所养。我前几日冒死去打探，发现那里原本长得茂盛青翠的竹林都已枯黑僵死。毛竹生命力最为顽强，也抵不住蛇毒，看来他们蓄养的数量之大已经超过了我的想象。我从一个朋友那里得知，前镇子从高家买走秘火之眼的人与朝廷有很大的瓜葛。朝廷当然不会害自己的民众，那么这个隐藏在朝廷里的势力居心之叵测就可以见出端倪了。具体是谁买走的在下没有查到，不过有了这条线索，相信以五爷的手段，定能查得出来。你快走，快走！高氏已经知道有人在查探此事，城里最近多了许多装扮奇异的人，若不早早出城，恐怕有危险。今天夜里城门关闭前你必须离开！见到了五爷，一切就安全了。",
			"结束对话/#taskProcess_002_12:doTaskEntity()",
		}
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		end;
		return 0;
	end,

});


-- 与茶博士的对话结束，改变任务进程为：5
taskProcess_002_12 = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 5);
		Msg2Player("你已经完成了茶博士的任务，你可以回去见龙五了！");
		
		-- 发放奖励
		PayMasterAward(2, 4);
		
		return 1;	
	end,
});



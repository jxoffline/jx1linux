
-- ====================== 文件信息 ======================

-- 剑侠情缘online 情义江湖同伴剧情脚本实体处理文件 - 珠宝商人修炼篇
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

PARID_REWIND_KILLER_01 = 39;  -- 一品堂枪兵
PARID_REWIND_KILLER_02 = 40;  -- 一品堂弓兵
PARID_REWIND_KILLER_03 = 41;  -- 一品堂带刀将领
PARID_REWIND_KILLER_04 = 42;  -- 武士

GLBID_MASTER_KILLER_NUM = 830; -- 服务器全局变量，记录一品堂统帅的刷出数量


-- 开始任务时的对话
rewindProcess_003_01 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_003)==nil then  -- 没有带同伴
			return 0;
		elseif GetMasterTaskState(PARID_TASK_MASTER_003)<5 then -- 没有完成剧情篇的任务的
			return 4;
		elseif CheckRewindState(3)~=1 then -- 不符合日期判断条件
			return 5;
		elseif GetRewindTaskState(PARID_TASK_REWIND_003)==0 then -- 第一次开始做
			return 1;
		elseif GetRewindTaskState(PARID_TASK_REWIND_003)>=1 and GetRewindTaskState(PARID_TASK_REWIND_003)<5 then -- 已经开始做了 
			return 2;
		elseif GetRewindTaskState(PARID_TASK_REWIND_003)==5 then -- 已经完成了
			return 3;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 or nCondition==3 then
			SelectDescribe({"<npc>如果找到丁利，或许可以查出些端倪。你带着玉石去临安找宝器斋丁利，如果他不在，找他的弟弟丁磊也是一样的。",
							"接受任务/#rewindProcess_003_Accept:doTaskEntity()",
							"我再考虑一下/OnTaskExit",
							});
			return 1;
		elseif nCondition==2 then
			SelectDescribe({"<npc>你带着玉石去临安找宝器斋丁利，如果他不在，找他的弟弟丁磊也是一样的。",
							"完成任务/#rewindProcess_003_Finish:doTaskEntity()",
							"我还没有完成/OnTaskExit",
							});
			return 1;
		elseif nCondition==4 then
			SelectDescribe({"<npc>你还没有完成这个任务的剧情篇哦，不能进行修炼任务。",
							"结束对话/OnTaskExit"});
			return 1;
		elseif nCondition==5 then
			SelectDescribe({"<npc>修炼任务每个同伴每天只能做三次哦！",
							"结束对话/OnTaskExit"});
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
rewindProcess_003_Accept = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SetRewindTaskState(PARID_TASK_REWIND_003, 1);
		Msg2Player("你接到了珠宝商人的同伴修炼任务！");
		
		-- 发放奖励
		PayRewindAward(3, 1);
		
		-- 当符合条件后开始一次新的修炼任务的处理
		SetRewindStart(3);
			
		return 1;
	end,

});


-- 完成任务，发予奖励，任务进程为 5
rewindProcess_003_Finish = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_003)==4 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		
		if nCondition==1 then
			SelectDescribe({"<npc>嗯，现在将事情交到你手里我是越来越放心拉。近来我看着窗外的落叶，觉得时间过得很快。这么些年的拼杀，就像经历过了一场暴风雨，再回头，什么都是空的。年轻人，世界终归会是你们的，加油吧。",
							"结束对话/OnTaskExit"
							});
			SetRewindTaskState(PARID_TASK_REWIND_003, 5);
			
			-- 发放奖励
			PayRewindAward(3, 8);		
				
			-- 设置今天的完成标志
			SetRewindFinish(3);
			
			-- 清除与任务有关的状态
			SetPartnerTask(PARID_REWIND_KILLER_01, 0);
			SetPartnerTask(PARID_REWIND_KILLER_02, 0);
			SetPartnerTask(PARID_REWIND_KILLER_03, 0);
			SetPartnerTask(PARID_REWIND_KILLER_04, 0);
			
			return 1;
		else
			SelectDescribe({"<npc>我交给你的任务你还没有完成哦，加油吧。",
							"结束对话/OnTaskExit"
							});
			return 0;			
		end;
	end,	
	
});


-- 与丁磊的对话
rewindProcess_003_02 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_003)==1 then
			return 1;
		elseif GetRewindTaskState(PARID_TASK_REWIND_003)==2 then
			return 2;
		else
			return 0;
		end
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SelectDescribe({"<npc>这颗玉珠，这颗玉珠怎么会在你的手里？哦，是江南义军首领龙五的部下吗？这种玉质的珠子敝号三十多年来总共出售不过十颗。材料都是由我兄长丁利自天竺国引入，珍贵无比。具体的情况我也不清楚，你说死去侍郎的手臂里镶有一颗？我不知道，真的不知道。这方面的事情，兄长从不让我插手。原本兄长西行一年有余，算时季该回来了。可前几日紫霞岭上传来的消息，兄长让人给绑了肉票！紫霞岭什么时候太平过？朝廷大军都扫不平的顽贼，对方开口就是三千万两银子，这可怎么是好，可怎么是好啊。侠士愿意帮丁某这个忙吗？若兄长能平安回来，那玉珠的来龙去脉自然清清楚楚。",
							"是的，我愿意帮助你去紫霞岭救人/#rewindProcess_003_Select01:doTaskEntity()",
							"这个简单，我帮你出那三千万两的赎金吧/#rewindProcess_003_Select02:doTaskEntity()",
							"还是让我再想想/OnTaskExit"
							});
			return 1;
		elseif nCondition==2 then
			rewindProcess_003_SendMan:doTaskEntity();
			return 1;
		end;
		return 0;
	end,	
	
	
});


-- 选择第一个选项，将任务进展设成 2
rewindProcess_003_Select01 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SelectDescribe({"<npc>到了紫霞岭你至少要杀掉{五十个一品堂的枪兵}，{三十个一品堂弓兵}，{三位一品堂的带刀将领}，才能够进入到最终的{圆舞之阵}。那个地方藏着四名武艺绝伦的高手，你需要找出他们来，并且{杀掉至少两个}，凭着他们的首级，才可以带领我兄长逃出来。我的兄长被他们囚禁在圆舞之阵深处的一座小木屋里。",
						"我知道了/#rewindProcess_003_SendMan:doTaskEntity()"
						});
		SetRewindTaskState(PARID_TASK_REWIND_003, 2);
		
		-- 发放奖励
		PayRewindAward(3, 2);
		
		return 1;
	end,

});

-- 传送去任务地图的过程
rewindProcess_003_SendMan = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SelectDescribe({"<npc>你现在要去紫霞岭吗？去之前可要多准备些保命的东西哦！",
						"是的，请送我过去吧/#rewindProcess_003_Send:doTaskEntity()",
						"我再准备一下/OnTaskExit",
						});
		return 1;
	end,
});


rewindProcess_003_Send = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		NewWorld(515,1639,3162);
		SetFightState(1);
		return 1;
	end,
});


-- 选择第二个选项，交 3000W 两银子
rewindProcess_003_Select02 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SelectDescribe({"<npc>真要帮我们出三千万两银子吗？如果匪徒们收到这么大笔钱，给个天做胆他们也不敢再藏着我兄长了。",
						"是的，这点小意思你就拿去吧/#rewindProcess_003_Select02_01:doTaskEntity()",
						"我再考虑考虑/OnTaskExit"
						});
		return 1;
	end,
	
});


-- 选择交钱后检查是否带足够的钱，如果成功扣除的话直接将任务进程设为 4
rewindProcess_003_Select02_01 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		if Pay(30000000)==1 then
			SelectDescribe({"<npc>侠士啊侠士啊，谢谢你，多谢了。",
							"结束对话/OnTaskExit"
							});
			SetRewindTaskState(PARID_TASK_REWIND_003, 4);
		else
			SelectDescribe({"<npc>侠士啊，如果你一时半会拿不出三千万两银子的话那还是不必麻烦你了，我还是另找他人吧！",
							"结束对话/OnTaskExit"
							});	
		end;
		return 1;
	end;
});


-- 杀死一品堂枪兵时的处理
rewindProcess_003_Kill_01 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_REWIND_KILLER_01);
		
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 and nNum<50 then
		
			Msg2Player("你已经杀死了一个一品堂枪兵，你总共杀死了"..(nNum+1).."个！");
			SetPartnerTask(PARID_REWIND_KILLER_01, nNum+1);
			
			if nNum+1>= 50 then
				Msg2Player("你已经杀死了足够多的一品堂枪兵！");
			end;

			-- 发放奖励
			-- PayRewindAward(3, 3);
			
			AddOwnExp(CountDoubleMode(2000));
			AddPartnerExp(CountDoubleMode(500));
					
			return 1;
		end;
		return 0;
	end,

});


-- 杀死一品堂弓兵时的处理
rewindProcess_003_Kill_02 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_REWIND_KILLER_02);
		
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 and nNum<30 then
		
			Msg2Player("你已经杀死了一个一品堂弓兵，你总共杀死了"..(nNum+1).."个！");
			SetPartnerTask(PARID_REWIND_KILLER_02, nNum+1);
			
			if nNum+1>= 30 then
				Msg2Player("你已经杀死了足够多的一品堂弓兵！");
			end;

			-- 发放奖励
			-- PayRewindAward(3, 4);
			
			AddOwnExp(CountDoubleMode(2000));
			AddPartnerExp(CountDoubleMode(500));
			
			return 1;
		end;
		return 0;
	end,

});



-- 杀死一品堂带刀将领时的处理
rewindProcess_003_Kill_03 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_REWIND_KILLER_03);
		
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 and nNum<3 then
		
			Msg2Player("你已经杀死了一个一品堂带刀将领，你总共杀死了"..(nNum+1).."个！");
			SetPartnerTask(PARID_REWIND_KILLER_03, nNum+1);
			
			if nNum+1>= 3 then
				Msg2Player("你已经杀死了足够多的一品堂带刀将领！");
			end;

			-- 发放奖励
			-- PayRewindAward(3, 5);
			
			AddOwnExp(CountDoubleMode(10000));
			AddPartnerExp(CountDoubleMode(2000));			
			
			return 1;
		end;
		return 0;
	end,

});



-- 杀死顶级武士的处理
rewindProcess_003_Kill_04 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_REWIND_KILLER_04);
		
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 and nNum<2 then
		
			Msg2Player("你已经杀死了一个一品堂统帅，你总共杀死了"..(nNum+1).."个！");
			SetPartnerTask(PARID_REWIND_KILLER_04, nNum+1);
			
			if nNum+1>= 2 then
				Msg2Player("你已经杀死了足够多的一品堂统帅！");
			end;

			-- 发放奖励
			-- PayRewindAward(3, 6);

			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(2000));
					
			return 1;
		end;
		return 0;
	end,

});


-- 点击石柱的过程
rewindProcess_003_Call = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
	
		local killzxboss ={
			{1078,95,515,1729,2845,1,"影煞",1,"\\script\\task\\partner\\npc\\master_fight_03_004.lua","影煞"},
			{1078,95,515,1729,2845,1,"风刃",1,"\\script\\task\\partner\\npc\\master_fight_03_004.lua","风刃"},
			{1078,95,515,1729,2845,1,"枪鸦",1,"\\script\\task\\partner\\npc\\master_fight_03_004.lua","枪鸦"},
			{1078,95,515,1729,2845,1,"寒衣",1,"\\script\\task\\partner\\npc\\master_fight_03_004.lua","寒衣"},
		}
		
		if nCondition==1 then
		
			local i = random(1,4);
			local Tid = SubWorldID2Idx(killzxboss[i][3]);
			
			-- 如果刷出的一品堂统帅大于 6 个，则不会再刷了
			if GetGlbValue(GLBID_MASTER_KILLER_NUM)>=6 then return end;
			
			if (Tid >= 0 ) then
				TabValue4 = killzxboss[i][4] * 32;
				TabValue5 = killzxboss[i][5] * 32;
				local Partner_npcindex = AddNpc(killzxboss[i][1],killzxboss[i][2],Tid,TabValue4,TabValue5,killzxboss[i][6],killzxboss[i][7],killzxboss[i][8]);
				SetNpcScript(Partner_npcindex, killzxboss[i][9]);
				
				SetGlbValue(GLBID_MASTER_KILLER_NUM, GetGlbValue(GLBID_MASTER_KILLER_NUM) + 1);
				
			end

			Msg2Player("紫霞岭营寨中的统帅"..killzxboss[i][10].."将军被你激怒了，他已经出现。");
			return 1;
		end;
		return 0;
	end,

});


-- 与丁利的对话
rewindProcess_003_03 = inherit(CProcess, {

	checkCondition = function(self)
	
		local nNum_1 = GetPartnerTask(PARID_REWIND_KILLER_01);
		local nNum_2 = GetPartnerTask(PARID_REWIND_KILLER_02);
		local nNum_3 = GetPartnerTask(PARID_REWIND_KILLER_03);
		local nNum_4 = GetPartnerTask(PARID_REWIND_KILLER_04);
		
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 and nNum_1>=50 and nNum_2>=30 and nNum_3>=3 and nNum_4>=2 then
			return 1;
		elseif GetRewindTaskState(PARID_TASK_REWIND_003)==3 then
			return 2;
		else
			return 0;
		end
	end,
	
	taskEntity = function(self, nCondition)
	
		if nCondition==1 or nCondition==2 then
			SelectDescribe({"<npc>谢侠士救命之恩！",
							"离开紫霞岭/#rewindProcess_003_03_Send:doTaskEntity()",
							"结束对话/OnTaskExit"});
			SetRewindTaskState(PARID_TASK_REWIND_003, 3);
			return 1;
		else
			SelectDescribe({"<npc>哎，这些匪徒都是穷凶极恶之辈，侠士不要管我，自己先离开吧。",
							"离开紫霞岭/#rewindProcess_003_03_Send:doTaskEntity()",
							"结束对话/OnTaskExit"});
			return 0;
		end;
		return 0;
		
	end,

});


rewindProcess_003_03_Send = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		NewWorld(176,1376,3333);
		SetFightState(0);
	end,
});


-- 再次回来与丁磊的对话
rewindProcess_003_04 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_003)==3 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SelectDescribe({"<npc>感谢的话说再多也没有用。听弟弟讲，你拿了一颗玉珠来鉴别。东西你留下，不用多久，丁某一定帮你查出来龙去脉！我以性命做保。",
							"结束对话/OnTaskExit"
							});
			SetRewindTaskState(PARID_TASK_REWIND_003, 4);
			return 1;
		end;
		return 0;
	end,
	
});

-------------------------------------------------------------------------
-- FileName		:	partner_reward.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-14 14:43:15
-- Desc			:  	同伴修练任务脚本
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
IncludeLib("PARTNER")
IncludeLib("TITLE")  --增加称号头文件
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua") --增加辉煌之夜双倍活动
Include("\\script\\task\\newtask\\newtask_head.lua")
TabFile_Load( "\\settings\\task\\partner\\reward\\reward_allprize.txt" , "rewardprize");	 --获得同伴修练的表格
Include([[\script\tong\tong_award_head.lua]]);--帮会周目标贡献度by志山
Include ("\\script\\task\\partner\\master\\partner_master_main_05.lua");
TITLETIME = 30 * 24 * 60 * 60 * 18 * 36  --称号技能的执行时间

------------------------------------1:同伴修练任务中触发卷轴的脚本操作,RewardTaskId为传入的修练任务编号------------------------------0-----------------
function reward_startreward2(RewardTaskId,RewardTaskLevel) 

	local Uworld1236 = nt_getTask(1236) --传给程序计数器的任务变量，记录玩家当前杀死了多少只怪物。
	local Uworld1237 = nt_getTask(1237) --记录修练任务编号的任务变量
	local Uworld1238 = nt_getTask(1238) --记录修练任务进行日期的任务变量
	local Uworld1239 = nt_getTask(1239) --记录玩家奖励经验的任务变量
	local Uworld1240 = nt_getTask(1240) --记录玩家同伴经验奖励的任务变量
	local Uworld1241 = nt_getTask(1241) --记录玩家当天已经完成任务次数的任务变量
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	
	if ( Uworld1237 ~= 0 ) then
		Msg2Player("请先完成你已经接到的修练任务，再开启新的卷轴吧。")
		return 1
	elseif ( Uworld1238 == 0 ) then                                    --开始当天第一个修练任务
		Msg2Player("欢迎你开始今天的第一个修练任务，请加油。")
		nt_setTask(1238,NowDate)
	elseif ( Uworld1238 ~= 0 ) and ( Uworld1238 ~= NowDate ) then  --修练任务日期已经更改
		Msg2Player("你的修练任务已经进入全新的一天。过去所做的修练任务无论没做完或者没有交，都将被取消。")
		reward_cleartaskvalue()
		return 1
	elseif ( Uworld1238 == NowDate ) then                           --修练任务时期符合要求
		if ( Uworld1241 >= 10 ) then                                 --修练任务次数已经达到上限
			Msg2Player("您在今天所做的修练任务次数已经达到了上限，请及时交付任务给长歌门人。明日再继续努力，谢谢。")
			return 1
		end
	end		
	
	if  ( reward_beckon(RewardTaskLevel) ~= 10 ) then              	--判断玩家与同伴相关的操作,返回值为10时表示有错误
		return 1
	end
	reward_justdoit(RewardTaskId)                                   --启动卷轴上该任务
end


------------------------------------------------判断同伴是否符合当前接任务的要求-----------------------------------------------

function reward_beckon(RewardTaskLevel)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()   --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	
	if ( NpcCount == 0 ) then
		Msg2Player("你当前没有同伴，怎么做修练任务？去找长歌门门人，然后从他那里到云中镇，从剑皇弟子处领个同伴先。")
		return 1
	elseif ( partnerstate == 0 ) then
		Msg2Player("你只有召唤出了你的同伴，才能带领他进行同伴修练任务。")
		return 1
	elseif ( PARTNER_GetLevel(partnerindex)+10 < RewardTaskLevel ) then
		Msg2Player("对不起，这个任务对于你现在的同伴来说过于艰难了，请先做些低级的修练任务。")
		return 1
	elseif ( PARTNER_GetTaskValue(partnerindex, 2) == 1 ) then
		Msg2Player("你当前同伴还有修练任务没做完，请先带他做完相关任务，谢谢。")
		return 1
	elseif ( PARTNER_GetTaskValue(partnerindex, 2) == 0 ) then  --今天做过修练任务的次数不为0
		local j = 0
		for i =1,NpcCount do
			if (  PARTNER_GetTaskValue(i,2) ~= 0  ) then
				Msg2Player("你已经有同伴在做修练任务了，在没有交任务之前其他同伴是不能做修练任务的。谢谢。")
				j = j+1
			end 
		end
		
		if ( j == 0 ) then
			return 10
		else
			return 1
		end
		 
	else
		return 10
	end
	
end

------------------------------------------------启动卷轴任务-------------------------------------------------------

function reward_justdoit(RewardTaskId)    
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	
	if ( PARTNER_GetTaskValue(partnerindex, 2) == 0 )  or ( PARTNER_GetTaskValue(partnerindex, 2) == 2 ) then               
		 PARTNER_SetTaskValue(partnerindex,2,1)                          --设置当前所带同伴为修练任务启动状态      
	else       
		Msg2Player("你当前同伴还有修练任务没做完，谢谢。")
		return 1
	end
	
	nt_setTask(1237,RewardTaskId)                                   --将当前接到任务编号存储起来
	AddPlayerEvent(RewardTaskId)                                    --启动该卷轴针对的杀怪任务
	Msg2Player("您已经顺利启动了任务。请在今天内完成。")
	
end



-------------------------------------------2:杀怪任务完成时调用的脚本操作-----------------------------------------

function reward_killfinish(nPlayerIdx, nTaskID ,EventID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	
	local Uworld1236 = nt_getTask(1236) --传给程序计数器的任务变量，记录玩家当前杀死了多少只怪物。
	local Uworld1237 = nt_getTask(1237) --记录修练任务编号的任务变量
	local Uworld1238 = nt_getTask(1238) --记录修练任务进行日期的任务变量
	local Uworld1239 = nt_getTask(1239) --记录玩家奖励经验的任务变量
	local Uworld1240 = nt_getTask(1240) --记录玩家同伴经验奖励的任务变量
	local Uworld1241 = nt_getTask(1241) --记录玩家当天已经完成任务次数的任务变量
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	local NpcCount = PARTNER_Count()
	
	if ( Uworld1238 ~= NowDate ) then
		Msg2Player("对不起，你当前的修练任务已经超过了规定的日期，所有任务将被清除从今天算起。")
		reward_cleartaskvalue()
	elseif ( NpcCount == 0 ) then
		Msg2Player("对不起，你一个同伴都没有，还怎么继续修练任务呢？你的任务失败了。")
		reward_cleartaskvalue()
	else
		local w = 0
		for i =1,NpcCount do
			if ( PARTNER_GetTaskValue(i,2) == 1 ) then
				PARTNER_SetTaskValue(i,2,2)
				w = w+1
			end
		end
		
		if ( w == 0 ) then
			Msg2Player("对不起，你的同伴中没有谁在做修练任务，该任务已被取消了。")
			reward_cleartaskvalue()
		else
			nt_setTask(1241,Uworld1241+1)
			tongaward_partner_xiulian()--帮会周目标贡献度by志山
			if ( nt_getTask(1241) == nt_getTask(1246) ) then  --1246为允许玩家每天做修炼任务的次数
				Msg2Player("您当天的任务完成次数已达"..nt_getTask(1246).."次，请及时去长歌门人处兑换奖励。")
			end
			local prize_peopleexp  = tonumber( TabFile_GetCell( "rewardprize" ,EventID - 4 , 2 )) --获得玩家该得的经验                   
			local prize_partnerexp = tonumber( TabFile_GetCell( "rewardprize" ,EventID - 4 , 3 )) --获得同伴该得的经验
			local prize_parameter  = nt_getTask(1241)*0.1+1
			prize_partnerexp = prize_partnerexp*prize_parameter
			
			prize_peopleexp  = prize_peopleexp  * greatnight_huang_event(5)
			prize_partnerexp = prize_partnerexp * greatnight_huang_event(5)

			nt_setTask(1239,Uworld1239+prize_peopleexp)                                       --将玩家今次应获得经验加到变量中
			nt_setTask(1240,Uworld1240+prize_partnerexp)                                      --将同伴今次应获得经验加到变量中
			nt_setTask(1237,0)                                                                --将记录任务编号的变量清空
			Msg2Player("恭喜！您已经完成了当前的同伴修练任务。")
			local x = nt_getTask(1246) - nt_getTask(1241)
			Msg2Player("您今天还能完成"..x.."次同伴修练任务。")
		end
	end
	PlayerIndex = oldPlayerIndex
end


---------------------------------------------3：交同伴修练任务的脚本-----------------------------------------------

function reward_givetask2()
	local Uworld1236 = nt_getTask(1236) --传给程序计数器的任务变量，记录玩家当前杀死了多少只怪物。
	local Uworld1237 = nt_getTask(1237) --记录修练任务编号的任务变量
	local Uworld1238 = nt_getTask(1238) --记录修练任务进行日期的任务变量
	local Uworld1239 = nt_getTask(1239) --记录玩家奖励经验的任务变量
	local Uworld1240 = nt_getTask(1240) --记录玩家同伴经验奖励的任务变量
	local Uworld1241 = nt_getTask(1241) --记录玩家当天已经完成任务次数的任务变量
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	
	if ( Uworld1238 ~= NowDate ) then        --时间不符
		Msg2Player("对不起，你当前的修练任务已经超过了规定的日期，所有任务将被清除从今天算起。")
		reward_cleartaskvalue()
	elseif ( Uworld1241 == 0 ) then          --次数为空
		Msg2Player("你今天还没有完成修练任务，请继续努力。")
	elseif ( PARTNER_GetTaskValue(partnerindex, 2) == 0 ) then
		Msg2Player("这个同伴并不是你带着去做修练任务的那个同伴，请将正确同伴召唤出来。")  
	elseif ( NpcCount == 0 ) then
		Msg2Player("你当前没有同伴，领取不了奖励哦。")
	elseif ( partnerstate == 0 ) then
		Msg2Player("你当前没有召唤出同伴来，领取不了奖励哦。") 
	elseif ( nt_getTask(1239) ~= 0 ) and ( nt_getTask(1240) ~= 0 ) then
		if ( PARTNER_GetTaskValue(partnerindex, 2) ~= 0 ) then
			PARTNER_AddExp(partnerindex,Uworld1240 ,1) 
			AddOwnExp(Uworld1239)
			nt_setTask(1239,0)
			nt_setTask(1240,0) 
			Msg2Player("您和您的同伴已经获得了今天内完成的同伴修练任务的奖励。")
		else
			Msg2Player("对不起，您带的这位同伴并没有接同伴修练任务。")
		end

		if ( PARTNER_GetTaskValue(partnerindex, 2) == 2 ) and ( nt_getTask(1237) == 0 ) then  --当玩家为任务开始状态，而1237又已被任务完成状态的函数清空时
			if ( nt_getTask(1241) == 10 ) then
				local Uworld1242 = nt_getTask(1242)
				nt_setTask(1242,Uworld1242+1)
				taskProcess_005_AddTimes:doTaskEntity();
			end
			PARTNER_SetTaskValue(partnerindex,2,0)
			if ( nt_getTask(1242) == 30 ) and ( GetBit(GetTask(1269),4) == 0 ) then
				nt_setTask(1245,5)
				nt_setTask(1246,20)
				Msg2Player("恭喜你获得了龙神之剑的称号！每天修练任务允许完成的次数增加到20次！")
				Title_AddTitle(80, 1, TITLETIME);
				Title_ActiveTitle( 80 );
				nt_setTask(1269,SetBit(GetTask(1269),4,1)) 
				reward_cleartaskvalue()
			end
		end
	else
		Msg2Player("走开走开，不要捣乱！") 
	end

end

--------------------------------------------清除所有过时的任务变量数值---------------------------------------------
function reward_cleartaskvalue()
	nt_setTask(1237,0)
	nt_setTask(1238,0)
	nt_setTask(1239,0)
	nt_setTask(1240,0)
	nt_setTask(1241,0)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	if ( NpcCount ~= 0 ) then
		for i=1,NpcCount do
			if ( PARTNER_GetTaskValue(i,2) ~= 0 ) then
				PARTNER_SetTaskValue(i,2,0) 
			end
		end
	end
end


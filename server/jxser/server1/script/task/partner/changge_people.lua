-------------------------------------------------------------------------
-- FileName		:	changge_people.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-04 14:17:15
-- Desc			:  	各大城市长歌门门人
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\partner\\partner_head.lua") --包含了图象调用
Include("\\script\\task\\partner\\reward\\partner_reward.lua") --包含了交修炼任务的脚本
Include("\\script\\task\\partner\\reward\\partner_reward2.lua") 
Include("\\script\\task\\partner\\reward\\partner_reward3.lua") 
Include("\\script\\global\\titlefuncs.lua")  --包含更改称号的脚本
Include("\\script\\task\\partner\\train\\partner_changgejindi.lua")

function main()

	Describe(DescLink_ChangGeMen.."：江湖十年风吹泪，长笑当歌苦做甜。当年柴门主侠义散财，广纳天下豪杰，我长歌门是何等的盛事。后来柴门主被金贼残害，我门中人也从无一日放弃天下苍生为己任的信条。如今长歌再起，就是要还天下人一个公道！",7,
		"领取同伴的教育任务/Getpartner_education",
		"同伴修练任务/Getpartner_allpractice",
		"同伴特殊任务/Getpartner_especial",
		"同伴雇佣/Getpartner_paymoney",
		"更改玩家称号/change_title",
		"前往长歌门禁地/Goto_jindichangge",
		"我想去云中古镇办些事/Goto_townyunzhong",
		"没什么，我只是来看看少侠你/no")
end

function Getpartner_allpractice()
	Describe(DescLink_ChangGeMen.."：你要做什么与同伴修练相关的事情？",5,
		"我想购买同伴的修练任务/Getpartner_practice",
		"我想交同伴修练任务/Getpartner_goonpractice",
		"我是来取消同伴修练任务的/Getpartner_finishpractice",
		"我想进一步了解修练任务/Getpartner_knowpractice",
		"没什么，我只是来看看少侠你/no")	
end

function Getpartner_goonpractice()
	if ( nt_getTask(1245) >=0 and nt_getTask(1245) <= 3 ) then
		reward_givetask()
	elseif ( nt_getTask(1245) == 4 ) then
		reward_givetask2()
	elseif ( nt_getTask(1245) == 5 ) then
		reward_givetask3()
	end
end

function Getpartner_knowpractice()
	Describe(DescLink_ChangGeMen.."：<color=yellow>同伴修练任务是长歌门为了替武林铲除危害而发布的一系列任务。当你购买了修练卷轴后就可以触发去相应地方杀怪的任务。杀怪卷轴目前分为<color=red>50只，100只，和150只<color>三种。开始的时候你只能购买到杀<color=red>50<color>只怪的卷轴，而且每天最多完成<color=red>5<color>次。完成以后你与你的同伴将会得到<color=red>丰厚的回报<color>。同时，随着你完成任务的<color=red>次数<color>越多，长歌门将会给予你<color=red>“青龙武士”，“青龙剑煞”<color>的称号。随着这些资格的提升，你将可以购买杀死更多怪物的卷轴，同时每天的完成次数也将更多。对应的，得到的回报也将越来越大哦。<color>",2,"回上一层/Getpartner_allpractice","离开这里/no")
end

function Getpartner_education()    --我想做领取同伴的教育任务
	Describe(DescLink_ChangGeMen.."：好的，如果你想做的话，那么到了云中以后找剑皇的徒弟对话，他会给你指引的。",2,
		"好的，我已经清楚了。让我去云中镇吧。/Goto_townyunzhong",
		"容我再想想/no")
end


function Getpartner_paymoney()
	Describe(DescLink_ChangGeMen.."：对不起，大批精锐的武士尚在训练中，目前没有可以供你雇佣的同伴，请以后再来。谢谢。",1,"结束对话/no")
end

function Getpartner_especial()
	Describe(DescLink_ChangGeMen.."：嘿嘿，那些剑术通神的同伴可不是轻易就可获得。你需要再历练历练，迟些再来吧。",1,"结束对话/no")
end

function Goto_townyunzhong()
	local i = random(8);
	local pos = {{1682,3290},{1694,3306},{1669,3320},{1655,3332},{1650,3340}};
	local j = random(5);
	if (random(2) == 1) then
		i = -i;
	end
	NewWorld(512,pos[j][1] + i,pos[j][2])   --去云中镇？？？
	--blackScreen();
end

function blackScreen()
	if(GetGameTime() <= 1800) then
		Say("官方提示： 如果你的云中道地图是黑屏，请去官网<enter><color=yellow>http://jx.kingsoft.com/zt1/2ye/2005/09/08/64217.shtml<color>下载第三资料片体服资源包并更新。如果对同伴系统有任何意见和想法，请到<color=yellow>bbs.jx.kingsoft.com<color>发表。",0);
	end
end

function Getpartner_practice()
	local Name = GetName()
	Describe(DescLink_ChangGeMen.."："..Name.."大人，你想购买哪种修练卷轴呢？",4,
	"杀怪50只/practice_kill50",
	"杀怪100只/practice_kill100",
	"杀怪150只/practice_kill150",
	"迟些再来/no")
end


function practice_kill50()
	if ( SubWorldIdx2ID( SubWorld ) == 1 ) then
		Sale(110)
	elseif ( SubWorldIdx2ID( SubWorld ) == 11 ) then
		Sale(113)
	elseif ( SubWorldIdx2ID( SubWorld ) == 37 ) then
		Sale(116)
	elseif ( SubWorldIdx2ID( SubWorld ) == 78 ) then
		Sale(119)
	elseif ( SubWorldIdx2ID( SubWorld ) == 80 ) then
		Sale(122)
	elseif ( SubWorldIdx2ID( SubWorld ) == 162 ) then
		Sale(125)
	elseif ( SubWorldIdx2ID( SubWorld ) == 176 ) then
		Sale(128)
	end
end

function practice_kill100()
	if ( nt_getTask(1245) < 2 ) then
		Describe(DescLink_ChangGeMen.."：对不起，您目前的称号还没有达到<color=red>青龙武士<color>的境界，无法购买杀<color=red>100<color>只怪的卷轴。要得到青龙武士的称呼，必须至少在<color=red>5<color>天内完成每天所有的修练任务。每天所有的修练任务次数为<color=red>5<color>次。",2,"回上一层/Getpartner_practice","结束对话/no")
	elseif ( nt_getTask(1245) >= 2 ) then
		if ( SubWorldIdx2ID( SubWorld ) == 1 ) then
			Sale(111)
		elseif ( SubWorldIdx2ID( SubWorld ) == 11 ) then
			Sale(114)
		elseif ( SubWorldIdx2ID( SubWorld ) == 37 ) then
			Sale(117)
		elseif ( SubWorldIdx2ID( SubWorld ) == 78 ) then
			Sale(120)
		elseif ( SubWorldIdx2ID( SubWorld ) == 80 ) then
			Sale(123)
		elseif ( SubWorldIdx2ID( SubWorld ) == 162 ) then
			Sale(126)
		elseif ( SubWorldIdx2ID( SubWorld ) == 176 ) then
			Sale(129)
		end
	end
end

function practice_kill150()
	if ( nt_getTask(1245) < 3 ) then
		Describe(DescLink_ChangGeMen.."：对不起，您目前的称号还没有达到<color=red>青龙剑煞<color>的境界，无法购买杀<color=red>150<color>只怪的卷轴。要得到青龙剑煞的称呼，必须至少在<color=red>20<color>天内完成每天所有的修练任务。每天所有的修练任务次数为<color=red>5<color>次。",2,"回上一层/Getpartner_practice","结束对话/no")
	elseif ( nt_getTask(1245) >= 3 ) then
		if ( SubWorldIdx2ID( SubWorld ) == 1 ) then
			Sale(112)
		elseif ( SubWorldIdx2ID( SubWorld ) == 11 ) then
			Sale(115)
		elseif ( SubWorldIdx2ID( SubWorld ) == 37 ) then
			Sale(118)
		elseif ( SubWorldIdx2ID( SubWorld ) == 78 ) then
			Sale(121)
		elseif ( SubWorldIdx2ID( SubWorld ) == 80 ) then
			Sale(124)
		elseif ( SubWorldIdx2ID( SubWorld ) == 162 ) then
			Sale(127)
		elseif ( SubWorldIdx2ID( SubWorld ) == 176 ) then
			Sale(130)
		end
	end
end

function Getpartner_finishpractice()
	local Uworld1237 = nt_getTask(1237)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	
	if ( NpcCount == 0 ) then
		Msg2Player("你没有带同伴，怎么取消同伴任务啊？")
	end
	
	if ( Uworld1237 ~= 0 ) then
		if ( PARTNER_GetTaskValue(partnerindex, 2) ~= 0  )  then
			RemovePlayerEvent(Uworld1237) --取消该事件
			nt_setTask(1237,0)
			PARTNER_SetTaskValue(partnerindex,2,0) 
			Msg2Player("你已经取消了当前的修练任务。")
		elseif ( PARTNER_GetTaskValue(partnerindex, 2) == 0  ) then
			local j = 0
			for i=1, NpcCount do
				if (PARTNER_GetTaskValue(i,2) ~= 0 ) then
					Msg2Player("你带着做修练任务的是第"..i.."号同伴。")
					j = j+1
				end
			end
			if ( j == 0 ) then
				RemovePlayerEvent(Uworld1237) --取消该事件
				nt_setTask(1237,0)
				nt_setTask(1244,0)
				Msg2Player("你已经取消了当前的修练任务。")
			end
		end
	else
		Describe(DescLink_ChangGeMen.."：你没有开始修练任务，怎么取消呢？",1,"结束对话/no")
	end
end

function no()
end
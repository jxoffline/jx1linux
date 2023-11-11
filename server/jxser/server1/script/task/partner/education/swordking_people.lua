-------------------------------------------------------------------------
-- FileName		:	sworldking_peolle.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-04 16:17:15
-- Desc			:  	剑皇楚欺天的弟子
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\partner\\partner_head.lua") --包含了图象调用
Include("\\script\\task\\partner\\partner_problem.lua") --调用 nt_getTask 同步变量到客户端的类
IncludeLib("PARTNER")
IncludeLib("RELAYLADDER");	--排行榜

function partner_finishanswer(nChange)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	if (partnerindex <= 0) then
		Msg2Player("你当前还没有同伴，请选择你需要的同伴。")
		partner_givetodo()
	elseif (partnerstate ~= 1) then
		Msg2Player("请将同伴召唤出来，我才能够给你奖励。")
	elseif ( PARTNER_GetLevel(partnerindex) < 10) then
		if ( nChange == 1 ) then
			PARTNER_AddExp(partnerindex ,100) --回答对问题且同伴等级<10级时给加100经验。
			Msg2Player("恭喜你的同伴获得了100点经验。")
		else
			Msg2Player("对不起，您回答正确的问题数量没有达到我的要求。请再来一次。")
		end
	else
		Msg2Player("经验奖励只在同伴等级小于10级时才给哦。")
	end
end

function partner_jianhuangdz_fajiang1(nChange)
	if ( nChange == 1 ) then
		Msg2Player("请再次与剑皇弟子对话领取奖励。")
	end
end

partner_keeponproblem = {
[1] = partner_finishanswer,
[2] = partner_jianhuangdz_fajiang1,
}

function main()
	local PlayerName = GetName()
	local Uworld1226 = nt_getTask(1226) --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227) --同伴教育任务长歌门人任务变量
	local Uworld1228 = nt_getTask(1228) --同伴教育任务长歌门人任务变量
	local Uworld1229 = nt_getTask(1228) --同伴教育任务长歌门人任务变量
	local Uworld1230 = nt_getTask(1230) --同伴教育任务长歌门人任务变量
	local Uworld1231 = nt_getTask(1231) --同伴教育任务长歌门人任务变量
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_JianHuangDiZi.."：啊，你果然做完了所有任务。好吧，领取你的奖励后再与我对话。",2,
		"领取奖励/jianhuangdizi_prize1",
		"取消任务/partner_killedu")
	elseif ( Uworld1226 == 20 ) and ( GetBit(GetTask(1232),20) == 0 ) then
		Describe(DescLink_JianHuangDiZi.."：好吧，我最后告诉你一些高阶的操作技巧，仔细看着，等下我会问你几个问题。：<enter>"
		.."<color=yellow><color=red>你能获得多少位同伴，每个同伴可以学多少个附加技能：<color> 一个玩家能获得五个同伴，但一次只能召唤出一个。同伴能学附加技能的个数会随着他的等级增加而增加，总共16个。<enter>"
		.."<color=red>多个同伴的切换：<color> 你首先要在在同伴的属性界面的上方点选你想切换到的同伴的标签，然后再点选界面下方的“选择同伴”按钮就可以了。当然你也可以直接在同伴的快捷栏里找到“同伴选择”按钮，左键点击后会出现你拥有同伴的名字，你只要点击你想要切换到的同伴的名字就可以了。注意：切换同伴操作不能连续进行，两次操作之间至少间隔半分钟。<enter>"
		.."<color=red>替换附加技能：<color>要想替换附加技能时你只要打开同伴技能界面，点遗忘按钮后选择希望删除的技能，这时系统会向你确认是否真的要遗忘该技能，点确定便可把该技能遗忘掉，之后你便可学习新技能了。<enter>"
		.."<color=red>同伴回复生命：<color>如果你想让同伴的生命回复，把他召回就可以了，处于非召唤出状态的同伴是可以自动回复生命的。<enter><color>"
		.."好啦，准备好了来回答对我三道问题吧。",3,
		"开始回答吧/jianhuangdizi_problem",
		"让我做下准备工作吧/no",
		"取消任务/partner_killedu")  
	elseif ( Uworld1226 == 20  and  GetBit(GetTask(1232),20) == 1 ) then
		local NpcCount = PARTNER_Count()
		if ( NpcCount >= 5 ) then
			Describe(DescLink_JianHuangDiZi.."：根据任务完成的时间，我将会给予你一个资质更好的同伴。不过你现在的同伴数量已经满了。如果你不需要同伴的话我将给你发放奖励，不过不再给予你同伴。如果你需要一位新的同伴，那么请点击'稍后再来'选项，先解散一位同伴。",2,"我不需要新同伴了，发放奖励吧/partner_goontofinishtask","稍后再来/no")
		else
			Describe(DescLink_JianHuangDiZi.."：根据任务完成的时间，我将会给予你一个资质更好的同伴。如果你不需要同伴的话我将给你发放奖励，不过不再给予你同伴。如果你需要一位新的同伴，那么请点击'我需要新同伴'选项，我将给予你一位新同伴。",4,
			"我不需要新同伴了，发放奖励吧/partner_goontofinishtask",
			"我需要新同伴/partner_goontogivepartner",
			"稍后再来/no",
			"取消任务/partner_killedu")
		end
	elseif ( Uworld1226 == 0 ) then 
		Describe(DescLink_JianHuangDiZi.."：欢迎你来到云中镇。我受师傅所托在此训练大批精锐武士，就是为了能让您在闯荡江湖时有一位值得信赖的同伴。那么好吧，让我们来看看你需要什么帮助。",5,
		"是的，我需要你为我提供一位同伴。/partner_givetodo",
		"我带了个同伴，想让他(她)做教育任务/partner_havetodo",
		"我想先看看教育任务将涉及的内容/partner_question",         --综合了所有npc可能问的问题？？？？？？
		"我要离开云中镇/partner_goback",
		"这镇子美不胜收，我想先在里面转转/no")
	else
		Describe(DescLink_JianHuangDiZi.."：师傅早看透江湖的风雨，避居世外了。我也不知道他老人家现在哪里。如果哪日你有幸能遇到他，或许会有意想不到的收获吧。好了，说正经的吧，镇子里有几位隐居的武林人物，你如果想训练你的同伴，就去找他们帮忙。这些人分别是<color=red>卢青、黑白双煞、唐影、秋衣水<color>。记得你正在训练中的同伴是谁，那么在他<color=red>完成<color>整个教育任务之前，你的其他同伴是<color=red>不能<color>开始训练的。做事只有专心一致，才能做到最好。不过如果你<color=red>不愿<color>再让这位同伴受训的话，你可以选择<color=red>取消<color>同伴教育任务。那么这位同伴今后也<color=red>不能<color>再受到教育任务的训练了。同时你可以<color=red>立即<color>开始用教育任务训练<color=red>另一位同伴<color>。<enter>"
		.."<color=red>真正资质最好的同伴，大概只有我师傅剑皇楚欺天才能训练出来吧。你如果有幸遇到他，千万别轻易错过！<color>",4,
		"是的，我要取消当前同伴的教育任务/partner_killedu",
		"我想先看看教育任务将涉及的内容/partner_question",
		"我要离开云中镇/partner_goback",
		"结束对话/no")
	end
end

function partner_goontofinishtask()
	local PlayerName = GetName()
	nt_setTask(1249,1)  --设为1表示不再需要同伴
	Describe(DescLink_JianHuangDiZi.."："..PlayerName.."，你已经完成了在我这里所有的学习。可以出师了！领取完奖励之后就离开云中吧，不要忘记这里的朋友们，有空常回来走走吧。对了，你此去任重道远，可以找我的师兄龙五接一些<color=red>同伴相关<color>的剧情任务，他现在内外交困，肩上的担子太重了。近来江湖上有一股<color=red>神秘势力<color>正暗暗行动，我心中有种不祥的感觉。希望你能挽狂澜于即倒吧，一切珍重！",2,
	"领取奖励/jianhuangdizi_prize2",
	"稍后再来/no")
end

function partner_goontogivepartner()
	local PlayerName = GetName()
	local partnercount = PARTNER_Count()                   --获取当前同伴数量
	nt_setTask(1249,2)  --设为2表示需要同伴
	if ( partnercount >= 5 ) then
		Describe(DescLink_JianHuangDiZi.."：你现在同伴数量已满，请先解散一位同伴再与我对话。",1,"结束对话/no")
	else
		Describe(DescLink_JianHuangDiZi.."："..PlayerName.."，你已经完成了在我这里所有的学习。可以出师了！领取完奖励之后就离开云中吧，不要忘记这里的朋友们，有空常回来走走吧。对了，你此去任重道远，可以找我的师兄龙五接一些<color=red>同伴相关<color>的剧情任务，他现在内外交困，肩上的担子太重了。近来江湖上有一股<color=red>神秘势力<color>正暗暗行动，我心中有种不祥的感觉。希望你能挽狂澜于即倒吧，一切珍重！此次下山，尽可去找义军首领龙五，他与我师傅有很深的渊源，也许有用得上你的地方。",2,
		"领取奖励/jianhuangdizi_prize2",
		"稍后再来/no")
	end
end

function jianhuangdizi_prize1()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,2000,1)                   			--给当前同伴增加经验，+2100
		nt_setTask(1226,20)
	end
end

function jianhuangdizi_problem()
	 partner_edu(3,1,100,3,1232,20,2)
end

function jianhuangdizi_prize2()
	local Uworld1234 = GetGameTime() - nt_getTask(1234)
	if ( nt_getTask(1248) == 0 ) then
		nt_setTask(1248,Uworld1234)
	elseif ( nt_getTask(1248) > Uworld1234 ) then
		nt_setTask(1248,Uworld1234)
	end
	Msg2Player("你这次完成教育任务使用了"..Uworld1234.."秒。")
	Ladder_NewLadder(10188, GetName(),-1 * Uworld1234,1);
	
	if ( nt_getTask(1249) == 2 ) then
		local w=random(1,4)
		local j=random(1,5)
		if  ( Uworld1234 >= 900 ) then
			if ( j == 1 ) then
				local partneridex = PARTNER_AddFightPartner(1,4,w,2)
				PARTNER_CallOutCurPartner(1)
				Msg2Player("恭喜你获得了一个同伴。")
			elseif ( j == 2 ) then
				local partneridex = PARTNER_AddFightPartner(2,2,w,2)
				PARTNER_CallOutCurPartner(1)
				Msg2Player("恭喜你获得了一个同伴。")
			elseif ( j == 3 ) then
				local partneridex = PARTNER_AddFightPartner(3,3,w,2)
				PARTNER_CallOutCurPartner(1)
				Msg2Player("恭喜你获得了一个同伴。")
			elseif ( j == 4 ) then
				local partneridex = PARTNER_AddFightPartner(4,1,w,2)
				PARTNER_CallOutCurPartner(1)
				Msg2Player("恭喜你获得了一个同伴。")
			else
				local partneridex = PARTNER_AddFightPartner(5,0,w,2)
				PARTNER_CallOutCurPartner(1)
				Msg2Player("恭喜你获得了一个同伴。")
			end
		elseif ( Uworld1234 >= 0 ) and ( Uworld1234 < 900 ) then
			local attribute = genRandNumArray(30,6,1,7) 
			if ( j == 1 ) then
				local partneridex = PARTNER_AddFightPartner(1,4,w,attribute[1],attribute[2],attribute[3],attribute[4],attribute[5],attribute[6])
				PARTNER_CallOutCurPartner(1)
				Msg2Player("恭喜你获得了一个同伴。")
			elseif ( j == 2 ) then
				local partneridex = PARTNER_AddFightPartner(2,2,w,attribute[1],attribute[2],attribute[3],attribute[4],attribute[5],attribute[6])
				PARTNER_CallOutCurPartner(1)
				Msg2Player("恭喜你获得了一个同伴。")
			elseif ( j == 3 ) then
				local partneridex = PARTNER_AddFightPartner(3,3,w,attribute[1],attribute[2],attribute[3],attribute[4],attribute[5],attribute[6])
				PARTNER_CallOutCurPartner(1)
				Msg2Player("恭喜你获得了一个同伴。")
			elseif ( j == 4 ) then
				local partneridex = PARTNER_AddFightPartner(4,1,w,attribute[1],attribute[2],attribute[3],attribute[4],attribute[5],attribute[6])
				PARTNER_CallOutCurPartner(1)
				Msg2Player("恭喜你获得了一个同伴。")
			else
				local partneridex = PARTNER_AddFightPartner(5,0,w,attribute[1],attribute[2],attribute[3],attribute[4],attribute[5],attribute[6])
				PARTNER_CallOutCurPartner(1)
				Msg2Player("恭喜你获得了一个同伴。")
			end
		end
	end
		
		local partnerindex,partnerstate = PARTNER_GetCurPartner()      --获得召唤出同伴的index,同伴状态为召出或为不召出
		local partner_addexp = floor(15000*(900/Uworld1234))
		PARTNER_SetTaskValue(partnerindex, 1, 2 );                            --将当前同伴设置为任务完成状态
		PARTNER_AddExp(partnerindex,partner_addexp,1)                   	  --给当前同伴增加经验
		
		nt_setTask(1226,0) --同伴教育任务剑皇弟子任务变量
		nt_setTask(1227,0) --同伴教育任务卢青变量
		nt_setTask(1228,0) --同伴教育任务唐影变量
		nt_setTask(1229,0) --同伴教育任务白煞变量
		nt_setTask(1230,0) --同伴教育任务黑煞变量
		nt_setTask(1231,0) --同伴教育任务秋衣水变量
		nt_setTask(1232,0) --同伴教育任务卢青统一字节位开关
		nt_setTask(1233,0) --同伴教育问答次数记数器
		nt_setTask(1234,0) --同伴教育任务计时器
		nt_setTask(1235,0) --同伴教育黑煞处问题答案
		nt_setTask(1243,0) --记录打木桩次数
		nt_setTask(1247,0) --记录教育任务中黑煞处沙袋击打次数
		nt_setTask(1249,0) --已经领过奖励了
		
		Msg2Player("恭喜你完成了同伴教育任务，前路珍重，江湖再见！你去找找义军首领龙五吧，他或许有用得着你的地方。")
end

-------------------------------------------------------同伴获得-----------------------------------------------

function partner_givetodo()                                --提供一个同伴
	local partnercount = PARTNER_Count()                   --获取当前同伴数量
	if ( partnercount == -1 ) then
		Msg2player("功能出现异常，请与GM联系。")
	elseif ( partnercount == 5 ) then
		Describe(DescLink_JianHuangDiZi.."：你已经拥有了最大数量的同伴，就不要再贪心了。",1,
		"结束对话/no")
	else
		Describe(DescLink_JianHuangDiZi.."你可以在同伴的快捷栏里找到<color=red>“召唤同伴”<color>按钮，左键单击该按钮就可以了。<color=red>再次<color>点击“召唤同伴”按钮就能<color=red>收回同伴了<color>",6,
		"获得金系同伴/partner_getgold",
		"获得木系同伴/partner_getwood",
		"获得水系同伴/partner_getwater",
		"获得火系同伴/partner_getfire",
		"获得土系同伴/partner_getdust",
		"结束对话/no")
	end
end

function partner_getgold()
	Describe(DescLink_JianHuangDiZi.."你要选择哪种性格的金系同伴",5,
		"获得勇猛型同伴/partner_getgold1",
		"获得卫主型同伴/partner_getgold2",
		"获得流氓型同伴/partner_getgold3",
		"获得懦弱型同伴/partner_getgold4",
		"结束对话/no")
end

function partner_getgold1()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(5,0,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位金系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(5,0,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位金系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getgold2()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(5,0,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位金系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(5,0,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位金系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getgold3()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(5,0,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位金系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(5,0,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位金系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getgold4()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(5,0,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位金系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(5,0,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位金系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getwood()
	Describe(DescLink_JianHuangDiZi.."你要选择哪种性格的木系同伴",5,
		"获得勇猛型同伴/partner_getwood1",
		"获得卫主型同伴/partner_getwood2",
		"获得流氓型同伴/partner_getwood3",
		"获得懦弱型同伴/partner_getwood4",
		"结束对话/no")
end		

function partner_getwood1()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(4,1,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位木系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(4,1,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位木系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getwood2()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(4,1,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位木系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(4,1,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位木系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getwood3()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(4,1,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位木系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(4,1,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位木系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getwood4()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(4,1,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位木系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(4,1,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位木系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getwater()
	Describe(DescLink_JianHuangDiZi.."你要选择哪种性格的水系同伴",5,
		"获得勇猛型同伴/partner_getwate1",
		"获得卫主型同伴/partner_getwate2",
		"获得流氓型同伴/partner_getwate3",
		"获得懦弱型同伴/partner_getwate4",
		"结束对话/no")
end
		
function partner_getwate1()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(2,2,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位水系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(2,2,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位水系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getwate2()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(2,2,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位水系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(2,2,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位水系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getwate3()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(2,2,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位水系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(2,2,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位水系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getwate4()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(2,2,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位水系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(2,2,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位水系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getfire()
	Describe(DescLink_JianHuangDiZi.."你要选择哪种性格的火系同伴",5,
		"获得勇猛型同伴/partner_getfire1",
		"获得卫主型同伴/partner_getfire2",
		"获得流氓型同伴/partner_getfire3",
		"获得懦弱型同伴/partner_getfire4",
		"结束对话/no")
end

function partner_getfire1()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(3,3,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位火系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(3,3,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位火系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getfire2()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(3,3,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位火系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(3,3,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位火系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getfire3()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(3,3,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位火系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(3,3,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位火系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getfire4()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(3,3,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位火系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(3,3,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位火系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getdust()
	Describe(DescLink_JianHuangDiZi.."你要选择哪种性格的土系同伴",5,
		"获得勇猛型同伴/partner_getdust1",
		"获得卫主型同伴/partner_getdust2",
		"获得流氓型同伴/partner_getdust3",
		"获得懦弱型同伴/partner_getdust4",
		"结束对话/no")
end

function partner_getdust1()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(1,4,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位土系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(1,4,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位土系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getdust2()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(1,4,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位土系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(1,4,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位土系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getdust3()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(1,4,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位土系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(1,4,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位土系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end

function partner_getdust4()
	local NowDate = tonumber(date("%y%m%d")) --获得当前日期
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(1,4,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位土系同伴。")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(1,4,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("恭喜你获得了一位土系同伴。")
	else
		Msg2Player("对不起，您今天已经领取过同伴了，请明日再来")
	end
end


-----------------------------------------------------同伴教育任务开始---------------------------------------------

function partner_havetodo()                                     --已经带了一个同伴
	local Uworld1226 = nt_getTask(1226)                         --同伴教育任务长歌门人任务变量
	local partnerindex,partnerstate = PARTNER_GetCurPartner()   --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	
	if ( NpcCount == 0 ) then                                 	--玩家当前一个同伴都没有
		Describe(DescLink_JianHuangDiZi.."：朋友，你一个同伴都没有怎么做任务呀？先选择领取一个同伴选项吧。",1,"结束对话/no")
	elseif ( partnerstate == 0 ) then    					 	 --同伴为未召出状态
		Describe(DescLink_JianHuangDiZi.."：朋友，你当前没有召唤任何同伴，怎么带他（她）做任务呀？",1,"哦，可能是我弄错了/no")
	elseif ( partnerindex>= 1 and partnerindex <= 5 ) then
		local partner_finishtask = PARTNER_GetTaskValue(partnerindex,1) --获得当前召唤出来的同伴的教育任务进行状态
		if ( partner_finishtask == 1 ) then 
			Describe(DescLink_JianHuangDiZi.."：你这个同伴已经在做同伴教育任务了，直接打开F12任务面板看看他(她)该做什么任务了吧。",1,"好的好的，明白了/no")
		elseif ( partner_finishtask == 2 ) then 
			Describe(DescLink_JianHuangDiZi.."：朋友啊，我服了你了。你这个同伴已经做完同伴教育任务了嘛。",1,"好的好的，明白了/no")
		elseif ( partner_finishtask == 0 ) then
			Describe(DescLink_JianHuangDiZi.."：这个镇子上藏龙卧虎，有许多的高人。你的同伴训练时如果与他们对话，可以学习到很多的东西。你去找位叫<color=red>卢青<color>的老人吧。另外，如果你对于同伴教育任务中那些古怪的问题有任务<color=red>疑问<color>，都可以从我这里做<color=red>问答题<color>得到参考哦。对了，从你接受任务开始，我将会给你设置一个<color=red>任务开始时间<color>，当你做完所有教育任务回来时，根据你完成的时间，我会给你一个<color=red>排名<color>，具体情况可打开F12面板，查看<color=red>'同伴教育任务时间挑战者'<color>，并且奖励也会不同的哦。你带领同伴完成任务的速度越快，得到的回报就越丰厚。以<color=red>900秒<color>为界，任务完成时奖励给你的同伴资质也将有天渊之别。",2,"开始任务/swordking_paiming","稍后再来/no")
		end
	end	
end

function swordking_paiming()
	nt_setTask(1226,10)									   --设置同伴教育任务开始
	nt_setTask(1234,GetGameTime())
	local partnerindex,partnerstate = PARTNER_GetCurPartner()   --获得召唤出同伴的index,同伴状态为召出或为不召出
	PARTNER_SetTaskValue(partnerindex,1,1)                 --设置当前同伴教育任务状态为开始
	Msg2Player("你已经开始了同伴教育任务。可以去镇子里找那些隐居人物学习了。")
end
-----------------------------------------------------取消同伴教育任务----------------------------------------------------

function partner_killedu()
	Describe(DescLink_JianHuangDiZi.."：你还有一次机会，你确定<color=red>取消<color>同伴正在做的教育任务吗？如果取消，那么这个同伴今后就<color=red>不能<color>再做同伴教育任务了哦。",2,
	"罗嗦什么，我确定要取消了/partner_killedureal",
	"容我再想想吧/no")
end

function partner_killedureal()
	local NpcName = GetName()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	
	if ( nt_getTask(1226) == 0 ) then
		Describe(DescLink_JianHuangDiZi.."："..NpcName.."朋友，别以为我是剑皇弟子就修养好得不行，你根本没接同伴教育任务嘛，这不是耍我？就是佛也发火啦！不要再有下次哦。",1,
		"结束对话/no")
	else
			local NpcCount = PARTNER_Count()
			if ( NpcCount ~= 0 ) then
				for i=1,NpcCount do	
					if ( PARTNER_GetTaskValue(i,1) == 1 ) then   --如果哪个同伴正在教育任务当中
						PARTNER_SetTaskValue(i,1,2)              --设置此同伴教育任务为完成状态
					end
				end
			end
			
				nt_setTask(1226,0) --同伴教育任务剑皇弟子任务变量
				nt_setTask(1227,0) --同伴教育任务卢青变量
				nt_setTask(1228,0) --同伴教育任务唐影变量
				nt_setTask(1229,0) --同伴教育任务白煞变量
				nt_setTask(1230,0) --同伴教育任务黑煞变量
				nt_setTask(1231,0) --同伴教育任务秋衣水变量
				nt_setTask(1232,0) --同伴教育任务卢青统一字节位开关
				nt_setTask(1233,0) --同伴教育问答次数记数器
				nt_setTask(1234,0) --同伴教育任务计时器
				nt_setTask(1235,0) --同伴教育黑煞处问题答案
				nt_setTask(1243,0) --记录打木桩次数
				nt_setTask(1247,0) --打沙袋的次数
				nt_setTask(1249,0) --已经领过奖励了
				
				Msg2Player("你的同伴教育任务已经被强制取消。如果有哪位同伴在做教育任务，那么今后他也不能再做下去了。")
	end
end

--------------------------------------------------------同伴问答----------------------------------------------

function partner_question()
	Describe(DescLink_JianHuangDiZi.."：好了，在我这里你可以查询到所有问题的答案。也可以自己开始做一些题目。对于你闯荡云中镇各个居民所设置的关卡都是大有裨益的哦。等级小于10级的同伴，在你回答对我提出的问题后，会得到一些小小的奖励。",3,
	"我想看一看教育任务的内容/partner_iwantsee",
	"我想做一下问答题目/partner_iwantdoproblem",
	"稍后再来吧/no")
end

function partner_iwantsee()
	Describe(DescLink_JianHuangDiZi.."：好吧，那么让我们来看一看与同伴相关的内容有哪些。",6,
	"同伴控制的要点/partner_control",
	"同伴属性与资质的要点/partner_property",
	"同伴亲密度的要点/partner_familiarity",
	"同伴技能的要点/partner_skills",
	"同伴进阶操作的要点/partner_advanced",
	"以后再来听吧/no")
end

function partner_iwantdoproblem()
	partner_edu(10,1,100,20,0,0,1,1) 
	Msg2Player("开始问答，你有20次机会，需要答对10道题目才可离开哦。")
end

function partner_control()
	Describe(DescLink_JianHuangDiZi.."：<color=yellow>同伴就是一个陪伴你共同闯荡江湖的NPC。同伴可以帮你打怪练级，在你和别人PK时助你一臂之力，还会偶尔给你些任务来让你获得一些珍贵奖励，当然在你寂寞的时候也可以试着跟同伴说说话，说不定会出现有趣的事情。你可以在指定的NPC处接到各种同伴获得任务，当你完成了这些任务就可以获得你的同伴了。你只要在同伴的快捷栏里找到“同伴的基本属性”按钮然后左键单击它就可以了。当你拥有多个同伴的时候你只要在同伴属性面板的上方点选你想要查看的同伴的标签就可以了。<color>",2,
	"回上一层菜单/partner_iwantsee",
	"稍后再来/no")
end

function partner_property()
	Describe(DescLink_JianHuangDiZi.."：<enter>"
	.."<color=yellow>1、	同伴的属性有哪些？它们有什么用？<enter>"
	.."精力：神秘潜质，日后开放；<enter>"
	.."性格：该同伴的性格，不同性格的同伴行为方式也会不同；现有的性格类型有：<enter>"
	.."    勇猛型：会攻击离他最近的对手，并不考虑自身损伤，拥有比较远的行动范围。<enter>"
	.."    卫主型：玩家攻击目标或被攻击时，同伴会予以协助，并不考虑自身损伤，一般在玩家附近。<enter>"
	.."    流氓型：会攻击血少的对手，当自身血少于20%时边跑边打。<enter>"
	.."    懦弱型：会随机攻击对手，受到攻击时会边跑边打，生命少于20%时会更多的闪躲。<enter>"
	.." <enter>"
	.."五行属性：显示该同伴的五行，不同五行的同伴所能拥有的武功跟绝技不同，同时有一部份的附加技能也会有五行的限制；<enter>"
	.."资质：决定同伴的属性在升级时所能提升多少的值。<enter>"
	.."2、	同伴的资质是什么？<enter>"
	.."同伴的以下属性是拥有资质的：生命，力量，命中，闪避，跑速，幸运；一个属性的资质越高意味着该属性在升级时提升得越多，不过具体提升多少，同一资质的人也会有少许不同。比如说你有两个同伴生命的资质都是2，那在他们升级的时候可能一个提升了50点生命值，而另一个只提升了45点生命值。这些具体提升的数值在同伴10级、30级、50级、90级时会出现一些波动。<color>",2,
	"回上一层菜单/partner_iwantsee",
	"稍后再来/no")
end

function partner_familiarity()
	Describe(DescLink_JianHuangDiZi.."：<enter>"
	.."<color=yellow>1、什么是同伴的亲密度？亲密度就是反映同伴跟玩家关系的数值。<enter>",2,
	"回上一层菜单/partner_iwantsee",
	"稍后再来/no")
end

function partner_skills()
	Describe(DescLink_JianHuangDiZi.."：<enter>"
	.."<color=yellow>1、我如何去查看同伴的技能界面？你只要在同伴的快捷栏里找到“同伴的武功技能”按钮然后左键单击它就可以了。<enter>"
	.."2、同伴有几种技能？它们如何获得？同伴的技能有四类：<enter>"
	.."    a)	武功技能：同伴用来攻击敌人的招式，通过升级获得；<enter>"
	.."    b)	五防技能：对普冰雷火毒五种抗性进行加成的技能，通过做教育任务获得；<enter>"
	.."    c)	附加技能：各种加成和辅助以及一些特殊的技能，通过技能书和剧情任务获得；<enter>"
	.."    d)	绝技：通过剧情任务获得；<enter>"
	.."3、同伴的技能如何升级？ 同伴的武功技能是用熟练度来升级的，而其它的技能全部要通过使用相应的技能书来提升。技能书的提升规则是：你只能学习比你要提升的技能当前等级高1级的技能书。比如；现有技能为6级，你只能学习7级的该技能书把该技能提升到7级，不能越级学习。<enter>"
	.."4、如何让同伴使用技能？ 在武功技能栏的下方有五个出招格，每一格代表着该同伴有20%的几率会使用格里的技能，格内可放入该同伴所能使出的任意主动技能。比如：该同伴的出招格里放了三个“技能A”和两个“技能B”那么该同伴使出“技能A”的几率是就是60%，使出“技能B” 的几率是就是40%。<color>",2,
	"回上一层菜单/partner_iwantsee",
	"稍后再来/no")
end

function partner_advanced()
	Describe(DescLink_JianHuangDiZi.."：<enter>"
	.."<color=yellow>1、我能获得多个同伴吗？ 能，一个玩家能获得五个同伴，但一次只能召唤出一个。<enter>"
	.."2、我总共可以学多少个附加技能？一个同伴能学附加技能的个数会随着他的等级增加而增加，总共16个。<enter>"
	.."3、当我拥有多个同伴时我要如何去切换不同的同伴呢？你首先要在在同伴的属性界面的上方点选你想切换到的同伴的标签，然后再点选界面下方的“选择同伴”按钮就可以了。当然你也可以直接在同伴的快捷栏里找到“同伴选择”按钮，左键点击后会出现你拥有同伴的名字，你只要点击你想要切换到的同伴的名字就可以了。注意：切换同伴操作不能连续进行，两次操作之间至少间隔半分钟。<enter>"
	.."4、我能替换附加技能吗？能，要想替换附加技能时你需要只要打开同伴技能界面，点遗忘按钮后选择希望删除的技能这时系统会向你确认是否真的要遗忘该技能，这时点确定便可把该技能遗忘掉，之后你便可以去学习你想学的新技能了。<enter>"
	.."5、如果你想让同伴的生命回复，把他召回就可以了，处于非召唤出状态的同伴是可以自动回复生命的。<color>",2,
	"回上一层菜单/partner_iwantsee",
	"稍后再来/no")
end

----------------------------------------------------------------------------------------------------------------

function partner_checkdo()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	if ( PARTNER_GetTaskValue(partnerindex, 1) ~= 1 ) then
		Msg2Player("这个同伴并不是你带着来做同伴教育任务的那个同伴，请将正确同伴召唤出来。")  
	elseif ( NpcCount == 0 ) then
		Msg2Player("你当前没有同伴，领取不了奖励哦。")
	elseif ( partnerstate == 0 ) then
		Msg2Player("你当前没有召唤出同伴来，领取不了奖励哦。") 
	else
		return 10
	end
end

function partner_goback()
	local i = random(1,7)
	if ( i == 1 ) then
		 NewWorld(1,1542,3229)  -- 凤翔
	elseif ( i == 2 ) then
		 NewWorld(11,3127,5112) -- 成都
	elseif ( i == 3 ) then
		 NewWorld(37,1658,3167) -- 汴京
	elseif ( i == 4 ) then
		 NewWorld(78,1458,3240) -- 襄阳
	elseif ( i == 5 ) then
		 NewWorld(80,1663,2999) -- 扬州
	elseif ( i == 6 ) then
		 NewWorld(162,1608,3204)-- 大理
	elseif ( i == 7 ) then
		 NewWorld(176,1583,2949)-- 临安
	end	 	 	 	
end

function genRandNumArray(nSum, nArrayLen, nMinNum, nMaxNum)
	local aryRandNumArray = {}
	if (nMinNum * nArrayLen > nSum or nMaxNum * nArrayLen < nSum) then
		print("genRandNumArray: 参数不合法！")
		return nil
	end	
	local nRest = nSum
	--此循环分配至倒数第二个
	for i = 1, nArrayLen -1 do
		local nRestLen = nArrayLen - i	--剩余分配的长度
		local nAverage = nRest / (nRestLen + 1) --剩余分配的平均值
		local nRand = random(0, 10000)/10000 --随机数
		local nMin, nMax
		local nGen
		--调整最大最小范围
		nMin = nRest - nMaxNum * nRestLen
		if (nMin < nMinNum) then nMin = nMinNum end
		nMax = nRest - nMinNum * nRestLen
		if (nMax > nMaxNum) then nMax = nMaxNum end
		--分配当前
		--随机分配，浮动以平均值为中心的随机值
		if (nRand > 0.5) then 
			nGen = nAverage + (nMax - nAverage) * (nRand - 0.5) / 0.5
		else
			nGen = nAverage - ( nAverage - nMin) * (0.5 - nRand) / 0.5			
		end
		nGen = floor(nGen + 0.5) --取整
		nRest = nRest - nGen
		aryRandNumArray[i]  =  nGen
	end
	aryRandNumArray[nArrayLen] = nRest --分配最后一个
	return aryRandNumArray;
end


function no()
end
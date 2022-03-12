-------------------------------------------------------------------------
-- FileName		:	partner_mastertask.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-25 10:50:15
-- Desc			:  	同伴剧情任务各对话人物脚本
--------------------------------------------------------------------------

-- 各个级别的同伴剧情任务实体处理文件
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\partner\\partner_head.lua") --包含了图象调用
IncludeLib("PARTNER")


--------------------------------------------------------------------与同伴剧情相关的龙五脚本------------------------------------------------------------------------
function master_longwu()
	local PlayerName = GetName()
	if ( GetLevel() <= 10 ) then
		Describe(DescLink_LongWu.."<#>："..PlayerName.."，你想要领取一位同伴陪伴你闯荡江湖吗？",2,
		"我愿意/partner_longwu_getpartner",
		"终身大事，再考虑考虑吧/no")
	elseif ( nt_getTask(1000) == 1000 or nt_getTask(1001) == 1000 or nt_getTask(1002) == 1000 or nt_getTask(1003) == 1000 ) then
		Describe(DescLink_LongWu.."<#>："..PlayerName.."，好久不见，近来我出了趟远门，你一切可好？义军中的兄弟姐妹们都很挂着你，嘱咐我见到你定要转告，江湖岁月催人老，身体为重，要懂得珍惜自己啊。好了，闲话不谈，你这次来找我，是有什么事情？",2,
		"我想来看看有什么与同伴相关的剧情任务/partner_longwu_mastertalk",
		"没什么，来看看老朋友而已/no")
	else
		Describe(DescLink_LongWu.."<#>："..PlayerName.."，江湖风雨飘摇，山河社稷不定，我龙某心中急啊。义军很高兴见到你愿意为国家出一份力，也太需要你的帮助了。",2,
		"我想来看看有什么与同伴相关的剧情任务/partner_longwu_mastertalk",
		"没什么，来看看老朋友而已/no")
	end
end

function partner_longwu_mastertalk()
	taskProcess_000:doTaskEntity();
	return 1;
end

function partner_longwu_cancelmastertask()
	Describe(DescLink_LongWu.."<#>：取消功能等制作完成一并加入。",1,"结束对话/no")
end



----------------------------------------------------------------------侍郎之死任务--------------------------------------------------------------------------
function  partner_longwu_70()	
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	if ( PARTNER_GetTaskValue(partnerindex,3) ~= 1000 ) then
		Describe(DescLink_LongWu.."<#>：近来，门下弟子告诉了我一件奇怪的事情。不久前，南岳镇上来了一个额有刺青，佩带铁匣的老年犯人，此人目光矍铄，看上去不像相貌非凡。所以我们暗藏在南岳客栈中的高手对他多有照顾。有一个雷雨交加的夜里，老人忽然神色惊恐的找到了那个弟子，说出来一个关于藏宝图碎片的莫大秘密。原来这位老人居然是当朝兵部侍郎，因力主抗击金国，被流放南疆戍边。更奇怪的是，第二日早晨侍郎大人忽然无疾暴毙！联系最近江湖上传闻的武林客栈在江湖广发英雄贴，约定来年召集天下英雄解开与天煌龙器相关的藏宝图之秘这件事，我觉得背后也许有个莫大的阴谋。一张小小的金泥秋枫笺，成了江湖英雄个个欲得之后快的宝贝。而真正流传江湖的，似乎只有十大门派掌门人手中的十张，另外十张英雄贴却不知所踪。我相信侍郎的死与之有关，想请你找出其中破绽。化解中原武林的一场浩劫！[此任务每位符合条件的同伴都被允许进行]<enter>"
		.."<color=green>奖励：<color>",3,
		"我愿意接受任务/longwu_70_gettask",
		"我是来交任务的/longwu_70_finishtask",
		"容我再想一想吧/no")
	else
		Describe(DescLink_LongWu.."<#>：侍郎之死任务似乎还有一些疑窦没有解开。你愿意去南岳继续调查吗？步骤和以前是相同的，看能不能查出些不同的地方来。<enter>"
		.."<color=green>奖励：<color>",4,
		"我愿意接受任务/longwu_70_gettask",
		"我是来交任务的/longwu_70_finishtask",
		"我想取消该任务/longwu_70_canceltask",
		"容我再想一想吧/no")
	end
end

function longwu_70_gettask()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	local longwu_70_date = tonumber(date("%y%m%d")) --获得现在日期	
	
	if ( NpcCount == 0 ) then
		Describe(DescLink_LongWu.."<#>：你当前没有同伴，做不了同伴相关的剧情任务啊。你可以通过各个城市的长歌门人，到云中镇找剑皇弟子领取一位。",1,"结束对话/no")
		return
	elseif ( partnerstate == 0 ) then
		Describe(DescLink_LongWu.."<#>：你当前没有召唤出同伴来，怎么做同伴剧情任务呢？",1,"结束对话/no")
		return
	elseif ( PARTNER_GetLevel(partnerindex) < 10  ) then
		Describe(DescLink_LongWu.."<#>：你当前同伴不满10级，请将他训练到10级以上再来吧。",1,"结束对话/no")
		return
	elseif ( GetLevel() < 70 ) then
		Describe(DescLink_LongWu.."<#>：你还没有达到任务需求的等级，到70级的时候再来吧，加油！",1,"结束对话/no")
		return
	elseif ( PARTNER_GetTaskValue(partnerindex,3) >= 10 ) and ( PARTNER_GetTaskValue(partnerindex,3) < 1000 ) then
		Describe(DescLink_LongWu.."<#>：你不是已经接到任务了吗，快快完成它吧。",1,"结束对话/no")
		return		
	else
		for i=1,NpcCount do
			if ( PARTNER_GetTaskValue(i,3) ~= 0 and PARTNER_GetTaskValue(i,3) ~= 1000 ) or ( nt_getTask(1256) ~= 0 ) then
				Describe(DescLink_LongWu.."<#>：你已经有同伴正在做侍郎之死任务了，先完成已接的任务吧。",1,"结束对话/no")
				return		
			end
		end
	end
	
	if ( PARTNER_GetTaskValue(partnerindex,3) == 0 ) then 
		PARTNER_SetTaskValue(partnerindex,3,10)  --设置唯一性剧情任务为开始状态
		nt_setTask(1256,10) --设置剧情任务开始
		Msg2Player("你已经接到了任务，应该去南岳镇调查一下侍郎的死因了。")
		if ( GetBit(GetTask(1250),1) == 0 ) then
			nt_setTask(1250,SetBit(GetTask(1250),1,1)) 
			Msg2Player("发放第一步剧情任务的玩家相关奖励。") --？？？？？？？？？？？？？？？？？
		end
	elseif ( PARTNER_GetTaskValue(partnerindex,3) == 1000 ) then
		if ( nt_getTask(1254) == 0 ) then
			nt_setTask(1254,longwu_70_date)
		end  
		
		if ( nt_getTask(1254) == longwu_70_date ) and ( nt_getTask(1255) == 0 ) then
			nt_setTask(1256,10) --设置可重复性剧情任务开始
			Msg2Player("你已经接到了任务，应该去南岳镇调查一下侍郎的死因了。")
		elseif ( nt_getTask(1254) == longwu_70_date ) and ( nt_getTask(1255) ~= 0 ) then
			Msg2Player("对不起，你今天已经完成过这种可重复性的剧情任务了。请明日再来。")
		elseif ( nt_getTask(1254) ~= longwu_70_date )  then
			nt_setTask(1254,longwu_70_date)
			nt_setTask(1256,10) --设置可重复性剧情任务开始	
			Msg2Player("你已经接到了任务，应该去南岳镇调查一下侍郎的死因了。")
		end
	else
		Describe(DescLink_LongWu.."<#>：你已经接过侍郎之死任务了，加油！",1,"结束对话/no")
	end
end

function longwu_70_finishtask()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	local longwu_70_date = tonumber(date("%y%m%d")) --获得现在日期	
	
	if ( nt_getTask(1256) ~= 40 or nt_getTask(1259) < 50 or nt_getTask(1260) < 50 ) then --没有完成任务到领奖这步
		Describe(DescLink_LongWu.."<#>：你还没有达到领取奖励的地步，等到了合适的时候再来吧。",1,"结束对话/no")
		return
	elseif ( NpcCount == 0 ) then
		Describe(DescLink_LongWu.."<#>：你当前没有同伴，怎么交同伴相关的剧情任务啊。你可以通过各个城市的长歌门人，到云中镇找剑皇弟子领取一位。",1,"结束对话/no")
		return
	elseif ( partnerstate == 0 ) then
		Describe(DescLink_LongWu.."<#>：你当前没有召唤出同伴来，怎么领奖呢？",1,"结束对话/no")
		return
	elseif ( PARTNER_GetTaskValue(partnerindex,3) ~= 10 ) then
		Describe(DescLink_LongWu.."<#>：你召唤出来的同伴并非与你一同做剧情任务的同伴，请召唤出正确同伴来，谢谢。",1,"结束对话/no")
		return
	end
	
	if ( PARTNER_GetTaskValue(partnerindex,3) == 10 ) then  --当开关打开时，表示剧情任务已经开始
		PARTNER_SetTaskValue(partnerindex,3,1000)
		nt_setTask(1256,0)
		nt_setTask(1259,0)
		nt_setTask(1260,0)
		nt_setTask(1261,0)
		if ( GetBit(GetTask(1250),3) == 0 ) then
			nt_setTask(1250,SetBit(GetTask(1250),3,1)) 
			Msg2Player("发放第三步剧情任务的玩家相关奖励。") --？？？？？？？？？？？？？？？？？
		end
		Msg2Player("发放同伴的奖励") 						 --？？？？？？？？？？？？？？？？？
	else
		nt_setTask(1254,longwu_70_date)
		nt_setTask(1255,1)
		nt_setTask(1256,0)
		nt_setTask(1259,0)
		nt_setTask(1260,0)
		nt_setTask(1261,0)
		Msg2Player("发放作为重复性任务的奖励！")			 --？？？？？？？？？？？？？？？
	end	
end

function longwu_70_canceltask()
	Describe(DescLink_LongWu.."<#>：你确定要取消当前正在做的任务吗？",2,
	"是的，我确定/longwu_70_yescancel",
	"容我再想想/no")
end

function longwu_70_yescancel()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	if ( nt_getTask(1256) ~= 0 ) then
		nt_setTask(1256,0)
		for i=1,NpcCount do
			if ( PARTNER_GetTaskValue(i,3) ~= 0 and PARTNER_GetTaskValue(i,3) ~= 1000 ) then
				 PARTNER_GetTaskValue(i,3,0)
			end
		end
		Msg2Player("您已成功取消了任务。")
	else
		Describe(DescLink_LongWu.."<#>：现在时局凋敝，龙某内外交困，你怎么还戏弄于我呢？明明没有接过这种任务嘛。",1,"结束对话/no")
		return
	end
	Msg2Player("你已经顺利取消了任务。")
end




-----------------------------------------------------------------------------静岳师太脚本------------------------------------------------------------------------

function partner_master_jingyue()
	if ( nt_getTask(1256) == 10 ) then
		Describe(DescLink_JingYue.."<#>：阿弥陀佛，"..GetName().."施主，你终于还是来拉。贫尼早间起了一卦，卦像成祥，是吉兆。也许这五岳之一的灵山，能免除一场血光之灾了。<enter>"
		.."侍郎死于一种非常奇怪的湿热。而且镇上不只一人患了重病而亡。那种湿热是由一种丛林金线蛇引起的，它常常在半夜的时候从梁木上爬下来，偷偷在睡梦中咬人的脑袋，因为头发遮蔽，所以看不出痕迹。可惜它非常狡猾，贫尼没有办法捉到。这种蛇绝非南岳镇所有，我怀疑是有人指使。所以需要找到能将金线蛇熏出来的地黄草，费叶和染胛根。这些东西都产于北面的山贼洞。那里凶险万分，一般武林高手进去，都是有去无回，你愿意去吗？",2,
		"是的，我愿意/partner_jingyue_go",
		"不，我先准备准备/no")
	else
		Describe(DescLink_JingYue.."<#>：阿弥陀佛，神秘金线蛇忽然降灾，希望佛祖保佑这千年灵山免除掉一场浩劫啊。",2,
		"我想去山贼洞/partner_jingyue_trap",
		"师太保重/no")
	end
end

function partner_jingyue_go()
	Describe(DescLink_JingYue.."<#>：山贼洞内强匪云集，在神秘山贼身上藏有<color=red>地黄草<color>，贼婆子身上藏着<color=red>费叶<color>。你需要各取<color=red>五十株<color>。然后去洞<color=red>上方<color>分别杀掉左右看守钥匙的<color=red>山贼寨主<color>，得到两把钥匙然后去地图中央的镇岳之门，找<color=red>开锁人<color>打开它。从<color=red>山贼王<color>手中夺到唯一的一支<color=red>染胛骨<color>。这样才能成功配制成药材，清楚了吗？如果清楚的话，贫尼这就送你上山。",2,
	"清楚了，让我去吧/partner_jingyue_trap2",
	"我想再准备准备/no")
end

function partner_jingyue_trap()
	SetFightState(1)
	NewWorld(514,1552,3308)

end

function partner_jingyue_trap2()
	nt_setTask(1256,20)
	SetFightState(1)	
	NewWorld(514,1552,3308)
end

------------------------------------------------------------------------------开锁人对话-------------------------------------------------------------------------

function partner_master_kaisuoren()
	if ( nt_getTask(1256) == 20 ) then
		if ( GetBit(GetTask(1261),1) == 1 ) and ( GetBit(GetTask(1261),2) == 1 ) then
			Describe(DescLink_KaiSuoRen.."<#>：恭喜阁下获得了完整的开启镇岳之门的钥匙。",2,
			"立刻送我入门/master_70_trap3",
			"我稍后再来/no")
		else
			Describe(DescLink_KaiSuoRen.."<#>：你还没有将左右山贼寨主降伏，得到他们手中掌握的各半片钥匙，那么我也打不开这扇门。快去打败他们吧，就在地图上方的两个山洞内。",1,"结束对话/no")
		end
	elseif ( nt_getTask(1256) == 30 ) then
		Describe(DescLink_KaiSuoRen.."<#>：要小心哪，这里可不是随便能过关的，山贼王凶暴得很。",2,
		"立刻送我入门/master_70_trap3",
		"我稍后再来/no")
	elseif ( nt_getTask(1256) == 40 ) then
		Describe(DescLink_KaiSuoRen.."<#>：你已经成功获得了染胛骨，恭喜啊！",2,
		"立刻送我走/master_70_trap4",
		"我稍后再来/no")
	else
		Describe(DescLink_KaiSuoRen.."<#>：镇岳之门岂是一般人随意进得？快走快走。",1,"结束对话/no")
	end	
end

function master_70_trap3()
	nt_setTask(1256,30)
	nt_setTask(1261,0)
	SetFightState(1)
	NewWorld(514,1791,3197)
end

function master_70_trap4()
	SetFightState(0)
	NewWorld(514,1817,3228)
end
-----------------------------------------------------------------------------获取一个同伴------------------------------------------------------------------------

function partner_longwu_getpartner()
	local partnercount = PARTNER_Count()                   --获取当前同伴数量
	if ( partnercount == -1 ) then
		Msg2player("功能出现异常，请与GM联系。")
	elseif ( partnercount == 0 ) then
		Describe(DescLink_LongWu.."<#>：你可以在同伴的快捷栏里找到<color=red>“召唤同伴”<color>按钮，左键单击该按钮就可以了。<color=red>再次<color>点击“召唤同伴”按钮就能<color=red>收回同伴了<color>",4,
		"获得男同伴/partner_longwu_getmen",
		"获得女同伴/partner_longwu_getwomen",
		"随机获得同伴/partner_longwu_getrandom",
		"结束对话/no") 
	elseif ( partnercount ~= 0 ) then
		Describe(DescLink_LongWu.."<#>：你已经拥有了同伴，就不要再贪心了。",1,
		"结束对话/no")
	end
end

function partner_longwu_getmen()
	local w=random(1,4)
	local j=random(1,3)
	if ( j == 1 ) then
		PARTNER_AddFightPartner(1,4,w,1,1,1,1,1,1)
	elseif ( j == 2 ) then
		PARTNER_AddFightPartner(3,3,w,1,1,1,1,1,1)
	else
		PARTNER_AddFightPartner(5,0,w,1,1,1,1,1,1)
	end
	Msg2Player("恭喜你获得了一个男同伴。")
end

function partner_longwu_getwomen()
	local w=random(1,4)
	local j=random(1,2)
	if ( j == 1 ) then
    	PARTNER_AddFightPartner(2,2,w,1,1,1,1,1,1)
	else
		PARTNER_AddFightPartner(4,1,w,1,1,1,1,1,1)
	end
	Msg2Player("恭喜你获得了一个女同伴。")
end

function partner_longwu_getrandom()
 	local j=random(1,5)
	local w=random(1,4)	
	if ( j == 1 ) then
		PARTNER_AddFightPartner(1,4,w,1,1,1,1,1,1)
		Msg2Player("恭喜你获得了一个同伴。")
	elseif ( j == 2 ) then
		PARTNER_AddFightPartner(2,2,w,1,1,1,1,1,1)
		Msg2Player("恭喜你获得了一个同伴。")
	elseif ( j == 3 ) then
		PARTNER_AddFightPartner(3,3,w,1,1,1,1,1,1)
		Msg2Player("恭喜你获得了一个同伴。")
	elseif ( j == 4 ) then
		PARTNER_AddFightPartner(4,1,w,1,1,1,1,1,1)
		Msg2Player("恭喜你获得了一个同伴。")
	else
		PARTNER_AddFightPartner(5,0,w,1,1,1,1,1,1)
		Msg2Player("恭喜你获得了一个同伴。")
	end
end

function no()
end
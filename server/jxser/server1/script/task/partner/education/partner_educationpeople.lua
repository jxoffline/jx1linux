------------------------------------------------------------------------
-- FileName		:	partner_educationpeople.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-06 14:34:15
-- Desc			:  	各同伴教育任务npc对话
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\partner\\partner_problem.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\partner\\partner_head.lua") --包含了图象调用
IncludeLib("PARTNER")

partner_birthday={"鼠","牛","虎","兔","龙","蛇","马","羊","猴","鸡","狗","猪"}
partner_caimei  ={"石头","剪子","布"}

function partner_keepjiguan1(nChange)
	if ( nChange == 0 ) then
		Msg2Player("你没合格，给我乖乖回答同伴问题吧。")
		partner_edu(3,1,29,3,1228,2,1,1)
	elseif ( nChange == 1 ) then
		jiguan1_giveprize()
	end
end

function partner_keepjiguan2(nChange)
	if ( nChange == 0 ) then
		Msg2Player("你没合格，给我乖乖回答同伴问题吧。")
		partner_edu(3,1,29,3,1228,4,1,2)
	elseif ( nChange == 1 ) then
		jiguan2_giveprize()
	end
end

function partner_keepjiguan3(nChange)
	if ( nChange == 0 ) then
		Msg2Player("你没合格，给我乖乖回答同伴问题吧。")
		partner_edu(3,1,29,3,1228,6,1,3)
	elseif ( nChange == 1 ) then
		jiguan3_giveprize()
	end
end

function partner_keepjiguan4(nChange)
	if ( nChange == 0 ) then
		Msg2Player("你没合格，给我乖乖回答同伴问题吧。")
		partner_edu(3,1,29,3,1228,8,1,4)
	elseif ( nChange == 1 ) then
		jiguan4_giveprize()
	end
end

function partner_keepzhuofeifan(nChange)
	if ( nChange == 0 ) then
		Msg2Player("你没合格，给我乖乖回答同伴问题吧。")
		partner_edu(3,1,29,3,1228,10,1,5)
	elseif ( nChange == 1 ) then
		zhuofeifan_giveprize()
	end
end

function partner_keepheishadizi(nChange)
	if ( nChange == 0 ) then
		Msg2Player("对不起，你没有回答正确，我不能告诉你什么。")
	elseif ( nChange == 1 ) then
		local Uworld1235 = nt_getTask(1235)
			  nt_setTask(1235,Uworld1235-1)
			  if ( Uworld1235 - 1 <= 0 ) then
			  		nt_setTask(1230,12)
					Describe(DescLink_HeiShaDizi.."：没错，朋友，你要的秘籍就在我的手上！我立刻将秘籍送到老师处，你可以回去找黑煞老师学习三段击了。加油",1,"结束对话/heishadizi_chenggong")
			  else
					Describe(DescLink_HeiShaDizi.."：对不起啊朋友，秘籍不在我手里，你还是找别人吧。不过你这样辛苦的答题，我是应该给你些奖励哦。",2,"领取奖励/heishadizi_giveprize","结束对话/heishadizi_geiyujiangli")
			  end
	end
end

function partner_moxiaofeng_fajiang1(nChange)
	if ( nChange == 1 ) then
		moxiaofeng_giveprize()
	end	
end

function partner_xiaoding_fajiang1(nChange)
	if ( nChange == 1 ) then
		xiaoding_giveprize()
	end	
end

function partner_quwan_fajiang1(nChange)
	if ( nChange == 1 ) then
		quwan_getprize()
	end	
end

function partner_xieqinger_fajiang1(nChange)
	if ( nChange == 1 ) then
		xieqinger_getprize()
	end	
end

partner_keeponproblem = {
[1] = partner_keepjiguan1,
[2] = partner_keepjiguan2,
[3] = partner_keepjiguan3,
[4] = partner_keepjiguan4,
[5] = partner_keepzhuofeifan,
[6] = partner_keepheishadizi,
[7] = partner_moxiaofeng_fajiang1,
[8] = partner_xiaoding_fajiang1,
[9] = partner_quwan_fajiang1,
[10] = partner_xieqinger_fajiang1,
}



----------------------------------------------------------卢青对话---------------------------------------------------
function pe_luqing()   
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务卢青任务变量
	local Uworld1228 = nt_getTask(1228)                        --同伴教育任务唐影任务变量
	local Uworld1229 = nt_getTask(1229)                        --同伴教育任务白煞任务变量
	local Uworld1230 = nt_getTask(1230)                        --同伴教育任务黑煞任务变量
	local Uworld1231 = nt_getTask(1231)                        --同伴教育任务秋衣水任务变量
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_LuQing.."：我们几个人的教育都结束了。你现在可以去找剑皇徒弟了。",1,"结束对话/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 0 ) then  	  
	--卢青处任务没有触发？？？？？没有把任务奖励告诉玩家
		Describe(DescLink_LuQing.."：哦，你是来做教育任务的啊。我的爱驹赤影生病了，正发动修炼的武士们帮忙找草药呢。你可以在<color=red>左边下山的山道上<color>找到<color=red>三男一女<color>四个武士。那帮家伙笨得可以，如果你能帮我把治疗赤影的草药<color=red>带回来<color>，我就会给你一面武士令，能带给你很大的好处哦。<enter>"
		.."<color=green>任务奖励：同伴技能'金刚不破'、'雷霆护甲'<color>",2,"开始任务/luqing_findmedicin","结束对话/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then  
	--任务已完成
		Describe(DescLink_LuQing.."：草药你都拿到了？太好了，我的马儿有救了。好了，我再告诉你一些窍门吧：<enter>"
		.."<color=yellow>同伴就是一个陪伴你共同闯荡江湖的NPC。同伴可以帮你打怪练级，在你和别人PK时助你一臂之力，还会偶尔给你些任务来让你获得一些珍贵奖励，当然在你寂寞的时候也可以试着跟同伴说说话，说不定会出现有趣的事情。你可以在指定的NpC处接到各种同伴获得任务，当你完成了这些任务就可以获得你的同伴了。你只要在同伴的快捷栏里找到“同伴的基本属性”按钮然后左键单击它就可以了。当你拥有多个同伴的时候你只要在同伴属性面板的上方点选你想要查看的同伴的标签就可以了。<color><enter>"
		.."好了，在我这里你已经学不到更多的东西，去找其他人吧。保重！见到我独孤师兄的时候，请代我问候他。",2,"领取奖励/luqing_getprize","稍后再来/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) then  
	--刚接到卢青处任务	
		Describe(DescLink_LuQing.."：不是告诉你了吗，你可以在<color=red>左边下山的山道上<color>找到<color=red>三男一女<color>四个武士。那帮家伙笨得可以，如果你能帮我把治疗赤影的草药<color=red>带回来<color>，我就会给你一面武士令，能带给你很大的好处。",1,
		"结束对话/no")	
	else
		Describe(DescLink_LuQing.."：许多年前独孤师兄站在江湖最高的那座山峰上，我记得武林子弟们齐齐拔出三尺剑锋对他誓死效命，那是一个神话吧。去年我意外收到一封他的信，他说最近衡山正雪，天冷得快受不了了。很想找个人喝酒，却发觉没有谁可勘共饮。他说会一直温着那坛衡松酒等我。呵呵，是啊，我这里炉火旺盛了几十年，山崖边的杜鹃也开谢了几十年，我想早年那些羡慕的思绪也化做寒风吹入师兄的身体里了吧。我这就要去陪他了，也不知路上是否平靖，天下纷乱得太久了。<enter>",1,"结束对话/no")
	end
		
end

function luqing_findmedicin()
	if ( partner_checkdo() == 10 ) then
		nt_setTask(1227,10)
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,100 ,1)                   			--给当前同伴增加经验，+100
		Msg2Player("卢青让你去左边下山的路上，那里有三男一女四位武士。")
	end
end

function luqing_getprize()                                          --获得在卢青处的总奖励
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()   --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddSkill(partnerindex,0,549,1)                      --增加同伴抗性技能《金刚不破》    
		Msg2Player("恭喜你获得了同伴技能《金刚不破》")
		nt_setTask(1227,20)											--卢青处的所有任务已结束
		Msg2Player("你已经完成在卢青处的学习，可以去黑白双煞，唐影、秋衣水夫妇那里瞧瞧。")
	end
end

----------------------------------------------------------书生莫笑风对话-----------------------------------------

function pe_moxiaofeng()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务卢青任务变量
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),1) ~= 1 ) then
		Describe(DescLink_MoXiaoFeng.."：<color=green>烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，君莫停。与君歌一曲，请君为我侧耳听。钟鼓馔玉不足贵，但愿长醉不复醒。古来圣贤皆寂寞，惟有饮者留其名。<color><enter>"
		.."这是唐朝大诗人李白的杰作，醉酒人生，留名野史。多么的惬意啊，我莫笑风若能成就一番抱负，也算没枉到这世间走一遭。什么？你是卢青那老头找来要草药的？哼哼，想要草药可没那么简单。我有三个问题，如果你都能答对，就把手上的草药给你。答不对的话，门都没有。",2,
		"什么问题？你尽管问/moxiaofeng_taskproblem",
		"稍后再来找你吧/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),1) == 1 ) and ( GetBit(GetTask(1232),2) == 0 ) then
		Describe(DescLink_MoXiaoFeng.."：好吧，我把我这里的奖励给你。",2,"领取奖励/moxiaofeng_giveprize","稍后再来/no")   --领取奖励？？？？？？？？？
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then
		Describe(DescLink_MoXiaoFeng.."：你已经完成在我们四个人这里的修行了，药草拿好回去找卢青老头吧。",1,"结束对话/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) then
		Describe(DescLink_MoXiaoFeng.."：恩，我这一关你已经通过了，去找下面的武士吧。他们可没我这样好讲话了，自己小心。",1,"结束对话/no")
	else
		Describe(DescLink_MoXiaoFeng.."：莫笑癫狂莫笑风，十年习剑十年松。书生我早就想剑试江湖了，困龙一朝得脱，那还不飞去九天，风行舞步吗？哈哈哈哈哈哈……",1,"结束对话/no")
	end
end

function moxiaofeng_taskproblem()
	--调用公共问题库，回答正确数要求为3，问题为问题1~问题29随机，玩家问答峰值为20次，完成回答后将1232号变量字节1置1
	partner_edu(3,1,29,3,1232,1,1,7)
end

function moxiaofeng_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,430,1 )                   			--给当前同伴增加经验，+430
		nt_setTask(1232,SetBit(GetTask(1232),2,1))  --发奖完毕
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end

----------------------------------------------------------屠夫牛满满对话-----------------------------------------
function pe_niumanman()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务牛满满任务变量
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),3) ~= 1 ) then
		Describe(DescLink_NiuManMan.."：我是一个杀手，收钱卖命。你是要杀猪呢，还是要杀人？<enter>"
		.."啊？你是要药材！我晕，来者不善哪！恩！既然如此，那你必须陪我玩一个游戏。玩不过我的话就要回答问题，<color=red>不论答得对错都必须再和我玩<color>。直到<color=red>赢<color>了我才可以出关。什么什么？我霸道！就霸道了，你说咋整吧。",3,
		"好啊，开始吧/niumanman_startcaimei",
		"听牛满满讲述游戏规则/niumanman_guize",
		"稍后再来找你吧/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),3) == 1 ) and ( GetBit(GetTask(1232),4) == 0 ) then
		Describe(DescLink_NiuManMan.."：好吧，我把我这里的奖励给你。",2,"领取奖励/niumanman_giveprize","稍后再来/no")   --领取奖励？？？？？？？？？
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then
		Describe(DescLink_NiuManMan.."：你已经完成在我们四个人这里的修行了，药草拿好回去找卢青老头吧。",1,"结束对话/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),4) == 1 ) then
		Describe(DescLink_NiuManMan.."：恩，我这一关你已经通过了，去找下面的武士吧。他们的点子也不少，你要小心哦，嘿嘿。",1,"结束对话/no")
	else
		Describe(DescLink_NiuManMan.."：杀猪一刀，杀人也是一刀。这样的世道，人和猪有什么区别？与其杀猪，不如杀些猪狗不如的人。你说对吧？来来来，我们玩个游戏如何？",2,
		"好啊，玩就玩/niumanman_startcaimei",
		"没空没空/no")
	end
end

function niumanman_startcaimei()
	Describe(DescLink_NiuManMan.."：好吧，那么现在你选择一组生肖开始和我比赛吧，哼哼。输死你！",3,
	"我选择鼠牛虎兔龙蛇这组/niumanman_bisai1",
	"我选择马羊猴鸡狗猪这组/niumanman_bisai2",
	"我还是再酝酿一下，等下再来玩/no")
end

function niumanman_guize()
	Describe(DescLink_NiuManMan.."：我这里有<color=red>子鼠，丑牛，寅虎，卯兔，辰龙，巳蛇，午马，未羊，申猴，酉鸡，戌狗，亥猪<color>十二生肖。我们来比大小，具体规则是：我们把十二生肖分为两组，前六个鼠牛虎兔龙蛇为一组。后六个马羊猴鸡狗猪为一组。你任意挑选一组来与我比大小。例如你选择了鼠牛虎兔龙蛇这一组，那么如果我出个虎，你出个兔，那么你比我大。如果我出个龙，你出个蛇，还是你大。也就是按照顺序越排后面的越大。不过呢最后一个是比第一个小的，也就是鼠会比蛇大。我们两一人出一个生肖，看谁的大。如果中间出现了两个生肖不是靠在一起的情况，如我出个虎，你出个蛇，那么算我赢。我赢了你就要回答我一个问题，不论答得对错，都必须赢了游戏才能从我这里出关。懂了没？",2,"懂了,让我回上一层菜单/pe_niumanman","太难,不玩了/no")
end

function niumanman_bisai1()
	SetTaskTemp(190,0)
	local i = random (1,6)
	SetTaskTemp(190,i)
	Describe(DescLink_NiuManMan.."：好啦好啦，开始选开始选，哈哈哈哈，快点快点。你出什么？",6,
	"鼠/niumanman_num1",
	"牛/niumanman_num2",
	"虎/niumanman_num3",
	"兔/niumanman_num4",
	"龙/niumanman_num5",
	"蛇/niumanman_num6")
end

function niumanman_bisai2()
	SetTaskTemp(190,0)
	local i = random (7,12)
	SetTaskTemp(190,i)
	Describe(DescLink_NiuManMan.."：好啦好啦，开始选开始选，哈哈哈哈，快点快点。你出什么？",6,
	"马/niumanman_num7",
	"羊/niumanman_num8",
	"猴/niumanman_num9",
	"鸡/niumanman_num10",
	"狗/niumanman_num11",
	"猪/niumanman_num12")
end

function niumanman_bisaijieguo(partner_personnum)
	local partner_systnum = GetTaskTemp(190)
	if ( partner_personnum == 1 or partner_personnum == 7 ) then
		if ( partner_systnum == 6 or partner_systnum == 12 )  then
			Describe(DescLink_NiuManMan.."：我出"..partner_birthday[partner_systnum]..",啊！你竟如此厉害，真的被你打败了。好吧，你过了我这关了。",1,"结束对话/niumanman_taskfinish")
		else 
			Describe(DescLink_NiuManMan.."：我出"..partner_birthday[partner_systnum]..",嘿嘿，你输啦！回答问题吧。",1,"好吧，我回答/niumanman_shule")
		end
	else
		if (  partner_personnum == partner_systnum + 1 ) then
			Describe(DescLink_NiuManMan.."：我出"..partner_birthday[partner_systnum]..",啊！你竟如此厉害，真的被你打败了。好吧，你过了我这关了。",1,"结束对话/niumanman_taskfinish")
		else
			Describe(DescLink_NiuManMan.."：我出"..partner_birthday[partner_systnum]..",嘿嘿，你输啦！回答问题吧。",1,"好吧，我回答/niumanman_shule")
		end
	end
end

function niumanman_taskfinish()
	if ( nt_getTask(1226) == 10 ) and ( nt_getTask(1227) == 10 ) and ( GetBit(GetTask(1232),3) == 0 ) then
		nt_setTask(1232,SetBit(GetTask(1232),3,1))  --牛满满处任务完成，但未领取奖励
		niumanman_giveprize()
	end
end

function niumanman_shule()
	--调用公共问题库，回答正确数要求为1，问题为问题1~问题20随机，玩家问答峰值为100次，不设置完成字节
	if ( partner_edu(1,1,29,1,0) == 10 ) then
		Describe(DescLink_NiuManMan.."：竟然被你答对了，好，再来玩游戏，你能赢我就过关。哼哼。",1,"来就来/niumanman_startcaimei")
	else
		Msg2Player("答错了就再来。")
	end
end

function niumanman_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,430,1)                   			--给当前同伴增加经验，+430
		PARTNER_AddSkill(partnerindex,0,553,1)                          --增加同伴抗性技能《雷霆护甲》
		Msg2Player("恭喜你获得了同伴技能《雷霆护甲》")
		nt_setTask(1232,SetBit(GetTask(1232),4,1))  --发奖完毕
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end

----------------------------------------------------------采花公子小丁对话----------------------------------------------
function pe_xiaoding()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务卢青任务变量
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),5) ~= 1 ) then
		Describe(DescLink_XiaoDing.."：我是采花公子，不是难缠公子。我的同伴们肯定给你设了很多陷阱吧，到我这里不需要了。安心回答对三道题目就把草药给你。",2,
		"什么问题？你尽管问/xiaoding_taskproblem",
		"稍后再来找你吧/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),5) == 1 ) and ( GetBit(GetTask(1232),6) == 0 ) then
		Describe(DescLink_XiaoDing.."：好吧，我把我这里的奖励给你。",2,"领取奖励/xiaoding_giveprize","稍后再来/no")   --领取奖励？？？？？？？？？
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then
		Describe(DescLink_XiaoDing.."：你已经完成在我们四个人这里的修行了，药草拿好回去找卢青老头吧。",1,"结束对话/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),6) == 1 ) then
		Describe(DescLink_XiaoDing.."：恩，我这一关你已经通过了，去找下面的武士吧。他们可没我这样好讲话了，自己小心。",1,"结束对话/no")
	else
		if ( GetSex() == 0 ) then
			Describe(DescLink_XiaoDing.."：哎，哎哎，哎哎哎……我冤哪？号称采花公子，却一朵花都没采过。刚在江湖闯出名头，就被长歌门硬行收入门里，过着暗无天日，练功习武的日子。大侠，帅哥，你一定要救我出去啊！",1,"结束对话/no")
		else
			Describe(DescLink_XiaoDing.."：哎，哎哎，哎哎哎……我冤哪？号称采花公子，却一朵花都没采过。刚在江湖闯出名头，就被长歌门硬行收入门里，过着暗无天日，练功习武的日子。美女，姐姐，你一定要救我出去啊！",1,"结束对话/no")
		end
	end
	
end

function xiaoding_taskproblem()
	--调用公共问题库，回答正确数要求为3，问题为问题1~问题20随机，玩家问答峰值为20次，完成回答后将1232号变量字节5置1
	partner_edu(3,1,29,3,1232,5,1,8)
end

function xiaoding_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,430,1 )                   			--给当前同伴增加经验，+430
		nt_setTask(1232,SetBit(GetTask(1232),6,1))  --发奖完毕
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end
----------------------------------------------------------可爱女侠云雀儿对话---------------------------------------------
function pe_yunqueer()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务卢青任务变量
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),7) ~= 1 ) then
		Describe(DescLink_YunQueEr.."：哈哈，你跟死杀猪的那个猪头三说过话没？他是不是让你猜生肖的大小？这个没读过书的。本小姐自幼就熟读四书五经，哪里是他可以相比。我们来玩高级的猜枚游戏：石头剪子布。哼哼......你输了一样是要回答本小姐提的问题，怎么样？",3,
		"开始吧/yunqueer_wenti",
		"给我讲解一下规则/yunqueer_guize",
		"稍后再来找你吧/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),7) == 1 ) and ( GetBit(GetTask(1232),8) == 0 ) then
		Describe(DescLink_YunQueEr.."：好吧，我把我这里的奖励给你。",2,"领取奖励/yunqueer_giveprize","稍后再来/no")   --领取奖励？？？？？？？？？
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then
		Describe(DescLink_YunQueEr.."：你已经完成在我们四个人这里的修行了，药草拿好回去找卢青老头吧。",1,"结束对话/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),8) == 1 ) then
		Describe(DescLink_YunQueEr.."：恩，我这一关你已经通过了，去找下面的武士吧。他们可没我这样好讲话了，自己小心。",1,"结束对话/no")
	else
		if ( GetSex() == 0 ) then
			Describe(DescLink_YunQueEr.."：嘻嘻，我在和树上的鸟儿说话呢。你能听懂它们说什么吗？它们说这里很美，有漫山的云霞，还有比云霞更漂亮的云雀儿呢。哥哥带我出去玩嘛，好不好？",1,"结束对话/no")
		else
			Describe(DescLink_YunQueEr.."：嘻嘻，我在和树上的鸟儿说话呢。你能听懂它们说什么吗？它们说这里很美，有漫山的云霞，还有比云霞更漂亮的云雀儿呢。姐姐带我出去玩嘛，好不好？",1,"结束对话/no")
		end
	end
end

function yunqueer_guize()
	Describe(DescLink_YunQueEr.."：规则是这样滴：石头剪子布呢，石头赢剪子，剪子赢布，布赢石头。懂了没？你赢了我就过关，没赢我或者打成平手，比如你出剪子我也出剪子，那也算我赢。哼哼。不过我赢了也不为难你，答对我三道题目就好嘛。",1,"我要返回上一层菜单/pe_yunqueer")
end

function yunqueer_wenti()
	Describe(DescLink_YunQueEr.."： 来来来，开始划拳咯。你出什么？",3,
	"石头/yunqueer_shitou",
	"剪子/yunqueer_jianzi",
	"布/yunqueer_bu")
end

function yunqueer_shitou()
	local i = random(1,3)
	if ( i ~= 2 ) then
		Describe(DescLink_YunQueEr.."：我出"..partner_caimei[i]..",哎呀！我赢啦，嘻嘻，回答问题吧",1,"好嘛，回答问题嘛/yunqueer_problem")
	else
		Describe(DescLink_YunQueEr.."：我出"..partner_caimei[i]..",哎呀！被你赢啦，好吧。算你过啦。",1,"好嘛，算你过关了/yunqueer_finish")
	end
end

function yunqueer_jianzi()
	local i = random(1,3)
	if ( i ~= 3 ) then
		Describe(DescLink_YunQueEr.."：我出"..partner_caimei[i]..",哎呀！我赢啦，嘻嘻，回答问题吧",1,"好嘛，回答问题嘛/yunqueer_problem")
	else
		Describe(DescLink_YunQueEr.."：我出"..partner_caimei[i]..",哎呀！被你赢啦，好吧。算你过啦。",1,"好嘛，算你过关了/yunqueer_finish")
	end
end

function yunqueer_bu()
	local i = random(1,3)
	if ( i ~= 1 ) then
		Describe(DescLink_YunQueEr.."：我出"..partner_caimei[i]..",哎呀！我赢啦，嘻嘻，回答问题吧",1,"好嘛，回答问题嘛/yunqueer_problem")
	else
		Describe(DescLink_YunQueEr.."：我出"..partner_caimei[i]..",哎呀！被你赢啦，好吧。算你过啦。",1,"好嘛，算你过关了/yunqueer_finish")
	end
end

function yunqueer_problem()
	--调用公共问题库，回答正确数要求为3，问题为问题1~问题20随机，玩家问答峰值为100次，不设置完成字节
	if  ( partner_edu(3,1,29,3,0) == 10 ) then
		Msg2Player("好，再接再厉，猜枚吧。嘻嘻。")
	else
		Msg2Player("输了也不要气馁，继续猜嘛。嘻嘻。")
	end
end

function yunqueer_finish()
	if ( nt_getTask(1226) == 10 ) and ( nt_getTask(1227) == 10 ) and ( GetBit(GetTask(1232),7) == 0 ) then
		nt_setTask(1232,SetBit(GetTask(1232),7,1))  --云雀儿处任务完成，但未领取奖励
		yunqueer_giveprize()
	end
end


function yunqueer_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,430,1 )                   			--给当前同伴增加经验，+430
		nt_setTask(1232,SetBit(GetTask(1232),8,1))  --发奖完毕
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end



-----------------------------------------------------------------唐影对话-----------------------------------------------------

function pe_tangying()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务卢青任务变量
	local Uworld1228 = nt_getTask(1228)                        --同伴教育任务唐影任务变量
	local Uworld1229 = nt_getTask(1229)                        --同伴教育任务白煞任务变量
	local Uworld1230 = nt_getTask(1230)                        --同伴教育任务黑煞任务变量
	local Uworld1231 = nt_getTask(1231)                        --同伴教育任务秋衣水任务变量
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_TangYing.."：我们几个人的教育都结束了。你现在可以去找剑皇徒弟了。",1,"结束对话/no")	
	elseif ( partner_getpartnerlevel(4) ~= 10  ) then
		return
	elseif ( Uworld1226 == 10 ) and ( Uworld1228 == 0 ) then  	   --唐影处任务没有触发？？？？？没有把任务奖励告诉玩家
		Describe(DescLink_TangYing.."：哎，这可怎么办呢？秋衣这孩子太不听话了。<enter>"
		.."哦，你是剑皇徒弟介绍来的。那好吧，我的儿子唐秋衣被镇子上一个怪人掳走了，我现在又忙着采制一种奇特药材，希望你能替我把秋衣救出来,必有回报。那个怪人就在右边悬崖那里设置了一条看不到路的空中栈道，你需要找到这条路，并且救出我的儿子。那条路所在的悬崖边上会有一颗奇怪的树。路上有许多空中石山，每座山上都要开启一个机关，机关人会问你些问题。总之非常不容易，你要小心啊。<enter>"
		.."<color=green>任务奖励：同伴技能'百毒不侵'、'真火抗力'<color>",2,
		"我接受挑战/tangying_findchildren",
		"我还没做好准备呢/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1228 == 8191 ) then
		Describe(DescLink_TangYing.."：秋衣等下就回来吗？太好了！谢谢你。好了，我再告诉你一些窍门吧：<enter>"
		.."<color=yellow>当你处于主动攻击状态且敌人在同伴的行动范围内时，如果是勇猛型、流氓型、懦弱型的同伴，便会自动攻击它，根据同伴的不同性格他的行动范围跟攻击方式也会不一样。当你不想让你的同伴去攻击敌人的时候，你只要在同伴的快捷栏里找到“仅跟随”按钮然后左键单击它就可以了。如果你想让你的同伴再次攻击敌人的话，那你就需要在同伴的快捷栏里找到“主动攻击”按钮并点击它。不想要这个同伴时，我要如何解散他呢？你首先要在同伴属性界面找到解散同伴按钮，左键点击后系统会向你确认是否真的要解散同伴，这时你点选“是”的话就可以把当前同伴解散了。<color><enter>"
		.."好了，在我这里你已经学不到更多的东西，去找其他人吧。秋衣水是我的老婆，你见到她时小心点，千万别告诉她儿子丢过啊，不然晚上我会被关在门口的。拜托拜托。",2,"领取奖励/tangying_getprize","稍后再来/no")
		
	elseif ( Uworld1226 == 10 ) and ( GetBit(GetTask(1228),1) == 1  ) then  --刚接到唐影处任务
		Describe(DescLink_TangYing.."：去<color=red>右边悬崖<color>那里找到一条<color=red>小路<color>，通过机关人阵，把我孩子从那个死怪物卓非凡手里救出来。",1,
		"结束对话/no")	
	else
		Describe(DescLink_TangYing.."：听说现在唐门掌门是唐仇？这孩子心性狭窄气量有限，怎么做得巴蜀第一家的主呢？或许前代掌门是看穿了乱世，故意选个不思进取之辈守家吧。说起来当年若不是南宫少侠成全，如今我唐影早已是枯骨一具。有些事你不能不争，却又争无可争，可见世上命运一道，终究存着个侥幸……希望天佑我唐家堡度过这些风烟吧。<enter>",1,"结束对话/no")
	end
	
end

function tangying_findchildren()
	nt_setTask(1228,SetBit(GetTask(1228),1,1))  --任务启动
	Msg2Player("唐影让你去右边一个神秘的通道里救出他的儿子唐秋衣。")
end

function tangying_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddSkill(partnerindex,0,550,1)                          --增加同伴抗性技能《百毒不侵》
		Msg2Player("恭喜你获得了同伴技能《百毒不侵》")
		nt_setTask(1228,20)
		Msg2Player("你已经完成在唐影处的学习，可以去黑白双煞，秋衣水，卢青那里瞧瞧。")
	end
end

----------------------------------------------------------------机关人对话--------------------------------------------------

function pe_jiguan1()
	if ( GetBit(GetTask(1228),1) == 1 ) and  ( GetBit(GetTask(1228),2) == 0 ) then 
		Describe(DescLink_JiGuanRen.."：此山是俺机关老大开<enter>"
		.."            此树是俺机关老大栽<enter>"
		.."            要想打俺机关老大这过<enter>"
		.."            就得给俺机关老大整明白<enter>"
		.."            要问咋过太简单了。回答俺机关老大几道弄不懂的方言题目，答不上来就要惩罚你！",2,
		"简单啊，我来回答/jiguanren_problem1",
		"搞什么，先不理你了/no")
	elseif ( GetBit(GetTask(1228),2) == 1 ) and ( GetBit(GetTask(1228),3) == 0 ) then 
		Describe(DescLink_JiGuanRen.."：好吧，我把我这里的奖励给你。",2,"领取奖励/jiguan1_giveprize","稍后再来/no")   --领取奖励？？？？？？？？？
	else
		Describe(DescLink_JiGuanRen.."：我是一个机关人，咿呀咿呀哦。",1,"你是啥机关人啊，你是个疯子/no")
	end
end

function pe_jiguan2()
	if ( GetBit(GetTask(1228),1) == 1 ) and  ( GetBit(GetTask(1228),4) == 0 ) then 
		Describe(DescLink_JiGuanRen.."：此山为我机关老，啊老，啊老老二开<enter>"
		.."            此树为我机关老啊，老啊，老二栽<enter>"
		.."            要想打我机关老二这过<enter>"
		.."            就得给我机关老二，啊二，啊弄明白<enter>"
		.."            要问咋过太简单了。回答我机关老二几道弄不懂的方言题目，答不上来就要惩罚你！",2,
		"简单啊，我来回答/jiguanren_problem2",
		"搞什么，先不理你了/no")
	elseif ( GetBit(GetTask(1228),4) == 1 ) and ( GetBit(GetTask(1228),5) == 0 ) then 
		Describe(DescLink_JiGuanRen.."：好吧，我把我这里的奖励给你。",2,"领取奖励/jiguan2_giveprize","稍后再来/no")   --领取奖励？？？？？？？？？
	else
		Describe(DescLink_JiGuanRen.."：我是一个机关人，咿呀咿呀哦。",1,"你是啥机关人啊，你是个疯子/no")
	end
end

function pe_jiguan3()
	if ( GetBit(GetTask(1228),1) == 1 ) and  ( GetBit(GetTask(1228),6) == 0 ) then 
		Describe(DescLink_JiGuanRen.."：此山是机关老三开<enter>"
		.."            此树是机关老三种滴<enter>"
		.."            要想打俺机关老三这过<enter>"
		.."            就得给我机关老三答明白<enter>"
		.."            要问咋过太简单了。回答机关老三几道弄不懂的方言题目，答不上来就要惩罚你！",2,
		"简单啊，我来回答/jiguanren_problem3",
		"搞什么，先不理你了/no")
	elseif ( GetBit(GetTask(1228),6) == 1 ) and ( GetBit(GetTask(1228),7) == 0 ) then 
		Describe(DescLink_JiGuanRen.."：好吧，我把我这里的奖励给你。",2,"领取奖励/jiguan3_giveprize","稍后再来/no")   --领取奖励？？？？？？？？？
	else
		Describe(DescLink_JiGuanRen.."：我是一个机关人，咿呀咿呀哦。",1,"你是啥机关人啊，你是个疯子/no")
	end
end

function pe_jiguan4()
	if  ( GetBit(GetTask(1228),1) == 1 ) and  ( GetBit(GetTask(1228),8) == 0 ) then 
		Describe(DescLink_JiGuanRen.."：此山是俺机关老四开<enter>"
		.."            此树是俺机关老四栽<enter>"
		.."            要想打俺机关老四这过<enter>"
		.."            就得给俺机关老四整明白<enter>"
		.."            要问咋过太简单了。回答俺机关老大几道弄不懂的方言题目，答不上来就要惩罚你！",2,
		"简单啊，我来回答/jiguanren_problem4",
		"搞什么，先不理你了/no")
	elseif ( GetBit(GetTask(1228),8) == 1 ) and ( GetBit(GetTask(1228),9) == 0 ) then 
		Describe(DescLink_JiGuanRen.."：好吧，我把我这里的奖励给你。",2,"领取奖励/jiguan4_giveprize","稍后再来/no")   --领取奖励？？？？？？？？？
	else
		Describe(DescLink_JiGuanRen.."：我是一个机关人，咿呀咿呀哦。",1,"你是啥机关人啊，你是个疯子/no")
	end
end

function jiguanren_problem1()
	--调用公共问题库，回答正确数要求为2，问题为问题101~问题118随机，玩家问答峰值为2次，回答正确将1228第2位置1。如果回答不正确，调用partner_keeponproblem[1]
	partner_edu(2,101,118,2,1228,2,1,1) 
end

function jiguanren_problem2()
	--调用公共问题库，回答正确数要求为2，问题为问题101~问题118随机，玩家问答峰值为2次，回答正确将1228第4位置1。如果回答不正确，调用partner_keeponproblem[2]
	partner_edu(2,101,118,2,1228,4,1,2)
end

function jiguanren_problem3()
	--调用公共问题库，回答正确数要求为2，问题为问题101~问题118随机，玩家问答峰值为2次，回答正确将1228第6位置1。如果回答不正确，调用partner_keeponproblem[3]
	partner_edu(2,101,118,2,1228,6,1,3) 
end

function jiguanren_problem4()
	--调用公共问题库，回答正确数要求为2，问题为问题101~问题118随机，玩家问答峰值为2次，回答正确将1228第8位置1。如果回答不正确，调用partner_keeponproblem[4]
	partner_edu(2,101,118,2,1228,8,1,4) 
end

function jiguan1_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		nt_setTask(1228,SetBit(GetTask(1228),3,1))  --发奖完毕
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end

function jiguan2_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		nt_setTask(1228,SetBit(GetTask(1228),5,1))  --发奖完毕
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end

function jiguan3_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		nt_setTask(1228,SetBit(GetTask(1228),7,1))  --发奖完毕
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end

function jiguan4_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		nt_setTask(1228,SetBit(GetTask(1228),9,1))  --发奖完毕
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end

-----------------------------------------------------------------卓非凡对话---------------------------------------------------

function pe_zhuofeifan()
	if ( nt_getTask(1228) == 511 ) then
		Describe(DescLink_ZhuoFeiFan.."：哈哈！一剑落叶枫，走马江湖泪。我卓非凡当年也是武林中一等一的高手。什么？我是谁？对啊，我是谁啊，我，我是谁？哎呀，不管啦。你要救那个红孩儿？他是牛魔王的儿子，放不得的。啊！我想起来了，我是齐天大圣，哈哈哈，上天入地神魔第一的美猴王啊。恩，既然你一定要救他，我美猴王当然要给你一个机会，来来来，答我<color=red>五道<color>问题来。",2,
		"来就来/zhuofeifan_problem",
		"这卓非凡病得好重，我还是稍后再来吧/no")
	elseif ( GetBit(GetTask(1228),11) == 1 )then
		Describe(DescLink_ZhuoFeiFan.."：你来找个叫唐秋衣的小孩？糖什么衣啊，没听过。你看看山后那个孩子是不是你要找的。滚蛋滚蛋。",1,"结束对话/no")
	elseif ( GetBit(GetTask(1228),10) == 1 ) and ( GetBit(GetTask(1228),11) == 0 ) then 
		Describe(DescLink_ZhuoFeiFan.."：哼哼，今天我心情好，只问你问题。否则绝对把你同伴打死，嘿嘿。<color=yellow>你知道会有什么惩罚吗？同伴不会死但是当同伴的生命值为0时则进入昏迷状态，自动退出战斗，要经过5分钟后才能再次召唤，并且同伴结束昏迷状态后，生命值恢复为最大值的100%。现在知道了吧。<color>好啦，我把我这里的奖励给你。",2,"领取奖励/zhuofeifan_giveprize","稍后再来/no")   --领取奖励？？？？？？？？？
	else
		Describe(DescLink_ZhuoFeiFan.."：我是齐天大圣，哈哈哈。卓非凡？卓非凡是谁？",1,"在他的身上也许发生了什么事情/no")
	end
end

function zhuofeifan_problem()
	--调用公共问题库，回答正确数要求为2，问题为问题101~问题118随机，玩家问答峰值为2次，回答正确将1228第4位置1。如果回答不正确，调用partner_keeponproblem[2]
	partner_edu(5,101,118,5,1228,10,1,5)
end

function zhuofeifan_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		PARTNER_AddSkill(partnerindex,0,552,1)                          --增加同伴抗性技能《真火抗力》
		Msg2Player("恭喜你获得了同伴技能《真火抗力》")
		nt_setTask(1228,SetBit(GetTask(1228),11,1))  --发奖完毕
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end


-----------------------------------------------------------------唐秋衣--------------------------------------------------------

function pe_tangqiuyi()
	
	if ( ( GetBit(GetTask(1228),12) == 1 )  and ( GetBit(GetTask(1228),13) == 0 ) ) then
		Describe(DescLink_TangQiuYi.."：恩恩，给你些东西玩吧。",2,"领取奖励/tangqiuyi_giveprize","稍后再来/no")
	elseif  ( GetBit(GetTask(1228),11) == 1 ) and ( GetBit(GetTask(1228),12) == 0 )  then 
		if ( GetSex() == 0 ) then
			Describe(DescLink_TangQiuYi.."：啊，卓叔叔不陪秋衣玩啦，唔......扫兴。好吧，大哥哥我马上回去。你可以回去告诉我父亲了。<color=red>再跟我对话我送你一些东西哦。<color>",1,"结束对话/tangqiuyi_finish")
		else
			Describe(DescLink_TangQiuYi.."：啊，卓叔叔不陪秋衣玩啦，唔......扫兴。好吧，大姐姐我马上回去。你可以回去告诉我父亲了。<color=red>再跟我对话我送你一些东西哦。<color>",1,"结束对话/tangqiuyi_finish")		
		end
	elseif ( GetBit(GetTask(1228),13) == 1 ) then
	  	if ( GetSex() == 0 ) then
			Describe(DescLink_TangQiuYi.."：啊，卓叔叔不陪秋衣玩啦，唔......扫兴。好吧，大哥哥我马上回去。你可以回去告诉我父亲了。",1,"结束对话/tangqiuyi_finish")
		else
			Describe(DescLink_TangQiuYi.."：啊，卓叔叔不陪秋衣玩啦，唔......扫兴。好吧，大姐姐我马上回去。你可以回去告诉我父亲了。",1,"结束对话/tangqiuyi_finish")		
		end
	else
		Describe(DescLink_TangQiuYi.."：卓叔叔说带我去天上见嫦娥姐姐呢，你不要吵啦，我不会跟你走的。你要说跟卓叔叔说去。",1,"结束对话/no")
	end
end

function tangqiuyi_finish()
	nt_setTask(1228,SetBit(GetTask(1228),12,1))  --唐秋衣处任务完成
end

function tangqiuyi_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		nt_setTask(1228,SetBit(GetTask(1228),13,1))  --发奖完毕
	end
end










-----------------------------------------------------------------白煞对话------------------------------------------------------
function pe_baisha()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务卢青任务变量
	local Uworld1228 = nt_getTask(1228)                        --同伴教育任务唐影任务变量
	local Uworld1229 = nt_getTask(1229)                        --同伴教育任务白煞任务变量
	local Uworld1230 = nt_getTask(1230)                        --同伴教育任务黑煞任务变量
	local Uworld1231 = nt_getTask(1231)                        --同伴教育任务秋衣水任务变量
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_BaiSha.."：我们几个人的教育都结束了。你现在可以去找剑皇徒弟了。",1,"结束对话/no")	
	elseif ( partner_getpartnerlevel(6) ~= 10  ) then
		return
	elseif ( Uworld1226 == 10 ) and ( Uworld1229 == 0 ) then  	   --白煞处任务没有触发？？？？？没有把任务奖励告诉玩家
		Describe(DescLink_BaiSha.."：葡萄美酒月光杯<enter>"
		.."      欲饮琵琶马上催<enter>"
		.."      醉卧沙场君莫笑<enter>"
		.."      古来征战几人回<enter>"
		.."年轻的时候总爱做梦，学古人饮马长江，一把孤剑一架二胡就跑去北塞看大漠的落日。可惜那些江湖的风雨没碰上我，再转眼人也老咯。江湖是你们年轻人的了，既然是剑皇弟子让你来，我终归不能叫你空手回去的。在这<color=red>云中镇的南方<color>有两处地方，分别唤做<color=red>三道士塔，谢寡妇牌坊<color>。我有两个不成器的徒弟在那里隐居，你去找他们，自会问些问题责难你。若你能过得了这两关，我这里的东西也就学得差不多了。<enter>"
		.."<color=green>任务奖励：同伴技能'冰雪初融'<color>",2,
		"好啊，那我们现在开始吧/baisha_starttask",
		"结束对话/no")
		
	elseif ( Uworld1226 == 10 ) and ( GetBit(GetTask(1229),3) == 1) and ( GetBit(GetTask(1229),5) == 1 )  and ( nt_getTask(1229) ~= 20 )then  --任务已完成
	
		Describe(DescLink_BaiSha.."：好吧，我再告诉你一些窍门：<enter>"
		.."同伴的以下属性是拥有资质的：<color=red>生命，力量，命中，闪避，跑速，幸运<color>；一个属性的资质越高意味着该属性在升级时提升得越多，不过具体提升多少，<color=red>同一资质<color>的人也会有<color=red>少许不同<color>。比如说你有两个同伴生命的资质都是2，那在他们升级的时候可能一个提升了50点生命值，而另一个只提升了45点生命值。这些具体提升的数值在同伴<color=red>10级、30级、50级、90级时会出现一些波动。<color><enter>"
		.."好了，在我这里你已经学不到更多的东西，去找其他人吧。我兄弟黑煞可不是盖得，牛得相当。你跟他说话时候嗓门千万别太大，他现在还在惦记着老主人张如梦先生和南宫小姐呢。",2,"领取奖励/baisha_getprize","稍后再来/no")
		
	elseif ( Uworld1226 == 10 ) and ( GetBit(GetTask(1229),1 ) == 1 ) then  --刚接到白煞处任务
		Describe(DescLink_BaiSha.."：在这云中镇的南方有两处地方，分别唤做三道士塔，谢寡妇牌坊。我有两个不成器的徒弟在那里隐居，你去找他们，自会问些问题责难你。若你能过得了这两关，我这里的东西也就学得差不多了",1,
		"结束对话/no")	
	else
		Describe(DescLink_BaiSha.."：你还来这里做什么？闯荡江湖？寻找同伴？你又知道江湖是什么呢。老人说一入江湖岁月催，催的不只是人命，还有你的心啊。罢了，说与你听又有何用？要闯的，终归得自己闯过才明白。有些事和这云中的雪一般年年飘过。我的心也已经僵死了。<enter>",1,"结束对话/no")
	end
   
end

function baisha_starttask()
	nt_setTask(1229,SetBit(GetTask(1229),1,1))  
	Msg2Player("白煞让你去云中镇南面的三道士塔和谢寡妇牌坊找他的两位徒弟。")
end

function baisha_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddSkill(partnerindex,0,551,1)                          --增加同伴抗性技能《冰雪初融》
		Msg2Player("恭喜你获得了同伴技能《冰雪初融》")
		nt_setTask(1229,20)
		Msg2Player("白煞没有什么可以教你的了，去黑煞，唐影、秋衣水夫妇，和卢青那里看看吧。")
	end
end

---------------------------------------------------------------男弟子门神曲万-------------------------------------------------

function pe_menshenquwan()
	if ( GetBit(GetTask(1229),1) == 1  ) and ( GetBit(GetTask(1229),2) == 0 ) then
		Describe(DescLink_QuWan.."：你是师傅他老人家介绍来的。好吧，我且先告诉你一些要点：<enter>"
		.."	<color=red>五行属性<color>：<color=yellow>显示该同伴的五行，不同五行的同伴所能拥有的武功跟绝技不同，同时有一部份的附加技能也会有五行的限制；<color><enter>"
    	.."	<color=red>资质<color>：<color=yellow>决定同伴的属性在升级时所能提升多少的值。<color><enter>"
		.." <color=red>精力<color>：<color=yellow>神秘潜质，日后开放；<color><enter>"
        .." <color=red>性格<color>：<color=yellow>该同伴的性格，不同性格的同伴行为方式也会不同；现有的性格类型有：<color><enter>"
		.."	  <color=red>勇猛型<color>：<color=yellow>会攻击离他最近的对手，并不考虑自身损伤，拥有比较远的行动范围。<color><enter>"
		.."	  <color=red>卫主型<color>：<color=yellow>玩家攻击目标或被攻击时，同伴会予以协助，并不考虑自身损伤，一般在玩家附近。<color><enter>"
		.."	  <color=red>流氓型<color>：<color=yellow>会攻击血少的对手，当自身血少于20%时边跑边打。<color><enter>"
		.."	  <color=red>懦弱型<color>：<color=yellow>会随机攻击对手，受到攻击时会边跑边打，生命少于20%时会更多的闪躲。<color><enter>"
    	.."好啦，弄清楚这些以后，你来回答我<color=red>三个<color>问题，答对了才可以过我这关。",2,"回答问题/quwan_problem","先准备一下吧/no")
    elseif ( GetBit(GetTask(1229),1 ) == 1  ) and ( GetBit(GetTask(1229),2) == 1) and ( GetBit(GetTask(1229),3) ~= 1)  then
    	Describe(DescLink_QuWan.."：好啦，你在我这里的学习已经过关了。领取你的奖励吧。",2,"领取奖励/quwan_getprize","稍后再来/no")
    elseif ( GetBit(GetTask(1229),3) == 1) and ( GetBit(GetTask(1229),5) == 1 )  then
    	Describe(DescLink_QuWan.."：好啦，你从我和清儿这里都学不到更多的东西了。回去找师傅他老人家吧。",1,"结束对话/no")
    else
    	Describe(DescLink_QuWan.."：我潜心在这塔里寻找上古的宝贝鬼镜，许久没回去找过师傅了。你见到他老人家，请代我问好。还有清儿......她,哎，算了，你走吧。",1,"结束对话/no")
    end
end

function quwan_problem()
	partner_edu(3,30,66,3,1229,2,1,9)
end

function quwan_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,2100,1)                   			--给当前同伴增加经验，+2100
		nt_setTask(1229,SetBit(GetTask(1229),3,1))  
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end

--------------------------------------------------------------- 女弟子谢清儿--------------------------------------------------

function pe_xieqinger()
	if ( GetBit(GetTask(1229),1) == 1) and ( GetBit(GetTask(1229),4) == 0) then
		Describe(DescLink_XieQingEr.."：哎，娘啊，让女儿下来陪你吧。<enter>"
		.."你是什么人？哦，是师傅他老人家让你来的。好吧，你且回答对我三个问题。<enter>",2,"回答问题/xieqinger_problem","先准备一下吧/no")
    elseif ( GetBit(GetTask(1229),1 ) == 1  ) and ( GetBit(GetTask(1229),4) == 1) and ( GetBit(GetTask(1229),5) ~= 1)  then
    	Describe(DescLink_XieQingEr.."：你在我这里的学习已经过关了。领取你的奖励吧。",2,"领取奖励/xieqinger_getprize","稍后再来/no")
    elseif ( GetBit(GetTask(1229),3) == 1) and ( GetBit(GetTask(1229),5) == 1 )  then
    	Describe(DescLink_XieQingEr.."：你从我和师兄这里都学不到更多的东西了。回去找师傅他老人家吧。",1,"结束对话/no")
    else
    	Describe(DescLink_XieQingEr.."：是的，我娘是个寡妇，这难道就是那些男人欺负我的理由吗？这些年如果没有师傅，师兄，我也过不下去了的。",1,"结束对话/no")
    end
end

function xieqinger_problem()
	partner_edu(3,30,66,3,1229,4,1,10)
end

function xieqinger_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,2100,1)                   			--给当前同伴增加经验，+2100
		nt_setTask(1229,SetBit(GetTask(1229),5,1))  
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end

-----------------------------------------------------------------黑煞对话-----------------------------------------------------
function pe_heisha()

	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务卢青任务变量
	local Uworld1228 = nt_getTask(1228)                        --同伴教育任务唐影任务变量
	local Uworld1229 = nt_getTask(1229)                        --同伴教育任务白煞任务变量
	local Uworld1230 = nt_getTask(1230)                        --同伴教育任务黑煞任务变量
	local Uworld1231 = nt_getTask(1231)                        --同伴教育任务秋衣水任务变量
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_HeiSha.."：我们几个人的教育都结束了。你现在可以去找剑皇徒弟了。",1,"结束对话/no")
	elseif ( partner_getpartnerlevel(7) ~= 10  ) then
		return
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 0 ) then  	   --黑煞处任务没有触发？？？？？没有把任务奖励告诉玩家
		Describe(DescLink_HeiSha.."：如果老子早生几年，早就上阵去杀光金狗报效家国了，哪里轮到你们这帮小鬼。现在老咯，只能培养些好武士，也算为国家出一份力，赎赎年轻时候犯的过错吧。<enter>"
		.."剑皇徒弟？那个贼小子，又来赚老夫的便宜。你既然来了，总不能让你空手回去的。他是想让你的同伴来学老夫的绝技：<color=red>南冥三段击<color>。要学可以，老夫这路武功招数变化多端，每一招都藏了无穷种变化，暗合星图。你要学的话只能将三段击分拆成三个层次，逐层教给你。学是不学？<enter>"
		.."<color=green>任务奖励：同伴技能'南冥三段击'<color>",2,
		"当然要学/heisha_starttask",
		"结束对话/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 10 ) then  --刚接到黑煞处任务
		Describe(DescLink_HeiSha.."：去找老夫的徒弟们对话呀，你咋凭地蠢呢？",1,
		"结束对话/no")	
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 12 )  then  --学习三段击任务已完成
		Describe(DescLink_HeiSha.."：恩，技能都已经熟悉了吧。好啦，我再告诉你一些窍门，同伴的技能分为下列几种：<enter>"
		.." <color=yellow>a)	武功技能：同伴用来攻击敌人的招式，通过升级获得；<enter>"
		.."	b)	五防技能：对普冰雷火毒五种抗性进行加成的技能，通过做教育任务获得；<enter>"
		.."	c)	附加技能：各种加成和辅助以及一些特殊的技能，通过技能书和剧情任务获得；<enter>"
		.."	d)	绝技：通过剧情任务获得；<enter>"
		.."好了，也辛苦你了。现在就教育给你正在做教育任务的同伴南冥三段击！<color>",2,"领取奖励/heisha_giveprize1","稍后再来/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 13 )  then  --已经学到了三段击，开始下个阶段的教育
		Describe(DescLink_HeiSha.."：好啦，南冥三段击已经教给你了，那么你知道接下来要如何使用这个附加技能中的攻击技能吗？让我来告诉你。<enter>"
		.."<color=yellow>在武功技能栏的下方有五个出招格，每一格代表着该同伴有20%的几率会使用格里的技能，格内可放入该同伴所能使出的任意主动技能。比如：该同伴的出招格里放了三个“技能A”和两个“技能B”那么该同伴使出“技能A”的几率是就是60%，使出“技能B” 的几率是就是40%。<color><enter>"
		.."怎么样，现在知道了吧。现在去里面的沙袋那里练习一下攻击方法吧。稍后再来找我。<color=red>记住，你必须自己亲自去打，你的同伴在教育任务中，他还没有完全练成功夫，击打沙袋是无效的。<color><enter>",1,"结束对话/heisha_starttask3")  
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 14 )  then      
		 Describe(DescLink_HeiSha.."：现在去里面的沙袋那里练习一下攻击方法吧。稍后再来找我。<enter>",1,"结束对话/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 15 )  then  --沙袋已打击完，要发放奖励
		Describe(DescLink_HeiSha.."：哦？沙袋也击打完了吗。很好，现在奖励给你一本南冥三段击的三级技能书。得到奖励后再与我对话，我还有话讲。",2,"领取奖励/heisha_giveprize2","稍后再来/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 16 )  then  --已经获得了三段击的技能书
		Describe(DescLink_HeiSha.."：<color=yellow>现在教你最后一点东西。同伴的武功技能是用熟练度来升级的，而其它的技能全部要通过使用相应的技能书来提升。这里需要注意一点，如果附加技能有武功技能，那么需要通过使用技能书提升等级而非熟练度。技能书的提升规则是：你只能学习比你要提升的技能当前等级高1级的技能书。比如；现有技能为6级，你只能学习7级的该技能书把该技能提升到7级，不能越级学习。<color><enter>"
		.."好啦，我这里已经没什么可教给你的了。多保重，去其他人那里瞧瞧吧。",1,"结束对话/heisha_finishtask")
	else
		Describe(DescLink_HeiSha.."：辣块妈妈，老主人夫妻死在大漠那年，老子就搬到这云中小镇里过淡得出鸟的日子了。听说飞云儿被狗日的金国天忍贼一掌打下了山崖，当时哭得那个伤心哪。最近又听说他没死，还当了什么鸟武林客栈的头目，咳，这孩子也不来看看俺，他黑叔叔也年纪一大把啦。想当年扛着他赶狼时候笑得跟只小鸡似的，现在再扛恐怕得压垮俺肩膀咯。<enter>",1,"结束对话/no")
	end
   
end

function heisha_starttask()
	Describe(DescLink_HeiSha.."：好！老爷子我就是喜欢爽快人。在我身后这片校武场里有二十名精锐武士正在修行，他们之中<color=red>有一个人<color>的身上带着老夫的三段击秘籍。你把那个人<color=red>找出来<color>，拿到秘籍来找我，我就教给你星空之南冥三段击。你看到可疑的就与他对话，探听虚实，总能找到的。",1,"结束对话/heisha_starttask2")
end

function heisha_starttask2()
	local Uworld1235 = random(10,20)
	nt_setTask(1235,Uworld1235)
	nt_setTask(1230,10)
	Msg2Player("老爷子让你从校武场找出携带他秘籍的徒弟来。")
end

function heisha_starttask3()
	Msg2Player("老爷子让你在校武场里打沙袋。看来不打一定次数是交不了差了。")
	nt_setTask(1230,14)  --第2阶段打沙袋
end

function heisha_giveprize1()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddSkill(partnerindex,2,621,2)                          --增加同伴附加技能《南冥三段击》
		Msg2Player("恭喜你获得了同伴技能《南冥三段击》")
		nt_setTask(1230,13)   
		Msg2Player("你获得了南冥三段击。可以再与老爷子对话了。")
	end
end

function heisha_giveprize2()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		AddItem(6,1,884,3,0,0)												--增加同伴附加技能《南冥三段击》
		Msg2Player("恭喜你获得了同伴技能《南冥三段击》的第3级技能书")
		PARTNER_AddExp(partnerindex,2600,1)                   			--给当前同伴增加经验，+2600
		nt_setTask(1230,16)     
		Msg2Player("你获得了南冥三段击的3级技能书。可以再与老爷子对话了。")
	end
end

function heisha_finishtask()
	nt_setTask(1230,20)
	Msg2Player("你已经完成在黑煞处的学习，可以去白煞，唐影、秋衣水夫妇和卢青那里瞧瞧。")
end

-----------------------------------------------------------黑煞弟子-----------------------------------------------------

function pe_heishadizi()
	local Uworld1226 = nt_getTask(1226)
	local Uworld1230 = nt_getTask(1230)
	if ( Uworld1226 == 10 ) and ( Uworld1230 == 11 ) then
		Describe(DescLink_HeiShaDizi.."：好的，给你一份小小的意思。",1,"发放奖励/heishadizi_giveprize")
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 10 ) then
		Describe(DescLink_HeiShaDizi.."：哦，我师父让你来找秘籍。你能找上我那是看得起我，要不告诉你我身上有没有那我还算高人嘛。当然啦，我又不能轻易告诉你，那样我还算高人嘛，所以呢，你需要回答对我这里<color=red>一道<color>题目。我就告诉你我到底<color=red>有没有掌握秘籍！<color>",2,
		"你这人怎么这么多名堂啊，好吧开始问吧/heishadizi_problem",
		"鬼才信你，我不需要知道你是不是/no"	)
	else
		Describe(DescLink_HeiShaDizi.."：朋友，请走开一些。我们在此练习上乘武术，当心误伤了你。",1,"结束对话/no")
	end
end

function heishadizi_problem()
	partner_edu(1,76,91,1,0,0,1,6) 
end

function heishadizi_geiyujiangli()
	nt_setTask(1230,11)
	Msg2Player("无论你与任何一个黑煞弟子对话，都将得到一份小奖励。")
end

function heishadizi_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,1500,1)                   			--给当前同伴增加经验，+1000
		nt_setTask(1230,10)
	end
end

function heishadizi_chenggong()
	nt_setTask(1230,12)
	Msg2Player("你可以回去找黑煞学习南冥三段击了。")
end

---------------------------------------------------------校武场沙袋对话--------------------------------------------------

function pe_wuchangshadai()
	local Uworld1230 = nt_getTask(1230)
	local Uworld1247 = nt_getTask(1247)
	if ( Uworld1230 == 14 ) then
		nt_setTask(1247,Uworld1247+1)
	end
	
	if ( Uworld1247 + 1 >= 30 ) and ( nt_getTask(1230) == 14 ) then
		Msg2Player("你已经成功的掌握了技能攻击方式，可以回去找黑煞领取奖励了。")
		nt_setTask(1230,15)
	end
end


----------------------------------------------------------秋衣水对话-----------------------------------------------------

function pe_qiuyishui()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务卢青任务变量
	local Uworld1228 = nt_getTask(1228)                        --同伴教育任务唐影任务变量
	local Uworld1229 = nt_getTask(1229)                        --同伴教育任务白煞任务变量
	local Uworld1230 = nt_getTask(1230)                        --同伴教育任务黑煞任务变量
	local Uworld1231 = nt_getTask(1231)                        --同伴教育任务秋衣水任务变量
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_QiuYiShui.."：我们几个人的教育都结束了。你现在可以去找剑皇徒弟了。",1,"结束对话/no")
	elseif ( partner_getpartnerlevel(9) ~= 10  ) then
		return
	elseif ( Uworld1226 == 10 ) and ( Uworld1231 == 0 ) then  	   --秋衣水处任务没有触发？？？？？没有把任务奖励告诉玩家
		Describe(DescLink_QiuYiShui.."：在这山里相夫教子，如果不是黑煞那个老小子天天带着一帮子弟喊打喊杀，恐怕都不记得江湖是什么样子啦。<enter>"
		.."你是来学习的吗？既然来了，我就将自己的本事都传授给你了吧。主要是与同伴<color=red>修炼任务<color>相关的。<enter>"
		.."同伴修练任务可以通过在各个城市的长歌门人处<color=red>购买卷轴<color>获得。修练任务为在游戏世界任意地图上选择杀多少只怪物。每次启动一个修练任务，当完成后启动另一个。每天可以启动<color=red>五个<color>修练任务，没有地区限制。你可以使用五张同一地点打怪的卷轴，也可以使用五个不同地点杀怪的卷轴。<color=red>你需要加以注意的地方是：每天接的任务必须在当天完成当天交，否则被看做失败<color>。好啦，就跟你讲这么多，现在你去龙王台找一个叫龙八的男人，说是我让你去的。从他这里拿五个去龙王台打木桩的<color=red>免费<color>的修练任务卷轴，自己打一打就明白啦。<color><enter>"
		.."<color=green>任务奖励：同伴技能'凌波微步'<color>",2,
		"好的，我知道了/qiuyishui_starttask1",
		"稍后再来/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1231 == 18 ) then --任务已完成
		Describe(DescLink_QiuYiShui.."：好了，在我这里你已经学不到更多的东西，看还有其他什么人那里没去过吧。你见到我丈夫唐影，请替我转告他，让他好好带着孩子，别整天只图自己采材练药，舞马长枪的。奴家这厢谢过了！",2,"领取奖励/qiuyishui_prize","稍后再来/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1231 == 10 ) then  --刚接到秋衣水处任务
		Describe(DescLink_QiuYiShui.."：不是说了让你去龙王台打木桩吗？龙王台就在地图的中下方。",1,"结束对话/no")	
	else
		Describe(DescLink_QiuYiShui.."：许多人问我为何放着翠烟门的大师姐不做，和个傻瓜来这山里斯守了几十年。呵呵，唐影这傻瓜是有福气哦。当年天下的女子里，我也不出前三吧？可回过头想想，真的一点都不后悔。江湖上风雪大，那些年的夜路总有个男人陪着我走，何况我还一直喜欢着他，就算他再傻，也是我的福气吧。都说人在江湖，身不由己，能脱离出来，老天对我们足够眷顾了。",1,"结束对话/no")
	end
end

function qiuyishui_starttask1()
	nt_setTask(1231,10)
	Msg2Player("秋衣水让你去龙王台找一个叫龙八的男人。")  
end

function qiuyishui_prize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddSkill(partnerindex,2,629,1)                          --增加同伴附加技能《凌波微步》
		Msg2Player("恭喜你获得了同伴技能《凌波微步》")
		nt_setTask(1231,20)
	end
end

--------------------------------------------------------龙八对话--------------------------------------------

function pe_longba()
	if ( nt_getTask(1231) == 10  ) and ( nt_getTask(1226) == 10 ) then
		Describe(DescLink_LongBa.."：你是秋姐介绍来的吗，好吧。我这里是有些卷轴任务，我给你详细讲解一下：<enter>"
		.."<color=yellow>你可以购买不同地方的不同杀怪任务，也可以购买同一地方的杀怪任务。你可以无限购买卷轴，但每天最多只能启动并完成5个。卷轴任务的经验奖励是累加的，也就是讲，你做的任务越多，得到的奖励也就越多。最后，当天做完的任务要记得当天交，否则仍然会被看做任务失败。<color>就是这么多了，现在你领取一个卷轴任务去做做吧。<color=red>记住，你必须自己亲自去打，你的同伴在教育任务中，他还没有完全练成功夫，击打木桩是无效的。<color>",3,
		"是的，我要获得打木桩的卷轴任务/longba_starttask1",
		"我的卷轴丢了，我想再领取一个/longba_starttask1",
		"我还是稍后再来吧/no")
	elseif ( nt_getTask(1231) == 15 ) then
		Describe(DescLink_LongBa.."：好了，你确实已经做完了卷轴任务，领取你的奖励吧。再与我对话。",2,"领取奖励/longba_getprize1","稍后再来/no")
	elseif ( nt_getTask(1231) == 16 ) then
		Describe(DescLink_LongBa.."：天将降大任于斯人，你再来回答对我五个问题，就可以回去找秋姑复命了。",1,"结束对话/longba_starttask2")
	elseif ( nt_getTask(1231) == 17 ) then
		Describe(DescLink_LongBa.."：好啦，你已经完成了我这里的对话，领完奖励就回去找秋姑吧。",1,"结束对话/longba_getprize2")
	elseif ( nt_getTask(1231) == 18 ) then
		Describe(DescLink_LongBa.."：我这里的任务已经完成了，你回去找秋姑吧。",1,"结束对话/no")
	else
		Describe(DescLink_LongBa.."：龙五？他是我许久以前的一个兄弟。那时候我们兄弟九人立志在江湖上闯出一翻事业，谁能想到后来发生了那样一件事情呢？",1,"结束对话/no")
	end
end

function longba_starttask1()
	AddItem(6,1,829,0,0,0)
	Msg2Player("你获得了一个打木桩的卷轴。请及时打开并完成它。")	
end

function longba_getprize1()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,4000,1)                   			--给当前同伴增加经验，+4000
		nt_setTask(1231,16)
	end
end

function longba_starttask2()
	if ( partner_edu(5,67,91,5,0) == 10 ) then
		nt_setTask(1231,17)
	end
end

function longba_getprize1()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,4500,1)                   			--给当前同伴增加经验，+4500
		nt_setTask(1231,18)
		Say("你已经完成了我这里的任务，去其他人那里吧。",0)
	end
end
--------------------------------------------------------卷轴启动-------------------------------------------

function pe_juanzhouqidong()
	if ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( nt_getTask(1243)  == 0 ) then
		nt_setTask(1243,10) --卷轴被启动
		Msg2Player("你已经启动了打木桩30次的卷轴任务。")
	elseif ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( nt_getTask(1243) >= 10 and  nt_getTask(1243) < 40 ) then
		Msg2Player("你已经在做打木桩任务了，请继续加油。")
	elseif ( nt_getTask(1231) == 15 )then
		Msg2Player("你已经完成了打木桩任务，请去与龙八对话。")
	else
		Msg2Player("对不起，这是特殊任务的道具，你拿了没有任何作用。")
	end
end	

------------------------------------------------------龙王台练功木桩---------------------------------------

function pe_liangongmuzhuang()
	local Uworld1243 = nt_getTask(1243)
	if   ( nt_getTask(1231) == 15 ) then
		Msg2Player("你已经完成了打木桩任务，请去与龙八对话。")
	elseif ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( Uworld1243 >= 10 and  Uworld1243 < 40 ) then
		nt_setTask(1243,Uworld1243+1)
	elseif ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( nt_getTask(1243) >= 40 ) then
		nt_setTask(1231,15)
		Msg2Player("你已经完成了打木桩任务，请去与龙八对话。")
	else
		if ( GetSex() == 0 ) then
			Msg2Player("帅哥，你我无冤无仇，你老打我干吗？")
		else
			Msg2Player("美女，你我无冤无仇，你老打我干吗？")
		end
	end
end


------------------------------------------------------牛满满的问答题---------------------------------------
function niumanman_num1()
	niumanman_bisaijieguo(1)
end
function niumanman_num2()
	niumanman_bisaijieguo(2)
end
function niumanman_num3()
	niumanman_bisaijieguo(3)
end
function niumanman_num4()
	niumanman_bisaijieguo(4)
end
function niumanman_num5()
	niumanman_bisaijieguo(5)
end
function niumanman_num6()
	niumanman_bisaijieguo(6)
end
function niumanman_num7()
	niumanman_bisaijieguo(7)
end
function niumanman_num8()
	niumanman_bisaijieguo(8)
end
function niumanman_num9()
	niumanman_bisaijieguo(9)
end
function niumanman_num10()
	niumanman_bisaijieguo(10)
end
function niumanman_num11()
	niumanman_bisaijieguo(11)
end
function niumanman_num12()
	niumanman_bisaijieguo(12)
end

function partner_getpartnerlevel(partnerlevel)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	if ( NpcCount == 0 ) then
		Msg2Player("你当前没有同伴，不能继续教育任务了。请先领取同伴。")
		return
	elseif ( PARTNER_GetLevel(partnerindex) < partnerlevel ) then
		Msg2Player("你的同伴不满"..partnerlevel.."级，还不能做我这里的任务。")
		return
	elseif ( PARTNER_GetTaskValue(partnerindex, 1) ~= 1 ) then
		Msg2Player("这个同伴并不是你带着来做同伴教育任务的那个同伴，请将正确同伴召唤出来。")  
		return
	elseif ( partnerstate == 0 ) then
		Msg2Player("你当前没有召唤出同伴来，不能继续教育任务了。请先召唤出做教育任务的同伴。") 
		return
	else
		return 10
	end
end

function partner_checkdo()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	if ( PARTNER_GetTaskValue(partnerindex, 1) ~= 1 ) then
		Msg2Player("这个同伴并不是你带着来做同伴教育任务的那个同伴，请将正确同伴召唤出来。")  
		for i=1,NpcCount do 
			if ( PARTNER_GetTaskValue(i, 1) == 1 ) then
				Msg2Player("你正在做同伴教育任务的是第"..i.."号同伴。")
			end
		end
	elseif ( NpcCount == 0 ) then
		Msg2Player("你当前没有同伴，领取不了奖励哦。")
	elseif ( partnerstate == 0 ) then
		Msg2Player("你当前没有召唤出同伴来，领取不了奖励哦。") 
	else
		return 10
	end
end

function no()
end
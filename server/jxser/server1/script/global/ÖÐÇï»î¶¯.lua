-- Const List
aryAwardTime = { 1900, 2400, 928 }									--领奖时间段 ( { 起始时间， 结束时间 } 时间格式为HHMM )
aryAwardItem = {{ "桂花酒",   {6,1,125,1,0,0,0} },	--奖品数组
				{ "八珍福月团圆饼", {6,1,126,1,0,0,0} }}
		
MingZi=50											--单字合成几率
QiuZi=30
GeZi=30
YingZi=80
JuZi=10
WangZi=80
YuanZi=10

-- Talking String
STR_Do_Nothing		 = "我只是来逛逛/do_nothing"
STR_Next_Page		 = "下一页"
STR_OK			 	 = "我知道了，谢谢。"
STR_Main			 = { "礼官：我是负责发送礼物的礼官，一年中的重大节日我都会有礼物发送。此外我还负责派发赠送物品。您现在要领取礼物吗？",
						 "打听中秋节的来历",
		 				 "打听打听中秋活动内容",
		 				 "中秋活动一：参加猜字谜活动",
		 				 "中秋活动二：参加合成单字",		--5
		 				 "中秋活动三：参加集诗词领奖品",
		 				 "中秋活动四：领取节日赠品",
		 				 "我只是来逛逛",
		 				 "领取赠送物品",
		 				 "购买周年庆大礼包得幸运戒指和十全大补丸" }		--10
STR_About_MA		 = { "    传说，后羿的妻子嫦娥，因为耐不住人间寂寞，在八月十五这天，偷吃了王母娘娘的灵药而飞升成仙。从此与玉兔相伴，夜夜守候月宫。后羿夜夜对空祭月，以思念妻子祈盼团圆，后来便慢慢有了八月十五赏月祭月的风俗。",
						 "    也有说，农历八月十五这一天恰好是稻子成熟的时刻，各家都拜土地神，中秋是秋报的遗俗。每到这一天，家家户户都会团聚在一起，赏明月、吃月饼、猜字谜。明月高挂，桂花飘香，其中也寄托了许多客居他乡的游子深切的思念之情。",
						 "    每到这一天，家家户户都会团聚在一起，赏明月，吃月饼，猜字谜。明月高挂，桂花飘香，其中也寄托了许多客居他乡的游子深切的思念之情。",
						 "我已经知道了" }
STR_About_Rules		 = { "    在这个喜庆的日子里，《剑网》也为玩家们准备了颇具民俗风情的节日活动——“<color=red>猜字谜<color>、<color=red>集诗词<color>、<color=red>品月饼<color>、<color=red>赏明月<color>”。",
						 "猜字谜", 
						 "集诗词",
						 "品月饼", 
						 "赏明月",						--5
						 "我已经明白了",
						 "    剑网和玩家一起庆祝中秋国庆，与各城市的礼官对话选择猜谜游戏，并每次缴纳<color=red>一千两<color>，就可以开始猜谜游戏。要求<color=red>连续答对五道题目<color>就可以随机获得一个<color=red>特殊单字<color>，其作用是与普通单字合成出<color=red>高一级的普通单字<color>，以及在参加集诗词活动中换取奖品。",
						 "    剑网和玩家一起庆祝中秋国庆，在活动期间，大家可以在礼官处用一些单字填诗词以领取不同的奖品，有三种途径来获得单字：<color=red>打怪<color>（<color=red>获得普通单字<color>）、<color=red>猜字谜<color>（<color=red>获得特殊单字<color>）、<color=red>合成单字<color>（<color=red>升级普通单字<color>），领取每种奖品都需要匹配一个普通字与一个特殊字。",
						 "    剑网和玩家一起庆祝中秋国庆，在<color=red>九月二十八日中秋<color>当天的 <color=red>19:00~24:00<color> 时段里，符合条件的玩家都可以到礼官处免费领取一次节日赠品（<color=red>八珍福月团圆饼<color>和<color=red>桂花酒<color>），邀约朋友品月饼赏明月。",
						 "    剑网和玩家一起庆祝中秋国庆，在活动期间，<color=red>华山<color>、<color=red>青城山<color>、<color=red>武夷山<color>三个风景区玩家都能看到月景，供大家赏月聊天、拍照留念。",
						 "打听其他活动说明" }	--11
STR_Gift			 = { "    对不起，您还没有充卡。请先充卡。",
						 "    对不起，请在九月二十八日中秋节晚上 19:00~24:00 这个时段来领取赠品。",
						 "    对不起，您的等级不足五十级。",
						 "    对不起，您已经领取过赠品了。",
						 "您获得了一个" }
STR_Guess			 = { "    对不起年轻人，银两是不是忘在家里啦？",
						 "对不起，银两不足！需要",
						 "两银子。",
						 "    前两天闲着没事，写了几句灯谜，年轻人要不要来猜一猜？只要<color=red>一千两银子<color>，并<color=red>连续答对五题<color>，我就给您一个<color=red>特殊单字<color>。",
						 "我正想试试",						--5
						 "我想参加其他活动",
						 "道题目。",
						 "就只差那么一点啦，别灰心，再接再厉吧！",
						 "您得到一个字！",
						 "猜字谜",							--10
						 "    果然饱读诗书，老夫敬佩，这里是许诺的奖品：送您一个<color=red>特殊单字<color>。年轻人还要不要让老夫再考考您？",
						 "    就只差那么一点啦，别灰心，再接再厉吧！还要不要再让老夫考考您？" }
STR_Reward_Note		 = { "    我这里有一些残破的诗句，如果您身上刚好有其间<color=red>缺失的单字<color>，我就送给您一件礼品。",
						 "    果然是英雄出少年啊！",
						 "恭喜啊！您得到 ",
						 "    想领奖品<color=red>",
						 "<color>需要解出“",
						 "”这句诗，您没有所需要的字呢！",
						 "我只是来逛逛",
						 "告诉大家一个好消息，传说中的贡月芙蓉已经被玩家领取了，大家继续努力啊！",
						 "告诉大家一个好消息，传说中的奉月果蓉已经被玩家领取了，大家继续努力啊！",
						 "告诉大家一个好消息，传说中的定国安邦黄金装备已经被玩家领取了，大家继续努力啊！",
						 "还要换取其他奖品",
						 "我想参加其他活动" }
STR_Reward_Poem		 = { "明__几时有，把__问青天 ",
						 "海上升__月，天涯共此__ ",
						 "__空明月悬，光__露沾湿 ",
						 "我__月徘徊，我__影零乱 ",
						 "起舞弄清__，何似__人间 ",
						 "__杯邀明月，对影成三__ ",
						 "举头__明月，低头__故乡 ",
						 "但__人长久，千里共婵__ " }
STR_Reward_Reward	 = { "（烟花+2粒PK药丸）",
						 "（猴年吉祥包）",
						 "（仙草露）",
						 "（八珍福月团圆饼）",
						 "（桂花酒）",
						 "（贡月芙蓉）",
						 "（奉月果蓉）",
						 "（定国安邦黄金装备其中一件）" }
STR_Reward_Func		 = { "/yes1",
						 "/yes2",
						 "/yes3",
						 "/yes4",
						 "/yes5",
						 "/yes6",
						 "/yes7",
						 "/yes8" }
STR_Combin_Note		 = { "    如果有多余的低级字，可以拿到我这里来，如果给我<color=red>一组单字<color>（同级的<color=red>一个特殊字和一个普通字<color>）和<color=red>一千两手续费<color>，我会让您试试从这个箱子里取高一级的单字，如果失败将不退还您付出的字！当然，别忘了每次合成的<color=red>一千两手续费<color>。",
						 "    合成字需要<color=red>一千两手续费<color=red>，您的钱好像不够，还是下次再来吧。",
						 "请稍等片刻。",
						 "您得到单字 ",
						 "    失败了，（<color=red>",
						 "<color>）字也不是这么好合成到的，下次再来试试手气吧。",
						 "    想合成“<color=red>",
						 "<color>”字需要<color=red>",
						 "<color>，您没有所需要的字呢！是不是忘带了？赶快回去找找再来吧。",
						 "我只是来逛逛/do_nothing",		--10
						 "还要合成其他单字",
						 "我想参加其他活动" }
STR_Combin_Word		 = { "明",
						 "秋",
						 "歌",
						 "影",
						 "举",
						 "望",
						 "愿" }
STR_Combin_Request	 = { "（月+酒）",
						 "（明+时）",
						 "（秋+彩）",
						 "（歌+舞）",
						 "（影+在）",
						 "（举+人）",
						 "（望+思）" }
STR_Combin_Func		 = { "/Combin1",
						 "/Combin2",
						 "/Combin3",
						 "/Combin4",
						 "/Combin5",
						 "/Combin6",
						 "/Combin7" }						
						
		 
-- Start of Proc
--function main()
--	Say(STR_Main[1], 9, 
--		STR_Main[2].."/about_mid_autumn",
--		STR_Main[3].."/about_game_rules",
--		STR_Main[4].."/guess_at_riddle",
--		STR_Main[5].."/Combination",
--		STR_Main[6].."/GetReward",
--		STR_Main[7].."/take_gift",
--		STR_Main[9].."/onGift",
--		STR_Main[10].."/lg_onRingGift",
--		STR_Main[8].."/do_nothing" )
--end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 主菜单 ----------------------------------------------
-- ------------------------------------------------------------------------------------------------
function on_mid_autumn()
	Say( 
		STR_Main[1],
		5,
--		STR_Main[2].."/about_mid_autumn",
		STR_Main[3].."/about_game_rules",
		STR_Main[4].."/guess_at_riddle",
		STR_Main[5].."/Combination",
		STR_Main[6].."/GetReward",
--		STR_Main[7].."/take_gift",
		STR_Main[8].."/do_nothing"
		);
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 关于中秋 --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function about_mid_autumn()
	Say(STR_About_MA[1], 1,
		STR_Next_Page.."/about_mid_autumn_b" )
end
function about_mid_autumn_b()
	Say(STR_About_MA[2], 1,
		STR_About_MA[4].."/main" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 游戏说明 --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function about_game_rules()
	Say(STR_About_Rules[1], 5,
		STR_About_Rules[2].."/rule_a",
		STR_About_Rules[3].."/rule_b",
		STR_About_Rules[4].."/rule_c",
		STR_About_Rules[5].."/rule_d",
		STR_About_Rules[6].."/main" )
end

function rule_a()
	Say(STR_About_Rules[7], 1,
		STR_About_Rules[11].."/about_game_rules" )
end

function rule_b()
	Say(STR_About_Rules[8], 1,
		STR_About_Rules[11].."/about_game_rules" )
end

function rule_c()
	Say(STR_About_Rules[9], 1,
		STR_About_Rules[11].."/about_game_rules" )
end

function rule_d()
	Say(STR_About_Rules[10], 1,
		STR_About_Rules[11].."/about_game_rules" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 领取赠品 --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function take_gift()					--中秋送礼( -1:未充卡  -2:当前不是领奖时间  -3：等级不足50  -4:已领过奖 )
	local nCurrTime = tonumber(date("%H%M"))
	local nCurrData = tonumber(date("%m%d"))

	if( IsCharged() ~= 1 ) then						--是否充过卡
		Say(STR_Gift[1], 1,
			STR_OK.."/main" )
		return -1
	end
	if not ((nCurrTime >= aryAwardTime[1]) and (nCurrTime <= aryAwardTime[2]) and (nCurrData == aryAwardTime[3])) then					--是否是领奖时间
		Say(STR_Gift[2], 1,
			STR_OK.."/main" )
		return -2
	end	
	if (GetLevel() < 50) then						--等级是否大于50
		Say(STR_Gift[3], 1,
			STR_OK.."/main" )
		return -3
	end
	
	if (GetTask(702) == 5) then						--是否已领过奖
		Say(STR_Gift[4], 1,
			STR_OK.."/main" )
		return -4
	else
        AddItem( aryAwardItem[1][2][1], aryAwardItem[1][2][2], aryAwardItem[1][2][3], aryAwardItem[1][2][4], aryAwardItem[1][2][5], aryAwardItem[1][2][6] , aryAwardItem[1][2][7])
        Msg2Player( STR_Gift[5]..aryAwardItem[1][1] )
        AddItem( aryAwardItem[2][2][1], aryAwardItem[2][2][2], aryAwardItem[2][2][3], aryAwardItem[2][2][4], aryAwardItem[2][2][5], aryAwardItem[2][2][6] , aryAwardItem[2][2][7])
        Msg2Player( STR_Gift[5]..aryAwardItem[2][1] )
		SetTask(702, 5)
	end	
	
end

function IsCharged()					--判断玩家是否充过卡
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1
	else
		return 0
	end
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 猜謎部分 --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function guess_at_riddle()
	local mpay		 = 1000		--需要支付的金錢數量

	Say(STR_Guess[4], 2,
		STR_Guess[5].."/get_question",
		STR_Guess[6].."/main" )	
end
function get_question()
	local mpay		 = 1000		--需要支付的金錢數量
	
	if ( GetCash() >= mpay ) then
		SetTaskTemp(250, 0)		--设置当前题目为第 0 题
		SetTaskTemp(251, 0)		--设置当前答案为第 0
		Pay(mpay)
		gquestion()
	else
		Say(STR_Guess[1], 1,
			STR_OK.."/main" )
		Msg2Player(STR_Guess[2]..mpay..STR_Guess[3])
	end
end


-- 下面是五个题目
function gquestion()
	local qid_min		 = 2001						--题库起始ID
	local qid_max		 = 2220						--题库结束ID
	local qid			 = random(qid_min, qid_max)	--确定一个题目ID	
	local question		 = GetQuestion(qid)			--取问题
	local qchoose		 = {GetChoose(qid , 1),		--取可选答案 A
							GetChoose(qid , 2),		--取可选答案 B
							GetChoose(qid , 3),		--取可选答案 C
							GetChoose(qid , 4)}		--取可选答案 D
	local qrextemp		 = 0						--交换用临时变量下标
	local qchoosetemp	 = "_"						--交换用临时变量
	local qanswer		 = GetQAnswer(qid)			--取答案(答案编号)
    local gttc			 = GetTaskTemp(250) + 1
    local inttemp		 = {1,2,3,4}
	SetTaskTemp(250, gttc)							--正在进行的题目轮次
	SetTaskTemp(251, 0)

	qrextemp = random(1, 3)
	qchoosetemp = qchoose[4]
	qchoose[4] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
		qanswer = 4
	elseif (qanswer == 4) then
		qanswer = qrextemp
	end
	
	qrextemp = random(1, 2)
	qchoosetemp = qchoose[3]
	qchoose[3] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
		qanswer = 3
	elseif (qanswer == 3) then
		qanswer = qrextemp
	end
	
	qrextemp = 1
	qchoosetemp = qchoose[2]
	qchoose[2] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
		qanswer = 2
	elseif (qanswer == 2) then
		qanswer = qrextemp
	end

	SetTaskTemp(251, qanswer)						--記錄當前問題答案
	Say(question, 4, 
		qchoose[1].."/answerproc_a",
		qchoose[2].."/answerproc_b",
		qchoose[3].."/answerproc_c",
		qchoose[4].."/answerproc_d" )
end
	
function answerproc_a()					--选择答案 A
	if (GetTaskTemp(251) == 1) then		--是否是正确答案
		if (GetTaskTemp(250) >= 5) then
			add_random_special_word()
		else
			gquestion()
		end
	else
		Msg2Player(STR_Guess[8])
		--guess_at_riddle()
		Say(STR_Guess[12], 2,
			STR_Guess[5].."/get_question",
			STR_Guess[6].."/main" )
	end
end	
function answerproc_b()					--选择答案 B
	if (GetTaskTemp(251) == 2) then		--是否是正确答案
		if (GetTaskTemp(250) >= 5) then
			add_random_special_word()
		else
			gquestion()
		end
	else
		Msg2Player(STR_Guess[8])
		--guess_at_riddle()
		Say(STR_Guess[12], 2,
			STR_Guess[5].."/get_question",
			STR_Guess[6].."/main" )
	end
end	
function answerproc_c()					--选择答案 C
	if (GetTaskTemp(251) == 3) then		--是否是正确答案
		if (GetTaskTemp(250) >= 5) then
			add_random_special_word()
		else
			gquestion()
		end
	else
		Msg2Player(STR_Guess[8])
		--guess_at_riddle()
		Say(STR_Guess[12], 2,
			STR_Guess[5].."/get_question",
			STR_Guess[6].."/main" )
	end
end	
function answerproc_d()					--选择答案 D
	if (GetTaskTemp(251) == 4) then		--是否是正确答案
		if (GetTaskTemp(250) >= 5) then
			add_random_special_word()
		else
			gquestion()
		end
	else
		Msg2Player(STR_Guess[8])
		--guess_at_riddle()
		Say(STR_Guess[12], 2,
			STR_Guess[5].."/get_question",
			STR_Guess[6].."/main" )
	end
end	

function qfail()				--回答出错
end
-- 题目结束

function add_random_special_word()
	local qitem		 	 = {426,427,428,429,430,431,432,433}				--記錄有可能的獎勵道具(幾率匹配)
	local qitem_rate	 = {763,863,913,963,983,993,998,1000}				--記錄有可能的獎勵道具出現機率
						--  763 100  50  50  20  10   5    2
	local accuracy		 = 1000						--隨機數精度
	local drop_rate		 = random(1, accuracy)		--確定獎品類型的一個隨機數
		
	if ( drop_rate <= qitem_rate[1] ) then
		AddItem(4,qitem[1],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[2] ) then
		AddItem(4,qitem[2],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[3] ) then
		AddItem(4,qitem[3],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[4] ) then
		AddItem(4,qitem[4],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[5] ) then
		AddItem(4,qitem[5],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[6] ) then
		AddItem(4,qitem[6],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[7] ) then
		AddItem(4,qitem[7],1,1,0,0,0)
	elseif ( drop_rate <= accuracy ) then
		AddItem(4,qitem[8],1,1,0,0,0)
	end
	Msg2Player(STR_Guess[9])
--	guess_at_riddle()
	Say(STR_Guess[11], 2,
		STR_Guess[5].."/get_question",
		STR_Guess[6].."/main" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 填诗领奖品部分 --------------------------------------
-- ------------------------------------------------------------------------------------------------
function GetReward()
	Say(STR_Reward_Note[1],9,
		STR_Reward_Poem[1]..STR_Reward_Reward[1]..STR_Reward_Func[1],
		STR_Reward_Poem[2]..STR_Reward_Reward[2]..STR_Reward_Func[2],
		STR_Reward_Poem[3]..STR_Reward_Reward[3]..STR_Reward_Func[3],
		STR_Reward_Poem[4]..STR_Reward_Reward[4]..STR_Reward_Func[4],
		STR_Reward_Poem[5]..STR_Reward_Reward[5]..STR_Reward_Func[5],
		STR_Reward_Poem[6]..STR_Reward_Reward[6]..STR_Reward_Func[6],
		STR_Reward_Poem[7]..STR_Reward_Reward[7]..STR_Reward_Func[7],
		STR_Reward_Poem[8]..STR_Reward_Reward[8]..STR_Reward_Func[8],
		STR_Reward_Note[7].."/main")
end

function yes1()                                                                 -- 烟花与2粒Pk药丸
	if ((GetItemCountEx(418)>=1) and (GetItemCountEx(426))>=1) then
	  	DelItemEx(418)
	  	DelItemEx(426)
	  	for i=1,2 do 
	    	local x=random(1,10)
	    	AddItem(6,0,x,1,0,0,0)
	  	end
	  	AddItem(6,0,11,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[1].."。")
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[1]..STR_Reward_Note[5]..STR_Reward_Poem[1]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes2()                                                                 -- 猴年吉祥包
	if ((GetItemCountEx(419)>=1) and GetItemCountEx(427)>=1) then
	  	DelItemEx(419)
	  	DelItemEx(427)
	  	AddItem(6,1,19,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[2].."。")
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[2]..STR_Reward_Note[5]..STR_Reward_Poem[2]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes3()                                                                 -- 仙草露
	if ((GetItemCountEx(420)>=1) and GetItemCountEx(428)>=1) then
	  	DelItemEx(420)
	  	DelItemEx(428)
	  	AddItem(6,1,71,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[3].."。")
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[3]..STR_Reward_Note[5]..STR_Reward_Poem[3]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes4()                                                                 -- 八珍福月团圆饼
	if ((GetItemCountEx(421)>=1) and GetItemCountEx(429)>=1) then
	  	DelItemEx(421)
	  	DelItemEx(429)
	  	AddItem(6,1,126,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[4].."。")
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[4]..STR_Reward_Note[5]..STR_Reward_Poem[4]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes5()                                                                 -- 桂花酒
	if ((GetItemCountEx(422)>=1) and GetItemCountEx(430)>=1) then
	  	DelItemEx(422)
	  	DelItemEx(430)
	  	AddItem(6,1,125,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[5].."。")
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[5]..STR_Reward_Note[5]..STR_Reward_Poem[5]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes6()                                                                 -- 贡月芙蓉
	if ((GetItemCountEx(423)>=1) and GetItemCountEx(431)>=1) then
	  	DelItemEx(423)
	  	DelItemEx(431)
	  	AddItem(6,1,128,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[6].."。")
	  	local n=GetGlbValue(12)+1
	  	SetGlbValue(12,n)
			WriteLog(date("%H%M%S").."		ACC- "..GetAccount().. ",		 CHAR- "..GetName().."		"..STR_Reward_Reward[6]);
	  	AddGlobalNews(STR_Reward_Note[8])
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[6]..STR_Reward_Note[5]..STR_Reward_Poem[6]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes7()                                                                 -- 奉月果蓉
	if ((GetItemCountEx(424)>=1) and GetItemCountEx(432)>=1) then
	  	DelItemEx(424)
	  	DelItemEx(432)
	  	AddItem(6,1,127,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[7].."。")
	  	local n=GetGlbValue(11)+1
	  	SetGlbValue(11,n)
			WriteLog(date("%H%M%S").."		ACC- "..GetAccount().. ",		 CHAR- "..GetName().."		"..STR_Reward_Reward[7]);
	  	AddGlobalNews(STR_Reward_Note[9])
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[7]..STR_Reward_Note[5]..STR_Reward_Poem[7]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes8()                                                                 -- 定国安邦黄金装备
	if ((GetItemCountEx(425)>=1) and GetItemCountEx(433)>=1) then
	  	DelItemEx(425)
	  	DelItemEx(433)
	  	local x=random(159,167)
	  	AddGoldItem(0,x)
	  	local n=GetGlbValue(10)+1
	  	SetGlbValue(10,n)
			WriteLog(date("%H%M%S").."		ACC- "..GetAccount().. ",		 CHAR- "..GetName().."		"..STR_Reward_Reward[8]);
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[8].."。")
	  	AddGlobalNews(STR_Reward_Note[10])
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[8]..STR_Reward_Note[5]..STR_Reward_Poem[8]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 合成部分 --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function Combination()
	local mpay		 = 1000		--需要支付的金錢數量
	
	if ( GetCash() < mpay ) then
		Say(STR_Combin_Note[2], 1,
			STR_OK.."/main" )
		Msg2Player(STR_Guess[2]..mpay..STR_Guess[3])
	else
		Say(STR_Combin_Note[1], 2,
			STR_Guess[5].."/Combination_List",
			STR_Guess[6].."/main" )
	end
end
function Combination_List()
	local i=GetCash()
	if (i>=1000) then
		Say(STR_Combin_Note[1],8,
			STR_Combin_Word[1]..STR_Combin_Request[1]..STR_Combin_Func[1],
			STR_Combin_Word[2]..STR_Combin_Request[2]..STR_Combin_Func[2],
			STR_Combin_Word[3]..STR_Combin_Request[3]..STR_Combin_Func[3],
			STR_Combin_Word[4]..STR_Combin_Request[4]..STR_Combin_Func[4],
			STR_Combin_Word[5]..STR_Combin_Request[5]..STR_Combin_Func[5],
			STR_Combin_Word[6]..STR_Combin_Request[6]..STR_Combin_Func[6],
			STR_Combin_Word[7]..STR_Combin_Request[7]..STR_Combin_Func[7],
			STR_Combin_Note[10] )
	end
end

function Combin1()                                                                 -- 明
	if ((GetItemCountEx(418)>=1) and GetItemCountEx(426)>=1) then
	  	if (Pay(1000) > 0 ) then 
	  		DelItemEx(418)
	  		DelItemEx(426)
	  		local x=random(1,100) 
	  		if (x<=MingZi) then
            	AddItem(4,419,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[1])
	  		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[1]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
	  	end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[1]..STR_Combin_Note[8]..STR_Combin_Request[1]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin2()                                                                 -- 秋
	if ((GetItemCountEx(419)>=1) and GetItemCountEx(427)>=1) then
		if (Pay(1000) > 0 ) then 
	  		DelItemEx(419)
	  		DelItemEx(427)
	  		local x=random(1,100) 
	  		if (x<=QiuZi) then
            	AddItem(4,420,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[2])
	 		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[2]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
	  	end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[2]..STR_Combin_Note[8]..STR_Combin_Request[2]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin3()                                                                 -- 歌
	if ((GetItemCountEx(420)>=1) and GetItemCountEx(428)>=1) then
		if (Pay(1000) > 0 ) then 
	  		DelItemEx(420)
	  		DelItemEx(428)
	  		local x=random(1,100) 
	  		if (x<=GeZi) then
            	AddItem(4,421,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[3])
	  		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[3]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
	  	end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[3]..STR_Combin_Note[8]..STR_Combin_Request[3]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin4()                                                                 -- 影
	if ((GetItemCountEx(421)>=1) and GetItemCountEx(429)>=1) then
		if (Pay(1000) > 0 ) then 
	  		DelItemEx(421)
	  		DelItemEx(429)
	  		local x=random(1,100) 
	  		if (x<=YingZi) then
            	AddItem(4,422,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[4])
	  		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[4]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
	  	end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[4]..STR_Combin_Note[8]..STR_Combin_Request[4]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin5()                                                                 -- 举
	if ((GetItemCountEx(422)>=1) and GetItemCountEx(430)>=1) then
	  	if (Pay(1000) > 0 ) then 
	  		DelItemEx(422)
	  		DelItemEx(430)
	  		local x=random(1,100) 
	  		if (x<=JuZi) then
            	AddItem(4,423,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[5])
	  		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[5]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
	  	end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[5]..STR_Combin_Note[8]..STR_Combin_Request[5]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin6()                                                                 -- 望
	if ((GetItemCountEx(423)>=1) and GetItemCountEx(431)>=1) then
	  	if (Pay(1000) > 0 ) then 
	    	DelItemEx(423)
	    	DelItemEx(431)
	  		local x=random(1,100) 
	  		if (x<=WangZi) then
            	AddItem(4,424,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[6])
			else
				Say(STR_Combin_Note[5]..STR_Combin_Word[6]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
			end
		end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[6]..STR_Combin_Note[8]..STR_Combin_Request[6]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin7()                                                                 -- 愿
	if ((GetItemCountEx(424)>=1) and GetItemCountEx(432)>=1) then
		if (Pay(1000) > 0 ) then 
	  		DelItemEx(424)
	  		DelItemEx(432)
	  		local x=random(1,100) 
	  		if (x<=YuanZi) then
            	AddItem(4,425,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[7])
	  		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[7]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
		end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[7]..STR_Combin_Note[8]..STR_Combin_Request[7]..STR_Combin_Note[9], 1,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function do_nothing()
end
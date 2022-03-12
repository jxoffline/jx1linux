-- 临安　职能　钱庄老板
-- by：Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-01-06) 从统一功能移动处理银票到此独有
-- Update: Fanghao_Wu(2004-9-04) 增加元宝兑换铜钱功能

-- Include("\\script\\global\\钱庄功能.lua")

-- function main(sel)
--	Talk(1,"main_proc","钱庄老板：俺这钱庄信誉一向都好得很，从不骗人。")
-- end;

Include("\\script\\global\\systemconfig.lua") -- 系统配置
Include("\\script\\global\\head_qianzhuang.lua") -- 头定义

function gamebank_proc()
	local msg = {
		"我想管理我的元宝/use_ingot",
		"我想管理我的银票/use_ticket",
		"关于铜钱/onAboutCoin",
		"随便逛逛/no"
	};

	local talk = "";  
	if (GetSex() == 0) then
		talk = "钱庄老板：对了这位少侠要些什么服务？";
	else
		talk = "钱庄老板：对了这位姑娘要些什么服务？";
	end

	local btns ={}
	if  (SYSCFG_GAMEBANK_GOLDSILVER_OPEN) then
		tinsert(btns, msg[1])
	end
	
	if  (SYSCFG_GAMEBANK_TICKET_OPEN) then
		tinsert(btns, msg[2])
	end
	
	tinsert(btns, msg[3])
	tinsert(btns, msg[4])
	
	Say(talk,  getn(btns), btns);
end

function use_ticket()
	local msg = {
		"我想取张银票出来/get_ticket",
		"我想把这张银票在你这儿兑现了/pay_ticket",
		"我想把这张银票兑换成铜钱/change_ticket_to_coin",
		"查一下我在这存了多少银票/show_ticket",
		"随便逛逛/no"
	};

	local talk = "";  
	if (GetSex() == 0) then
		talk = "钱庄老板：少侠需要些什么服务？";
	else
		talk = "钱庄老板：姑娘需要些什么服务？";
	end

	local btns ={}
	if  (SYSCFG_GAMEBANK_TICKET_GET) then
		tinsert(btns, msg[1])
	end

	if  (SYSCFG_GAMEBANK_TICKET_PAY) then
		tinsert(btns, msg[2])
	end
	
	if  (SYSCFG_GAMEBANK_TICKET_COIN) then
		tinsert(btns, msg[3])
	end
		
	tinsert(btns, msg[4])
	tinsert(btns, msg[5])
	
	Say(talk, getn(btns), btns);
end

function use_ingot()
	local msg = {
		"我想取个元宝出来/get_ingot",
		"我想把这个元宝在你这儿兑现了/pay_ingot",
		"我想把这个元宝兑换成铜钱/change_ingot_to_coin",
		"查一下我在这存了多少元宝/show_ingot",
		"随便逛逛/no"
	};

	local talk = "";  
	if (GetSex() == 0) then
		talk = "钱庄老板：少侠需要些什么服务？";
	else
		talk = "钱庄老板：姑娘需要些什么服务？";
	end

	local btns ={}
	if  (SYSCFG_GAMEBANK_GOLD_GET or SYSCFG_GAMEBANK_SILVER_GET) then
		tinsert(btns, msg[1])
	end

	if  (SYSCFG_GAMEBANK_GOLD_PAY or SYSCFG_GAMEBANK_SILVER_PAY) then
		tinsert(btns, msg[2])
	end
	
	if  (SYSCFG_GAMEBANK_GOLD_COIN or SYSCFG_GAMEBANK_SILVER_COIN) then
		tinsert(btns, msg[3])
	end
	
	tinsert(btns, msg[4])
	tinsert(btns, msg[5])
	
	Say(talk, getn(btns), btns);
end

------------- 查询银票 --------------------
function show_ticket()
	local count = GetExtPoint(EXTPOINT_TICKET) + GetExtPoint(EXTPOINT_TICKET_NEW);
	if (count >= EXTPOINT_MAXVAL or count <= 0) then
		Say("钱庄老板：客倌现在没有在小号寄存银票。", 1, "知道了/no")
	else
		Say("<#>钱庄老板：客倌在小号总共寄存了 <color=green>" .. count .. "<color> 张银票。", 1, "知道了/no")
	end
end

------------- 查询元宝 --------------------
function show_ingot()
	i = GetExtPoint(1)
	if (i >= 32768) then
		i = 0
	end
	if (i <= 0) then
		Say("钱庄老板：客倌现在没有在小号寄存金银元宝。",1,"知道了/no")
	else
		Say("<#>钱庄老板：小号所寄存的元宝一律以银元宝计数，每一个金元宝会折算成四个银元宝。客倌在小号总共寄存了"..i.."<#>个银元宝。",1,"知道了/no")
	end
end

------------- 取元宝 -----------------------
function get_ingot()
--	Talk(1,"","钱庄老板：对不起，此项业务正在筹备中，暂时还没有开通，请过两天再来。")
	i = GetExtPoint(1)	
	if (i >= 32768) then
		i = 0
	end
	if (i <= 0) then					-- 没有扩展点数
		Talk(1,"","钱庄老板：对不起，客倌您并没有在小号寄存金银元宝。")
	elseif (i < 4) then				-- 不足4，直接给银元宝
		if (SYSCFG_GAMEBANK_SILVER_GET) then -- 是否允许取银元宝？
			get_ingot_10()
		end
--	elseif (mod(i, 4) == 0) then	-- 是4的整数倍，直接给金元宝
--		get_ingot_35()
	else							-- 允许自行选择要取金元宝还是银元宝
		if (SYSCFG_GAMEBANK_GOLD_GET == nil and SYSCFG_GAMEBANK_SILVER_GET) then -- 不允许取金元宝，但允许取银元宝
			get_ingot_10()
		elseif (SYSCFG_GAMEBANK_GOLD_GET and SYSCFG_GAMEBANK_SILVER_GET == nil) then -- 不允许取银元宝，但允许取金元宝
			get_ingot_35()
		else
			Say("钱庄老板：客倌您在小号寄存了金银两种元宝，不知您想取哪种呢？",3,"取个金元宝/get_ingot_35","取个银元宝/get_ingot_10","不取了/no")
		end
	end
end

------------- 取银票 -----------------------
function get_ticket()
	if (SYSCFG_GAMEBANK_TICKET_GET == nil) then -- 出错了~~
		print("get_ticket have close, but something is wrong...");
		Msg2Player("功能出错！");
		return
	end
	
	local count = GetExtPoint(EXTPOINT_TICKET) + GetExtPoint(EXTPOINT_TICKET_NEW);
	local msg = "";
	if (count >= EXTPOINT_MAXVAL or count <= 0) then				-- 没有扩展点数
		msg = "钱庄老板：对不起，客倌您并没有在小号寄存银票。";
		Talk(1, "", msg)
	else 
		Say("钱庄老板：客倌您确定需要在本店取银票吗？(点确定后切勿退出客户端！)", 2, "确定/get_ticketok", "取消/no");
	end
end

function get_ticketok()
	local nCountOld = GetExtPoint(EXTPOINT_TICKET);
	local nCountNew = GetExtPoint(EXTPOINT_TICKET_NEW);
	if (nCountOld > 0) then
		PayExtPoint(EXTPOINT_TICKET, 1);
		Msg2Player("正在为您获取银票中！在此过程中切勿退出游戏！请稍等。。。")
	elseif (nCountNew > 0) then
		PayExtPoint(EXTPOINT_TICKET_NEW, 1);
		Msg2Player("正在为您获取银票中！在此过程中切勿退出游戏！请稍等。。。")
	else
		msg = "钱庄老板：对不起，客倌您并没有在小号寄存银票。";
		Talk(1, "", msg);
	end;
end

function get_ingot_35()
	if (SYSCFG_GAMEBANK_GOLD_GET == nil) then -- 出错了~~
		print("get_gold35 have close, but something is wrong...");
		Msg2Player("功能出错！");
		return
	end
	
	if (GetExtPoint(1) < 4) then
		Talk(1,"","钱庄老板：对不起，我们的帐本中您的记录好象有些不对劲，请您等等，我们会尽快给您核实查清。实在不好意思，还得请您把金元宝先在我们这儿多放一小段时间。")
		return
	end
	Say("钱庄老板：客倌您确定需要在本店取金元宝吗？(点确定后切勿退出客户端！)", 2, "确定/get_ingot35ok", "取消/no");
end

function get_ingot35ok()
	PayExtPoint(1,4)
	Msg2Player("正在为您获取元宝中！在此过程中切勿退出游戏！请稍等。。。")
end

function get_ingot_10()
	if (SYSCFG_GAMEBANK_SILVER_GET == nil) then -- 出错了~~
		print("get_silver10 have close, but something is wrong...");
		Msg2Player("功能出错！");
		return
	end
	
	if (GetExtPoint(1) < 1) then		-- 小卡消费成功
		Talk(1,"","钱庄老板：对不起，我们的帐本中您的记录好象有些不对劲，请您等等，我们会尽快给您核实查清。实在不好意思，还得请您把银元宝先在我们这儿多放一小段时间。")
		return
	end
	Say("钱庄老板：客倌您确定需要在本店取银元宝吗？(点确定后切勿退出客户端！)", 2, "确定/get_ingot10ok", "取消/no");
end

function get_ingot10ok()
	PayExtPoint(1,1)
	Msg2Player("正在为您获取银元宝中！在此过程中切勿退出游戏！请稍等。。。")
end;
------------- 兑现元宝 ---------------------
function pay_ingot()
--	Talk(1,"","钱庄老板：对不起，此项业务正在筹备中，暂时还没有开通，请过两天再来。")
	i = GetItemCountEx(343)
	j = GetItemCountEx(342)
	if (i > 0) and (j > 0) and (SYSCFG_GAMEBANK_GOLD_PAY and SYSCFG_GAMEBANK_SILVER_PAY)then			-- 两种都有，询问兑现哪种
		Say("钱庄老板：您身上带了许多元宝啊，您想兑现哪一个呢？",5,"把金元宝兑现成25天/pay_ingot_35a","把金元宝兑现成600点/pay_ingot_35b","把银元宝兑现成6天/pay_ingot_10a","把银元宝兑现成150点/pay_ingot_10b","不兑现了/no")
	elseif (i > 0) and (SYSCFG_GAMEBANK_GOLD_PAY) then						-- 只有金元宝
		Say("钱庄老板：没问题，您想把身上的<color=red>金元宝<color>兑现成什么形式呢？",3,"把金元宝兑现成25天/pay_ingot_35a","把金元宝兑现成600点/pay_ingot_35b","不兑现了/no")
	elseif (j > 0) and (SYSCFG_GAMEBANK_SILVER_PAY) then						-- 只有银元宝
		Say("钱庄老板：没问题，您想把身上的<color=green>银元宝<color>兑现成什么形式呢？",3,"把银元宝兑现成6天/pay_ingot_10a","把银元宝兑现成150点/pay_ingot_10b","不兑现了/no")
	elseif (i <= 0 and SYSCFG_GAMEBANK_GOLD_PAY) or (j <= 0 and SYSCFG_GAMEBANK_SILVER_PAY) then	-- 一种都没有
		Say("钱庄老板：您现在没带元宝啊！",1,"对了，我忘在家里了/no")
	end
end

------------- 兑现银票 ---------------------
function pay_ticket()
	if (SYSCFG_GAMEBANK_TICKET_PAY == nil) then -- 出错了~~
		print("pay_ticket have close, but something is wrong...");
		Msg2Player("功能出错！");
		return
	end
	
	local msg = {
		"钱庄老板：没问题，您想把身上的<color=red>银票<color>兑现成什么形式呢？",
		"把银票兑现成30小时/pay_ticket_hours",
		"把银票兑现成7天/pay_ticket_days",
		"不兑现了/no"
	};
	local count = GetItemCountEx(QUESTKEY_TICKET) + GetItemCountEx(QUESTKEY_TICKET_NEW);
	if (count > 0) then			-- 询问兑现哪种
		Say(msg[1], 3, msg[2], msg[3], msg[4])
	else
		Say("钱庄老板：您现在没带银票啊！", 1, "对了，我忘在家里了/no")
	end
end

--获取扣除银票的种类
function pay_ticket_typediff()
	local tab_TicketType = {
		{QUESTKEY_TICKET, 2},
		{QUESTKEY_TICKET_NEW, 3}
		};
	local nOldSilverCount = GetItemCountEx(QUESTKEY_TICKET);
	local nNewSilverCount = GetItemCountEx(QUESTKEY_TICKET_NEW);
	if (nOldSilverCount > 0) then
		return tab_TicketType[1];
	elseif (nNewSilverCount > 0) then
		return tab_TicketType[2];
	else
		return nil;
	end;
end;
-- 把银票兑现成30小时
function pay_ticket_hours()
	local tab_TicketType = pay_ticket_typediff();
	if (not tab_TicketType) then
		Say("钱庄老板：您现在没带银票啊！", 1, "对了，我忘在家里了/no");
		return
	end;
	DelItemEx(tab_TicketType[1]);
	UseSilver(tab_TicketType[2], 0, 1)
	-- SaveQuickly()
	SaveNow(); -- 立即存盘
	WriteGoldLog( GetAccount().."("..GetName()..") USE a TICKET for 30 HOUR CHARGE", 0, 0, 0, -1 );
	Say("钱庄老板：<color=red>银票<color>兑换成<color=red>30小时<color>无误，请客倌核查。", 1, "知道了/no")
end

-- 把银票兑现成7天
function pay_ticket_days()
	local tab_TicketType = pay_ticket_typediff();
	if (not tab_TicketType) then
		Say("钱庄老板：您现在没带银票啊！", 1, "对了，我忘在家里了/no");
		return
	end;
	DelItemEx(tab_TicketType[1])
	UseSilver(tab_TicketType[2], 1, 1)
	-- SaveQuickly()
	SaveNow(); -- 立即存盘
	WriteGoldLog( GetAccount().."("..GetName()..") USE a TICKET for 7 DAY CHARGE", 0, 0, 0, -1 );
	Say("钱庄老板：<color=red>银票<color>兑换成<color=red>7天<color>无误，请客倌核查。", 1, "知道了/no")
end

function pay_ingot_35a()
	if (SYSCFG_GAMEBANK_GOLD_PAY == nil) then -- 出错了~~
		print("pay_gold35 have close, but something is wrong...");
		Msg2Player("功能出错！");
		return
	end

	if (GetItemCountEx(343) > 0) then 
	DelItemEx(343)
	UseSilver(0,1,1)
	-- SaveQuickly()
	SaveNow(); -- 立即存盘
	WriteGoldLog( GetAccount().."("..GetName()..") USE a GOLD for 25 DAY CHARGE", -1, 0, 0, 0 );
	Say("钱庄老板：<color=red>金元宝<color>兑换成<color=red>25天<color>无误，请客倌核查。",1,"知道了/no")
	end
end

function pay_ingot_35b()
	if (SYSCFG_GAMEBANK_GOLD_PAY == nil) then -- 出错了~~
		print("pay_gold35 have close, but something is wrong...");
		Msg2Player("功能出错！");
		return
	end
	
	if (GetItemCountEx(343) > 0) then
	DelItemEx(343)
	UseSilver(0,0,1)
	-- SaveQuickly()
	SaveNow(); -- 立即存盘
	WriteGoldLog( GetAccount().."("..GetName()..") USE a GOLD for 600 POINT CHARGE", -1, 0, 0, 0 );
	Say("钱庄老板：<color=red>金元宝<color>兑换成<color=green>600点<color>无误，请客倌核查。",1,"知道了/no")
	end
end

function pay_ingot_10a()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- 出错了~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("功能出错！");
		return
	end
	
	if (GetItemCountEx(342) > 0) then 
	DelItemEx(342)
	UseSilver(1,1,1)
	-- SaveQuickly()
	SaveNow(); -- 立即存盘
	WriteGoldLog( GetAccount().."("..GetName()..") USE a SILVER for 6 DAY CHARGE", 0, -1, 0, 0 );
	Say("钱庄老板：<color=green>银元宝<color>兑换成<color=red>6天<color>无误，请客倌核查。",1,"知道了/no")
	end
end

function pay_ingot_10b()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- 出错了~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("功能出错！");
		return
	end
	
	if (GetItemCountEx(342) > 0) then 
	DelItemEx(342)
	UseSilver(1,0,1)
	-- SaveQuickly()
	SaveNow(); -- 立即存盘
	WriteGoldLog( GetAccount().."("..GetName()..") USE a SILVER for 150 POINT CHARGE", 0, -1, 0, 0 );
	Say("钱庄老板：<color=green>银元宝<color>兑换成<color=green>150点<color>无误，请客倌核查。",1,"知道了/no")
	end
end

------------- 确认银票兑换铜钱---------------------
function change_ticket_to_coin()
	if (SYSCFG_GAMEBANK_TICKET_COIN == nil) then -- 出错了~~
		print("coin_ticket have close, but something is wrong...");
		Msg2Player("功能出错！");
		return
	end
	
	local count = GetItemCountEx(QUESTKEY_TICKET) + GetItemCountEx(QUESTKEY_TICKET_NEW);
	if (count > 0) then
		Say( "钱庄老板：您确定要把银票兑换成铜钱吗？", 2, "<#>把银票兑换成"..COIN_CHANGE_COUNT_OF_TICKET.."<#>个铜钱/confirm_ticket_to_coin", "不兑换了/no");
	else
		Say( "钱庄老板：您现在没带银票啊！", 1, "对了，我忘在家里了/no");
	end
end

------------- 银票兑换铜钱---------------------
function confirm_ticket_to_coin()
	local tab_TicketType = pay_ticket_typediff();
	if (not tab_TicketType) then
		Say("钱庄老板：您现在没带银票啊！", 1, "对了，我忘在家里了/no");
		return
	end;
	DelItemEx(tab_TicketType[1]);
	AddStackItem(COIN_CHANGE_COUNT_OF_TICKET, 4, 417, 1, 1, 0, 0, 0);
	UseSilver(tab_TicketType[2], 2, 1); -- 银票兑换为铜钱的消耗统计
	-- SaveQuickly();
	SaveNow(); -- 立即存盘
	WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a TICKET into "..COIN_CHANGE_COUNT_OF_TICKET.." COINS", 0, 0, COIN_CHANGE_COUNT_OF_TICKET, -1 );
	Say( "<#>钱庄老板：您的银票已成功兑换成" .. COIN_CHANGE_COUNT_OF_TICKET .. "<#>个铜钱，请客倌核查。", 2, "知道了/no", "再兑换一些铜钱/change_ticket_to_coin" );
end

------------- 元宝兑换铜钱---------------------
function change_ingot_to_coin()	
	local nGoldCount = GetItemCountEx( 343 );		-- 金元宝个数
	local nSilverCount = GetItemCountEx( 342 );		-- 银元宝个数
	
	if( nGoldCount > 0 and nSilverCount > 0 ) and (SYSCFG_GAMEBANK_GOLD_COIN and SYSCFG_GAMEBANK_SILVER_COIN) then			-- 两种都有，询问兑现哪种
		Say( "钱庄老板：您想兑换哪个元宝呢？", 3, "<#>把金元宝兑换成"..COIN_CHANGE_COUNT_OF_GOLD.."<#>个铜钱/change_gold_to_coin", "<#>把银元宝兑换成"..COIN_CHANGE_COUNT_OF_SILVER.."<#>个铜钱/change_silver_to_coin", "不兑换了/no");
	elseif( nGoldCount > 0 and SYSCFG_GAMEBANK_GOLD_COIN) then							-- 只有金元宝
		Say( "钱庄老板：您想兑换哪个元宝呢？", 2, "<#>把金元宝兑换成"..COIN_CHANGE_COUNT_OF_GOLD.."<#>个铜钱/change_gold_to_coin", "不兑换了/no");
	elseif( nSilverCount > 0 and SYSCFG_GAMEBANK_SILVER_COIN) then							-- 只有银元宝
		Say( "钱庄老板：您想兑换哪个元宝呢？", 2, "<#>把银元宝兑换成"..COIN_CHANGE_COUNT_OF_SILVER.."<#>个铜钱/change_silver_to_coin", "不兑换了/no");
	elseif (nGoldCount <= 0 and SYSCFG_GAMEBANK_GOLD_COIN) or (nSilverCount <= 0 and SYSCFG_GAMEBANK_SILVER_COIN) then	-- 一种都没有
		Say( "钱庄老板：您现在没带元宝啊！", 1, "对了，我忘在家里了/no");
	end
end

function change_gold_to_coin()
	if (SYSCFG_GAMEBANK_GOLD_COIN == nil) then -- 出错了~~
		print("coin_gold have close, but something is wrong...");
		Msg2Player("功能出错！");
		return
	end

	if (GetItemCountEx(343) > 0) then
	DelItemEx( 343 );
	AddStackItem( COIN_CHANGE_COUNT_OF_GOLD, 4, 417, 1, 1, 0, 0, 0 );
	UseSilver(0, 2, 1); -- 金元宝兑换为铜钱的消耗统计
	-- SaveQuickly();
	SaveNow(); -- 立即存盘
	WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a GOLD into "..COIN_CHANGE_COUNT_OF_GOLD.." COINS", -1, 0, COIN_CHANGE_COUNT_OF_GOLD, 0 );
	local nGoldCount = GetItemCountEx( 343 );		-- 金元宝个数
	local nSilverCount = GetItemCountEx( 342 );		-- 银元宝个数
	if( nGoldCount > 0 or nSilverCount > 0 ) then
		Say( "<#>钱庄老板：您的金元宝已成功兑换成"..COIN_CHANGE_COUNT_OF_GOLD.."<#>个铜钱，请客倌核查。", 2, "知道了/no", "再兑换一些铜钱/change_ingot_to_coin" );
	else
		Say( "<#>钱庄老板：您的金元宝已成功兑换成"..COIN_CHANGE_COUNT_OF_GOLD.."<#>个铜钱，请客倌核查。", 1, "知道了/no" );
	end
	end
end

function change_silver_to_coin()
	if (SYSCFG_GAMEBANK_SILVER_COIN == nil) then -- 出错了~~
		print("coin_silver have close, but something is wrong...");
		Msg2Player("功能出错！");
		return
	end
	
	if (GetItemCountEx(342) > 0) then
	DelItemEx( 342 );
	AddStackItem( COIN_CHANGE_COUNT_OF_SILVER, 4, 417, 1, 1, 0, 0, 0 );
	UseSilver(1, 2, 1); -- 银票兑换为铜钱的消耗统计
	-- SaveQuickly();
	SaveNow(); -- 立即存盘
	WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a SILVER into "..COIN_CHANGE_COUNT_OF_SILVER.." COINS", 0, -1, COIN_CHANGE_COUNT_OF_SILVER, 0 );
	local nGoldCount = GetItemCountEx( 343 );		-- 金元宝个数
	local nSilverCount = GetItemCountEx( 342 );		-- 银元宝个数
	if( nGoldCount > 0 or nSilverCount > 0 ) then
		Say( "<#>钱庄老板：您的银元宝已成功兑换成"..COIN_CHANGE_COUNT_OF_SILVER.."<#>个铜钱，请客倌核查。", 2, "知道了/no", "再兑换一些铜钱/change_ingot_to_coin" );
	else
		Say( "<#>钱庄老板：您的银元宝已成功兑换成"..COIN_CHANGE_COUNT_OF_SILVER.."<#>个铜钱，请客倌核查。", 1, "知道了/no" );
	end
	end
end

------------ 关于铜钱 ------------------
function onAboutCoin()
	local msg = {
		"钱庄老板：铜钱可以从我这里用元宝或银票换得，元宝或银票换成铜钱后不可以再换回。",
		"<#>钱庄老板：一个<color=yellow>金元宝<color>可兑换<color=yellow>"..COIN_CHANGE_COUNT_OF_GOLD.."<color>枚铜钱，一个<color=yellow>银元宝<color>可兑换<color=yellow>"..COIN_CHANGE_COUNT_OF_SILVER.."<color>枚，一张<color=yellow>银票<color>可兑换<color=yellow>"..COIN_CHANGE_COUNT_OF_TICKET.."<color>枚。",
		"钱庄老板：用铜钱可以在各个城市的零贩处购买各种稀有物品。",
		"钱庄老板：左键单击需要叠放的铜钱，鼠标移动到另一堆铜钱上左键单击，两堆铜钱就会叠放到一起，每堆铜钱叠放的上限是<color=yellow>100<color>个。按住<color=yellow>Shift<color>键，左键单击需要拆分的铜钱，输入想拆出的铜钱个数，即可完成拆分。"
	};
	Talk(4, "", msg[1], msg[2], msg[3], msg[4]);
end

----------------------------------------
function no()
end

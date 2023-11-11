-- 幸运彩票
-- Fanghao Wu
-- 2004.11.13

LOTTERY_GOLD_TYPENAME = "lottery_gold";	-- 彩票名，对应\settings\lotterys.txt的LOTTERY_NAME
EXTPOINT_LOTTERY_GOLD = 3;				-- 领取彩票判断的扩展点的编号
MONTH_CARD_EXTPOINT_COST = 2;			-- 充一张月卡等价的扩展点数
WEEK_CARD_EXTPOINT_COST = 1;			-- 充一张周卡等价的扩展点数
MONTH_CARD_LOTTERY_ID_COUNT = 10;		-- 月卡换取的彩票包含的号码数
WEEK_CARD_LOTTERY_ID_COUNT = 5;			-- 周卡换取的彩票包含的号码数


--	奖品设置格式为：	 {
--						"奖品描述",
--						{
--							{ 候选奖品1名称, { 候选奖品1参数 }, 候选奖品1个数, 候选奖品1抽中概数 },
--							...
--						}
--					 }
--	第1期 （2004.11.22 - 2004.11.28）--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							"安邦之冰晶石项链1条",
--							{ { "安邦之冰晶石项链", { 4, 2549, 0, 164 }, 1, 1 }, }
--						};
--	SECOND_PRIZE_AWARD = {
--							"《武林秘籍》1本",
--							{ { "武林秘籍", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 }, }
--						 };
--	OTHER_PRIZE_AWARD1 = {
--							"仙草露10个",
--							{ { "仙草露", { 6, 1, 71, 1, 0, 0, 0 }, 10, 1 }, }
--						 };
--	OTHER_PRIZE_AWARD2 = {
--							"仙草露2个",
--							{ { "仙草露", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 }, }
--						 };
--	第2期 （2004.11.28 - 2004.12.05）--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							"定国系列黄金装备随机1件",
--							{
--								{ "定国之青纱长衫", { 0, 159 }, 1, 1 },
--								{ "定国之钨砂发冠", { 0, 160 }, 1, 1 },
--								{ "定国之赤绢软靴", { 0, 161 }, 1, 1 },
--								{ "定国之紫藤护腕", { 0, 162 }, 1, 1 },
--								{ "定国之银蚕腰带", { 0, 163 }, 1, 1 },
--							}
--						};
--	SECOND_PRIZE_AWARD = {
--							"《武林秘籍》1本",
--							{
--								{ "武林秘籍", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 },
--							}
--						 };
--	OTHER_PRIZE_AWARD1 = {
--							"水晶或猩红宝石1个",
--							{
--								{ "兰水晶", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "紫水晶", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "绿水晶", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "猩红宝石", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--							}			
--						 };
--	OTHER_PRIZE_AWARD2 = {
--							"仙草露2个",
--							{
--								{ "仙草露", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 },
--							}
--						 };
--	第3期 （2004.12.05 - 2004.12.12）--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							"继业之奔雷钻龙枪1把",
--							{
--								{ "继业之奔雷钻龙枪", { 0, 21 }, 1, 1 },
--							}
--						};
--	SECOND_PRIZE_AWARD = {
--							"定国安邦黄金装备1件",
--							{
--								{ "定国之青纱长衫", { 0, 159 }, 1, 10 },
--								{ "定国之钨砂发冠", { 0, 160 }, 1, 8 },
--								{ "定国之赤绢软靴", { 0, 161 }, 1, 14 },
--								{ "定国之紫藤护腕", { 0, 162 }, 1, 12 },
--								{ "定国之银蚕腰带", { 0, 163 }, 1, 14 },
--								{ "安邦之冰晶石项链", { 0, 164 }, 1, 8 },
--								{ "安邦之菊花石指环", { 0, 165 }, 1, 12 },
--								{ "安邦之田黄石玉佩", { 0, 166 }, 1, 12 },
--								{ "安邦之鸡血石戒指", { 0, 167 }, 1, 10 },
--							}
--					 };
--	OTHER_PRIZE_AWARD1 = {
--							"水晶或猩红宝石1个",
--							{
--								{ "兰水晶", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "紫水晶", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ "绿水晶", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "猩红宝石", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--							}			
--						 };
--	OTHER_PRIZE_AWARD2 = {
--								"仙草露2个",
--							{
--								{ "仙草露", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 },
--							}
--						 };


--	第5期 （2004.12.27 - 2005.01.02）--------------------------------------------------------
--FIRST_PRIZE_AWARD = {
--						"各门派大黄金装备随机一件",
--						{
--							{ "魔煌之按出虎项圈", { 0, 107 }, 1, 1 },
--							{ "及丰之三清符", { 0, 122 }, 1, 1 },
--							{ "无魇之洗象玉扣", { 0, 39 }, 1, 1 },
--							{ "洞察之白玉乾坤佩", { 0, 144 }, 1, 1 },
--							{ "同仇之降龙丐衣", { 0, 92 }, 1, 1 },
--							{ "幽胧之墨蛛软履", { 0, 60 }, 1, 1 },
--						}
--					};
--SECOND_PRIZE_AWARD = {
--						"《武林秘籍》1本",
--						{
--							{ "武林秘籍", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 },
--						}
--					 };
--OTHER_PRIZE_AWARD1 = {
--						"水晶或猩红宝石1个",
--						{
--							{ "兰水晶", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ "紫水晶", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ "绿水晶", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ "猩红宝石", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--						}			
--					 };
--OTHER_PRIZE_AWARD2 = {
--						"仙草露3个",
--						{
--							{ "仙草露", { 6, 1, 71, 1, 0, 0, 0 }, 3, 1 },
--						}
--					 };
					 

--第6期(2005.01.02 - 2005.01.09)
FIRST_PRIZE_AWARD = {
						"安邦之冰晶石项链1条",
						{ 
							{ "安邦之冰晶石项链", { 0, 164 }, 1, 1 }, 
						}
					};
SECOND_PRIZE_AWARD = {
						"《洗髓经》1本",
						{
							{ "洗髓经", { 6, 1, 22, 1, 0, 0, 0 }, 1, 1 },
						}
					 };
OTHER_PRIZE_AWARD1 = {
						"大白驹丸3个",
						{
							{ "大白驹丸", { 6, 1, 130, 1, 0, 0, 0 }, 3, 1 },
						}			
					 };
OTHER_PRIZE_AWARD2 = {
						"大白驹丸1个",
						{
							{ "大白驹丸", { 6, 1, 130, 1, 0, 0, 0 }, 1, 1 },
						}
					 };

-- 幸运彩票菜单项
function onLotteryGold()
	Say( "礼官：您好，为了回报您对于我们的大力支持，剑网自2004年11月22日起推出幸运彩票活动。通过每个周日的开奖，您将获得我们送出的各种丰厚奖品。如果您有不清楚的地方，可以参阅本菜单中关于幸运彩票的详细解释。", 5, "领取幸运彩票/onLotteryGold_Gain", "幸运彩票兑奖/onLotteryGold_Prize", "查询中奖号码/onLotteryGold_QueryPrize", "关于幸运彩票/onLotteryGold_About", "我只是来逛逛/onCancel" );
end

-- 非扬州的礼官的对话
function onLotteryGoldEx()
	Say( "礼官：您好，为了回报您对于我们的大力支持，剑网自2004年11月22日起推出幸运彩票活动。通过每个周日的开奖，您将获得我们送出的各种丰厚奖品，此活动只限于在<color=red>扬州<color>的礼官处进行。",0);
end

-- 领取幸运彩票
function onLotteryGold_Gain()

	Say( "礼官：本期彩票稍候发行，发行时间请您多多关注。", 1, "我知道了，谢谢/main" );
	do return end
	
	local nWeekDay = tonumber( date( "%w" ) );
	local nHour = tonumber( date( "%H" ) );
	if( nWeekDay == 0 and nHour >= 8 and nHour < 11 ) then
		Say( "礼官：很抱歉，每周日8：00至11：00期间所充卡无法换取彩票，活动细则请查看“关于幸运彩票”，多谢合作。", 1, "我知道了，谢谢/onLotteryGold" );
		do return end
	end
	local nEPValue = GetExtPoint( EXTPOINT_LOTTERY_GOLD );
	local nMonthCardCount = 0;
	local nWeekCardCount = 0;
	local nMonthLotteryCount = 0;
	local nWeekLotteryCount = 0;
	local szSayContent = "";
	
	if( nEPValue >= WEEK_CARD_EXTPOINT_COST ) then
		nMonthCardCount = floor( nEPValue / MONTH_CARD_EXTPOINT_COST );
		nWeekCardCount = floor( mod( nEPValue, MONTH_CARD_EXTPOINT_COST ) / WEEK_CARD_EXTPOINT_COST );
		szSayContent = "<#>礼官：您可以领取";
		if( nMonthCardCount > 0 ) then
			szSayContent = szSayContent.." <color=yellow>"..nMonthCardCount.."<#><color> 张10随机号码的套票";
		end
		if( nWeekCardCount > 0 ) then
			if( nMonthCardCount > 0 ) then
				szSayContent = szSayContent.."<#>和";
			end
			szSayContent = szSayContent.." <color=yellow>"..nWeekCardCount.."<#><color> 张5随机号码的套票";
		end
		szSayContent = szSayContent.."<#>，请整理好您的背包，确保有足够的空间放置彩票，不要让别人捡了便宜哦。";
		if( nMonthCardCount + nWeekCardCount > 10 ) then
			Say( szSayContent, 4, "背包空着哪，我全部彩票一块领了吧/onLotteryGold_Gain_All", "背包空间不是很够，我先只领10张彩票吧/onLotteryGold_Gain_10", "背包空间不是很够，我先只领1张彩票吧/onLotteryGold_Gain_1", "我再整理一下背包吧/onCancel" );
		else
			Say( szSayContent, 3, "背包空着哪，我全部彩票一块领了吧/onLotteryGold_Gain_All", "背包空间不是很够，我先只领1张彩票吧/onLotteryGold_Gain_1", "我再整理一下背包吧/onCancel" );
		end
	else
		Say( "礼官：对不起，您本周尚未充卡或者您已领取了本期的幸运彩票，这项购买活动是针对充卡用户的特别奖励哦，您有可能会幸运的获得黄金装备，您仔细考虑考虑嘛。", 0 );
	end
end

-- 领取幸运彩票-确认领取全部彩票
function onLotteryGold_Gain_All()
	onLotteryGold_Gain_Count( 0 );
end

-- 领取幸运彩票-确认领取10张彩票
function onLotteryGold_Gain_10()
	onLotteryGold_Gain_Count( 10 );
end

-- 领取幸运彩票-确认领取1张彩票
function onLotteryGold_Gain_1()
	onLotteryGold_Gain_Count( 1 );
end

-- 领取幸运彩票-确认领取指定数目的彩票（0表示领取全部）
function onLotteryGold_Gain_Count( nLotteryCount )
	local nEPValue = GetExtPoint( EXTPOINT_LOTTERY_GOLD );
	local nMonthCardCount = 0;
	local nWeekCardCount = 0;
	local nMonthLotteryCount = 0;
	local nWeekLotteryCount = 0;
	
	if( nEPValue >= WEEK_CARD_EXTPOINT_COST ) then
		nMonthCardCount = floor( nEPValue / MONTH_CARD_EXTPOINT_COST );
		nWeekCardCount = floor( mod( nEPValue, MONTH_CARD_EXTPOINT_COST ) / WEEK_CARD_EXTPOINT_COST );
		if( nLotteryCount == 0 ) then
			nLotteryCount = nMonthCardCount + nWeekCardCount;
		end
		for i = 1, nMonthCardCount do
			if( i > nLotteryCount ) then
				break;
			end
			if( Lottery_GenerateItem( LOTTERY_GOLD_TYPENAME, MONTH_CARD_LOTTERY_ID_COUNT ) == 1 ) then
				nMonthLotteryCount = nMonthLotteryCount + 1;
				PayExtPoint( EXTPOINT_LOTTERY_GOLD, MONTH_CARD_EXTPOINT_COST );
			end
		end
		for i = 1, nWeekCardCount do
			if( ( nMonthLotteryCount + i ) > nLotteryCount ) then
				break;
			end
			if( Lottery_GenerateItem( LOTTERY_GOLD_TYPENAME, WEEK_CARD_LOTTERY_ID_COUNT ) == 1 ) then
				nWeekLotteryCount = nWeekLotteryCount + 1;
				PayExtPoint( EXTPOINT_LOTTERY_GOLD, WEEK_CARD_EXTPOINT_COST );
			end
		end
		
		if( ( nMonthLotteryCount + nWeekLotteryCount ) > 0 ) then
			szSayContent = "<#>礼官：您已经领取了";
			if( nMonthLotteryCount > 0 ) then
				szSayContent = szSayContent.." <color=yellow>"..nMonthLotteryCount.."<#><color> 张10随机号码的套票";
			end
			if( nWeekLotteryCount > 0 ) then
				if( nMonthLotteryCount > 0 ) then
					szSayContent = szSayContent.."<#>和";
				end
				szSayContent = szSayContent.." <color=yellow>"..nWeekLotteryCount.."<#><color> 张5随机号码的套票";
			end
			szSayContent = szSayContent.."<#>，请在北京时间本周日早晨11：00到下周日早晨11：00之间来兑奖吧。";
			if( ( nMonthLotteryCount + nWeekLotteryCount ) < ( nMonthCardCount + nWeekCardCount ) ) then
				szSayContent = szSayContent.."<#>您还有几张彩票在我这儿，不要忘了在本周日8：00前来领走哦。";
			end
			Say( szSayContent, 0 );
			
			Msg2Player( "<#>您获得了"..(nMonthLotteryCount+nWeekLotteryCount).."<#>张幸运彩票" );
			WriteLog( format( "[%s] %s(%s) 领取了 %d张10号码彩票 %d张5号码彩票\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nMonthLotteryCount, nWeekLotteryCount ) );
		else
			Say( "礼官：幸运彩票暂时无法领取，请稍候再试，谢谢。", 0 );
		end
	end
end

-- 幸运彩票兑奖
function onLotteryGold_Prize()

	Say("礼官：上一期彩票没有发行哦，具体的发行时间还请您多留意。",0)
	do return end
	
	local nPrizeIssueID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	if( nPrizeIssueID > 0 ) then
		Say( "<#><color=yellow>第"..format( "%03d", nPrizeIssueID ).."<#>期幸运彩票奖品<color>：\n一等奖："..FIRST_PRIZE_AWARD[1].."<#>\n二等奖："..SECOND_PRIZE_AWARD[1].."<#>\n纪念奖：[大套票]"..OTHER_PRIZE_AWARD1[1].."<#> [小套票]"..OTHER_PRIZE_AWARD2[1].."<#>\n<color=red>注：由于奖品数量较多，在兑奖前请注意整理背包，确保有足够的空间放置奖品。建议不要一次兑换过多彩票。<color>", 2, "没问题，背包有足够的空间/onLotteryGold_Prize_Check", "我再整理一下背包吧/onCancel"  );
	else
		Say( "幸运彩票尚未开奖，请于本周日早上11：00后再来吧，谢谢。", 1, "我知道了，谢谢/onLotteryGold" );		
	end
end

-- 幸运彩票兑奖-彩票兑奖界面
function onLotteryGold_Prize_Check()
	
	local nPrizeIssueID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	GiveItemUI( "第"..format( "%03d", nPrizeIssueID ).."期幸运彩票兑奖", "礼官：请将到达兑奖时间的彩票放到此界面中，我们将把您获得的奖品自动放入您的物品栏。若彩票已过期，则无法兑换。<color=white>注：由于奖品数量较多，不要一次兑换过多彩票，以防背包空间不足，奖品掉落。<color>", "onLotteryGold_Prize_Confirm", "onCancel" );
end

-- 幸运彩票兑奖-彩票兑奖界面“确定”回调函数
function onLotteryGold_Prize_Confirm( nCount )
	local nLotteryItemIndex, nLotteryIDCount, nPrize1Count, nPrize2Count, nPrize1TotalCount, nPrize2TotalCount, nOtherPrizeTotalCount;
	local nLotteryItemCount = 0;
	local nPrize1TotalCount = 0;
	local nPrize2TotalCount = 0;
	local nOtherPrizeTotalCount = 0;
	local szHeOrShe;
	
	if( GetSex() == 1 ) then
		szHeOrShe = "她";
	else
		szHeOrShe = "他";
	end
	
	for i = 1, nCount do
		local nLotteryItemIndex = GetGiveItemUnit( i );
		local nLotteryIssueID = GetItemParam( nLotteryItemIndex, 1 );
		local nLotteryIDCount, nPrize1Count, nPrize2Count = Lottery_CheckPrize( LOTTERY_GOLD_TYPENAME, nLotteryItemIndex );
		local nRandAwardIdx;
		
		if( nLotteryIDCount > 0 ) then
			nLotteryItemCount = nLotteryItemCount + 1;
			if( RemoveItemByIndex( nLotteryItemIndex ) == 1 ) then
				if( nPrize1Count > 0 or nPrize2Count > 0 ) then
					for j = 1, nPrize1Count do
						local aryProbability = {};
						for k = 1, getn( FIRST_PRIZE_AWARD[2] ) do
							aryProbability[k] = FIRST_PRIZE_AWARD[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for k = 1, FIRST_PRIZE_AWARD[2][nRandAwardIdx][3] do
							addAward( FIRST_PRIZE_AWARD[2][nRandAwardIdx][2] );
						end
						Lottery_WriteLog( LOTTERY_GOLD_TYPENAME, format( "[%s] %s(%s) 领取了第%d期的一等奖奖品 %d个%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, FIRST_PRIZE_AWARD[2][nRandAwardIdx][3], FIRST_PRIZE_AWARD[2][nRandAwardIdx][1] ) );
						Msg2Player( "<#>您获得了"..FIRST_PRIZE_AWARD[2][nRandAwardIdx][3].."<#>个"..FIRST_PRIZE_AWARD[2][nRandAwardIdx][1] );
						AddGlobalNews( "<#>特好消息，"..GetName().."<#>在扬州的礼官处所领取的第"..format("%03d", nLotteryIssueID).."<#>期幸运彩票中得一等奖，获得"..FIRST_PRIZE_AWARD[2][nRandAwardIdx][1]..FIRST_PRIZE_AWARD[2][nRandAwardIdx][3].."<#>件，让我们衷心祝福"..szHeOrShe.."<#>。我们期待您的参与，谢谢。");
					end
					for j = 1, nPrize2Count do
						local aryProbability = {};
						for k = 1, getn( SECOND_PRIZE_AWARD[2] ) do
							aryProbability[k] = SECOND_PRIZE_AWARD[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for k = 1, SECOND_PRIZE_AWARD[2][nRandAwardIdx][3] do
							addAward( SECOND_PRIZE_AWARD[2][nRandAwardIdx][2] );
						end
						Lottery_WriteLog( LOTTERY_GOLD_TYPENAME, format( "[%s] %s(%s) 领取了第%d期的二等奖奖品 %d个%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, SECOND_PRIZE_AWARD[2][nRandAwardIdx][3], SECOND_PRIZE_AWARD[2][nRandAwardIdx][1] ) );
						Msg2Player( "<#>您获得了"..SECOND_PRIZE_AWARD[2][nRandAwardIdx][3].."<#>个"..SECOND_PRIZE_AWARD[2][nRandAwardIdx][1] );
						AddGlobalNews( format( "特好消息，%s在扬州的礼官处所领取的第%03d期幸运彩票中得二等奖，获得%s%d个，让我们衷心祝福%s。我们期待您的参与，谢谢。", GetName(), nLotteryIssueID, SECOND_PRIZE_AWARD[2][nRandAwardIdx][1], SECOND_PRIZE_AWARD[2][nRandAwardIdx][3], szHeOrShe ) );
					end
					nPrize1TotalCount = nPrize1TotalCount + nPrize1Count;
					nPrize2TotalCount = nPrize2TotalCount + nPrize2Count;
				else
					if( nLotteryIDCount == 10 ) then
						local aryProbability = {};
						for k = 1, getn( OTHER_PRIZE_AWARD1[2] ) do
							aryProbability[k] = OTHER_PRIZE_AWARD1[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for j = 1, OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3] do
							addAward( OTHER_PRIZE_AWARD1[2][nRandAwardIdx][2] );
						end
						WriteLog( format( "[%s] %s(%s) 领取了第%d期的三等奖大套票奖品 %d个%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3], OTHER_PRIZE_AWARD1[2][nRandAwardIdx][1] ) );
						Msg2Player( "<#>您获得了"..OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3].."<#>个"..OTHER_PRIZE_AWARD1[2][nRandAwardIdx][1] );
					else
						local aryProbability = {};
						for k = 1, getn( OTHER_PRIZE_AWARD2[2] ) do
							aryProbability[k] = OTHER_PRIZE_AWARD2[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for j = 1, OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3] do
							addAward( OTHER_PRIZE_AWARD2[2][nRandAwardIdx][2] );
						end
						WriteLog( format( "[%s] %s(%s) 领取了第%d期的三等奖小套票奖品 %d个%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3], OTHER_PRIZE_AWARD2[2][nRandAwardIdx][1] ) );
						Msg2Player( "<#>您获得了"..OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3].."<#>个"..OTHER_PRIZE_AWARD2[2][nRandAwardIdx][1] );
					end
					nOtherPrizeTotalCount = nOtherPrizeTotalCount + 1;
				end
			end
		end
	end
	if( nLotteryItemCount > 0 ) then
		local szPrizeResultContent = "礼官：恭喜您！在您兑换的彩票中开中了<color=yellow>"
		if( nPrize1TotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<#> 一等奖"..nPrize1TotalCount.."<#>个";
		end
		if( nPrize2TotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<#> 二等奖"..nPrize2TotalCount.."<#>个";
		end
		if( nOtherPrizeTotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<#> 纪念奖"..nOtherPrizeTotalCount.."<#>个";
		end
		szPrizeResultContent = szPrizeResultContent.."<color>"
		Say( szPrizeResultContent, 0 );
	else
		Say( "请检查您放置的是有效兑奖期内的幸运彩票", 3, "刚才搞错了，我重新放吧/onLotteryGold_Prize", "我想看一下中奖彩票号码/onLotteryGold_QueryPrize", "我没有要兑的彩票了，下次再来吧/onCancel" );
	end
end

-- 查询上期中奖号码
function onLotteryGold_QueryPrize()
	

	Say("礼官：上一期彩票没有发行哦，具体的发行时间还请您多留意。",0)
	do return end
	
	local szResultPrize1, szResultPrize2;
	local nPrizeIssueID, nPrize1Count, nPrize2Count;
	local aryaryszPrize1ID = {};
	local aryaryszPrize2ID = {};
	
	nPrizeIssueID, aryaryszPrize1ID, aryaryszPrize2ID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	nPrize1Count = getn( aryaryszPrize1ID );
	nPrize2Count = getn( aryaryszPrize2ID );
	if( nPrizeIssueID > 0 ) then
		for i = 1, nPrize1Count do
			if( aryaryszPrize1ID[i] == nil or tonumber( aryaryszPrize1ID[i] ) < 0 ) then
				aryaryszPrize1ID[i] = " (空) ";
			end
		end
		for i = 1, nPrize2Count do
			if( aryaryszPrize2ID[i] == nil or tonumber( aryaryszPrize2ID[i] ) < 0 ) then
				aryaryszPrize2ID[i] = " (空) ";
			end
		end
		szResultPrize1 = "<#>上期(<color=red>第"..format( "%03d", nPrizeIssueID ).."<#><color>)期幸运彩票中彩信息\n";
		szResultPrize1 = szResultPrize1.."<#><color=yellow>一等奖<color>幸运号码：\n<color=yellow>";
		for i = 1, nPrize1Count do
			szResultPrize1 = szResultPrize1..aryaryszPrize1ID[i].." ";
		end
		szResultPrize2 = "<#>上期(<color=red>第"..format( "%03d", nPrizeIssueID ).."<#><color>)期幸运彩票中彩信息\n";
		szResultPrize2 = szResultPrize2.."<#><color=yellow>二等奖<color>幸运号码：\n<color=yellow>";
		for i = 1, nPrize2Count do
			szResultPrize2 = szResultPrize2..aryaryszPrize2ID[i].." ";
			if( mod( i, 7 ) == 0 ) then
				szResultPrize2 = szResultPrize2.."\n";
			end
		end
		Talk( 2, "onLoteryGold", szResultPrize1, szResultPrize2 );
	else
		Say( "幸运彩票尚未开奖，请于<color=yellow>本周日11：00<color>后再来查询，谢谢。", 1, "我知道了，谢谢/onLotteryGold" );
	end
end

-- 关于幸运彩票
function onLotteryGold_About()
	Talk( 3, "", "礼官：幸运彩票是以套票的方式赠送给您，每充值一张30元充值卡获得1张套票，票内包含<color=yellow>10<color>个随机号码。每充值一张10元充值卡获得1张套票，票内包含<color=yellow>5<color>个随机号码。", "礼官：允许充卡领取彩票的时间为：每期彩票在该彩票发行的<color=yellow>周日早晨11：00至下周日早晨8：00<color>领取。<color=red>而每周日的早晨8：00至11：00,所充的卡不能领取彩票。<color>", "礼官：在周日早晨11：00我们将公告当期中奖号码，您在获得彩票后可根据票面的兑奖时间和自己的随机号码来兑换奖品。" );
end

-- 本期彩票开奖并启动新一期彩票（SystemTask每天定时调用）
function onLotteryGold_UpdateIssue()
	
	do return end;
	
	local nLotteryLatestIssueID = Lottery_UpdateIssue( LOTTERY_GOLD_TYPENAME );
	if( nLotteryLatestIssueID > 0 ) then
		local nPrizeIssueID, nPrize1Count, nPrize2Count;
		local aryszPrize1ID = {};
		local aryszPrize2ID = {};
		
		nPrizeIssueID, aryaryszPrize1ID, aryaryszPrize2ID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
		nPrize1Count = getn( aryaryszPrize1ID );
		nPrize2Count = getn( aryaryszPrize2ID );
		if( nPrizeIssueID > 0 ) then
			for i = 1, nPrize1Count do
				if( aryaryszPrize1ID[i] == nil or tonumber( aryaryszPrize1ID[i] ) < 0 ) then
					aryaryszPrize1ID[i] = " (空) ";
				end
			end
			for i = 1, nPrize2Count do
				if( aryaryszPrize2ID[i] == nil or tonumber( aryaryszPrize2ID[i] ) < 0 ) then
					aryaryszPrize2ID[i] = " (空) ";
				end
			end
			local szNewsContent = "<#>号外！号外！第"..format( "%03d", nPrizeIssueID ).."<#>期幸运彩票开奖啦！一等奖幸运号码是 ";
			for i = 1, nPrize1Count do
				szNewsContent = szNewsContent..aryaryszPrize1ID[i].." ";
			end
			szNewsContent = szNewsContent.."<#>，二等奖幸运号码是 ";
			for i = 1, nPrize2Count do
				szNewsContent = szNewsContent..aryaryszPrize2ID[i].." ";
			end
			szNewsContent = szNewsContent.."<#>。本期一等奖得主将获得 "..FIRST_PRIZE_AWARD[1].."<#> ！ 二等奖得主将获得  "..SECOND_PRIZE_AWARD[1].."<#> ！ 大家赶紧查对一下自己的彩票，并及时到扬州礼官处领取奖品！";
			AddGlobalCountNews( szNewsContent, 3 );
		end
	end
end

-- 取消
function onCancel()
end

-- 根据若干个指定概率的选项随机选出某一项
function randByProbability( aryProbability )
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = mod( random( nSum ) + random( 191 ), nSum ) + 1;
	for i = nArgCount, 1, -1 do
		nSum = nSum - aryProbability[i];
		if( nRandNum > nSum ) then
			return i;
		end
	end
end

-- 给予玩家指定参数的奖品
function addAward( aryAwardParam )
	local nAwardParamCount = getn( aryAwardParam );
	if( nAwardParamCount == 2 ) then
		return AddGoldItem( aryAwardParam[1], aryAwardParam[2] );
	elseif( nAwardParamCount == 4 ) then
		return AddVerGoldItem( aryAwardParam[1], aryAwardParam[2], aryAwardParam[3], aryAwardParam[4] );
	elseif( nAwardParamCount == 7 ) then
		return AddItem( aryAwardParam[1], aryAwardParam[2],aryAwardParam[3], aryAwardParam[4], aryAwardParam[5], aryAwardParam[6], aryAwardParam[7] );
	end
	return 0;
end
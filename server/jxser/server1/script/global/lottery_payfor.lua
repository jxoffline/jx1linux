TEMP_QID = 122;
TEMP_QCHOOSE = 123;
GOLD_TIMESTEMP = 4001;
GOLD_SERIES = 4000;
GOLD_COUNT = 4002;
FIRSTDAY = 816;

GLBID_GOLD_LOTTERY_COUNT = 6;	--全局变量ID of 服务器上已发出的黄金彩票数
-- 七大城市地图
-- 1-凤翔, 2-成都, 3-大理, 4-汴京, 5-襄阳, 6-扬州, 7-临安
arynCityMapID = { 1, 11, 162, 37, 78, 80, 176 }
nMaxGoldLottery = 100000;		--每台GameServer上可发出的最多黄金彩票数

function onPayTicket()
if (IsCharged() ~= 1 ) then
	 Say("对不起，您尚未充值，所以无法参加雅典盛会彩票活动。", 0)
	return
end
nCount = GetPayTicketCount();

if (nCount == 0 ) then
	Say("对不起，现在没到兑换彩票的时间，请您在北京时间早晨9点到当日晚上22点来兑换吧，谢谢。", 0) 
	return
end;

Tab = {};

for i = 1, nCount + 1 do 
	Tab[i] = GetQuestionTip(GetPayTicket(i)).."/OPAsk";
end;

Tab[nCount + 1] = "不兑奖了/Cancel";
Say("您要兑那种哪种奖?", nCount + 1, Tab)
end;

function OPAsk(nSel)
	nQuestion, nBonus = GetPayTicket(nSel + 1);
	if (nQuestion > 0 ) then 
		nAnswer = GetQAnswer(nQuestion)
		if (nAnswer > 0) then 
			if (nQuestion ~= 1000) then 
				str = format("竞猜:%s，结果:%s ,奖金:%d。您要兑奖吗?", GetQuestion(nQuestion), GetChoose(nQuestion, nAnswer), nBonus )
			else
				lGold = GetByte(nAnswer, 1);
				lYing = GetByte(nAnswer,2);
				lTong = GetByte(nAnswer,3);
				str = format("竞猜:%s, 结果:金牌%d块、银牌%d块、铜牌%d块, 奖金:%d。你要兑奖吗?", GetQuestion(nQuestionI), lGold, lYing, lTong,nBonus)
			end
			Say(str, 2, "兑奖/OPOnPayFor", "不兑奖/Cancel");
			SetTaskTemp(TEMP_QID, nQuestion)
		end
	end
end;


function OPOnPayFor()
	nQuestion = GetTaskTemp(TEMP_QID)
	nTotal, nRight, nBonus = CheckTicket(75, nQuestion);
	
	if (nTotal == 0) then
		Say("对不起，您购买的彩票没有答对，再接再厉，不要放弃哦，也许大奖就在等着您，黄金装备呢！", 0)
	else
		nTotalBonus = nBonus * nRight
		local str = "";
		if (nQuestion ~= 1000) then 
			str = format("您一共有%d张这类奖票,其中中奖的有%d张,得到的总奖金为%d,恭喜您!如果您中奖,我们还将赠送给您黄金彩票,凭此彩票可能会获得一件黄金装备哦。黄金彩票的开奖日期就在今晚的22点30到24点。", nTotal,nRight, nTotalBonus);
		else
			str = format("您一共有%d张这类奖票,其中中奖的有%d张,得到的总奖金为%d,恭喜您!如果您中奖,我们还将赠送给您黄金彩票,凭此彩票可能会获得一件本次雅典盛会的黄金装备大奖！！开奖日期在9月1日、9月2日晚22点30到24点。", nTotal,nRight, nTotalBonus);
		end
		
		local logstr = format("[Lottery] Acc:%s Role:%s Q:%d QSum:%d QWin:%d Bonus:%d", GetAccount(), GetName(), nQuestion, nTotal, nRight, nTotalBonus )
		WriteLog(logstr);	
		Earn(nTotalBonus);
		Say(str,0)
		
		for i = 1, nRight do 
			item = AddItem(6,1,76, 1,0,0);
			LotteryId = getGoldLotteryID();
			LotteryTime = getCurrTime();
			SetSpecItemParam(item , 1, LotteryId)
			SetSpecItemParam(item , 2, LotteryTime)
			P3 = SetByte(GetByte(LotteryId, 3), 2, GetByte(LotteryId,4))
			P4 = SetByte(GetByte(LotteryTime, 3), 2, GetByte(LotteryTime,4))
			SetSpecItemParam(item , 3, P3)
			SetSpecItemParam(item , 4, P4)
			SetSpecItemParam(item, 5, nQuestion)
			if (nQuestion == 1000) then 
				SetSpecItemParam(item, 5, 1000)
				UpdateSDBRecord("GoldLottery0901", LotteryId, LotteryTime, 0) --黄金大奖记录为9月1日的彩票
			else
				UpdateSDBRecord("GoldLottery"..date("%m%d"),LotteryId, LotteryTime, 0)
			end
			SyncItem(item)
		end;
	end;
end;

function Cancel()

end;

function onPayforGoldLottery()
	local PayTab={};
	if (tonumber(date("%m%d")) > 831 ) then 
		Say("对不起，本次雅典盛会的普通黄金彩票的兑奖活动已经结束了。",0)
		return
	end
	
	nIntervalDay = tonumber(date("%m%d")) - FIRSTDAY + 1;
	
	if (nIntervalDay <=0) then 
		return
	end

	for i = 1, nIntervalDay do 
		nMonth = floor((FIRSTDAY + nIntervalDay - i) / 100)
		nDay = mod(FIRSTDAY + nIntervalDay - i , 100)
		PayTab[i] = nMonth.."月"..nDay.."日黄金彩票/doPayforGold"
	end;
	PayTab[nIntervalDay + 1] = "不用兑奖了/Cancel";
	Say("你要兑换哪一天的黄金彩票大奖？", getn(PayTab), PayTab);
--	Say("本日中奖的黄金彩票号为["..GetGlbValue(GOLD_TIMESTEMP).."-"..GetGlbValue(GOLD_SERIES).."],获奖者可得到随机得到黄金装备一件！你要兑奖吗？", 2, "好的/doPayforGold", "不用了/Cancel")
end

function doPayforGold(nDay)

	ldate = tonumber(date("%m%d"))
	
	if (ldate > 831) then 
		return 
	end
	
	nIntervalDay = ldate - FIRSTDAY + 1;

	if (nIntervalDay <= 0) then
		return
	end

	nSel =  nIntervalDay - nDay - 1;
	dayGOLD_SERIES = GOLD_SERIES + nSel * 2;
	dayGOLD_TIMESTEMP = GOLD_TIMESTEMP + nSel * 2;

	if ( GetGlbValue(dayGOLD_TIMESTEMP) == 0 ) then 
		Say("对不起，目前该日期的黄金彩票可能尚未开出，请稍后再兑奖，谢谢。", 0)
		return
	end;

	 nItem = FindSpecItemParam2(1, 76, GetGlbValue(dayGOLD_SERIES), GetGlbValue(dayGOLD_TIMESTEMP));
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) > 0) then 
			Say("恭喜你，你的黄金彩票中奖了，获得黄金装备一件！", 0)
			
			nMonth = floor((FIRSTDAY + nSel)/100);
			nDay = mod( (FIRSTDAY + nSel) , 100)

			AddGoldItem(0, random(159,167))
			Msg2Player("恭喜你获得黄金装备一件！")
			WriteLog(GetAccount()..","..GetName().."中了"..FIRSTDAY+nSel.."黄金彩票大奖，获得黄金装备一件。彩票ID"..GetGlbValue(dayGOLD_TIMESTEMP).."-".. GetGlbValue(dayGOLD_SERIES))
			msg = "恭喜:玩家"..GetName().." 中了"..nMonth.."月"..nDay.."日的黄金彩票大奖，获得黄金装备一件！";
			AddGlobalCountNews(msg, 1);
		end
	else
		Say("对不起，中奖号为"..GetGlbValue(dayGOLD_TIMESTEMP).."-"..GetGlbValue(dayGOLD_SERIES).."，你身上开奖的黄金彩票中没有匹配的中奖号码。", 0)
	end
end;



function doPayforGreateGold()

	nIntervalDay = 901 - FIRSTDAY;
	
	dayGOLD_SERIES = GOLD_SERIES + nIntervalDay * 2;
	dayGOLD_TIMESTEMP = GOLD_TIMESTEMP + nIntervalDay * 2;

	if ( GetGlbValue(dayGOLD_TIMESTEMP) == 0 ) then 
		Say("对不起，目前雅典盛会竞猜中国奖牌数的黄金彩票中奖号可能尚未开出，请稍后再兑奖，谢谢。", 0)
		return
	end;

	
	nItem = FindSpecItemParam2(1, 76, GetGlbValue(dayGOLD_SERIES), GetGlbValue(dayGOLD_TIMESTEMP));
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) > 0) then 
			Say("热烈地恭喜您，您的黄金彩票中奖了，中了奥运系列活动的最大奖！获得雅典之魂、北京之梦高级黄金戒指一对！", 0)
			AddGoldItem(0, 141)
			AddGoldItem(0, 142)
			Msg2Player("您获得雅典之魂、北京之梦一对黄金戒指！")
			WriteLog(GetAccount()..","..GetName().."中了奥运中国队奖牌数的黄金彩票大奖，获得奥运戒指装备一套。彩票ID"..GetGlbValue(dayGOLD_TIMESTEMP).."-".. GetGlbValue(dayGOLD_SERIES))
			msg = "热烈恭喜:玩家"..GetName().." 中了雅典盛会中国队奖牌数竞猜的黄金大奖，获得雅典之魂、北京之梦高级黄金戒指一对！";
			AddGlobalNews(msg);
		end
	else
		Say("对不起，中奖号为"..GetGlbValue(dayGOLD_TIMESTEMP).."-"..GetGlbValue(dayGOLD_SERIES).."，你身上开奖的黄金彩票中没有匹配的中奖号码。", 0)
	end
end;



function getGoldLotteryID()
	local nMapCount = getn( arynCityMapID );
	local nCurrServerID = nMapCount + 1;
	for i = 1, nMapCount do
		if( SubWorldID2Idx( arynCityMapID[i] ) >= 0 ) then	--利用地图是否存在来判断当前是在哪一台服务器上
			nCurrServerID = i;
			break;
		end
	end
	local nLotteryCount = GetGlbValue( GLBID_GOLD_LOTTERY_COUNT );
	SetGlbValue( GLBID_GOLD_LOTTERY_COUNT, nLotteryCount + 1 );
	return nMaxGoldLottery * ( nCurrServerID - 1 ) + nLotteryCount;
end

function getCurrTime()
	return tonumber( date( "%m%d%H%M%S" ) );
end
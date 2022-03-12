QUESTKEY_TICKET = 488;					-- 银票的物品ID

function OnExtPointChange_Proc(nExtPointIndex, nChangeValue)
	if (ExtFunTab[nExtPointIndex + 1] == nil) then
		print("Error!!!!!!!!, No ExtPoint Fun On"..nExtPointIndex)
		WriteGoldLog("Importacne Error!!!!!!!!, No ExtPoint CallFun On"..nExtPointIndex..", "..GetAccount().." "..GetName().." nExtPointIndex"..nExtPointIndex.." nChangeValue"..nChangeValue, 0, 0, 0, 0)
		return
	end
	ExtFunTab[nExtPointIndex + 1](nChangeValue)
end

function OnPayYuanBao(nChangeValue)
	nValue = -nChangeValue
	if (nValue == 4) then
	--拿金元宝
		AddEventItem(343)
		SaveNow(); -- 立即存盘
		WriteGoldLog( GetAccount().."("..GetName()..") MAKE a GOLD with a HIGH CARD", 1, 0, 0, 0 );
		Talk(1,"","钱庄老板：这是您的金元宝，请拿好喽！")
		Msg2Player( "您获得1个金元宝.金元宝操作已成功！");
	elseif (nValue == 1) then
	--拿银元宝
		AddEventItem(342)
		SaveNow(); -- 立即存盘
		WriteGoldLog( GetAccount().."("..GetName()..") MAKE a SILVER with a LOW CARD", 0, 1, 0, 0 );
 		Talk(1,"","钱庄老板：这是您的银元宝，请拿好喽！")
		Msg2Player( "您获得1个银元宝.银元宝操作已成功！");
 	elseif( nValue > 1) then
			WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO , MUST PAY(4) BUT PAY("..nValue..")!!!!", 0,0,0,0)
			Msg2Player("元宝操作出错，已备档，请与管理员联系！")
	else
			WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO PAYVALUE <= 0", 0,0,0,0)
			Say("钱庄老板：对不起，客倌您并没有在小号寄存元宝。", 0)
	end
end

function OnPayYinPiao(nChangeValue)
--拿银票
	nValue = -nChangeValue
	  if (nValue == 1) then
		AddEventItem(QUESTKEY_TICKET)
		SaveNow(); -- 立即存盘
		WriteGoldLog( GetAccount() .. "(" .. GetName() .. ") MAKE a TICKET:"..szItemEnName, 0, 0, 0, 1 );
		Say("钱庄老板：这是您的银票，请拿好喽！",0)
		Msg2Player( "您获得1个银票.银票操作已成功！");
		elseif (nValue > 1) then
				WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YINPIAO , MUST PAY(1) BUT PAY("..nValue..")!!!!")
				Msg2Player("银票操作出错，已备档，请与管理员联系！")
		else
				Say("钱庄老板：对不起，客倌您并没有在小号寄存银票。", 0)
				WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO PAYVALUE <= 0", 0,0,0,0)
	  end
end

function LiguanLog(object)
	WriteLog(date("%H%M%S") .. "：账号：" .. GetAccount() .. "，角色：" .. GetName() .. "，" .. object);
end
	
function OnYearGift(nChangeValue)
	nValue = -nChangeValue
			if (nValue == 1) then
				AddStackItem(5, 6, 1, 147, 6, 1, 1, 1)
				AddStackItem(5, 6, 1, 147, 7, 1, 1, 1)
				LiguanLog( "由于充值年卡获得5个6级玄晶矿石和5个7级玄晶矿石");
				Say("您获得5个6级玄晶矿石和5个7级玄晶矿石", 0)
				Msg2Player( "您获得5个6级玄晶矿石和5个7级玄晶矿石.获取年卡礼物操作成功！");
			elseif (nValue > 1) then
				Msg2Player("对不起年卡礼物获取操作出错，已备档，请与GM联系！")
				WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YEARGIFT , MUST PAY(3,1) BUT PAY(3"..nValue..")!!!!",0,0,0,0)				
			else
				Say("对不起，您没有年卡礼物或已领取过了，如有问题请与GM联系。", 0)
				WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO PAYVALUE <= 0", 0,0,0,0)
			end
end		


ExtFunTab=
{nil,
 nil, -- OnPayYuanBao,
 OnPayYinPiao,
 OnYearGift,
 nil,
 nil,
 nil,
 nil
};
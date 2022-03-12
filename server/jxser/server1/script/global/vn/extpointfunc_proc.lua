function OnExtPointChange_Proc(nExtPointIndex, nChangeValue)
	if (ExtFunTab[nExtPointIndex + 1] == nil) then
		--print("Error!!!!!!!!, No ExtPoint Fun On"..nExtPointIndex)
		--WriteGoldLog("Importacne Error!!!!!!!!, No ExtPoint CallFun On"..nExtPointIndex..", "..GetAccount().." "..GetName().." nExtPointIndex"..nExtPointIndex.." nChangeValue"..nChangeValue, 0, 0, 0, 0)
		return 0;
	end
	ExtFunTab[nExtPointIndex + 1](nChangeValue)
	return 1;
end

function OnPayYuanBao(nChangeValue)
	nValue = -nChangeValue
	if (nValue == 1) then
	--ÄÃÒøÔª±¦
		 AddStackItem(20,4,417,1,1,0,0,0)--add 20 tien dong
		SaveNow(); -- Á¢¼´´æÅÌ
		WriteGoldLog( GetAccount().."("..GetName()..") MAKE a SILVER with a LOW CARD", 0, 1, 0, 0 );
		local nCurValue = GetExtPoint(1)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Rót TiÒn §ång"..GetAccount().."\t"..GetName().."\t".."Rót 20 TiÒn §ång cßn l¹i "..nCurValue*20)
 		Say("¤ng chñ tiÒn trang: §©y lµ 20 TiÒn §ång cña kh¸ch quan! Xin nhËn lÊy!", 0)
		Msg2Player( "B¹n nhËn ®­îc 20 TiÒn §ång !");
 	elseif( nValue > 1) then
			WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO , MUST PAY(1) BUT PAY("..nValue..")!!!!", 0,0,0,0)
			Msg2Player("Thao t¸c TiÒn §ång  bÞ lçi, xin liªn hÖ GM ®Ó gi¶i quyÕt!")
	else
			WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO PAYVALUE <= 0", 0,0,0,0)
			Say("Xin lçi! Kh¸ch quan kh«ng cã gëi TiÒn §ång  t¹i bæn tiÖm. ", 0)
	end
end

ExtFunTab=
{
	nil,
 	OnPayYuanBao,
 	nil,
 	nil,
 	nil,
 	nil,
 	nil,
 	nil
};

function main()
	return 1;
end



function GetDesc(nItem)
	nQId = GetItemParam(nItem, 1);
	nAnswer = GetItemParam(nItem,2);
	nParam3 = GetItemParam(nItem,3);
	nEndTime = tonumber( GetQEndTime( nQId ) );
	nEndYear = floor( nEndTime / 100000000 );
	nEndMonth = mod( floor( nEndTime / 1000000 ), 100 );
	nEndDay = mod( floor( nEndTime / 10000 ), 100 );
	nEndHour = mod( floor( nEndTime / 100 ), 100 );
	nEndMinute = mod( nEndTime, 100 );
	
	if (nQId ~= 1000) then 
		return "<color=Blue>"..GetQuestion(nQId).."\n投:<color=Yellow>"..GetChoose(nQId, nAnswer).."<color>\n".."兑奖截止日期："..nEndMonth.."月"..nEndDay.."日"..format( "%02d", nEndHour )..":"..format( "%02d", nEndMinute );
	else
		str  = format("<color=Blue> %s\n投: <color=Yellow> 金牌:%d, 银牌:%d, 铜牌:%d <color>", GetQuestion(nQId), GetByte(nAnswer, 1), GetByte(nAnswer, 2), nParam3)
		return str.."\n兑奖截止日期："..nEndMonth.."月"..nEndDay.."日"..format( "%02d", nEndHour )..":"..format( "%02d", nEndMinute );
	end;
end
IncludeLib("SETTING")

TSK_Lingyao_Date	= 2640

function main()
	if ((GetLevel() < 50 or GetExtPoint(0) == 0)and ST_IsTransLife() ~= 1) then
		Say("CÊp 50 trë lªn vµ ®· nép thÎ míi sö dông ®­îc", 0);
		return 1
	end
	
	ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate ~= GetTask(TSK_Lingyao_Date)) then
		SetTask(TSK_Lingyao_Date, ndate);
		AddOwnExp(20000000);
	else
		Say("Mét ngµy chØ cã thÓ sö dông ®­îc 1 Thiªn Niªn Linh D­îc", 0);
		return 1
	end
	local nLastTime = FormatTime2Number(GetCurServerTime());
	Msg2Player(nLastTime)
end

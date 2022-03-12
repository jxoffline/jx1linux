Include("\\script\\missions\\challengeoftime\\include.lua")
function main()
	if (GetLevel() < 90 or GetExtPoint(0) == 0) then
		Say("Ng­êi ch¬i ph¶i cÊp 90 trë lªn vµ ®· nép thÎ míi sö dông ®­îc", 0);
		return 1
	end
	
	ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate ~= GetTask(%TSK_Longxuewan_Date)) then
		SetTask(%TSK_Longxuewan_Date, ndate);
		SetTask(%TSK_Longxuewan_Use, 0);
		SetTask(%TSK_Longxuewan_avail, 0);
		if (ndate ~= GetTask(1551)) then
			SetTask(1551, ndate);
			SetTask(1550, 1);
		end
	end
		
	if(GetTask(%TSK_Longxuewan_Use) >= 2) then
		Say("Mçi ngµy mçi ng­êi chØ ®­îc sö dung 2 Long HuyÕt Hoµn", 0);
		return 1
	end
	

	SetTask(1550, GetTask(1550) + 1);
	SetTask(%TSK_Longxuewan_Use, GetTask(%TSK_Longxuewan_Use) + 1);
	SetTask(%TSK_Longxuewan_avail, GetTask(%TSK_Longxuewan_avail) + 1);
	Say("Thu ®­îc thªm c¬ héi 1 lÇn tham gia ho¹t ®éng <th¸ch ®Êu thêi gian>!", 0);
end
Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("Ng­êi ch¬i ph¶i cã ®¼ng cÊp tõ 50 trë lªn vµ ®· qua nép thÎ míi sö dông ®­îc Hoµng Kim Béi.", 0);
	end
	if (GetTask(christmas_yupei_taskid) + 30000000 <= 200000000) then
		SetTask(christmas_yupei_taskid, GetTask(christmas_yupei_taskid) + 30000000);
		AddOwnExp(30000000);
	else
		Say("§¹i hiÖp ®· ®¹t ®­îc kinh nghiÖm cao nhÊt, v× vËy kh«ng thÓ tiÕp tôc sö dông hoµng kim béi.", 0);
		return 1;
	end
end
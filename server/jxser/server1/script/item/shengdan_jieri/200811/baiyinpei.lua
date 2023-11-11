Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("Ng­êi ch¬i ph¶i qua n¹p thÎ vµ ®¼ng cÊp tõ 50 trë lªn míi cã thÓ sö dông B¹ch Ng©n Béi.", 0);
	end
	if (GetTask(christmas_yupei_taskid) + 10000000 <= 200000000) then	
		SetTask(christmas_yupei_taskid, GetTask(christmas_yupei_taskid) + 10000000);
		AddOwnExp(10000000);
	else
		Say("§· ®¹t ®Õn giíi h¹n kinh nghiÖm cho phÐp, kh«ng thÓ sö dông thªm B¹ch Ng©n Béi.", 0);
		return 1;
	end
end
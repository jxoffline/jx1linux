Include("\\script\\item\\newyear_2009\\head.lua");

function main()
	newyear0901_resettask();
	
	local n_date	= tonumber(GetLocalDate("%Y%m%d"));
	if (n_date >= 20090216) then
		Say("VËt phÈm nµy ®· qu¸ h¹n.", 0);
		return 0;
	end
	
	if (GetTask(newyear0901_TSK_GetExp_Yanhua) + 200 > 20000) then
		Say("§¹i hiÖp ®· ®¹t ®Õn kinh nghiÖm cao nhÊt, v× vËy kh«ng thÓ sö dông thªm Ph¸o Hoa Mõng Xu©n.", 0);
		return 1;
	end
	SetTask(newyear0901_TSK_GetExp_Yanhua, GetTask(newyear0901_TSK_GetExp_Yanhua) + 200);
	AddOwnExp(2000000);
	CastSkill(932, 1);
end
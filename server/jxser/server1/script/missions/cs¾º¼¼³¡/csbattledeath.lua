Include("\\script\\missions\\csbattlelib\\csbattledeath.lua");
Include("\\script\\missions\\cs竞技场\\演武场head.lua");

function GetBonus()
	--随机送血瓶或蓝瓶
	if (random(0,1) == 1) then
		AddItem(1,0,0,2,0,0)
	else
		AddItem(1,1,0,2,0,0)
	end;
	Earn(MS_WIN_MONEY);
end;
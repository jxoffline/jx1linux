Include("\\script\\missions\\csbattlelib\\csbattledeath.lua");
Include("\\script\\missions\\hsbattleorigin\\hshead.lua");
function GetBonus()
	
	if (random(0,1) == 1) then
		AddItem(1,0,0,3,0,0)
	else
		AddItem(1,1,0,3,0,0)
	end;
	
	Earn(MS_WIN_MONEY);
end;
--Edit  by Youtube PGaming--
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\progressbar.lua")

IncludeLib("ITEM")

MAXCOUNT = 1

GccPos = {{43552,93184},};

local ItemAward = {
	{szName="Dung TuyÕt Chi Thñy",tbProp={6,1,3945,0,0,0},nCount=1, nBindState=-2},
	
}
local _GetFruit = function(nItemIndex)
	tbAwardTemplet:Give(%ItemAward, 1)
	ConsumeEquiproomItem(1,6,1,3944,-1)
	SetTask(169,22)	
end
local _OnBreak = function()
	Msg2Player("Qu¸ tr×nh móc n­íc bÞ ®øt ®o¹n")
end
function main(nItemIdx)
	local G,D,P,nLevel = GetItemProp(nItemIdx);
	if (G ~= 6) then
		return 1;
	end

	w,x,y=GetWorldPos()
	
	PosId = GetNearstPos(x*32,y*32, GccPos);
	if (PosId == 0) then 
		Msg2Player("H·y ®Õn thung lòng ph¸i Hoa S¬n <color=red>170/182<color> ®Ó móc n­íc.") 
		return 1
	end;	

	if CalcFreeItemCellCount() < 6 then
		CreateTaskSay({"Xin h·y s¾p xÕp l¹i hµnh trang! Nhí ®Ó trèng 6 « trë lªn nhÐ!",  "§­îc råi./Cancel",});
		return 1;
	end
	if P == 3944 then 
		tbProgressBar:OpenByConfig(6, %_GetFruit,{nItemIdx}, %_OnBreak)
	end
	return 1
end

function GetNearstPos(X,Y, PosTab)
	PosCount = getn(PosTab);
	PosId = 0;
	MaxDist = 999999999;

	BeyondCount = 0;---gi do

	for i = 1, PosCount do 
		Dist = sqrt( (X-PosTab[i][1]) * (X-PosTab[i][1]) + (Y - PosTab[i][2]) * (Y - PosTab[i][2]))
		if (Dist >= 250) then 
			BeyondCount = BeyondCount + 1;
		end;
		if (i == 1) then 
			PosId = 1
			MaxDist = Dist
		elseif (MaxDist > Dist) then 
			PosId = i
			MaxDist = Dist
		end
	end;

	if (BeyondCount >= PosCount) then
		return 0
	else
		return PosId;
	end;
end

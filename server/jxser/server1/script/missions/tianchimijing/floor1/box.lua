Include("\\script\\lib\\awardtemplet.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if (GetNpcParam(nNpcIndex, 4) == 0 ) then
		GiveItem(nNpcIndex)
	end;
end

function GiveItem(nNpcIndex)
	
	local tbItemList = 
	{
		{szName="MÈt c©y Æao gÿ",tbProp={6, 1, 2592, 1, 0, 0}, nExpiredTime = 30},
		{szName="MÈt C©y Th≠¨ng CÚ",tbProp={6, 1, 2593, 1, 0, 0}, nExpiredTime = 30},
		{szName="MÈt C©y Ki’m CÊ.",tbProp={6, 1, 2594, 1, 0, 0}, nExpiredTime = 30},
	}
	
	local nId = random(1, getn(tbItemList))
	tbAwardTemplet:GiveAwardByList(tbItemList[nId] , "NhÀn Æ≠Óc tı trong r≠¨ng Æπo cÙ");
	HideNpc(nNpcIndex, 180)
end
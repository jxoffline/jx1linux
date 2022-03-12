Include("\\script\\activitysys\\config\\1012\\head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\config\\1012\\variables.lua");
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("ITEM")
local tbTableAward = {
	{szName="LÂng ßÃn K–o Qu©n", tbProp={6,1,30257,1,0,0},nExpiredTime=20121101},
	{szName = "ßi”m Kinh Nghi÷m", nExp=2e5},
}
local _GetFruit = function(nNpcIdx, dwNpcId)
	
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end
	if (pActivity.tbNpc[nNpcIdx] and (pActivity.tbNpc[nNpcIdx] ~= GetName())) then
		return 
	end
	if (PlayerFunLib:CheckItemInBag(ITEM_CAROT,1,"Bπn kh´ng c„ th¯c ®n(Cµ rËt), kh´ng th” nu´i th·.") ~= 1) then 
		return 
	end
	PlayerFunLib:ConsumeEquiproomItem(ITEM_CAROT,1)
	DelNpc(nNpcIdx)
	pActivity.tbNpc[nNpcIdx] = nil
	tbAwardTemplet:Give(%tbTableAward, 1, {"TRUNGTHU_2012", "SudungcarotchoThoan"})
end


local _OnBreak = function()
	Msg2Player("Th· ch≠a ®n h’t th¯c ®n.")
end


function main()
	local nNpcIdx = GetLastDiagNpc();
	local dwNpcId = GetNpcId(nNpcIdx)
	if (pActivity.tbNpc[nNpcIdx] and (pActivity.tbNpc[nNpcIdx] ~= GetName())) then
		return 
	end
	if (PlayerFunLib:CheckItemInBag(ITEM_CAROT,1,"Bπn kh´ng c„ th¯c ®n, kh´ng th” nu´i th·.") ~= 1) then 
		return 
	end
	tbProgressBar:OpenByConfig(8, %_GetFruit, {nNpcIdx, dwNpcId}, %_OnBreak)
end;

function OnTimer(nNpcIndex, nTimeOut) 
	DelNpc(nNpcIndex);
	strPlayerName = pActivity.tbNpc[nNpcIndex]
	if strPlayerName then
		WriteLog(date("%Y%m%d %H%M%S").."\t".."[TRUNGTHU_2012]".."\tQuanThoiGianThoBienMat".."\tThoCuaNguoiChoi"..strPlayerName)
	end
end
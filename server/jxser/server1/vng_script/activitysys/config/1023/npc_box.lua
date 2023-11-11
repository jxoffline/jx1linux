Include("\\vng_script\\activitysys\\config\\1023\\extend.lua")
Include("\\script\\lib\\progressbar.lua")

local _GetNpcBox = function(nNpcIndex, dwNpcId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return 0
	end
	
	if (IsNpcHide(nNpcIndex) == 1) then
		return 0;
	end
	
	if (PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1) then
		return 0;
	end
	local nX, nY, nMapIndex = GetNpcPos(nNpcIndex)	
	local nRand = random(1, 10)
	if nRand < 10 then
		local tbAward_RuongTB = {  {szName="R­¬ng ThÇn BÝ", tbProp={6,1,30257,1,0,0}, nExpiredTime=DATE_END}}
		tbAwardTemplet:Give(tbAward_RuongTB,1,{EVENT_LOG_TITLE,"MoRuongThanhCong"})
	else
		if pActivity:AddMonster(37,nX,nY) == 1 then
			Msg2Player("<color=red>H·y h¹ gôc bän Hé B¶o, ®Ó më kho b¸u.<color>")
		end
	end	
	HideNpc(nNpcIndex, 15*18)
	--KillNpcWithIdx(nNpcIndex, PIdx2NpcIdx(PlayerIndex));
end

function main()
--dua gamer vao trang thai chien dau
	SetFightState(1)	
	local nNpcIndex = GetLastDiagNpc()	
	if (pActivity:IsOpen() ~= 1) then
		return
	end
	%pActivity:SetFightAroundBoss(nNpcIndex)
	if (PlayerFunLib:CheckLevel(50,"default",">=") ~= 1) then
		return
	end
	if GetFightState() == 0 then
		return Talk(1,"","Tr¹ng th¸i phi chiÕn ®Êu kh«ng thÓ më r­¬ng.")
	end	
	local dwNpcId = GetNpcId(nNpcIndex)
	
	tbProgressBar:OpenByConfig(16, %_GetNpcBox, {nNpcIndex, dwNpcId})	
end

function OnTimer(nNpcIndex, nTimeOut) 
end

--boss death
function OnDeath(nNpcIdx)
	if nNpcIdx > 0 then
		local tbAward_RuongTB = {  {szName="R­¬ng ThÇn BÝ", tbProp={6,1,30257,1,0,0}, nExpiredTime=DATE_END}}
		tbDropTemplet:GiveAwardByList(nNpcIdx, -1, tbAward_RuongTB, "KillBossRot5RuongTB", 5)		
		local nTimerId =  AddMonster.Timer[nNpcIdx]
		DelTimer(nTimerId)
		AddMonster.Timer[nNpcIdx] =nil
		AddMonster.TimerCount[nNpcIdx] = nil
	end
end
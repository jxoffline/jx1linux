Include("\\vng_script\\activitysys\\config\\1023\\extend.lua")
--khi nguoi choi tu vong
function OnDeath(laucher)
	if pActivity:IsOpen() == 1 then
		DropItemPlayerDeath(laucher)
	end	
end

function DropItemPlayerDeath(nIndex)	
	local tbProp = %ITEM_RUONGTHANBI.tbProp
	--kiem tra trong hanh trang tren nguoi
	local nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])

	if nCount <= 0 then
		return
	end
	local nDrop = floor(nCount/2)
	if mod(nCount,2) > 0 then
		nDrop = nDrop + 1
	end
	ConsumeItem(-1, nDrop, tbProp[1], tbProp[2], tbProp[3], tbProp[4])	
	local tbAward_RuongTB = {{szName="R≠¨ng Th«n B›", tbProp={6,1,30257,1,0,0}, nExpiredTime=DATE_END}}
	tbDropTemplet:GiveAwardByList(nIndex, -1, tbAward_RuongTB, "RotItemKhiTuVong", nDrop)
end
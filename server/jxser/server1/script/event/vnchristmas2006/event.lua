
TB_XMASMASK = {394,395,396,397,398,399,400,401,402,403,404,248,249,250,251};
--2006-12-22~2007-01-05  •µÆ≥‰ø® ÀÕ√Êæﬂ
-- π”√¿©’πµ„4
function takeMaskFree()
	local nExtValue = GetExtPoint(4);
	
	if (nExtValue <= 0) then
		Say("Qu˝ kh∏ch ch≠a ÆÒ Æi“u ki÷n nhÀn quµ t∆ng M∆t nπ! ", 0);
		return
	end;
	PayExtPoint(4, 1);
	local nMaskID = TB_XMASMASK[random(getn(TB_XMASMASK))];
	local nItemIdx = AddItem(0,11, nMaskID, 1,0,0);
	Say("ß©y lµ m∆t nπ "..GetItemName(nItemIdx)..". C∂m ¨n qu˝ kh∏ch Æ∑ Òng hÈ!", 0);
	WriteLog("[XMAS-MASK]"..GetLocalDate("%Y-%m-%d %H:%M").." Name:"..GetName().." Account:"..GetAccount().." take a mask : "..GetItemName(nItemIdx));
end;

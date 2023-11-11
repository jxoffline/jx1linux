IncludeLib("TIMER")

TIMER_XINNIANLIHUA = 83	--¼ÆÊ±Æ÷;ÔÚsettings\timertask.txtÉêÇë
XINNIANLIHUA_TIMES = 5*60	--Àñ»¨È¼·Å5·ÖÖÓ
XINNIAN_MAXEXP = 100000000
TB_XINNIANLIHUA_SKILL = {757, 760};

TSK_XINNIANLIHUA_MAXEXP = 1587;
TSK_XINNIANNIANGAO_MAXEXP = 1588;

function isTakeXinNianItem(nItemIdx)
	if (GetLevel() < 80) then
		Say("B¹n ph¶i sau cÊp 80 míi cã thÓ sö dông!", 0);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nDate > 20070306) then
		Say(GetItemName(nItemIdx).."§· qu¸ h¹n sö dông, nÕu tiÕp tôc sö dông sÏ g©y h¹i, cÇn ph¶i vøt bá!", 0);
		RemoveItemByIndex(nItemIdx);
		return 0;
	end;
	return 1;
end;


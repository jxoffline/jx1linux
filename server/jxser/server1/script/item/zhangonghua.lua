--Õ½¹¦»¨
--by Ð¡ÀË¶à¶à
--2007-04-13
ZHANGONGHUA_EXP = 2557;		--¾­Ñé±äÁ¿£¬×î¶à3E
function main(sel)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate > 070531) then
		return 0
	end;
	if (GetLevel() < 50) then
		Msg2Player("Ng­êi ch¬i cÊp 50 trë lªn ®· n¹p thÎ míi cã thÓ sö dông.");
		return 1;
	end;
	
	local nexp = GetTask(ZHANGONGHUA_EXP);
	local addexp = 1500000;
	if nexp >= 300000000 then
		Talk(1,"","Kinh nghiÖm b¹n nhËn ®­îc ®· qu¸ giíi h¹n, tèi ®a chØ nhËn ®­îc 300 triÖu ®iÓm kinh nghiÖm.");
		return 1;
	end
	
	if nexp + addexp > 300000000 then
		addexp = 300000000 - nexp ;
		SetTask(ZHANGONGHUA_EXP,300000000);
	else
		SetTask(ZHANGONGHUA_EXP,tonumber(nexp+addexp));
	end
	
	AddOwnExp(addexp);
	Msg2Player("B¹n t¨ng thªm "..addexp.."®iÓm kinh nghiÖm.");
	WriteLog(format("[ZhanGongHua]\t Date:%s\t Account:%s\t Name:%s\t Effect:GetExp %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),addexp));
		
end
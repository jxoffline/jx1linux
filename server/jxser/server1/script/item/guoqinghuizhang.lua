--π˙«Èª’’¬
--by –°¿À∂‡∂‡
--2007-08-8
TASK_EXP = 1832;					--æ≠—È±‰¡ø£¨◊Ó∂‡4E,≤ªµ˛º”
TASK_TOP_EXP = 400000000;	--◊Ó∂‡ø…µ√æ≠—È
TASK_GET_EXP = 2091945;		--“ª¥ŒªÒµ√æ≠—È
TASK_LEVEL = 50						--µ»º∂œﬁ÷∆
TASK_DATE_END = 07092324-- π”√Ωÿ÷¡ ±º‰
function main(sel)
	nDate = tonumber(GetLocalDate("%y%m%d%H"))
	if TASK_DATE_END < nDate then
		Talk(1,"","ThÀt Æ∏ng ti’c, vÀt ph»m nµy Æ∑ qu∏ hπn sˆ dÙng.")
		return 0
	end
	if GetLevel() < TASK_LEVEL then
		Talk(1,"","Chÿ c„ ng≠Íi ch¨i c p tı 50 trÎ l™n mÌi c„ th” sˆ dÙng huy ch≠¨ng QuËc Kh∏nh.")
		return 1
	end
	local nexp = GetTask(TASK_EXP);
	local addexp = TASK_GET_EXP;
	if nexp >= TASK_TOP_EXP then
		Talk(1,"","Chÿ c„ th” nhÀn Æ≠Óc tËi Æa 400 tri÷u Æi”m kinh nghi÷m!!!")
		return 1
	end
	
	if nexp + addexp > TASK_TOP_EXP then
		addexp = TASK_TOP_EXP - nexp ;
		SetTask(TASK_EXP,TASK_TOP_EXP);
	else
		SetTask(TASK_EXP,tonumber(nexp+addexp));
	end
	
	AddOwnExp(addexp);
	Msg2Player(format("Bπn nhÀn Æ≠Óc %d Æi”m kinh nghi÷m.",addexp));
	WriteLog(format("[GuoQingHuiZhang]\t Date:%s\t Account:%s\t Name:%s\t Effect:GetExp %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),addexp));
		
end
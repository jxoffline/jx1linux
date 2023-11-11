-- æ∆∫˘¬´ by bel at 20090409 10£∫04

Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= jf0904_jiu_expiredtime) then
		Msg2Player("VÀt ph»m nµy Æ∑ qu∏ hπn.");
		return 0;
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("ßπi hi÷p v…n ch≠a ÆÒ c p 50 ho∆c v…n ch≠a nÈp thŒ, v◊ vÀy kh´ng th” tham gia hoπt ÆÈng", 0);
		return 1;
	end
	
	if CalcFreeItemCellCount() < 10 then
		Say(format("ß” b∂o Æ∂m an toµn tµi s∂n, xin mÍi Æ” trËng %d ´.", 10), 0);
		return 1;
	end
	
	jf0904_InitTaskctrl();
	
	if (GetTask(jf0904_TSK_jiuexp) >= GetTask(jf0904_TSK_jiuexplt)) then
		Say("ß∑ Æπt Æ’n kinh nghi÷m cao nh t, kh´ng th” sˆ dÙng th™m B«u R≠Óu.", 0);
		return 1;
	end
	
	local nAddedExp = 15;
	if (GetTask(jf0904_TSK_jiuexp) + nAddedExp > GetTask(jf0904_TSK_jiuexplt)) then
		nAddedExp = GetTask(jf0904_TSK_jiuexplt) - GetTask(jf0904_TSK_jiuexp);
	end	
	
	AddOwnExp(nAddedExp * 100000);
	SetTask(jf0904_TSK_jiuexp, GetTask(jf0904_TSK_jiuexp) + nAddedExp);
end

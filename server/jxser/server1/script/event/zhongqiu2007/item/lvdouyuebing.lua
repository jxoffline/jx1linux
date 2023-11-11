--÷–«Ô2007ªÓ∂Ø ¬Ã∂π‘¬±˝
--by –°¿À∂‡∂‡
--2007-09-07
Include("\\script\\event\\zhongqiu2007\\head.lua")

function main(sel)
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0710312400 then
		Say("B∏nh Trung Thu ÆÀu xanh nµy Æ∑ qu∏ hπn sˆ dÙng.",0)
		return 0
	end
	if check_level() == 0 then
		Say(tb_content["szlevel"],0)
		return 1
	end
	if check_pay() == 0 then
		Say(tb_content["szpay"],0)
		return 1
	end
	local ncurexp = GetTask(TSK_ZHONGQIU2007)
	if ncurexp >= NZHONGQIU2007_MAX then
		Say("ßi”m kinh nghi÷m nhÀn Æ≠Óc tı b∏nh Trung Thu Æ∑ v≠Ót m¯c giÌi hπn.",0)
		return 1
	end
	local nexp = 500000
	if (ncurexp + nexp) >= NZHONGQIU2007_MAX then
		nexp = NZHONGQIU2007_MAX - ncurexp
	end
	SetTask(TSK_ZHONGQIU2007,(ncurexp+nexp))
	AddOwnExp(nexp)
	Msg2Player(format("NhÀn Æ≠Óc <color=yellow>%s<color> Æi”m kinh nghi÷m",nexp))
	WriteLog(format("[zhongqiu2007_lvdou]\t Date:%s\t Account:%s\t Name:%s\t GetExp:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nexp));
end
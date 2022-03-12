-- 2007Ê¥µ®»î¶¯ Ê¥µ®ÌÇ
-- Ê¹ÓÃÊ±¼ä 2007/11/23   00£º00~24£º00
-- Ê¥µ®ÌÇ£¨¼«Ğ¡£©	6	1	1622
-- Ê¥µ®ÌÇ£¨Ğ¡£©	6	1	1623
-- Ê¥µ®ÌÇ£¨ÖĞ£©	6	1	1624
-- Ê¥µ®ÌÇ£¨´ó£©	6	1	1625
-- Ê¥µ®ÌÇ£¨¼«´ó£©	6	1	1626
-- Ê¹ÓÃ¾­ÑéÉÏÏŞ	1ÒÚ

XMASCANDY2007_DATE	=	20071224	-- Ê¥µ®ÌÇÊ¹ÓÃÆÚÏŞ
XMASCANDY2007_EXPLM	=	100000000	--Ê¥µ®ÌÇ¾­ÑéÉÏÏŞ
TSK_XMASCANDY2007_EXP	=	1861	-- Ê¥µ®ÌÇ¾­ÑéÀÛ¼Æ¼ÇÂ¼±äÁ¿

function main(nItemIdx)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nDate > XMASCANDY2007_DATE) then		--Ê¹ÓÃÊ±¼äÅĞ¶Ï
		Msg2Player("§· qu¸ h¹n sö dông, nÕu tiÕp tôc sö dông sÏ g©y h¹i, cÇn ph¶i vøt bá!");
		Say("§· qu¸ h¹n sö dông, nÕu tiÕp tôc sö dông sÏ g©y h¹i, cÇn ph¶i vøt bá!", 0);
		WriteLog(format("[XMASCANDY2007]\t%s\t%s\t%s\t%s",
						GetLocalDate("%Y%m%d %X"),
						GetName(),
						GetAccount(),
						"Delete_Dated_XMASCANDY"	));
		return 0;
	end;
	
	local tb_candy_exp = {
		[1622]	=	15000,
		[1623]	=	25000,
		[1624]	=	40000,
		[1625]	=	50000,
		[1626]	=	100000,
			};
	local ng, nd, np = GetItemProp(nItemIdx);
	local szItemName = GetItemName();
	if (tb_candy_exp[np]) then
		local nCurExp = tb_candy_exp[np] + GetTask(TSK_XMASCANDY2007_EXP);
		if (nCurExp >= XMASCANDY2007_EXPLM) then
			Msg2Player("§iÓm kinh nghiÖm nhËn ®­îc ®· ®¹t giíi h¹n 100 triÖu ®iÓm, kh«ng thÓ sö dông n÷a.");
			Say("§iÓm kinh nghiÖm nhËn ®­îc ®· ®¹t giíi h¹n 100 triÖu ®iÓm, kh«ng thÓ sö dông n÷a.");
			return 1;
		else
			AddOwnExp(tb_candy_exp[np]);
			SetTask(TSK_XMASCANDY2007_EXP, nCurExp);
			WriteLog(format("[XMASCANDY2007]\t%s\t%s\t%s\t%s%d",
						GetLocalDate("%Y%m%d %X"),
						GetName(),
						GetAccount(),
						"Use_XMASCANDY_Exp:",
						tb_candy_exp[np]	));
		end;
	else
		return 1;
	end;
end;
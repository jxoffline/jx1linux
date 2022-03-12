-- ´óÀí Ö°ÄÜ Ìú½³
-- By: Dan_Deng(2003-09-16)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>TiÖm thî rÌn cña ta do nhê häc vâ chÕ t¹o vò khİ lËp nªn, ®ao kiÕm c«n th­¬ng kİch, m­êi t¸m lo¹i binh khİ ®ñ c¶, ®¹i hiÖp muèn mua lo¹i nµo?"

function main(sel)
	tiejiang_city(TIEJIANG_DIALOG);
end;

function yes()
	Sale(16);  				--ÁÙÊ±¶¨Îª25
end;


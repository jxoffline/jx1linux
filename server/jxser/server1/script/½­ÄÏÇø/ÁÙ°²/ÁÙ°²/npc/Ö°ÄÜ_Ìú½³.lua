-- ÁÙ°²¡¡Ö°ÄÜ¡¡Ìú½³
-- by£ºDan_Deng(2003-09-16)
--update:zhaowenyi(2005-02-20)Ôö¼Ó×ÏÉ«¼°»Æ½ğ×°±¸ÖıÔì

Include("\\script\\global\\global_tiejiang.lua")


TIEJIANG_DIALOG = "<dec><npc>Gian hµng thî rÌn nµy lµ do «ng tæ ta truyÒn l¹i, t¹i L©m An nµy kh«ng ng­êi nµo kh«ng biÕt, xin hái ®¹i hiÖp muèn mua mãn ®å nµo?";
function main()
	tiejiang_city(TIEJIANG_DIALOG);
end;


function yes()
	Sale(1);  				--µ¯³ö½»Ò×¿ò
end;


-- ÁÙ°²¡¡Ö°ÄÜ¡¡Ç®×¯ÀÏ°å
-- by£ºDan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-01-06) ´ÓÍ³Ò»¹¦ÄÜÒÆ¶¯´¦ÀíÒøÆ±µ½´Ë¶ÀÓĞ
-- Update: Fanghao_Wu(2004-9-04) Ôö¼ÓÔª±¦¶Ò»»Í­Ç®¹¦ÄÜ

-- Update: paul zhang(2005-09-06) ÎªÔ½ÄÏ°æ×÷ĞŞ¸Ä£¬Ö»Ê¹ÓÃÒøÔª±¦£¬Ã»ÓĞ½ğÔª±¦£¬ÒøÔª±¦¿É³ä³É°üÖÜ(7Ìì)»òÕß25Ğ¡Ê±£¬
--			Í­Ç®ÔİÊ±²»¿ª·Å£¬Í¬Ê±Ôö¼ÓÒ»¸öÍ·ÎÄ¼şÓÃÓÚ¿ØÖÆ¹¦ÄÜµÄ¿ª·ÅÓë¹Ø±Õ
-- Update: paul zhang(2005-12-28) ÎªÔ½ÄÏ°æ×÷ĞŞ¸Ä£¬ÓÉÓÚÔ½ÄÏ·½µÄÔ­Òò£¬ĞŞ¸Ä³ÉÖ»Ê¹ÓÃ½ğÔª±¦£¬Ã»ÓĞÒøÔª±¦£¬µ«ÊÇ½ğÔª±¦µÄ×÷ÓÃĞŞ¸ÄÎª¿É³ä³É°üÖÜ(7Ìì)»òÕß25Ğ¡Ê±£¬

-- Edited by peres
-- 2005/12/29 ¿ª·ÅÒ»¸öÔª±¦»» 15 ¸öÍ­Ç®µÄ¹¦ÄÜ
-- end;

Include("\\script\\global\\systemconfig.lua") -- ÏµÍ³ÅäÖÃ
Include("\\script\\global\\head_qianzhuang.lua") -- Í·¶¨Òå
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 

IncludeForRegionVer("\\script\\global\\", "gamebank_proc.lua")

function main()
	if (CheckGlobalTradeFlag() == 0) then		-- È«¾Ö¾­¼ÃÏµÍ³½»Ò×¿ª¹Ø
		return
	end
	
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 360 ) or ( Uworld1000 == 370 ) then
		education_qianzhuanglaoban()
	else
		Talk(1,"gamebank_proc","ViÖc lµm ¨n cña bæn tiÖm ngµy cµng ph¸t ®¹t, ta dù ®Şnh sang n¨m më thªm vµi chi nh¸nh. Nh­ng viÖc nµy cßn ph¶i th­¬ng l­îng l¹i víi Hé bé V­¬ng ®¹i nh©n, kh«ng cã sù b¶o hé cña «ng ta, cöa tiÖm cho vay cña ta sÏ ch¼ng lµm g× ®­îc")
	end
end

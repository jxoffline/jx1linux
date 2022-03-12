
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline ¾­Ñé²¹³¥»î¶¯Í·ÎÄ¼ş
-- Edited by peres
-- 2005/12/21 AM 11:23

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================

IncludeLib( "FILESYS" );

Include("\\script\\task\\task_addplayerexp.lua")  --¸øÍæ¼ÒÀÛ¼Ó¾­ÑéµÄ¹«¹²º¯Êı

--TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- Éı¼¶ËùĞèµÄ¾­Ñé±í

ID_2005EXPISPAY = 2333; -- ¼ÇÂ¼ÊÇ·ñÒÑ¾­ÁìÈ¡

-- 2005 Äê 12 ÔÂÍ£»ú²¹³¥¾­ÑéµÄÖ÷Èë¿Ú
function getExpiationExp_200512()

local nYear  = tonumber(date("%y"));
local nMonth = tonumber(date("%m"));
local nDay   = tonumber(date("%d"));

	-- ÅĞ¶ÏÊÇ·ñ³å¿¨
	if IsCharged()==0 then
		Say("ThËt xin lçi! Ho¹t ®éng båi th­êng nµy chØ cã ng­êi ch¬i <color=yellow>n¹p thÎ<color> míi ®­îc tham gia!", 0);
		return
	end;
	
	-- ÅĞ¶ÏµÈ¼¶ÊÇ·ñ´óÓÚ 50 ¼¶
	if GetLevel()<50 then
		Say("ThËt xin lçi! Ho¹t ®éng båi th­êng nµy chØ cã ng­êi ch¬i <color=yellow>®¼ng cÊp tõ 50 trë lªn<color> míi ®­îc tham gia!", 0);
		return
	end;
	
	-- ÅĞ¶ÏÊÇ·ñÒÑ¾­ÁìÈ¡¹ıÁË
	if GetTask(ID_2005EXPISPAY)~=0 then
		Say("Uhm! Ta nhí kh«ng lÇm ng­¬i ®· nhËn qua kinh nghiÖm båi th­êng råi, ®õng tham lam nh­ vËy!", 0);
		return
	end;
	
	-- ÅĞ¶ÏÊÇ·ñ·ûºÏÈÕÆÚ£º2005/12/23 ~ 2005/12/31
	if nYear==5 and nMonth==12 and nDay>=23 and nDay<=31 then
		compensateExp();
		return
	else
		Say("ThËt xin lçi! Ho¹t ®éng båi th­êng lÇn nµy lµ tõ <color=yellow>23/12/2005<color> b¾t ®Çu ®Õn <color=yellow>31/12/2005<color>, hiÖn nay <color=yellow>®· kÕt thóc<color>, ng­¬i h·y vÒ ®i!", 0);
		return	
	end;

end;


-- ²¹³¥¾­ÑéµÄÖ÷º¯Êı
function compensateExp()

local nExp = getRedeemeExp();

	SetTask(ID_2005EXPISPAY, 1);  -- Ğ´ÈëÈÎÎñ±äÁ¿£¬ÏÈĞ´±äÁ¿ÔÙ¼Ó¾­Ñé£¬ÒÔ·ÀºóÃæ³ö´íºó»áË¢¾­Ñé

	addPlayerExp(nExp);
	
	Say("Ho¹t ®ång båi th­êng lÇn nµy cña b¹n nhËn ®­îc: <color=yellow>"..nExp.."<color> ®iÓm kinh nghiÖm!", 0);
	
	Msg2Player("Ho¹t ®éng båi th­êng lÇn nµy cña b¹n nhËn ®­îc:<color=yellow>"..nExp.."<color> ®iÓm kinh nghiÖm!");
	
	WriteTaskLog("Trong ho¹t ®éng båi th­êng kinh nghiÖm nhËn ®­îc"..nExp.." ®iÓm kinh nghiÖm!");

end;


-- »ñÈ¡Ó¦¸Ã²¹³¥µÄ¾­Ñé
function getRedeemeExp()

local nLevel = GetLevel();

	return nLevel * 8 * 20000;
	
end;


-- ¸øÍæ¼Ò¼ÓÖ¸¶¨µÄ¾­Ñé£¬µş¼ÓÀàĞÍ
function addPlayerExp(myExpValue)
	tl_addPlayerExp(myExpValue)	
end;


--ÅĞ¶ÏÍæ¼ÒÊÇ·ñ³ä¹ı¿¨
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;


-- ÈÎÎñÏµÍ³µÄĞ´Èë LOG ¹ı³Ì
function WriteTaskLog(strMain)

	-- Èç¹ûÊÇ¿ÕÖµÔò²»Ğ´Èë
	if strMain==nil then return end;

	WriteLog(" [Kû lôc båi th­êng kinh nghiÖm]"..date(" [%y n¨m %m th¸ng %d ngµy  %H giê %M phót]").." [mËt m·:"..GetAccount().."] [nh©n vËt:"..GetName().."]"..strMain);
end;

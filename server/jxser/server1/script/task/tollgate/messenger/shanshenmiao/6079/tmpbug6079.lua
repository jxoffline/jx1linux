-------------------------------------------------------------------------
-- FileName		:	tmpbug6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:57:14
-- Desc			:   É½ÉñÃí¹Ø¿¨µÄĞ¡¹Ö½Å±¾[60-79¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_tembugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ

TEMBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,5 ,"bug_exp"))  --Ğ¡¹Ö¾­Ñé
TEMBUGBEAR_MAPID= 390  --É½ÉñÃíµÄµØÍ¼id
TEMBUGBEAR_MESSENGEREXP=tonumber( TabFile_GetCell( "tollprize" ,5 ,"bug_jifen"))  --Ğ¡¹Ö¾­Ñé


function OnDeath()
	local name = GetName()
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖĞµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô Tİn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		temple_killbugbear()
	end
end
-------------------------------------------------------------------------
-- FileName		:	enemy_flybugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 18:30:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄĞ¡¹Ö½Å±¾[60-79¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flybugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ

FLYBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,2 ,"bug_exp"))  --Ğ¡¹Ö¾­Ñé
FLYBUGBEAR_MAPID= 387  --·çÖ®ÆïµÄµØÍ¼id
FLYBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,2 ,"bug_jifen"))--·çÖ®ÆïµÄĞ¡¹ÖËÀÍö»ñµÃĞÅÊ¹»ı·Ö


function OnDeath()
	local name = GetName()
	if ( messenger_middletime() == 10  ) then --Íæ¼ÒÔÚµØÍ¼ÖĞµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô Tİn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		messenger_killbugbear()
	end
end
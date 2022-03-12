-------------------------------------------------------------------------
-- FileName		:	turebug8089.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 11:05:14
-- Desc			:   Ç§±¦¿â¹Ø¿¨µÄÐ¡¹Ö½Å±¾[80-89¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\enemy_turebugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éÐÞÁ·µÄ±í¸ñ

TUREBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,9 ,"bug_exp"))  --Ð¡¹Ö¾­Ñé
TUREBUGBEAR_MAPID= 394  --Ç§±¦¿âµÄµØÍ¼id
TUREBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,9 ,"bug_jifen"))  --Ð¡¹Ö¾­Ñé


function OnDeath(Npcindex)
	local name = GetName()
	local turesureindex = GetNpcParam(Npcindex,1)
	SetTaskTemp(181,turesureindex)
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖÐµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô TÝn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		turesure_killbugbear()
	end
end
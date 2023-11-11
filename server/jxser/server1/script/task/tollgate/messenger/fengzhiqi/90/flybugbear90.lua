-------------------------------------------------------------------------
-- FileName		:	enemy_flybugbear90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-13 11:19:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄĞ¡¹Ö½Å±¾[90ÒÔÉÏ¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flybugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊı¾İ±í¸ñµÄÀà
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --µ÷ÓÃ×é¶ÓÅĞ¶Ï
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

FLYBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,4 ,"bug_exp"))  --Ğ¡¹Ö¾­Ñé
FLYBUGBEAR_MAPID= 389  --·çÖ®ÆïµÄµØÍ¼id
FLYBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,4 ,"bug_jifen"))--·çÖ®ÆïµÄĞ¡¹ÖËÀÍö»ñµÃĞÅÊ¹»ı·Ö


function OnDeath()
	dofile("/script/task/tollgate/messenger/fengzhiqi/flybugbear90.lua");
		local Uworld3000 = nt_getTask(3000) + 5
		nt_setTask(3000,Uworld3000)
--		Msg2SubWorld("Cao thñ <color=yellow>"..GetName().."<color> <color=red> tiªu diÖt <color=orange>Kim Quèc Gian TÕ<color> trong Tİn Sø nhËn ®­îc <color=yellow>5 ®iÓm<color> Tİn Sø  .")
	local name = GetName()
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖĞµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô Tİn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		messenger_killbugbear()
	end
end
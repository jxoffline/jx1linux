-------------------------------------------------------------------------
-- FileName		:	enemy_flyrefresh6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 19:39:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄbossÉí±ßË¢³ö¹ÖËÀÍö½Å±¾[60-79¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flyrefresh.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀµ
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ

FLYREFRESH_EXP = tonumber( TabFile_GetCell( "tollprize" ,2 ,"shuachu_exp"))   --bossÉí±ßË¢³öĞ¡¹Ö¾­Ñé
FLYREFRESH_MAPID= 387  --·çÖ®ÆïµÄµØÍ¼id
FLYREFRESH_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,2 ,"shuachu_jifen"))  --·çÖ®ÆïµÄbossÉí±ßË¢³öĞ¡¹ÖËÀÍö»ñµÃĞÅÊ¹»ı·Ö


function OnDeath()
	local name = GetName()
	local Uworld1215 = nt_getTask(1215)  --bossÉí±ßË¢¹ÖµÄ´ò¹Ö¿ª¹Ø
	if ( messenger_middletime() == 10  ) then --Íæ¼ÒÔÚµØÍ¼ÖĞµÄÊ±¼ä
		Msg2Player("ThËt xin lçi ! "..name.."! Thi hµnh thêi gian nhiÖm vô tİn sø ®· hÕt, nhiÖm vô thÊt b¹i !.")
		losemessengertask()
	elseif ( Uworld1215 == 0 ) then  --Ã»ÓĞË¢¹ÖµÄÈÎÎñ
		Msg2Player("Ng­êi nµy ®· bŞ ng­êi kh¸c bäc, ng­¬i ®¸nh h¾n ch¾c lµ sÏ kh«ng cã bÊt kú phÇn th­ëng ph¶i.")
		return
	else
		messenger_killrefresh()
	end
end

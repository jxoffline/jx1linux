-------------------------------------------------------------------------
-- FileName		:	enemy_flypoint.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 18:30:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄ¶¨µãĞ¡¹Ö½Å±¾
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --µ÷ÓÃ×é¶ÓÅĞ¶Ï

function messenger_killpoint()
	--local Uworld1205 = nt_getTask(3000)  --ĞÅÊ¹»ı·Ö
	local Uworld1213 = nt_getTask(1213)  --Ë«±¶¾­ÑéÊ±¼ä
	local Uworld1214 = nt_getTask(1214)  --¶¨µã´ò¹Ö¿ª¹Ø
	
		if ( Uworld1213 ~= 0 ) then       --ÅĞ¶ÏÊÇ·ñË«±¶¾­ÑéÊ±¼ä
			if  ( GetGameTime() - Uworld1213 >= 1200 ) then
				nt_setTask(1213,0)
				Msg2Player("Thêi gian t¨ng gÊp ®«i ®iÓm kinh nghiÖm cña b¹n ®· kÕt thóc!")
			else
				AddOwnExp(FLYPOINT_EXP)    --¸øÓèÒ»±¶µÄ¾­Ñé£¬Ö»ÓĞ´òËÀ¸Ã¹ÖÎïµÄÈËÓĞÈÎÎñ±äÁ¿²Å¿ÉÒÔ
			end
		end
		
		messenger_killnpc_jifen(FLYPOINT_MESSENGEREXP,FLYPOINT_MAPID)
		messenger_killbugbear_inteam(FLYPOINT_EXP,FLYPOINT_MAPID)   --Ôö¼Ó¶ÓÎéÄÚÍæ¼Ò¾­Ñé
		nt_setTask(1214,0)
	
		Msg2Player("Chóc mõng b¹n hoµn thµnh nhiÖm vô!"..killfly[Uworld1214][3].."!")
end
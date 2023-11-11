-------------------------------------------------------------------------
-- FileName		:	playerdead_tollgate.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-07 17:33:14
-- Desc			:	ĞÅÊ¹ÈÎÎñÖĞËùÓĞÍæ¼ÒËÀÍöËùµ÷ÓÃµÄ½Å±¾
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀµ

function OnDeath()
	if ( nt_getTask(1203) == 20 or nt_getTask(1203) == 25 ) then
		nt_setTask(1203,21)--ÈÎÎñÔİÍ£
		nt_setTask(1201,0)
		nt_setTask(1202,0)
		nt_setTask(1203,0)
		nt_setTask(1204,0)
		nt_setTask(1207,0)
		nt_setTask(1212,0)
		nt_setTask(1213,0)
		nt_setTask(1214,0)
		nt_setTask(1215,0)
--		
--		
		local Uworld1211 = nt_getTask(1211)  --ÈÎÎñ¿ªÊ¼Ê±¼ä£¨Ò»Ö±ÔÚ±ä»¯£©
		local Uworld1222 = nt_getTask(1222)
		local Uworld1221 = nt_getTask(1221)             --»ñµÃµ±Ç°ÈÎÎñÈÕÆÚ
		local messenger_date = tonumber(GetLocalDate("%y%m%d")) --»ñµÃÏÖÔÚÈÕÆÚ	  	 
		local lasttime   = GetGameTime()
		if ( Uworld1211~= 0 ) then
			if ( lasttime - Uworld1211 > Uworld1222  ) then
				nt_setTask(1222,0)
			else				
                                Uworld1222 = Uworld1222 - ( lasttime - Uworld1211 )
				nt_setTask(1222,Uworld1222)
				nt_setTask(1211,lasttime)
			end
		end
	
		DisabledUseTownP(0)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬
--		--SetLogoutRV(0);       -- µ±ÉèÖÃÁË´Ë½Å±¾ºó£¬ÖØÉúµãÒÑ±»È¡Ïû£¬ÎŞ·¨ÔÙÈ¥ÆäËûµØ·½ÀÕ£¬ËùÒÔÔ­µØÖØÉúÁË¡£
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		Msg2Player("Ngµi nhiÖm vô tİn sø thÊt b¹i.")
	elseif ( nt_getTask(1201) == 20 or nt_getTask(1201) == 25 ) then
		nt_setTask(1203,21)--ÈÎÎñÔİÍ£
		nt_setTask(1201,0)
		nt_setTask(1202,0)
		nt_setTask(1203,0)
		nt_setTask(1204,0)
		nt_setTask(1207,0)
		nt_setTask(1212,0)
		nt_setTask(1213,0)
		nt_setTask(1214,0)
		nt_setTask(1215,0)
--		
--		
		local Uworld1211 = nt_getTask(1211)  --ÈÎÎñ¿ªÊ¼Ê±¼ä£¨Ò»Ö±ÔÚ±ä»¯£©
		local Uworld1222 = nt_getTask(1222)
		local Uworld1221 = nt_getTask(1221)             --»ñµÃµ±Ç°ÈÎÎñÈÕÆÚ
		local messenger_date = tonumber(GetLocalDate("%y%m%d")) --»ñµÃÏÖÔÚÈÕÆÚ	  	 
		local lasttime   = GetGameTime()
		if ( Uworld1211~= 0 ) then
			if ( lasttime - Uworld1211 > Uworld1222  ) then
				nt_setTask(1222,0)
			else				
                                Uworld1222 = Uworld1222 - ( lasttime - Uworld1211 )
				nt_setTask(1222,Uworld1222)
				nt_setTask(1211,lasttime)
			end
		end
	
		DisabledUseTownP(0)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬
--		--SetLogoutRV(0);       -- µ±ÉèÖÃÁË´Ë½Å±¾ºó£¬ÖØÉúµãÒÑ±»È¡Ïû£¬ÎŞ·¨ÔÙÈ¥ÆäËûµØ·½ÀÕ£¬ËùÒÔÔ­µØÖØÉúÁË¡£
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		Msg2Player("Ngµi nhiÖm vô tİn sø thÊt b¹i.")
	end
	nt_setTask(1211,0)
end

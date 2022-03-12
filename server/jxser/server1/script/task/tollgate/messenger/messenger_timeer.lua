-------------------------------------------------------------------------
-- FileName		:	messenger_timeer.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-06-28 10:45:05
-- Desc			:	ËÍĞÅÈÎÎñ¼ÇÊ±Æ÷½Å±¾
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")

function messenger_givetime()                   --æäÕ¾¹ÙÔ±´¦½ÓĞÅÊ¹ÈÎÎñÊ±µÄ¼ÇÊ±Æ÷
    local Uworld1221 = nt_getTask(1221)             --»ñµÃµ±Ç°ÈÎÎñÈÕÆÚ
    local messenger_date = tonumber(GetLocalDate("%y%m%d")) --»ñµÃÏÖÔÚÈÕÆÚ	  	  

    if ( Uworld1221 == 0 ) then               --µÚÒ»´ÎÆô¶¯ÈÎÎñÊ±ÎªĞÅÊ¹ÈÎÎñ¼ÇÊ±Æ÷ÉèÖÃÆô¶¯²ÎÊı 
      nt_setTask(1221,messenger_date)
      nt_setTask(1222,7200)
    end
--      
    local Uworld1222 = nt_getTask(1222) 		  --»ñµÃµ±ÈÕÍæ¼ÒĞÅÊ¹¹Ø¿¨Ê£ÓµÊ±¼ä
--    
    if ( Uworld1222 == 0 ) and ( Uworld1221 == messenger_date ) then     --µ±ÈÕĞÅÊ¹¹Ø¿¨Ê£ÓµÊ±¼äÎª0
     return 10                                                        --·µ»ØÖµÎª10Ê±²»ÄÜÔÙ½ÓÈÎÎñ
    elseif ( Uworld1222 >= 0 ) and ( Uworld1221 ~= messenger_date ) then --ĞÅÊ¹¹Ø¿¨µÄÊ±¼äÒÑ¾­µ½ÁËÁíÒ»Ìì£¬¿ÉÒÔÖØĞ¢¿ªÊ¼¹Ø¿¨ÈÎÎñ
      nt_setTask(1223,0)     --ÉèÖÃµ±ÈÕ»ñµÃ»ı·ÖÎª0
      nt_setTask(1273,0)     --ÉèÖÃµ±ÈÕ×Ü»ñµÃ¾­ÑéÎª0
      nt_setTask(1274,0)     --ÉèÖÃµ±ÈÕ×Ü»ñµÃ»ı·ÖÎª0
      nt_setTask(1224,0)     --ÉèÖÃµ±ÈÕÁì½±¿ª¹ØÎª0
      nt_setTask(1222,7200)
      nt_setTask(1221,messenger_date)
    end
end 

function messenger_middletime(nMapId)                                 --ÈÎÎñ½øĞĞÖĞµ÷ÓÃµÄ¼ÆÊ±Æ÷
	local Uworld1211, Uworld1222, Uworld1221, messenger_date, lasttime = 0,0,0,0,0;
	local nTeamSize = GetTeamSize();
	local boldPlayer;
	local tbPlayer = {};
--	
	if (nTeamSize <= 1) then
		return messenger_middletime_do();
	else
		local oldPlayer = PlayerIndex;
--		
		for i = 1, nTeamSize do		--ÏÈ±£´æ¶ÓÔ±
			tbPlayer[i] = GetTeamMember(i);
		end;
--		
		for i = 1, getn(tbPlayer) do	--¶ÔÃ¿¸ö¶ÓÔ±×ö´¦Àí
			PlayerIndex = tbPlayer[i];
--			
			if ( nt_getTask(1201) == 20 or  nt_getTask(1202) == 20 or  nt_getTask(1203) == 20 ) then
				local bp = messenger_middletime_do();
				if (oldPlayer == PlayerIndex) then	--Èç¹ûÊÇÉ±ÈËµÄÈË£¬ÏÈ±£Áô£¬ºóreturn
					boldPlayer = bp;
				else
					if (bp == 10) then
						Msg2Player("ThËt xin lçi ,"..GetName().."§¹i nh©n, ngµi ®· v­ît qua nhiÖm vô tİn qu¸ thêi gian, nhiÖm vô thÊt b¹i.")
						losemessengertask();
					end;
				end;

			end
		end;
		
		PlayerIndex = oldPlayer;
		return boldPlayer;
	end;
end

function messenger_middletime_do()
	local Uworld1211 = nt_getTask(1211)  --ÈÎÎñ¿ªÊ¼Ê±¼ä£¨Ò»Ö±ÔÚ±ä»¯£©
	local Uworld1222 = nt_getTask(1222)
	local Uworld1221 = nt_getTask(1221)             --»ñµÃµ±Ç°ÈÎÎñÈÕÆÚ
	local messenger_date = tonumber(GetLocalDate("%y%m%d")) --»ñµÃÏÖÔÚÈÕÆÚ	  	 
	local lasttime   = GetGameTime()
  
	if ( Uworld1221 ~= messenger_date  ) then
		Msg2Player("ThËt xin lçi, ng­¬i kh«ng cã ë nhiÖm vô quy ®Şnh nhËt kú bªn trong hoµn thµnh nhiÖm vô .")
		return 10                                              
	elseif ( lasttime - Uworld1211 > Uworld1222  ) then
		nt_setTask(1222,0)
		return 10                                               --·µ»ØÖµÎª10Ê±±íÊ¾Ê±¼äÒÑ³¬¹ıµ±Ç°¹Ø¿¨ËùĞèÊ±¼ä 
	else
		Uworld1222 = Uworld1222 - ( lasttime - Uworld1211 )
		nt_setTask(1222,Uworld1222)
		nt_setTask(1211,lasttime)
	end
end

function messenger_gettime()  --æäÕ¾¹ÙÔ±´¦½»ĞÅÊ¹ÈÎÎñÊ±µÄ¼ÇÊ±Æ÷
    local Uworld1222 = nt_getTask(1222)
    local Uworld1221 = nt_getTask(1221)             --»ñµÃµ±Ç°ÈÎÎñÈÕÆÚ
    local messenger_date = tonumber(GetLocalDate("%y%m%d")) --»ñµÃÏÖÔÚÈÕÆÚ
--		
   if ( messenger_date ~= Uworld1221 ) then
     nt_setTask(1223,0)     --ÉèÖÃµ±ÈÕ»ñµÃ»ı·ÖÎª0
     nt_setTask(1273,0)     --ÉèÖÃµ±ÈÕ×Ü»ñµÃ¾­ÑéÎª0
     nt_setTask(1274,0)     --ÉèÖÃµ±ÈÕ×Ü»ñµÃ»ı·ÖÎª0
     nt_setTask(1224,0)     --ÉèÖÃµ±ÈÕÁì½±¿ª¹ØÎª0
      return 10              --ÈÎÎñÊ§°Ü
    end
end




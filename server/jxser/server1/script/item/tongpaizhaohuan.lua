--zero 20070713 Í­ÅÆÕÙ»½
--ÈÎÎñ±äÁ¿ Ç°16bit×öÄ¾ÅÆ Ç°8bit×öÈÕÆÚ£¬¼ÇÂ¼ÈÕ£¬ºó8bit¼ÇÂ¼´ÎÊı
--           ºó16bit×öÍ­ÅÆ Ç°8bit×öÈÕ£¬ºó8bit´ÎÊı
--           
--           Ê¹ÓÃGetByte(TaskValue,1)È¡Ä¾ÅÆµÄÈÕÆÚ
--               GetByte(TaskValue,2)È¡Ä¾ÅÆÊ¹ÓÃ´ÎÊı
--               GetByte(TaskValue,3)È¡Í­ÅÆÈÕÆÚ
--               GetByte(TaskValue,4)È¡Í­ÅÆÊ¹ÓÃ´ÎÊı
--ÉèÖÃÈÎÎñ±äÁ¿·½·¨
--               SetByte(TaskValue,i,n) ÆäÖĞi±íÊ¾µÚ¼¸×Ö½Ú£¬n±íÊ¾ÈÕÆÚ»ò´ÎÊı 10½øÖÆ
Include( "\\script\\event\\mengjiang2007\\callboss.lua" )
Include("\\script\\lib\\pay.lua");
tongpai_Task=1826;
function main( nItemIdx )
	local TaskValue=GetTask(tongpai_Task);
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if(nDate>20070820) then
		Say("LÖnh bµi ®· qu¸ h¹n sö dông, bŞ mÊt hiÖu lùc!",0)
		return 0;
	end
	if( IsCharged() == 0) then
		Say("ThËt ®¸ng tiÕc, chØ cã ng­êi ch¬i ®· n¹p thÎ míi cã thÓ sö dông.",0);
		return 1; 
	end
	if( GetLevel() <90 ) then
		Say("ThËt ®¸ng tiÕc, chØ cã ng­êi ch¬i cÊp 90 trë lªn míi cã thÓ sö dông.",0);
		return 1;
	end
	nDate = tonumber(GetLocalDate("%d"));
	if(nDate ~= GetByte(TaskValue,3) ) then --²»ÊÇ½ñÌì´ÎÊı»Ö¸´
		TaskValue=SetByte(TaskValue,3,nDate); --ÉèÖÃÍ­ÅÆÈÕÆÚ µÚ3×Ö½Ú
		TaskValue=SetByte(TaskValue,4,10);    --»Ö¸´Í­ÅÆ´ÎÊı10 µÚ4×Ö½Ú
		SetTask(tongpai_Task,TaskValue); -- ÉèÖÃÈÎÎñÈÎÎñ±äÁ¿
	end
	local temp_count=GetByte(TaskValue,4);--»ñµÃÊ¹ÓÃ´ÎÊı
	if(temp_count > 0 ) then --´ÎÊı´óÓÚ0´Î
		if( CallBoss(2) == 0) then
			TaskValue=SetByte(TaskValue,4,temp_count-1); --Ê¹ÓÃ´ÎÊı-1
			SetTask(tongpai_Task,TaskValue); -- ÉèÖÃÈÎÎñÈÎÎñ±äÁ¿
			return 0;
		else
			return 1;
		end	
	else
		Say("H«m nay ®· sö dông 10 §ång Bµi råi! H·y ®îi ngµy mai míi cã thÓ tiÕp tôc sö dông!",0);
		return 1;
	end
	
end

function GetDesc(nItem)
end
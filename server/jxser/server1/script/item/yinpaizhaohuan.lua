--zero 20070713 ÒøÅÆÕÙ»½
--µÚÒ»¸ö×Ö½Ú¼ÇÂ¼Òø µÚ¶ş¸ö×Ö½Ú¼ÇÂ¼½ğ µÚÈı¸ö×Ö½Ú¼ÇÂ¼Óñ£¬ÒòÎªÖ»ÓÃÒ»´Î£¬Ö»ĞèÒª¼ÇÂ¼Ê±¼ä

Include( "\\script\\event\\mengjiang2007\\callboss.lua" )
Include("\\script\\lib\\pay.lua");
yinpai_Task=1827;
function main( nItemIdx )
	local TaskValue=GetTask(yinpai_Task);
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if(nDate>20080331) then
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
	if(nDate ~= GetByte(TaskValue,1) ) then --²»ÊÇ½ñÌì
		if( CallBoss(3) == 0) then
			TaskValue=SetByte(TaskValue,1,nDate); --ÉèÖÃÒøÅÆÈÕÆÚ µÚ1×Ö½Ú
			SetTask(yinpai_Task,TaskValue);
			return 0;
		else
			return 1;
		end	
	else
		Say("H«m nay ®· sö dông 1 Ng©n Bµi råi! H·y ®îi ngµy mai míi cã thÓ tiÕp tôc sö dông!",0);
		return 1;
	end
	
end

function GetDesc(nItem)

end
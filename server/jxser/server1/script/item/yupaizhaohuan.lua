--zero 20070713 ÓñÅÆÕÙ»½
--µÚÒ»¸ö×Ö½Ú¼ÇÂ¼Òø µÚ¶ş¸ö×Ö½Ú¼ÇÂ¼½ğ µÚÈı¸ö×Ö½Ú¼ÇÂ¼Óñ£¬ÒòÎªÖ»ÓÃÒ»´Î£¬Ö»ĞèÒª¼ÇÂ¼Ê±¼ä
--tinhpn 20100720: forbid item
Include("\\script\\item\\forbid_jinpai_yupai.lua");

Include( "\\script\\event\\mengjiang2007\\callboss.lua" )
Include("\\script\\lib\\pay.lua");

--tinhpn 20100803: Patch Request
local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		--ÌØÊâµØÍ¼½ûÓÃ
		if( %tbUseOnlyInMap[i] == nMapId ) then
			return 1
		end
	end
	return 0
end


yupai_Task=1827;
function main( nItemIdx )
	local TaskValue=GetTask(yupai_Task);
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	--if(nDate>20080331) then
	--	Say("ÁîÅÆ¹ıÁËÊ¹ÓÃÆÚÏŞ£¬ÎŞĞ§ÁË£¬Ö»ÄÜ¶ªµô",0)
	--	return 0;
	--end
	
	--tinhpn 20100803: Patch ReQuest
	if %checkOnlyUseInMap() ~= 1 then
		Msg2Player("Kh«ng thÓ sö dông vËt phÈm nµy t¹i ®©y.")
		return 1
	end
	
	--tinhpn 20100720: forbid item
	if (ForbidMap() == 1) then
		return 1
	end
	
	if( IsCharged() == 0) then
		Say("ThËt ®¸ng tiÕc, chØ cã ng­êi ch¬i ®· n¹p thÎ míi cã thÓ sö dông.",0);
		return 1; 
	end
	if( GetLevel() < 90 ) then
		Say("ThËt ®¸ng tiÕc, chØ cã ng­êi ch¬i cÊp 90 trë lªn míi cã thÓ sö dông.",0);
		return 1;
	end
	nDate = tonumber(GetLocalDate("%d"));
	if(nDate ~= GetByte(TaskValue,3) ) then --²»ÊÇ½ñÌì
		if( CallBoss(5) == 0) then
			TaskValue=SetByte(TaskValue,3,nDate); --ÉèÖÃÓñÅÆÈÕÆÚ µÚ1×Ö½Ú
			SetTask(yupai_Task,TaskValue);
			return 0;
		else
			return 1;
		end	
		
	else
		Say("H«m nay ®· sö dông 1 Ngäc Bµi råi! H·y ®îi ngµy mai míi cã thÓ tiÕp tôc sö dông!",0);
		return 1;
	end
	
end

function GetDesc(nItem)
end
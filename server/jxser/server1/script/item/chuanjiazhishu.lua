--´«¼ÒÖ®Êé
Include("\\script\\event\\teacher_day_200711\\head.lua");

-- Ã¿¸ö½ÇÉ«Ö»ÄÜÍ¨¹ı¼Ò´«Ö®ÊéµÀ¾ß»ñµÃ5ÒÚ¾­ÑéÖµµÃÉÏÏŞ ¡£
--

function main()
	local nDate = tonumber(GetLocalDate("%y%m%d%H"));
	local nExpLimit = GetTask(TSK_TeacherDay200711_UseExpLimit); 
	if ( nExpLimit >= TeacherDay200711_UseExpLimit) then
		Say("Sö dông bİ kİp gia truyÒn ®· ®¹t giíi h¹n ®iÓm kinh nghiÖm, kh«ng thÓ sö dông n÷a.",0)
		return 1;
	end
	if (GetLevel() < 50) then
		Say("ThËt ®¸ng tiÕc, chØ cã ng­êi ch¬i <color=yellow>cÊp trªn 50<color> míi cã thÓ sö dông bİ kİp nµy.",0)
		return 1;
	end
	if (nDate < TeacherDay200711_START_TIME or nDate > TeacherDay200711_UseLimitTime) then
		Say("Ho¹t ®éng ®· kÕt thóc, kh«ng thÓ sö dông!",0);
		return 0;
	end
	--2.000.000 ¾­ÑéÖµ
	--1,5% ¸ÅÂÊ»ñµÃ1¿ÅĞÉºì±¦Ê¯
	AddOwnExp(2000000);
	SetTask(TSK_TeacherDay200711_UseExpLimit,nExpLimit+2000000);
	if (random(1,10000) <= 150) then
		AddItem(4,353,1,1,0,0)
		Msg2Player(format("NhËn ®­îc %d %s",1,"Tinh Hång B¶o Th¹ch"))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tGetItem %d %s.","Ho¹t ®éng Nhµ gi¸o ViÖt Nam 2007",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),1,"Tinh Hång B¶o Th¹ch"));			
	end
	return 0;
end
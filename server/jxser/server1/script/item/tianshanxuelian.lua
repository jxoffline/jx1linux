-- ÌìÉ½Ñ©Á«
-- By: Feimingzhi(2007-05-08)
-- Content:90¼¶ÒÔÏÂÍæ¼ÒÊ¹ÓÃÌìÉ½Ñ©Á«Ö±½ÓÉýµ½120¼¶¡£

IncludeLib("SETTING");
Include("\\script\\task\\task_addplayerexp.lua")  --¸øÍæ¼ÒÀÛ¼Ó¾­ÑéµÄ¹«¹²º¯Êý
Include("\\script\\lib\\pay.lua")


function main( nItemIndex )
    
    local nPLev = GetLevel()
    if nPLev > 90  or nPLev < 50 or IsCharged() < 1 then
        Say("ChØ cã nh©n vËt cÊp ®é tõ 50 ®Õn 90 (bao gåm cÊp 50 vµ 90) míi cã thÓ sö dông.", 0)
        return 1
    end
	
    tl_addPlayerExp(1433042000)	--90¼¶0%Éýµ½120¼¶0%µÄ×Ü¾­ÑéÖµ
	nPLev = GetLevel()
	Msg2Player(format("Chóc mõng b¹n, ®¼ng cÊp hiÖn t¹i cña b¹n lµ %d.",nPLev))
	WriteLog(format("[Sö dông Thiªn S¬n TuyÕt Liªn]\t%s\tName:%s\tAccount:%s\t võa ¨n ®­îc 1 Thiªn S¬n TuyÕt Liªn.",
			GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
end
--

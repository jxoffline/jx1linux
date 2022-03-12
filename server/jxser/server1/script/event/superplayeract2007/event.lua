-- ³¬¼¶Íæ¼Ò»î¶¯£¨ËÍÌìÉ½Ñ©Á«£©
-- By: Feimingzhi(2007-05-08)
-- Content:
--»î¶¯ÆÚ¼ä£¬·²ÔÚ2007Äê06ÔÂ01ÈÕ·şÎñÆ÷Î¬»¤ÖÁ2007Äê07ÔÂ01ÈÕ24µãÖ®¼äĞÂ½¨µÄ½ÇÉ«£¬ÓĞ×Ê¸ñ²Î¼Ó¡¶³¬¼¶Íæ¼Ò»î¶¯¡·¡£ ÔÚ»î¶¯ÆÚ¼äÄÚ£¬´´½¨µÄĞÂ½ÇÉ«²¢µÈ¼¶´ïµ½90¼¶£¬ ²¢Íê³É116¸öÒ°ÛÅÈÎÎñÁ´£¨ÎŞ¼ä¶ÏµØÍê³ÉÈÎÎñ£©¾Í¿ÉÒÔÔÚĞÂÊÖ´åºÍ¸÷´ó³ÇÊĞµÄÀñ¹Ù´¦»ñµÃÒ»¸öÌìÉ½Ñ©Á«¡£¼ÇÂ¼LOG¡£
--Ò»¸ö½ÇÉ«Ö»ÄÜÁìÈ¡Ò»´Î¡£
--90¼¶ÒÔ¼°90¼¶ÒÔÏÂµÄÍæ¼Ò£¬Ê¹ÓÃÌìÉ½Ñ©Á«£¬Á¢¼´Éıµ½120 ¼¶¡£
--
-- 	Àñ¹Ù¶Ô»°Éè¼Æ
--Ö»ÓĞÔÚ2007Äê06ÔÂ01ÈÕ·şÎñÆ÷Î¬»¤ÖÁ2007Äê07ÔÂ01ÈÕ24µãÖ®¼ä²Å»á³öÏÖ¡°³¬¼¶Íæ¼Ò»î¶¯¡±Ñ¡Ïî¡£

SUPERPLAYERACT_BIGENTIME = 20070601     --³¬¼¶Íæ¼Ò»î¶¯¿ªÊ¼ÈÕÆÚ
SUPERPLAYERACT_ENDTIME = 20070701       --³¬¼¶Íæ¼Ò»î¶¯½áÊøÈÕÆÚ
SUPERPLAYERACT_LevRequest = 90          --³¬¼¶Íæ¼Ò»î¶¯½ÇÉ«ËùĞèµÈ¼¶
SUPERPLAYERACT_TaskTime = 116             --ÒªÇóÒ°ÛÅÈÎÎñ×îÉÙ¶àÉÙ´Î
SUPERPLAYERACT_TaskDataKey = 1044       --´æ´¢Ò°ÛÅÈÎÎñ´ÎÊıµÄÊı¾İkey
TSK_SUPERPLAYERACT = 1816               --´æ´¢ÊÇ·ñÁìÈ¡½±Àø¡£
TSXL_ITEM_ID = 1431                     --ÌìÉ½Ñ©Á«µÄÎïÆ·ID
SUPERPLAYERACT_ExtPoint = 4             --ÒªÇóĞÂ½¨ÕÊºÅ
Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua")    --°üº¬Ò°ÛÅÈÎÎñ

function SuperPlayerAct2007()
    local tDiaStr = 
    {
        "Tµi kho¶n ®­îc t¹o míi trong kho¶ng thêi gian tõ <color=green>01-06-2007<color> ®Õn <color=green>01-07-2007<color> ",
        format("sÏ cã c¬ héi tham gia 'Ho¹t ®éng ng­êi ch¬i siªu cÊp'. Trong thêi gian ho¹t ®éng, khi nh©n vËt míi (trong tµi kho¶n míi t¹o) ®¹t ®Õn cÊp <color=yellow>%s<color> vµ hoµn thµnh <color=yellow>",SUPERPLAYERACT_LevRequest),
        format("%s<color> nhiÖm vô D· TÈu (chuçi nhiÖm vô) sÏ cã thÓ ®Õn LÔ Quan t¹i c¸c thµnh thŞ vµ T©n thñ th«n ®Ó nhËn 1 <yellow=color>Thiªn S¬n TuyÕt Liªn<color>.",	SUPERPLAYERACT_TaskTime)
    }
   Say( format("%s%s%s",tDiaStr[1],tDiaStr[2],tDiaStr[3]),
   		3,
   		"NhËn Thiªn S¬n TuyÕt Liªn/SuperPlayerAct_WinMedal",
   		"Thiªn S¬n TuyÕt Liªn lµ g×?/SuperPlayerAct_ItemDes",
   		"KÕt thóc ®èi tho¹i/OnCancel")
end
--
function SuperPlayerAct_WinMedal()

	local nDay = tonumber(GetLocalDate("%Y%m%d"))
    local szMsg = "";
    if nDay < SUPERPLAYERACT_BIGENTIME and nDay > SUPERPLAYERACT_ENDTIME then
        Msg2Player("ThËt ®¸ng tiÕc, thêi gian ho¹t ®éng ®· kÕt thóc.")
        return 0;
    end;
     
    if GetExtPoint(SUPERPLAYERACT_ExtPoint) ~= 1 then
    	szMsg = "ThËt ®¸ng tiÕc, kh«ng ph¶i lµ tµi kho¶n míi t¹o, kh«ng thÓ tham gia ho¹t ®éng nµy!";
        Say(szMsg,
        	2,
        	"Trë l¹i/main",
        	"KÕt thóc ®èi tho¹i/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    
    local nLev = GetLevel()
    if nLev < SUPERPLAYERACT_LevRequest then
    	szMsg = format("Ch­a ®ñ cÊp %s, h·y ®¹t ®Õn cÊp %s råi h·y ®Õn t×m ta.",SUPERPLAYERACT_LevRequest,SUPERPLAYERACT_LevRequest)
        Say(szMsg,
        	2,
        	"Trë l¹i/main",
        	"KÕt thóc ®èi tho¹i/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    
    local nTaskEDTime = GetTask(SUPERPLAYERACT_TaskDataKey)
    --local nTaskEDTime = tl_counttasklinknum(1)
    
    if nTaskEDTime < SUPERPLAYERACT_TaskTime then
    	szMsg = format("ThËt ®¸ng tiÕc, ch­a hoµn thµnh mét chuçi %s nhiÖm vô D· TÈu, kh«ng thÓ nhËn Thiªn S¬n TuyÕt Liªn.",SUPERPLAYERACT_TaskTime)
        Say(szMsg,2,"Trë l¹i/main","KÕt thóc ®èi tho¹i/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    if  GetTask( TSK_SUPERPLAYERACT ) > 0 then
        Say("ThËt ®¸ng tiÕc, nh©n vËt nµy ®· nhËn phÇn th­ëng råi.",2,"Trë l¹i/main","KÕt thóc ®èi tho¹i/OnCancel")
        return 0
    end
    local nItemIdx = AddItem( 6, 1, TSXL_ITEM_ID, 1, 0, 0 )
    if nItemIdx > 0 then
        SetTask( TSK_SUPERPLAYERACT, 1 )
        Say("Thiªn S¬n TuyÕt Liªn ®©y! H·y cÊt gi÷ cÈn thËn!",0)
        Msg2Player("B¹n nhËn ®­îc 1 Thiªn S¬n TuyÕt Liªn.")
        WriteLog(format("[Ho¹t ®éng ng­êi ch¬i siªu cÊp] \t%s\tName:%s\tAccount:%s\t nhËn ®­îc mét Thiªn S¬n TuyÕt Liªn",
		GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
    else
        Say("Hµnh trang ®· ®Çy, kh«ng thÓ nhËn vËt phÈm!",2,"Trë l¹i/main","KÕt thóc ®èi tho¹i/OnCancel")
    end
end
--
function SuperPlayerAct_ItemDes()
    Say("Thiªn S¬n TuyÕt Liªn: <enter>Nh©n vËt cÊp ®é tõ 50 ®Õn 90 (bao gåm cÊp 50 vµ 90) sö dông sÏ nhanh chãng n©ng cao ®¼ng cÊp cña m×nh.",2,"Trë l¹i/SuperPlayerAct2007","KÕt thóc ®èi tho¹i/OnCancel")
end
--
function OnCancel()
end
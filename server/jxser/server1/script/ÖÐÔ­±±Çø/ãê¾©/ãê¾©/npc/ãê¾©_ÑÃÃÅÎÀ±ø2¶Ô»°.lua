--ÖĞÔ­±±Çø ãê¾©¸® ÑÃÃÅÎÀ±ø2¶Ô»°

--function main(sel)
--Say("ÑÃÃÅÎÀ±ø£ºÕâ³ÇÖĞµÄÀÏ°ÙĞÕÔç¾Í¶ÔÎÒÃÇ½ğÈË¸©Ê×³Æ³¼£¬ÄÑµÀÄãÏëÄÖÊÂ²»³É£¿", 0);
--end;

--Í¨¼©ÏµÍ³×¨ÓÃÑùÀı½Å±¾(BlackBay.2003.12.30)

FESTIVAL06_NPCNAME = "<color=yellow>VÖ binh Nha m«n:<color>";
Include([[\script\global\Â·ÈË_ÑÃÃÅÎÀ±ø.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	--ÏÂÃæÕâ¸öÖ¸ÁîÏòÏµÍ³Ñ¯ÎÊµ±Ç°PlayerµÄÍ¨¼©Ïà¹Ø×´Ì¬ĞÅÏ¢
	--²éÑ¯µÄ½á¹û·µ»ØÒÔºó£¬ÏµÍ³»Øµ÷²ÎÊıÖĞÖ¸¶¨µÄº¯ÊıÃû
	--AskRelayForKillerStatus("KillerCallBack")
	Say("L·o b¸ t¸nh ë trong thµnh nµy ®· sím phôc tïng ng­êi Kim cña chóng ta, lÏ nµo ng­¬i cßn muèn lµm n¸o lo¹n?", 0);
end;

--ÏÂÃæÕâ¸öº¯ÊıÊÇ²éÑ¯½á¹ûµÄ»Øµ÷º¯Êı£¬²ÎÊı¸öÊıºÍË³Ğò²»ÔÊĞí¸Ä±ä
function KillerCallBack(RewardMoney, RewardTaskID, CancelMoney, CancelTaskID, OwnCount, MyTaskCount)
	if (RewardMoney > 0) then
		--ÏÂÃæÕâ¸öº¯ÊıÍ¨ÖªÏµÍ³Íæ¼ÒÒÑ¾­ÁìÈ¡ÁËÉÍ½ğ£¬×¢ÒâµÚÒ»¸ö²ÎÊı0±íÊ¾ÁìÉÍ½ğ£¬µÚ¶ş¸ö²ÎÊı±íÊ¾ÎªÄÄ¸öÈÎÎñÁìÉÍ½ğ
		GetTaskMoney(0, RewardTaskID)
		Earn(RewardMoney)
	elseif (CancelMoney > 0) then
		--ÏÂÃæÕâ¸öº¯ÊıÍ¨ÖªÏµÍ³Íæ¼ÒÒÑ¾­ÁìÈ¡ÁËÍË»ØµÄ±êµÄ½ğ£¬×¢ÒâµÚÒ»¸ö²ÎÊı1±íÊ¾ÁìÍË½ğ£¬µÚ¶ş¸ö²ÎÊı±íÊ¾ÎªÄÄ¸öÈÎÎñÁìÍË½ğ
		GetTaskMoney(1, CancelTaskID)
		Earn(CancelMoney)
	elseif (OwnCount + MyTaskCount > 0) then
		Say("Gan ng­¬i to thÕ ­? Téi danh x«ng vµo C«ng ®­êng vµ Nha m«n ng­¬i g¸nh næi kh«ng vËy?", 4, "ThiÕt lËp nhiÖm vô truy n· /CreateTask", "TiÕp nhËn nhiÖm vô truy n· /QueryTask", "Xem l¹i nhiÖm vô cña m×nh /ModifyTask", "Kh«ng lµm g× c¶ /DoNothing")
	else
		Say("Gan ng­¬i to thÕ ­? Téi danh x«ng vµo C«ng ®­êng vµ Nha m«n ng­¬i g¸nh næi kh«ng vËy?", 3, "ThiÕt lËp nhiÖm vô truy n· /CreateTask", "TiÕp nhËn nhiÖm vô truy n· /QueryTask", "Kh«ng lµm g× c¶ /DoNothing")
	end
end;

function CreateTask()
	--ÏÂÃæÕâ¸öº¯ÊıÍ¨Öª¿Í»§¶Ë´ò¿ª´´½¨ÈÎÎñµÄ½çÃæ
	OpenCreateTask()
end;

function QueryTask()
	--ÏÂÃæÕâ¸öº¯Êı½«ËùÓĞÄÜÁìÈ¡µÄÈÎÎñ´«ËÍ¸øÍæ¼Ò¿Í»§¶Ë
	OpenAllTask()
end;

function ModifyTask()
	--ÏÂÃæÕâ¸öº¯Êı½«ËùÒÑÁìÈ¡µÄÈÎÎñÒÔ¼°ÒÑ´´½¨µÄÈÎÎñ´«ËÍ¸øÍæ¼Ò¿Í»§¶Ë
	OpenOwnTask()
end;

function DoNothing()
	Say("L·o b¸ t¸nh ë trong thµnh nµy ®· sím phôc tïng ng­êi Kim cña chóng ta, lÏ nµo ng­¬i cßn muèn lµm n¸o lo¹n?", 0)
end;
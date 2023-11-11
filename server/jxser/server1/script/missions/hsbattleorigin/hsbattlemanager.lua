--²ÎÈüÁ÷³Ì
--1¡¢ÓëÖ÷Èë¿ÚµÄNpc¶Ô»°£¬Ñ¡Ôñ½øÈëµÚ¼¸¸öÕ½Çø
--2¡¢Èç¹û·ûºÏ²ÎÈüÌõ¼þÔò½øÈëÕ½ÇøÄÚ£¨ÁíÒ»ÕÅµØÍ¼£©£¬²¢ÒÔ0ÕóÓªÄ£Ê½½øÈë
--3¡¢Íæ¼ÒÓëÁ½±ßµÄNpc¶Ô»°£¬×ÔÓÉÑ¡Ôñ²ÎÓëµÄÕóÓª¡£
--4¡¢Íæ¼ÒPkËÀÍöºó½«×Ô¶¯±»ÈÔ³ö³¡Íâ£¬µ«ÔÚ±¾µØÍ¼ÄÚ
--5¡¢µ±Íæ¼ÒËÀÍöÊ±£¬»á×Ô¶¯ÏòÍ¬µØÍ¼µÄËùÓÐÍæ¼Ò¹«²¼µ±Ç°µÄÕ½¿ö¡£
--6¡¢Èç¹û¿ÉÒÔ£¬¿ÉÒÔ´ÓNpc¶Ô»°ÖÐÁË½âµ±Ç°µÄ×ÜÅÅÐÐ
--7¡¢±ÈÈü¿ÉÒÔ°´ÕÕµÈ¼¶·Ö³É¸÷ÖÖÈü³¡
--ÈëÕ½ÇøµÄNpc¡¢Ñ¡ÔñÕóÓªµÄNpc
Include("\\script\\missions\\csbattlelib\\csbattlehead.lua");
Include("\\script\\missions\\hsbattle\\hshead.lua");
MapTab = {};
MapCount = 1;
MapTab[1]= {212, 1577, 3288};

function main()
	--ÉèÖÃ·µ»Øµã
	SetTask(300, 2);
	SetTask(301, 2605);
	SetTask(302, 3592);
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		Say("HiÖn giê vÉn ch­a cã ai b¸o danh L«i ®µi ®¬n ®Êu! NghÜa sÜ cã muèn thö tµi kh«ng?",0)
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	if (GetMissionV(1) ~= 1) then 
		Say("HiÖn giê vÉn ch­a cã ai b¸o danh L«i ®µi ®¬n ®Êu! NghÜa sÜ cã muèn thö tµi kh«ng?",0)
		return
	end;
	
	SubWorld = OldSubWorld;

	Say("HiÖn giê vÉn ch­a cã ai b¸o danh L«i ®µi ®¬n ®Êu! ChØ cÇn cÊp 60 trë lªn, ®ãng 10000 phÝ b¸o danh lµ cã thÓ thö tµi!", 2, "§­îc, Ta muèn th­ëng thøc tµi nghÖ cña c¸c vÞ hµo kiÖt Êy. /JoinHS", "Kh«ng tham gia /OnCancel");
end;

function JoinHS()
	LeaveTeam();
	if (CheckCondition() == 0) then
		Say("B¹n ch­a ®ñ ®¼ng cÊp hoÆc kh«ng mang ®ñ tiÒn hoÆc kh«ng ph¶i lµ ng­êi trong giang hå, kh«ng thÓ lªn Hoa S¬n tuyÖt ®Ønh", 0);
		return
	end;
	
	if (PrePay(MS_SIGN_MONEY) == 1) then
		NewWorld(MapTab[1][1], MapTab[1][2], MapTab[1][3]);
		idx = SubWorldID2Idx(MapTab[1][1]);
		if (idx == -1) then 
			return
		end;
		SubWorld = idx;
		JoinCamp(4);
		return
	end;
end;


function CheckCondition()
	if ( GetLevel() >= 60 and GetCamp() ~= 0 ) then
		if (GetCash() >= MS_SIGN_MONEY) then
			return 1;
		end;
 	end;
 	return 0;
end;

function OnCancel()
end;

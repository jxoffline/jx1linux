--²ÎÈüÁ÷³Ì
--1¡¢ÓëÖ÷Èë¿ÚµÄNpc¶Ô»°£¬Ñ¡Ôñ½øÈëµÚ¼¸¸öÕ½Çø
--2¡¢Èç¹û·ûºÏ²ÎÈüÌõ¼şÔò½øÈëÕ½ÇøÄÚ£¨ÁíÒ»ÕÅµØÍ¼£©£¬²¢ÒÔ0ÕóÓªÄ£Ê½½øÈë
--3¡¢Íæ¼ÒÓëÁ½±ßµÄNpc¶Ô»°£¬×ÔÓÉÑ¡Ôñ²ÎÓëµÄÕóÓª¡£
--4¡¢Íæ¼ÒPkËÀÍöºó½«×Ô¶¯±»ÈÔ³ö³¡Íâ£¬µ«ÔÚ±¾µØÍ¼ÄÚ
--5¡¢µ±Íæ¼ÒËÀÍöÊ±£¬»á×Ô¶¯ÏòÍ¬µØÍ¼µÄËùÓĞÍæ¼Ò¹«²¼µ±Ç°µÄÕ½¿ö¡£
--6¡¢Èç¹û¿ÉÒÔ£¬¿ÉÒÔ´ÓNpc¶Ô»°ÖĞÁË½âµ±Ç°µÄ×ÜÅÅĞĞ
--7¡¢±ÈÈü¿ÉÒÔ°´ÕÕµÈ¼¶·Ö³É¸÷ÖÖÈü³¡
--ÈëÕ½ÇøµÄNpc¡¢Ñ¡ÔñÕóÓªµÄNpc
Include("\\script\\missions\\challenge\\challengehead.lua");

MapTab = {};

MapTab[1]= {209, 1568, 3278};
MapTab[2]= {210, 1568, 3278};
MapTab[3]= {211, 1568, 3278};

MapCount = getn(MapTab);

function main()
	if (GetCamp() == 0) then 
		Say("B¹n kh«ng ph¶i lµ ng­êi trong giang hå! Kh«ng thÓ vµo khi vùc chiÕn ®Êu!",0);
		return
	end;

	--ÉèÖÃ·µ»Øµã
	SetTask(300, 80);
	SetTask(301, 1908);
	SetTask(302, 2844);
	Say("Hoan nghªnh tham gia thi ®Êu! ChØ cã nh÷ng tuyÓn thñ ®· b¸o danh míi ®­îc vµo vâ tr­êng! B¹n muèn vµo khu ®Êu nµo?", 4 , "Khu ®Êu thø nhÊt /DoJoin", "Khu ®Êu thø hai /DoJoin", "Khu ®Êu thø ba /DoJoin","Ta kh«ng ph¶i tuyÓn thñ tham gia thi ®Êu, ta kh«ng vµo. /OnCancel");
end;

function DoJoin(nSel)
	if (nSel + 1 > MapCount) then
		return
	end;
	LeaveTeam();
	WantToJoin(MapTab[nSel + 1][1], MapTab[nSel + 1][2], MapTab[nSel + 1][3]);
end;


function WantToJoin(nMapId, nX, nY)
	SetFightState(0);
	SetLogoutRV(1);
	SetTaskTemp(200,1);--´ËÊ±ÎŞ·¨ĞŞ¸Ä°ï»áÕóÓª
	w, x, y = GetLeavePos();
	SetTempRevPos(w, x * 32 , y * 32); --ÉèÖÃÔİÊ±ÖØÉúµãÎª±¨Ãûµã¸½½ü
	NewWorld(nMapId, nX, nY);
end;

function OnCancel()

end;

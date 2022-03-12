Include("\\script\\gb_taskfuncs.lua")
greatseed_configtab = {
	--{340,3,100,"\\settings\\maps\\great_night\\Äª¸ß¿ß.txt","M¹c Cao QuËt"},			--Äª¸ß¿ß
	{336,3,100,"\\settings\\maps\\great_night\\·çÁê¶É.txt","Phong L¨ng ®é"},			--·çÁê¶É
	
	{322,2,100,"\\settings\\maps\\great_night\\³¤°×É½±±Â´.txt","Tr­êng B¹ch s¬n B¾c"},	-- ³¤°×É½±±Â´
	--{321,2,100,"\\settings\\maps\\great_night\\³¤°×É½ÄÏ.txt","Tr­êng B¹ch S¬n Nam"},		-- ³¤°×É½ÄÏ
	--{225,2,30,"\\settings\\maps\\great_night\\É³Ä®É½¶´1.txt","Sa M¹c 1"},		-- ³¤°×É½ÄÏ
	--{226,2,30,"\\settings\\maps\\great_night\\É³Ä®É½¶´2.txt","Sa M¹c 2"},		-- ³¤°×É½ÄÏ
	--{227,2,40,"\\settings\\maps\\great_night\\É³Ä®É½¶´3.txt","Sa M¹c 3"},		-- ³¤°×É½ÄÏ
	
	--{182,1,25,"\\settings\\maps\\great_night\\ÄõÁú¶´ÃÔ¹¬.txt","NghiÖt Long ®éng"},	-- ³¤°×É½ÄÏ
	--{167,1,25,"\\settings\\maps\\great_night\\µã²ÔÉ½.txt","§iÓm Th­¬ng s¬n"},			-- ³¤°×É½ÄÏ
	{200,1,25,"\\settings\\maps\\great_night\\¹ÅÑô¶´ÃÔ¹¬.txt","Cæ D­¬ng ®éng"},	-- ³¤°×É½ÄÏ
	--{92,1,25,"\\settings\\maps\\great_night\\Êñ¸ÔÉ½.txt","Thôc C­¬ng s¬n"},				-- ³¤°×É½ÄÏ

--	{341, 4, 1, "\\settings\\maps\\great_night\\Ä®±±²ÝÔ­.txt","Ä®±±²ÝÔ­"},		-- Ä®±±²ÝÔ­
--	{333, 4, 1, "\\settings\\maps\\great_night\\»ªÉ½ÅÉ.txt","»ªÉ½ÅÉ"},			-- »ªÉ½ÅÉ
--	{319, 4, 1, "\\settings\\maps\\great_night\\ÁÙÓå¹Ø.txt","ÁÙÓå¹Ø"},			-- ÁÙÓå¹Ø
	{959, 4, 3, "\\settings\\maps\\great_night\\Ë«Áú¶´.txt","ChiÕn Long §éng"},			-- Ë«Áú¶´
--	{181, 4, 1, "\\settings\\maps\\great_night\\Á½Ë®¶´.txt","Á½Ë®¶´"},			-- Á½Ë®¶´
};

tblantern_area = {2, 21, 167, 193}

function TaskShedule()
	--ÉèÖÃ·½°¸Ãû³Æ
	TaskName("h¹t Huy Hoµng")
	
	-- 12µã00·Ö¿ªÊ¼
	TaskTime(20	, 00);
	
	--ÉèÖÃ¼ä¸ôÊ±¼ä£¬µ¥Î»Îª·ÖÖÓ
	TaskInterval(5)
	
	--ÉèÖÃ´¥·¢´ÎÊý£¬0±íÊ¾ÎÞÏÞ´ÎÊý
	TaskCountLimit(0)
	OutputMsg("#NAME?");
end

function TaskContent()
	--ÔÚ19:30µ½20:01·ÖÖÐ¼ä²ÅÄÜ´¥·¢
	local START_TIME = 2000;
	local END_TIME = 2030;
	
	if righttime_add() ~= 1 then--Èç¹ûÊ±¼ä²»¶Ô
		gb_SetTask("Ho¹t ®éng 'Hoa §¨ng'", 1, 0)
		gb_SetTask("h¹t Huy Hoµng", 12, 0);	--12ºÅ±äÁ¿ÓÃÀ´´æ´¢NPCµÄÐòºÅ
		return
	end;
	
	OutputMsg("#NAME?")
	--±£ÏÕÆð¼û£¬ÔÚ»î¶¯×î¿ªÊ¼½«±äÁ¿ÇåÁã
	local nNowTime = tonumber(date("%H%M"))
	
	--µ±·þÎñÆ÷Õý³£ÔËÐÐÊ±£¬Ã¿Ìì×¼Ê±¿ªÊ¼»î¶¯Ê±£¬µÚÒ»³¡Ê±
	if nNowTime >= 2000 and nNowTime < 2005 then	--	
		--NPCÐòºÅ = NPCµÄË³Ðò +  ÈÕÆÚ(4)£»ÓÃÒÔÑéÖ¤µã»÷µÄNPCÊÇ·ñÊôÓÚ¿É±»ÕªÈ¡µÄ¹ûÊµ
		gb_SetTask("h¹t Huy Hoµng", 12, 0);	--12ºÅ±äÁ¿ÓÃÀ´´æ´¢NPCµÄÐòºÅ
	end
	--------------------
	--
	--------------------
	--¼ì²éÊÇµÚ¼¸¸ö5·ÖÖÓ£¬¼´µÚ¼¸Åú´Î
	--Ö´ÐÐµÄÊ±ºò¸ù¾ÝÅú´ÎµÄÆæÅ¼À´È·¶¨ÊÇË¢ÖÖ×Ó»¹ÊÇ¹ûÊµ
	local nBatch = floor(mod(nNowTime,100)/5) + 1
	--
	local nMapCount = getn(greatseed_configtab);
	-----
	--
	-----
	for i = 1, nMapCount do
		local strExecute = format("dw Global_GreatSeedExecute(%d, %d, %d, [[%s]], [[%s]],%d)", greatseed_configtab[i][1], greatseed_configtab[i][2], greatseed_configtab[i][3], greatseed_configtab[i][4],greatseed_configtab[i][5],nBatch);
		GlobalExecute(strExecute);
		local szMsg = "";
		if (mod(nBatch,2) == 1) and greatseed_configtab[i][2] ~= 4 then
			szMsg = "h¹t Huy Hoµng"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "H¹t Hoµng Kim "
		elseif (mod(nBatch,2) == 0) and greatseed_configtab[i][2] ~= 4 then
			szMsg = "Qu¶ Huy Hoµng"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "Qu¶ Hoµng Kim"
		end; 
		szMsg = format("HiÖn t¹i <%s> ®· xuÊt hiÖn t¹i %s, 5 phót sau sÏ kÕt qu¶. C¸c vÞ ®¹i hiÖp h·y chuÈn bÞ h¸i qu¶.",
					szMsg,
					greatseed_configtab[i][5]);
		
		GlobalExecute(format("dw AddLocalNews([[%s]])",szMsg));
	end;
end
function CreateLantern(nDate)
	if (gb_GetTask("Ho¹t ®éng 'Hoa §¨ng'", 2) == 0 or gb_GetTask("Ho¹t ®éng 'Hoa §¨ng'", 2) ~= nDate) then
		lantern_area = tblantern_area[ random( getn(tblantern_area) ) ]
		gb_SetTask("Ho¹t ®éng 'Hoa §¨ng'", 1, lantern_area)
		gb_SetTask("Ho¹t ®éng 'Hoa §¨ng'", 2, nDate)
	end
	GlobalExecute("dw GN_Create_Lanterns()")
end

-- LLG_ALLINONE_TODO_20070802
--
function righttime_add()
	local nTime = tonumber(date("%H%M"));
	if (nTime >= 2000 and nTime < 2030)  then
		return 1;
	end;
	return 0;
end

function goldenseedmap()	--Ëæ»úÏÂÒ»´Î»Æ½ðÖÖ×Ó³öÏÖµÄµØÍ¼£»1´óÀí£¬2ÑïÖÝ£»
	local goldcity = random(1, 2);
	gb_SetTask("h¹t Huy Hoµng", 1, goldcity);
	local RowIndex = random(2, 41)
	gb_SetTask("h¹t Huy Hoµng", 2, RowIndex);
	OutputMsg("Thµnh phè huy hoµng"..goldcity);
	OutputMsg("goldenseedmap();"..RowIndex);
	return goldcity;
end;

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end

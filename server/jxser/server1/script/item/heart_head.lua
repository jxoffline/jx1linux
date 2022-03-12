--ĞÄĞÄÏàÓ³·û
--Suyu 2004.1.12

--ÍòÊÂÍ¨ÑùÀı½Å±¾(BlackBay.03.12.30)
Include("\\script\\battles\\battlehead.lua");
Include("\\script\\battles\\battleinfo.lua");
Include("\\script\\global\\forbidmap.lua");
IncludeLib("FILESYS")

function init(tb)
	local file = "\\settings\\forbitheart.txt"
	if (TabFile_Load(file, file) == 0) then
		return
	end
	local count = TabFile_GetRowCount(file)
	if (count < 2) then
		return
	end
	for i = 2, count do
		local mapid = tonumber(TabFile_GetCell(file, i, 1))
		if (mapid > 0) then
			tb[mapid] = 1
		end
	end
end

FORBITMAP_LIST  = {}
init(FORBITMAP_LIST)

function add_forbitmap(mapid)
	FORBITMAP_LIST[mapid] = 1
end

function del_forbitmap(mapid)
	FORBITMAP_LIST[mapid] = nil
end


FORBIT_TEMPLATEMAP_LIST  = {}
function add_forbit_templatemap(mapid)
	FORBIT_TEMPLATEMAP_LIST[mapid] = 1
end

function del_forbit_templatemap(mapid)
	FORBIT_TEMPLATEMAP_LIST[mapid] = nil
end

function use_heart(bForever)
	nSubWorldID = SubWorldIdx2ID();
	W,X,Y = GetWorldPos();
	local nMapTemplateID = SubWorldIdx2MapCopy(SubWorld)
	
	local nSongNumber = 60; -- ËÎ·½ÈËÊı
	local nJinNumber = 70;  -- ½ğ·½ÈËÊı
	local nMapId = W;
	
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
			return 1;
		end
	end	
	if checkYDBZMaps(nSubWorldID) == 1 then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1
	end

	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dôngT©m T©m T­¬ng ¸nh Phï!");
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dôngT©m T©m T­¬ng ¸nh Phï!");
		return 1
	end
	
	if (nSubWorldID == 44 or nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223)	or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 ) )then 
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dôngT©m T©m T­¬ng ¸nh Phï!");
		--AddItem(6,1,18,1,0,0,0);
		return 1
	end;

	if (FORBITMAP_LIST[nSubWorldID] == 1 or FORBIT_TEMPLATEMAP_LIST[nMapTemplateID] == 1) then
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dôngT©m T©m T­¬ng ¸nh Phï!")
		return 1
	end

	--ÎÀ¹úÕ½ÕùÖ®·é»ğÁ¬³ÇµØÍ¼£¬²»ÄÜÊ¹ÓÃ
	if (checkHFMaps(nSubWorldID) == 1) then
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dôngT©m T©m T­¬ng ¸nh Phï!");
		return 1
	end;

	if (checkBWMaps(nSubWorldID) == 1) then
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dôngT©m T©m T­¬ng ¸nh Phï!");
		return 1
	end;
	
	if checkActMaps(nSubWorldID) == 1 then
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dôngT©m T©m T­¬ng ¸nh Phï!");
		return 1
	end
	
	if (checkZQMaps(nSubWorldID) == 1) then
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dôngT©m T©m T­¬ng ¸nh Phï!");
		return 1
	end;
	
	if (checkNEWPRACTICEMaps(nSubWorldID) == 1) then
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dôngT©m T©m T­¬ng ¸nh Phï!");
		return 1
	end;
	
	-- ĞÄĞÄÏàÓ³·û¹¦ÄÜ±»ÆÁ±Î£¬²»ÄÜÊ¹ÓÃ
	if (IsDisabledUseHeart(PlayerIndex) == 1) then 
		Msg2Player("Xin lçi! HiÖn b¹n kh«ng thÓ sö dông T©m T©m T­¬ng ¸nh Phï.");
		--AddItem(6,1,18,1,0,0,0);
		return 1
	end;

	Lover = GetMateName();
	if (Lover == "") then 
		Msg2Player("Ng­êi ch­a kÕt h«n kh«ng thÓ sö dông!");
		--AddItem(6,1,18,1,0,0,0);
		return 1
	end;
	if (bForever == 0) then
		QueryWiseManForSB("LoverCB_C", "UnlineCB_C", 1000, Lover);
		return 0
	else
		QueryWiseManForSB("LoverCB_F", "UnlineCB_F", 1000, Lover);	
		return 1
	end
end;

--ÏûºÄĞÔĞÄĞÄÏàÓ³¸¶£¬Ã¿´ÎÊ¹ÓÃ³É¹¦»áÏûºÄÒ»¸ö
function LoverCB_C(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect, nMapTemplateID)
	_LoverCallBack(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect,nMapTemplateID ,0)
end

--ÓÀ¾ÃĞÔĞÄĞÄÏàÓ³¸¶£¬²»ÏŞÊ¹ÓÃ´ÎÊı
function LoverCB_F(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect,nMapTemplateID)
	_LoverCallBack(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect,nMapTemplateID, 1)
end

--´Ëº¯ÊıÎª³É¹¦²éÑ¯ĞÅÏ¢µÄ»Øµ÷º¯Êı£¬²ÎÊı¸öÊıºÍ²ÎÊıË³Ğò²»ÔÊĞí¸Ä±ä
function _LoverCallBack(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect,nMapTemplateID,  bForever)
	if (nSubWorldID > 70000) then
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ dÉn vµo.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0;
	end
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nSubWorldID == tbBATTLEMAP[i] ) then
			Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ dÉn vµo.");
			if (bForever == 0) then
				AddItem(6,1,18,1,0,0,0);
			end
			return 0;
		end
	end
	
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ dÉn vµo.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0)
		end;
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ dÉn vµo.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0)
		end;
		return 1
	end
	
	if (nSubWorldID == 44 or  nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223) or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 )) then 
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ dÉn vµo.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0)
		end;
		return 0
	end;
	
	if (FORBITMAP_LIST[nSubWorldID] == 1 or FORBIT_TEMPLATEMAP_LIST[nMapTemplateID] == 1 ) then
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ dÉn vµo.")
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0)
		end
		return 0
	end

	if checkActMaps(nSubWorldID) == 1 then
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ sö dông T©m T©m T­¬ng ¸nh Phï.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 1
	end
	
	if (checkBWMaps(nSubWorldID) == 1) then
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ sö dông T©m T©m T­¬ng ¸nh Phï.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end;
	
	if (checkZQMaps(nSubWorldID) == 1) then
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ sö dông T©m T©m T­¬ng ¸nh Phï.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end;	
	if (checkTONGMaps(SubWorldIdx2MapCopy(SubWorld)) == 1) then
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ sö dông T©m T©m T­¬ng ¸nh Phï.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end;	
	if (checkNEWPRACTICEMaps(nSubWorldID) == 1) then
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ sö dông T©m T©m T­¬ng ¸nh Phï.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0)
		end
		return 0
	end;		

	if checkYDBZMaps(nSubWorldID) == 1 then
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ sö dông T©m T©m T­¬ng ¸nh Phï.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end
	
	-- ÅäÅ¼±»±£»¤(¿ÉÄÜÊÇÔÚ×Ô¶¯¹Ò»úÖĞ£¬ĞÄĞÄÏàÓ³·û¹¦ÄÜ±»ÆÁ±Î£¬²»ÄÜÊ¹ÓÃ)
	if (bTargetProtect > 0) then 
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ dÉn vµo.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end;

	--ÎÀ¹úÕ½ÕùÖ®·é»ğÁ¬³ÇµØÍ¼£¬²»ÄÜÊ¹ÓÃ
	if (checkHFMaps(nSubWorldID) == 1) then
		Msg2Player("Xin lçi! Phèi ngÉu cña b¹n ®ang ë khu vùc ®Æc biÖt kh«ng thÓ sö dông T©m T©m T­¬ng ¸nh Phï.");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end;

	NewWorld(nSubWorldID,nPosX, nPosY);
	SetFightState(nFightMode)
end;


function UnlineCB_C(TargetName, MoneyToPay)
	return _UnlineCallBack(TargetName, MoneyToPay, 0)
end

function UnlineCB_F(TargetName, MoneyToPay)
	return _UnlineCallBack(TargetName, MoneyToPay, 1)
end

--´Ëº¯ÊıÎªÊ§°Ü²éÑ¯(Ò²¾ÍÊÇ²»ÔÚÏß)ĞÅÏ¢µÄ»Øµ÷º¯Êı£¬²ÎÊı¸öÊıºÍ²ÎÊıË³Ğò²»ÔÊĞí¸Ä±ä
function _UnlineCallBack(TargetName, MoneyToPay, bForever)
	Say("<#>Xin lçi! "..TargetName.."<#>T¹m thêi kh«ng Online ",0)
	if (bForever == 0) then
		AddItem(6,1,18,1,0,0,0)
	end;
	return 0
end;

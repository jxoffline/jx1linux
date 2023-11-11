DTMISSIONID = 14
function BT2DTFight(orgmissionid,Player1, Player2)
	print("battlewd:"..SubWorld)
	local MS_ORGWORLDINDEX = 3		--À´Ê±ÊÀ½çµØÍ¼µÄINDEX
	local MS_ORGMISSION = 4		--À´Ê±ÊÀ½çµÄMISSION	
	local MS_ORGMAPID = 5			--À´Ê±ÊÀ½çµÄMAPID
	local MS_LEVEL = 	6			--ÊÀ½çµÄµÈ¼¶
	local MS_ORGBACK_X1 = 7		--ÍË³öµ¥ÌôºóµÄÖØÉúµã
	local MS_ORGBACK_Y1 =	8		
	local MS_ORGBACK_X2 = 9
	local MS_ORGBACK_Y2 = 10
	local MS_DTWORLDINDEX = 12		--µ¥ÌôÊÀ½çµØÍ¼µÄINDEX
	local MS_DTMISSION = 13			--µ¥ÌôÊÀ½çµÄMISSION

	local MS_PL_INDEX_1 = 14
	local MS_PL_CURCAMP_1 = 15
	local MS_PL_INDEX_2 = 17
	local MS_PL_CURCAMP_2 = 18

	local mapid = dt_getfightmap();						--µÃµ½µ¥ÌôµØÍ¼id
	local mapindex = SubWorldID2Idx(mapid)		--µÃµ½µØÍ¼ºÅmapidµÄË÷Òý
	if (mapindex < 0) then
		print("Error!Server nµy hiÖn thiÕu khu vùc ®¬n ®Êu! Xin bé phËn kü thuËt kiÓm tra gÊp!");
		return
	end;

	--²é¿´µØÍ¼ÊÇ·ñ±»Õ¼ÓÃ£»
	if (dt_CheckMap(mapindex) == 0) then
		return
	end;
	
	local orgsubworld = SubWorld;---ÕâÀïÊÇµ±Ç°µØÍ¼µÄË÷ÒýºÅ
	local orgPlayerIndex = PlayerIndex	
	local orgmapid = SubWorldIdx2ID(SubWorld)	
	local orggamelevel = BT_GetGameData(GAME_LEVEL)
	local orghomeinx1 = GetMissionV(MS_HOMEIN_X1)
	local orghomeiny1 = GetMissionV(MS_HOMEIN_Y1)
	local orghomeinx2 = GetMissionV(MS_HOMEIN_X2)
	local orghomeiny2 = GetMissionV(MS_HOMEIN_Y2)
	
	SubWorld = mapindex	
	----·ûºÏÌõ¼þ³õÊ¼»¯µ¥Ìômission
	OpenMission(DTMISSIONID)
	
	--±£´æµ±Ç°ÊÀ½çµÄÐÅÏ¢ÓÚµ¥ÌômissionÀï	
	SetMissionV(MS_ORGWORLDINDEX,orgsubworld)
	SetMissionV(MS_ORGMISSION,orgmissionid)
	SetMissionV(MS_ORGMAPID,orgmapid)
	SetMissionV(MS_LEVEL,orggamelevle)
	SetMissionV(MS_ORGBACK_X1,orghomeinx1)
	SetMissionV(MS_ORGBACK_Y1,orghomeiny1)
	SetMissionV(MS_ORGBACK_X2,orghomeinx2)
	SetMissionV(MS_ORGBACK_Y2,orghomeiny2)
	SetMissionV(MS_DTWORLDINDEX , SubWorld)
	SetMissionV(MS_DTMISSION , DTMISSIONID)
	
	PlayerIndex = Player1
	SetMissionV(MS_PL_INDEX_1,PlayerIndex)
	SetMissionS(1,GetName())
	SetMissionV(MS_PL_CURCAMP_1,GetCurCamp())
	
	PlayerIndex = Player2
	SetMissionV(MS_PL_INDEX_2,PlayerIndex)
	SetMissionS(2,GetName())
	SetMissionV(MS_PL_CURCAMP_2,GetCurCamp())
	
----½«µ¥ÌôË«·½¼ÓÈëµ½µ¥ÌôµØÍ¼ÖÐ
	dt_EnterMap(mapindex,Player1)
	dt_EnterMap(mapindex,Player2)
	
	RunMission(DTMISSIONID)
	
	SubWorld = orgsubworld				--»¹Ô­µ±Ç°µØÍ¼µÄindex
	PlayerIndex = orgPlayerIndex		--»¹Ô­µ±Ç°PlayerIndex
end


--------½«player¼ÓÈëµ½Ö¸¶¨indexµØÍ¼ÖÐ
function dt_EnterMap(newworldindex,pindex)
	local MS_ORGWORLDINDEX = 3		--À´Ê±ÊÀ½çµØÍ¼µÄINDEX
	print("enter1wd:"..SubWorld)
	
	SubWorld = newworldindex;
	PlayerIndex = pindex
	local orgworldidx = GetMissionV(MS_ORGWORLDINDEX)
	if (GetCurCamp() == 1) then 
		local newworldid = SubWorldIdx2ID(newworldindex)
		
		SubWorld = orgworldidx;
		print("enter2wd:"..SubWorld)
		local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))	
		
		enterpos = GetIniFileData(mapfile, "Area_SingleFight", "SinglePos1");
		x1,y1 = bt_str2xydata(enterpos)	
		
		SubWorld = newworldindex;
		NewWorld(newworldid, floor(x1/32),floor(y1/32))	
		print("newworld"..newworldid.." "..x1.." "..y1)
		AddMSPlayer(DTMISSIONID,1)
		SetCurCamp(1);
		local str2 = "<#> phe Tèng"..GetName().."vµo khu vùc ®¬n ®Êu";
	else
		local newworldid =	 SubWorldIdx2ID(newworldindex)
		
		SubWorld = orgworldidx;
		local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))		
		enterpos = GetIniFileData(mapfile, "Area_SingleFight", "SinglePos2");
		x1,y1 = bt_str2xydata(enterpos)	
		
		SubWorld = newworldindex;
		NewWorld(newworldid, floor(x1/32),floor( y1/32))
		print("newworld"..newworldid.." "..x1.." "..y1)
		AddMSPlayer(DTMISSIONID, 2)
		SetCurCamp(2);
		
		local str2 = "<#> phe Kim"..GetName().."vµo khu vùc ®¬n ®Êu";
	end;
	local str1 = "B¹n ®i vµo khu vùc ®¬n ®Êu! B¹n chØ cã 3 phót ®Ó tiªu diÖt ®èi thñ! NÕu b¹n thÊt b¹i hoÆc thêi gian kÕt thóc, b¹n sÏ ®­îc d­a vÒ hËu doanh."
	Talk(1,"",str1.."<enter>  <color=red>ChÝnh thøc khai chiÕn!")
	Msg2Player(str2);
	
	SubWorld = orgworldidx
	Msg2MSAll(GetMissionV(MS_ORGMISSION),str2)
	
	SubWorld = newworldindex
	SetPKFlag(1)
	SetDeathScript("\\script\\battles\\singlefight\\dt_death.lua");
end;

--------Í¨¹ýµ±Ç°Õ½ÒÛµÈ¼¶µÈ¼¶µÃµ½ÏàÓ¦µÈ¼¶µÄµ¥ÌôµØÍ¼id
function dt_getfightmap()
	local lel=BT_GetGameData(GAME_LEVEL);
	if ( lel < 0 ) then
		print("error:")
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	return tonumber(GetIniFileData(mapfile, "Area_SingleFight", "SingleFightMap"..lel)) 	
end;

--------²é¿´µ¥ÌôµØÍ¼ÓÐÃ»ÓÐ±»Õ¼ÓÃ£¬ÄÜ²»ÄÜÊ¹ÓÃ¡£return 0--²»ÄÜ£»return  1--ÄÜ;
function dt_CheckMap(index)
	orgworld = SubWorld;
	SubWorld = index;
	count = GetMSPlayerCount(DTMISSIONID, 0)
	if (count > 0 ) then 
		SubWorld = orgworld
		return 0
	else
		SubWorld = orgworld
		return 1
	end
	SubWorld = orgworld
end;

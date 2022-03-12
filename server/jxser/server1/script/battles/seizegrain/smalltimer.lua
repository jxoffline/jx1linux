IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function OnTimer()
	local t = GetMissionV(MS_TIMER1_TIME) + 1;--¼ÆÊıÆ÷£¬Í³¼Æµ±Ç°¶¨Ê±Æ÷´¥·¢ÁË¶àÉÙ´ÎÁË
	SetMissionV(MS_TIMER1_TIME, t);
	
	--Storm ¼Ó½±Àø»ı·Ö
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "Khu vùc S¬ cÊp "
	elseif (lsf_level == 2) then
		resultstr = "Khu vùc Trung cÊp "
	elseif (lsf_level == 3) then
		resultstr = "Khu vùc Cao cÊp "
	end
	
	if (t == RUNGAME_TIME) then --Èç¹ûµ½ÁËÕıÊ½¿ªÕ½Ê±¿Ì£¬ÔòÍ£Ö¹±¨Ãû£¬ÕıÊ½½øÈëÕ½¶·½×¶Î
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."Thêi gian b¸o danh cho Tèng Kim ph­¬ng thøc VËn l­¬ng ®· ®Õn, cuéc chiÕn chİnh thøc b¾t ®Çu!", 2);
		Msg2MSAll(MISSIONID, "Tèng Kim chİnh thøc khai chiÕn! C¸c chiÕn sÜ! X«ng lªn!");
		WriteLog("battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end
	local gamemode = GetMissionV(MS_FLAGMODE)

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>Tèng Kim ®¹i chiÕn ph­¬ng thøc VËn l­¬ng ®ang trong thêi gian b¸o danh, mäi ng­êi h·y mau ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn trÊn ®Ó b¸o danh, hoÆc cã thÓ dïng Tèng Kim chiªu th­ ®Ó trùc tiÕp ®Õn ®iÓm b¸o danh. Thêi gian khai chiÕn cßn l¹i lµ: 	"..RestMin.."phót. §iÒu kiÖn tham gia: ®¼ng cÊp tõ 40, phİ b¸o danh 3000 l­îng. Sau khi khai chiÕn, nÕu tæng sè ng­êi ch­a ®ñ vÉn cã thÓ tiÕp tôc b¸o danh!";
			str2 ="<#> Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.."phót"
		else
			str1 = resultstr.."<#>Tèng Kim ®¹i chiÕn ph­¬ng thøc VËn l­¬ng ®ang trong thêi gian b¸o danh, mäi ng­êi h·y mau ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn trÊn ®Ó b¸o danh, hoÆc cã thÓ dïng Tèng Kim chiªu th­ ®Ó trùc tiÕp ®Õn ®iÓm b¸o danh. Thêi gian khai chiÕn cßn l¹i lµ: 	"..RestMin.."phót"..RestSec.."gi©y. §iÒu kiÖn tham gia: ®¼ng cÊp tõ 40, phİ b¸o danh 3000 l­îng. Sau khi khai chiÕn, nÕu tæng sè ng­êi ch­a ®ñ vÉn cã thÓ tiÕp tôc b¸o danh!";
			str2 = "<#> Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.."phót"..RestSec.." gi©y"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--Í¨Öª³¡ÄÚÍæ¼Ò¿ªÕ½Ê£ÓàÊ±¼ä
	end
	
	if (t >= RUNGAME_TIME) then
		if (t == RUNGAME_TIME) then --ÕıÊ½¿ªÕ½µÄµÚÒ»´Î´¥·¢Ê±£¬²úÉúÕ½¶·NpcµÄÉú³É¹æÔòÊı¾İ
			sf_buildfightnpcdata()
		else
			--Ã¿Ò»·ÖÖÓ²úÉúÒ»ÅúNpc£¬²¢ÇÒÍ¨¸æµ±Ç°ËÍÁ¸Ê³°üµÄÊıÁ¿
			if (t <= VANISHGAME_TIME and mod(t, 3) == 0 ) then
				sf_callnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- ²úÉúÕ½¶·Npc				
			end
			
			bt_pop2signmap()	--½«ÔÚºóÓª£¨fight=0£©µÄÍæ¼ÒËÍ»Ø±¨Ãûµã
			
			if (mod(t, 3 ) == 0) then
				msstr = format("C«ng bè: Tû lÖ Bao l­¬ng phe Tèng vµ phe Kim vËn chuyÓn ®­îc lµ <color=yellow>%d:%d",BT_GetGameData(GAME_CAMP1),BT_GetGameData(GAME_CAMP2));
				Msg2MSAll(MISSIONID, msstr);
			end
		end
		
		if (t > RUNGAME_TIME) then
			local bp = mod(t - RUNGAME_TIME*2, 3*10);
			local n_b = floor((t - RUNGAME_TIME*2) / (3*10));
			
			if (bp == 0)  then
				sf_creategraingharry(n_b+1);
			end
		end
		
	end;
	
end;

function sf_creategraingharry(n_branch)
	if (n_branch > 3) then
		print("error, add grain branch is overflow !"..n_branch);
		return 0;
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local area1 = BT_GetGameData(GAME_CAMP1AREA);
	local area2 = BT_GetGameData(GAME_CAMP2AREA);
	
	local flagposfile1 = GetIniFileData(mapfile, "Area_"..area1, "grainpos");
	local flagposfile2 = GetIniFileData(mapfile, "Area_"..area2, "grainpos");
	local flagposfile = {flagposfile1, flagposfile2};
	for n_camp = 1, 2 do
		local sz_file = flagposfile[n_camp]
		local count = GetTabFileHeight(sz_file) - 1;
		if (count < 9) then
			print("error, flagposfile height not enough!"..sz_file, count);
			return
		end
		
		for i = ((n_branch-1)*3+1), (n_branch*3) do
			local srcx = GetTabFileData(sz_file, i + 1, 1)
			local srcy = GetTabFileData(sz_file, i + 1, 2)
		
			sf_addgharry(n_camp, srcx, srcy, 0);
		end
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>Xe l­¬ng míi ®· ®Õn, h·y mau cho ng­êi ®i vËn l­¬ng.");
	end
	
end

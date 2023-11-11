Include( "\\script\\missions\\leaguematch\\head.lua" )

function OnTimer()
	--Ê±¼ä¼ÆÊýÔö¼Ó
	local n_timer = GetGlbValue(GLB_WLLS_TIME) + 1
	SetGlbValue(GLB_WLLS_TIME, n_timer)
	
	if (n_timer >= WLLS_TIMER_FIGHT_TOTAL) then --±ÈÈü½áÊø
		SetGlbValue(GLB_WLLS_PHASE, 3) --½øÈë¼äÐªÊ±¼ä
		CloseGlbMission(WLLS_MSID_GLB)
	end

	local tb_sub = wlls_get_subworld(3)
	local n_oldsub = SubWorld
	for n_idx, nGroupIdx in tb_sub do
		SubWorld = n_idx
		if (n_timer == WLLS_TIMER_FIGHT_PREP) then --×¼±¸½áÊø
			_M("RunMission(WLLS_MSID_COMBAT)")
			RunMission(WLLS_MSID_COMBAT)
		elseif (n_timer < WLLS_TIMER_FIGHT_PREP) then
			local n_resttime = (WLLS_TIMER_FIGHT_PREP - n_timer)*WLLS_TIMER_FIGHT_FREQ
			Msg2MSAll(WLLS_MSID_COMBAT, "Giai ®o¹n chuÈn bÞ: b¹n cßn thêi gian chuÈn bÞ lµ: <color=yellow>"..n_resttime.."<color> gi©y.")
		else
			local n_resttime = WLLS_TIMER_FIGHT_TOTAL - n_timer
			if (n_resttime <= 0) then --±ÈÈü½áÊø
				CloseMission(WLLS_MSID_COMBAT)
			elseif (mod(n_timer, 2) == 0) then	--Ë«Êý´Î±¨¸æ£¬µ¥Êý²»±¨¸æ
				--·¢ËÍÕ½±¨£¬±¨¸æ¶Ô·½Ê£ÓàÈËÊý
				for i = 1, WLLS_MAX_COUNT, 2 do
					local count_org = GetMSPlayerCount( WLLS_MSID_COMBAT, i )
					local count_emy = GetMSPlayerCount( WLLS_MSID_COMBAT, i + 1 )
					if (count_org > 0 or count_emy > 0) then --²»ÊÇË«·½¶¼Îª¿Õ
						Msg2MSGroup(WLLS_MSID_COMBAT, "<color=pink>Tin tøc chiÕn sù: §èi ph­¬ng cßn"..count_emy.." ng­êi", i)
						Msg2MSGroup(WLLS_MSID_COMBAT, "<color=pink>Tin tøc chiÕn sù: §èi ph­¬ng cßn"..count_org.." ng­êi", i + 1)
					end
				end
				--±¨¸æÉËº¦Á¿
				local tb_camp	= wlls_get_ms_troop()
				for i = 1, getn(tb_camp) do
					local n_dmg = wlls_get_ms_damage(tb_camp[i])
					Msg2MSGroup(WLLS_MSID_COMBAT, "Phe ta hiÖn t¹i bÞ ®¸nh tróng: <color=yellow>"..n_dmg.."<color>", tb_camp[i])
				end
				--±ÈÈüÊ£ÓàÊ±¼ä
				n_resttime = n_resttime * WLLS_TIMER_FIGHT_FREQ;
				local n_RestMin = floor( n_resttime / 60 );
				local n_RestSec = mod( n_resttime,60 );
				if (n_RestMin == 0) then
					Msg2MSAll( WLLS_MSID_COMBAT, "Giai ®o¹n chiÕn ®Êu: Thêi gian thi ®Êu cßn l¹i lµ: <color=yellow>"..n_RestSec.."<color> gi©y." );
				elseif (n_RestSec == 0) then
					Msg2MSAll( WLLS_MSID_COMBAT, "Giai ®o¹n chiÕn ®Êu: Thêi gian thi ®Êu cßn l¹i lµ: <color=yellow>"..n_RestMin.."<color> phót." );
				end;
			end
		end
	end
	SubWorld = n_oldsub
end

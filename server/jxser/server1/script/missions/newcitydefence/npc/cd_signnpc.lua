----------------------------------------------------------------
--FileName:	cd_signnpc.lua
--Creater:	firefox
--Date:		2005-
--Comment:	ÖÜÄ©»î¶¯£ºÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³Ç
--			¹¦ÄÜ£º±¨Ãûµã±¨Ãû¹Ù
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")
CD_SIGNNPCNAME = "T­íng qu©n thñ thµnh"
function main()
	local signmap = SubWorldIdx2ID( SubWorld )
	if ( signmap == tbDEFENCE_SIGNMAP[1] ) then
		camp = 1
		cityname = "Phe Tèng"
		defencemap = tbDEFENCE_MAPID[1]
		defencesidx = SubWorldID2Idx( defencemap )
	elseif ( signmap == tbDEFENCE_SIGNMAP[2] ) then
		camp = 2
		cityname = "Phe Kim"
		defencemap = tbDEFENCE_MAPID[2]
		defencesidx = SubWorldID2Idx( defencemap )
	else
		print("citydefence signmap error!!! mapid = "..signmap)
		return
	end
	local guanyuanname = cityname.."T­íng qu©n thñ thµnh"
	
	local level = GetLevel()
	if ( level < CD_LEVEL_LIMIT ) then
		Talk(1, "", CD_SIGNNPCNAME..": TiÓu quû tõ ®©u ®Õn? Kh«ng muèn sèng µ? §¼ng cÊp cßn ch­a ®ñ!"..CD_LEVEL_LIMIT.."cÊp, ch¹y ®Õn tiÒn tuyÕn, ng­¬i t­ëng ®©y lµ ®©u? §õng cã mµ ®i lung tung, nÕu kh«ng ng­¬i cã chÕt còng kh«ng biÕt t¹i sao!")
		Msg2Plalyer("§¼ng cÊp lín h¬n"..CD_LEVEL_LIMIT.."cÊp míi cã thÓ tham gia chiÕn tranh vÖ quèc.")
		return
	end
	local oldSubWorld = SubWorld
	
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": ChiÕn tr­êng phÝa tr­íc x¶y ra vÊn ®Ò, t¹m thêi kh«ng thÓ vµo.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end

	SubWorld = defencesidx;
	local state = GetMissionV(MS_STATE)
	if ( state ~= 1 and state ~= 2 ) then
		Say(CD_SIGNNPCNAME..":Kh«ng cã g× bÈm c¸o ®õng ®Õn quÊy rÇy ta!", 0)
		Msg2Player("VÖ quèc Phong Háa liªn thµnh"..cityname.."Ho¹t ®éng thñ thµnh vÉn ch­a b¾t ®Çu.")
		SubWorld = oldSubWorld
		return
	end
	
	local randkey = GetMissionV( MS_RANDKEY );
	local memcount = GetMSPlayerCount(MISSIONID, 0)
	local nday = tonumber(date("%m%d"));
	local time = GetMissionV(MS_SMALL_TIME)
	SubWorld = oldSubWorld
	
	if (time >= CALLBOSS_ZHUSHUAI) then
		Say(CD_SIGNNPCNAME..": qu©n viÖn trî cña ta ®· bÞ ®Þch qu©n chia c¾t, kh«g thÓ ®Õn ®©y ®­îc!", 2, "§iÓm tËp kÕt/OnCancel", "LuËn c«ng ban th­ëng/cd_awardforpayout")
		return
	end
	
	if ( memcount >= MAX_MEMBERCOUNT ) then
		Talk(2, "", CD_SIGNNPCNAME..": Ng­¬i lµ ai?", CD_SIGNNPCNAME..": µ! Ng­¬i muèn gióp ta chèng l¹i kÎ ®Þch? Ng­¬i qu¶ lµ yªu n­íc! Binh lùc qu©n ta rÊt ®Çy ®ñ, ng­¬i cã lßng lµ tèt, nh­ng xin ng­¬i h·y vÒ ®i!")
		Msg2Player("Sè ng­êi tham gia chiÕn tranh vÖ quèc ®· ®Çy<color=yellow>"..MAX_MEMBERCOUNT.."<color>ng­êi, kh«ng thÓ vµo chiÕn tr­êng.")
		return
	end
	
--	if ( GetTask( TASKID_FIRE_DAY ) == nday and GetTask( TASKID_FIRE_KEY ) ~= randkey ) then	--²»ÔÊÐí±¨Ãû
--		Say(CD_SIGNNPCNAME.."£ºÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³Ç»î¶¯Ò»ÌìÖ»ÄÜ²Î¼ÓÒ»³¡£¬Äã»¹ÊÇºÃºÃÑø¾«ÐîÈñ£¬ÏÂ´ÎÔÙÀ´°É¡£", 0)
--	elseif ( nday ~= GetTask( TASKID_FIRE_DAY ) ) then	--ÔÊÐí±¨Ãû
	if ( GetTask( TASKID_FIRE_KEY ) ~= randkey or  GetTask( TASKID_FIRE_DAY ) ~= nday) then	--ÔÊÐí±¨Ãû
		Say(CD_SIGNNPCNAME..": Lý NhÞ! Tªn tiÓu tö nhµ ng­¬i mau ®i kªu TÝn Sö l¹i ®©y, qu©n ®Þch l¹i ®¸nh ®Õn råi! ¥? Ng­¬i lµ ai? B©y giê lµ lóc nµo? Cã ng­êi ®ang tÊn c«ng thµnh cña ta, ng­¬i cßn kÐo dµi qu©n c¬ sÏ bÞ chÐm ®Çu biÕt kh«ng?", 3, "T­íng qu©n! Ta ®Õn gióp thñ thµnh!/#want2joincd1("..defencemap..")", "LuËn c«ng ban th­ëng/cd_awardforpayout", "…… (B¹n kh«ng nãi lêi g×, chØ c­êi nh¹t mét tiÕng råi ®i ) /laughtoleave")
		cd_clear_lastsumexp();		--Çå³ýÉÏ´Î¼ÆËãµÄÀÛ¼Æ¾­ÑéÖµ
	else
		Say(CD_SIGNNPCNAME..": ¥? Ch¼ng ph¶i ng­¬i ®· vµo chiÕn tr­êng sao? Hay lµ ta bi hoa m¾t? enter> Th«i ®­îc råi! Ng­¬i chÈun bÞ vµo trong ®ã ®i!", 3, "Ta muèn gia nhËp/#sure2joincd("..defencemap..")", "LuËn c«ng ban th­ëng/cd_awardforpayout", "Ta chØ ghÐ qua xem/OnCancel")
	end
end

function sure2joincd(defencemap)
	local oldSubWorld = SubWorld;
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencesidx = SubWorldID2Idx( defencemap )
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": ChiÕn tr­êng phÝa tr­íc x¶y ra vÊn ®Ò, t¹m thêi kh«ng thÓ vµo.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end
	SubWorld = defencesidx
	local state = GetMissionV( MS_STATE )
	local time = GetMissionV(MS_SMALL_TIME)
	local memcount = GetMSPlayerCount(MISSIONID, 0)
	if ( state ~= 1 and state ~= 2 ) then
		SubWorld = oldSubWorld
		return
	end
	if (time >= CALLBOSS_ZHUSHUAI) then
		SubWorld = oldSubWorld
		return
	end
	if (memcount >= MAX_MEMBERCOUNT) then
		SubWorld = oldSubWorld
		return
	end
	local randkey = GetMissionV( MS_RANDKEY )
	local nday = tonumber(date("%m%d"))
	if ( GetTask( TASKID_FIRE_KEY ) ~= randkey or  GetTask( TASKID_FIRE_DAY ) ~= nday) then
		if (Pay(FIRE_JOINUP_FEE) == 1) then
			SetTask( TASKID_FIRE_DAY,  nday)
			SetTask( TASKID_FIRE_KEY,  randkey)
		else
			Say(CD_SIGNNPCNAME..": Sao thÕ, ng­¬i kh«ng mang theo"..floor(FIRE_JOINUP_FEE / 10000).." v¹n l­îng, ta kh«ng thÓ cho ng­¬i vµo. H·y chuÈn bÞ tiÒn råi h·y ®Õn t×m ta!", 0);
			return -1;
		end;
	end;
	cd_setsign_levelexp();
	JoinMission(MISSIONID, GetMissionV( MS_CITYCAMP ))
	SubWorld = oldSubWorld
end

function want2joincd1(defencemap)
	Say(CD_SIGNNPCNAME..": µ! Ng­¬i muèn gióp chóng ta chèng l¹i kÎ ®Þch? ¸i chµ! MÊy tªn nµy kh«ng gièng binh sÜ tÇm th­êng, bän chóng vâ nghÖ cao c­êng, c­ìi ngùa rÊt tµi, l¹i cßn biÕt phãng ¸m khÝ.", 1, "T­íng qu©n! ¤ng kh«ng sao chø?/#want2joincd2("..defencemap..")")
end

function want2joincd2(defencemap)
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencesidx = SubWorldID2Idx( defencemap )
	oldSubWorld = SubWorld
	SubWorld = defencesidx
	local cd_membercount = GetMSPlayerCount(MISSIONID, 0)
	SetTask(TSKID_PLAYER_ZHANGONG,0) --Çå¿ÕÕ½¹¦Öµ
	SubWorld = oldSubWorld
	Say(CD_SIGNNPCNAME..": §­îc råi! Kh«ng cÇn nãi nhiÒu, nãi chung ta c¶m thÊy lai lÞch cña bän hä rÊt kh¶ nghi, trong lóc chiÕn ®Êu nÕu ng­¬i nhÆt ®­îc th­ hµm th× h·y ®em ®Õn ta xem, ta sÏ träng th­ëng! Sè ng­êi tham gia thñ thµnh lµ<color=yellow>"..cd_membercount.."<color> ng­êi. Tr­íc tiªn ph¶i nép 10 v¹n lÖ phÝ b¸o danh, chuÈn bÞ s½n sµng ch­a?", 2, "§óng vËy!/#sure2joincd("..defencemap..")", "§Ó ta chuÈn bÞ ®·!/OnCancel")
end

function laughtoleave()
	Talk(1, "", CD_SIGNNPCNAME.."Ta ch¼ng sî bän du môc nµy! Ph¶i cho chóng biÕt tµi nghÖ cña nh©n sÜ Trung nguyªn")
end

function cd_awardforpayout()
	if (camp == 1) then
		Talk(1, "", format("%s: H·y nghe ®©y, mäi ng­êi h·y dèc hÕt toµn lùc cho cuéc chiÕn nµy.", CD_SIGNNPCNAME))
	else
		Talk(1, "", format("%s: Qu©n Nam Man vÉn ch­a nhôc chÝ, chóng quyÕt t©m giµnh l¹i chiÕn lîi phÈm mµ binh sü ta ph¶i bao phen ®æ m¸u míi cã ®­îc. C¸c dòng sü h·y quyÕt ®Êu trËn nµy!", CD_SIGNNPCNAME))
	end;
end;

function OnCancel()
end
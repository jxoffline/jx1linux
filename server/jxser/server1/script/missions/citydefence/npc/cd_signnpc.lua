----------------------------------------------------------------
--FileName:	cd_signnpc.lua
--Creater:	firefox
--Date:		2005-
--Comment:	ÖÜÄ©»î¶¯£ºÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³Ç
--			¹¦ÄÜ£º±¨Ãûµã±¨Ãû¹Ù
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\headinfo.lua")
CD_SIGNNPCNAME = "T­íng qu©n thñ thµnh"
function main()
	local signmap = SubWorldIdx2ID( SubWorld )
	if ( signmap == tbDEFENCE_SIGNMAP[1] ) then
		camp = 1
		cityname = "Phe Tèng"
	elseif ( signmap == tbDEFENCE_SIGNMAP[2] ) then
		camp = 2
		cityname = "Phe Kim"
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
	signmap = SubWorldIdx2ID( SubWorld )
	defencemap = signmap - 2
	defencesidx = SubWorldID2Idx( defencemap )
	
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
	SubWorld = oldSubWorld
	
	if ( memcount >= MAX_MEMBERCOUNT ) then
		Talk(2, "", CD_SIGNNPCNAME..": Ng­¬i lµ ai?", CD_SIGNNPCNAME..": µ! Ng­¬i muèn gióp ta chèng l¹i kÎ ®Þch? Ng­¬i qu¶ lµ yªu n­íc! Binh lùc qu©n ta rÊt ®Çy ®ñ, ng­¬i cã lßng lµ tèt, nh­ng xin ng­¬i h·y vÒ ®i!")
		Msg2Player("HiÖn nay sè ng­êi tham gia chiÕn tranh vÖ quèc liªn thµnh ®· ®Çy"..MAX_MEMBERCOUNT.."ng­êi, kh«ng thÓ vµo chiÕn tr­êng.")
		return
	end
	
	if ( GetTask( TASKID_FIRE_DAY ) == nday and GetTask( TASKID_FIRE_KEY ) ~= randkey ) then	--²»ÔÊÐí±¨Ãû
		Say(CD_SIGNNPCNAME..": Ho¹t ®éng chiÕn tranh vÖ quèc liªn thµnh 1 ngµy chØ cã thÓ tham gia 1 trËn, lÇn sau h·y quay l¹i!", 0)
	elseif ( nday ~= GetTask( TASKID_FIRE_DAY ) ) then	--ÔÊÐí±¨Ãû
		Say(CD_SIGNNPCNAME..": Lý NhÞ! Tªn tiÓu tö nhµ ng­¬i mau ®i kªu TÝn Sö l¹i ®©y, qu©n ®Þch l¹i ®¸nh ®Õn råi! ¥? Ng­¬i lµ ai? B©y giê lµ lóc nµo? Cã ng­êi ®ang tÊn c«ng thµnh cña ta, ng­¬i cßn kÐo dµi qu©n c¬ sÏ bÞ chÐm ®Çu biÕt kh«ng?", 2, "T­íng qu©n! Ta ®Õn gióp thñ thµnh!/want2joincd1", "…… (B¹n kh«ng nãi lêi g×, chØ c­êi nh¹t mét tiÕng råi ®i ) /laughtoleave")
	else
		Say(CD_SIGNNPCNAME..": ¥? Ch¼ng ph¶i ng­¬i ®· vµo chiÕn tr­êng sao? Hay lµ ta bi hoa m¾t? enter> Th«i ®­îc råi! Ng­¬i chÈun bÞ vµo trong ®ã ®i!", 2, "Ta muèn gia nhËp/sure2joincd", "Ta chØ ghÐ qua xem/OnCancel")
	end
end

function sure2joincd()
	local oldSubWorld = SubWorld;
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencemap = signmap - 2
	local defencesidx = SubWorldID2Idx( defencemap )
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": ChiÕn tr­êng phÝa tr­íc x¶y ra vÊn ®Ò, t¹m thêi kh«ng thÓ vµo.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end
	SubWorld = defencesidx
	local state = GetMissionV( MS_STATE )
	if ( state ~= 1 and state ~= 2 ) then
		SubWorld = oldSubWorld
		return
	end
	SetTask( TASKID_FIRE_DAY, tonumber(date("%m%d")) )
	SetTask( TASKID_FIRE_KEY, GetMissionV( MS_RANDKEY ) )
	JoinMission(MISSIONID, GetMissionV( MS_CITYCAMP ))
	SubWorld = oldSubWorld
end

function want2joincd1()
	Say(CD_SIGNNPCNAME..": µ! Ng­¬i muèn gióp chóng ta chèng l¹i kÎ ®Þch? ¸i chµ! MÊy tªn nµy kh«ng gièng binh sÜ tÇm th­êng, bän chóng vâ nghÖ cao c­êng, c­ìi ngùa rÊt tµi, l¹i cßn biÕt phãng ¸m khÝ.", 1, "T­íng qu©n! ¤ng kh«ng sao chø?/want2joincd2")
end

function want2joincd2()
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencemap = signmap - 2
	local defencesidx = SubWorldID2Idx( defencemap )
	oldSubWorld = SubWorld
	SubWorld = defencesidx
	local cd_membercount = GetMSPlayerCount(MISSIONID, 0)
	SubWorld = oldSubWorld
	Say(CD_SIGNNPCNAME..": §­îc råi! Kh«ng cÇn nãi nhiÒu, nãi chung ta c¶m thÊy lai lÞch cña bän hä rÊt kh¶ nghi, trong lóc chiÕn ®Êu nÕu ng­¬i nhÆt ®­îc th­ hµm th× h·y ®em ®Õn ta xem, ta sÏ träng th­ëng! Sè ng­êi tham gia thñ thµnh lµ<color=yellow>"..cd_membercount.."<color>ng­êi. B¹n ®· s½n sµng vµo chiÕn tr­êng ch­a?", 2, "§óng vËy!/sure2joincd", "§Ó ta chuÈn bÞ ®·!/OnCancel")
end

function laughtoleave()
	Talk(1, "", CD_SIGNNPCNAME..": (Sî ®Õn to¸t må h«i tr¸n")
end

function OnCancel()
end
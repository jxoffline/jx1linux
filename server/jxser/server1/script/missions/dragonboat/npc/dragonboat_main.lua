Include("\\script\\missions\\dragonboat\\include.lua")
Include("\\script\\missions\\dragonboat\\npc\\duanwu_convert.lua")
IncludeLib("RELAYLADDER")

DWGOLDENLASTDATE = tonumber(date("%d")) --ÉÏÒ»´ÎÓÃ¾ŞĞÍÁúÖÛ»»È¡»Æ½ğ×°±¸µÄÈÕÆÚ Ö»¼ÇÂ¼Ìì
DWGOLDENMAXCOUNT = 2	--¶ËÎçÓÃ¾ŞĞÍÁúÖÛ»»¶¨¹ú°²°î¡¢ÏÀ¹ÇÈáÇé£¬Ã¿ÌìÃ¿Ì¨·şÎñÆ÷¿ÉÒÔ»»È¡µÄÊıÁ¿£¬Ã¿Ì¨gameserverµÄÉÏÏŞ£¬¹²16¸ö
DWGOLDENNOWCOUNT = 0 --µ±Ç°ÓÃ¾ŞĞÍÁúÖÛ»»È¡»Æ½ğ×°±¸Êı

DWORELASTDATE = tonumber(date("%d")) --ÉÏÒ»´ÎÓÃÊŞĞÍÁúÖÛ»»È¡Ğş¾§¡¢ÉñÃØ¿óÊ¯µÄÈÕÆÚ Ö»¼ÇÂ¼Ìì
DWOREMAXCOUNT = 12	--¶ËÎçÓÃÊŞĞÍÁúÖÛ»»Ğş¾§¡¢ÉñÃØ¿óÊ¯£¬Ã¿ÌìÃ¿Ì¨·şÎñÆ÷¿ÉÒÔ»»È¡µÄÊıÁ¿£¬Ã¿Ì¨gameserverµÄÉÏÏŞ£¬¹²96¸ö
DWORENOWCOUNT = 0 --µ±Ç°ÓÃÊŞĞÍÁúÖÛ»»È¡Ğş¾§¡¢ÉñÃØ¿óÊ¯Êı

AWARD_BIRDBOAT = {
					{"Tiªn Th¶o Lé ",{6,1,71,1,0,0},30},
					{"Tö Thñy Tinh",{239},15},
					{"Lam Thñy Tinh",{238},15},		
					{"Lôc Thñy Tinh",{240},15},
					{"Tinh Hång B¶o Th¹ch",{353},15},	
					{"Thiªn s¬n  B¶o Lé ",{6,1,72,1,0,0},10},	
					}

AWARD_BEASTBOAT = {
					{"HuyÒn Tinh cÊp 5",{6,1,147,5,0,0},20},
					{"HuyÒn Tinh cÊp 6",{6,1,147,6,0,0},43},
					{"HuyÒn Tinh cÊp 7",{6,1,147,7,0,0},30},		
					{"HuyÒn Tinh cÊp 8",{6,1,147,8,0,0},3},
					{"ThÇn bİ kho¸ng th¹ch",{6,1,398,1,0,0},4},
					}

AWARD_HUGEBOAT = {
					{"§Şnh Quèc Thanh Sa Tr­êng Sam",{159},100},
					{"§Şnh Quèc ¤ Sa Ph¸t Qu¸n",{160},51},
					{"§Şnh Quèc Xİch Quyªn NhuyÔn Ngoa",{161},70},	
					{"§Şnh Quèc Tö §»ng Hé uyÓn",{162},70},
					{"§Şnh Quèc Ng©n Tµm Yªu ®¸i",{163},70},
					{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",{164},51},
					{"An Bang Cóc Hoa Th¹ch ChØ hoµn",{165},51},
					{"An Bang §iÒn Hoµng Th¹ch Ngäc Béi",{166},51},
					{"An Bang Kª HuyÕt Th¹ch Giíi ChØ ",{167},51},
					{"HiÖp Cèt ThiÕt HuyÕt Sam",{186},70},
					{"HiÖp Cèt §a T×nh Hoµn",{187},70},
					{"HiÖp Cèt §an T©m Giíi",{188},70},
					{"HiÖp Cèt T×nh ı KÕt",{189},20},
					{"Nhu T×nh C©n Quèc Nghª Th­êng",{190},14},
					{"Nhu T×nh Thôc N÷ H¹ng Liªn",{191},60},
					{"Nhu T×nh  Phông Nghi Giíi ChØ ",{192},80},
					{"Nhu T×nh  TuÖ T©m Ngäc Béi",{193},51},
					}
																									
function dragonboat_main()
	Say(" Ho¹t ®éng TÕt §oan Ngä ®· kÕt thóc nh­ng mäi ng­êi vÉn cã thÓ dïng nh÷ng vËt liÖu cßn l¹i ®Ó ghĞp thuyÒn rång vµ ®æi lÊy phÇn th­ëng. Ng­êi ch¬i trong 10 tªn ®øng ®Çu cña b¶ng xÕp h¹ng ®ua ThuyÒn rång cao vµ s¬ cÊp nhanh ch©n ®Õn chç ta ®æi Trang bŞ Hoµng Kim.", 5,"T¹o thuyÒn rång/duanwu_convert","Dïng thuyÒn rång ®æi phÇn th­ëng/dragon_award","10 tªn ®øng ®Çu b¶ng xÕp h¹ng ®ua thuyÒn rång nhËn Trang bŞ Hoµng Kim./dragon_golden","Ho¹t ®éng cã liªn quan/aboutboat", "Kh«ng cÇn/OnCancel");
end

function want_playboat()
	OldSubWorld = SubWorld
	OldPlayer = PlayerIndex
	local totalboat = 0
	local freeboat = 0
	local startboat = 0
	local blevel = 0
	if (IsCaptain() ~= 1) then
		Say(" Xin lçi! CÇn ®éi tr­ëng b¸o danh tham gia ho¹t ®éng ®ua thuyÒn rång míi ®­îc.",0)
		return
	end
	if (GetTeamSize() < 4) then
		Say(" Xin lçi! §éi thi ®Êu tham gia ho¹t ®éng ®ua thuyÒn rång cÇn İt nhÊt <color=red>4<color> ng­êi. HiÖn ®éi cña b¹n kh«ng ®ñ ng­êi! H·y ®i t×m thªm b»ng h÷u nhĞ!",0)
		return
	end
	if (GetLevel() >= 90) then
		blevel = 1
	end
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" Xin lçi! Trong ®éi cña b¹n cã ®éi viªn cã ®¼ng cÊp <color=red>v­ît qu¸ cÊp 90<color>, kh«ng thÓ tham gia thi ®Êu! KiÓm tra l¹i råi ®Õn b¸o danh tham gia! ",0)
				return
			else
				Say(" Xin lçi! Trong ®éi cña b¹n cã ®éi viªn cã ®¼ng cÊp <color=red>ch­a ®Õn cÊp 90<color>, kh«ng thÓ tham gia thi ®Êu! KiÓm tra l¹i råi ®Õn b¸o danh tham gia! ",0)
				return
			end
		end
	end
	
	PlayerIndex = OldPlayer
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			print("have "..map_map[i])
			totalboat = totalboat + 1
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if (state > 0) then
				startboat = 1
			end
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and map_isadvanced[map_map[i]] == blevel) then
				freeboat = freeboat + 1
			end
		end
	end
	print("total"..totalboat.."free"..freeboat)
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "®ua thuyÒn rång s¬ cÊp"
	else
		strlevel = "thuyÒn rång cao cÊp"
	end
	
	if (startboat == 1) then
		if (freeboat == 0) then
			Say(" Khu vùc nµy ®ang trong"..strlevel.."®· b¾t ®Çu. Kh«ng cßn chç n÷a….",0)
			return
		else
			Say(" Khu vùc nµy ®ang trong"..strlevel.."giai ®o¹n b¸o danh ®ua thuyÒn rång, vÉn cßn <color=red>"..freeboat.."<color>thuyÒn rång cßn trèng. Tham gia thi ®Êu cÇn nép <color=red>5 v¹n<color>l­îng, b¹n cã muèn tham gia?",2, "Ph¶i! Ta muèn dÉn d¾t ®éi cña ta tham gia./dragon_join", "Kh«ng cÇn/OnCancel")
			return
		end
	else
		Say(" Xin lçi! Khu vùc nµy"..strlevel.."hiÖn ch­a më ho¹t ®éng ®ua thuyÒn rång nµo ®Ó tham gia. B¸o danh <color=red>®óng mçi giê<color> b¾t ®Çu. Thêi gian b¸o danh lµ 5 phót. Xin chó ı th«ng b¸o cña hÖ thèng!",0)
		return
	end
	
end

function dragon_join()
	local blevel = 0
	if (GetLevel() >= 90) then
		blevel = 1
	end
	if (IsCaptain() ~= 1) then
		Say(" Xin lçi! CÇn ®éi tr­ëng b¸o danh tham gia ho¹t ®éng ®ua thuyÒn rång míi ®­îc.",0)
		return
	end
	if (GetTeamSize() < 1) then
		Say(" Xin lçi! §éi thi ®Êu tham gia ho¹t ®éng ®ua thuyÒn rång cÇn İt nhÊt <color=red>4<color> ng­êi. HiÖn ®éi cña b¹n kh«ng ®ñ ng­êi! H·y ®i t×m thªm b»ng h÷u nhĞ!",0)
		return
	end
	local bhaveboat = 0
	local boatstr = "ThuyÒn Rång nhá "
	if (blevel > 0) then
		boatstr = "ThuyÒn Rång truyÒn thèng"
	end
	
	if (blevel == 0) then
		bhaveboat = CalcEquiproomItemCount( 6, 1, 422, 1 )
	else
		bhaveboat = CalcEquiproomItemCount( 6, 1, 423, 1 )
	end
	
	if (GetCash() < 50000 or bhaveboat == 0 and blevel == 0) then
		Say(" Xin lçi! Tham gia thi ®Êu thuyÒn rång cÇn nép<color=red> 5 v¹n l­îng vµ "..boatstr.."<color>míi ®­îc, tiÒn cña b¹n kh«ng ®ñ hoÆc kh«ng mang theo thuyÒn rång nhá!ChuÈn bŞ ®ñ råi h·y ®Õn!.", 0)
		return
	end
	if (GetCash() < 50000 or bhaveboat == 0 and blevel == 1) then
		Say(" Xin lçi! Tham gia thi ®Êu thuyÒn rång cÇn nép<color=red> 5 v¹n l­îng vµ "..boatstr.."<color=red>míi ®­îc, tiÒn cña b¹n kh«ng ®ñ hoÆc kh«ng mang theo thuyÒn rång truyÒn thèng! ChuÈn bŞ ®ñ råi h·y ®Õn!", 0)
		return
	end
	
	local OldPlayer = PlayerIndex
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" Xin lçi! Trong ®éi cña b¹n cã ®éi viªn cã ®¼ng cÊp <color=red>v­ît qu¸ cÊp 90<color>, kh«ng thÓ tham gia thi ®Êu! KiÓm tra lai råi ®Õn b¸o danh tham gia! ",0)
				return
			else
				Say(" Xin lçi! Trong ®éi cña b¹n cã ®éi viªn cã ®¼ng cÊp <color=red>ch­a ®Õn cÊp 90<color>, kh«ng thÓ tham gia thi ®Êu! KiÓm tra l¹i råi ®Õn b¸o danh tham gia! ",0)
				return
			end
		end
	end
	
	PlayerIndex = OldPlayer
	
	OldSubWorld = SubWorld
	
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and blevel == map_isadvanced[map_map[i]] ) then
				local tabplayer = {}
				for i = 1, GetTeamSize() do 
					tabplayer[i] = GetTeamMember(i)
					print("plal"..tabplayer[i])
				end
				PlayerIndex = tabplayer[1]
				w,x,y = GetWorldPos()
				SetMissionV(VARV_SIGNUP_WORLD, w)
				SetMissionV(VARV_SIGNUP_POSX, x)
				SetMissionV(VARV_SIGNUP_POSY, y)
				SetMissionS(VARS_TEAM_NAME,GetName())
				
				-- DEBUG
				print(format("%s tõ (%d, %d, %d) vŞ trİ vµo thuyÒn rång", GetName(), w, x, y));

				Pay(50000)
				if (blevel == 0) then
					ConsumeEquiproomItem( 1, 6, 1, 422, 1)
				else
					ConsumeEquiproomItem( 1, 6, 1, 423, 1)
				end

				for i = 1 , getn(tabplayer) do 
					PlayerIndex = tabplayer[i]
					print("player"..PlayerIndex)
					JoinMission(MISSION_MATCH, 1)
				end
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "®ua thuyÒn rång s¬ cÊp"
	else
		strlevel = "thuyÒn rång cao cÊp"
	end
	Say("Xin lçi! HiÖn t¹i<color=red>"..strlevel.."<color> ®· kh«ng cßn chç. Xin ®îi vßng sau!",0)
end

function dragon_award()
	Say(" Cuéc ®ua thuyÒn rång ®ang s«i næi. L·o phu ®ang thu nhËn thuyÒn rång. B¹n muèn dïng lo¹i thuyÒn nµo ®Ó ®æi phÇn th­ëng?",7,"ThuyÒn rång nhá ®æi B¸nh ch­ng nh©n ®Ëu/dousha","ThuyÒn rång truyÒn thèng ®æi B¸nh ch­ng nh©n nÊm/xianggu","M· ®Çu thuyÒn rång ®æi B¸nh ch­ng nh©n trøng/danhuang"," ThuyÒn rång ®Çu phông ngÉu nhiªn ®æi lÊy Tiªn Th¶o lé, Thñy Tinh, B¶o Th¹ch, Thiªn S¬n B¶o Lé /birdboat_award","ThuyÒn rång h×nh thó ngÉu nhiªn ®æi lÊy Kho¸ng th¹ch thÇn bİ, 5-HuyÕn Tinh kho¸ng th¹ch cÊp 8/beastboat_award","ThuyÒn rång lo¹i lín ngÉu nhiªn ®æi lÊy §Şnh Quèc An Bang, 1 bé trang bŞ hoµng kim HiÖp Cèt Nhu T×nh/hugeboat_award","Kh«ng cÇn!/OnCancel");
end

function dragon_golden()
	--Say("Àñ¹Ù£ºÁúÖÛ´óÈüÕıÔÚÈç»ğÈçİ±µÄ½øĞĞÖĞ£¬ÒªµÈµ½<color=red>»î¶¯½áÊø<color>ºó²ÅÄÜÀ´Áì½±Å¶¡£",0);
	Say(" B¹n muèn nhËn phÇn th­ëng thi ®Êu nµo?", 3, "§ua thuyÒn rång s¬ cÊp/dragon_golden_low","§ua thuyÒn rång cao cÊp/dragon_golden_high","Kh«ng cÇn!/OnCancel");
end

function dragon_golden_low()
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(10141, i);
		if( GetName() ==  RoleName) then
			if(GetTask(1507) ~= 0) then
				Say(" B¹n ®· l·nh phÇn th­ëng 10 tªn ®øng ®Çu trong b¶ng xÕp h¹ng thuyÒn rång s¬ cÊp!",0);
				return 0
			end			
			if(CalcFreeItemCellCount() < 6) then
				Say(" Chç trèng hµnh trang cña b¹n kh«ng ®ñ. S¾p xÕp l¹i råi h·y ®æi nhĞ!",0);
				return 0
			end
			dragon_givegolden();
			SetTask(1507,1);
			return 1
		end
	end
	Say(" B¹n kh«ng n»m trong 10 tªn ®øng ®Çu b¶ng xÕp h¹ng ®ua thuyÒn rång s¬ cÊp, kh«ng thÓ l·nh th­ëng.",0);
end

function dragon_golden_high()
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(10142, i);
		if( GetName() ==  RoleName) then
			if(GetTask(1508) ~= 0) then
				Say(" B¹n ®· l·nh phÇn th­ëng 10 tªn ®øng ®Çu trong b¶ng xÕp h¹ng thuyÒn rång cao cÊp!",0);
				return 0
			end			
			if(CalcFreeItemCellCount() < 6) then
				Say(" Chç trèng hµnh trang cña b¹n kh«ng ®ñ. S¾p xÕp l¹i råi h·y ®æi nhĞ!",0);
				return 0
			end
			dragon_givegolden();
			SetTask(1508,1);
			return 1
		end
	end
	Say(" B¹n kh«ng n»m trong 10 tªn ®øng ®Çu b¶ng xÕp h¹ng ®ua thuyÒn rång cao cÊp, kh«ng thÓ l·nh th­ëng.",0);
end

function aboutboat()
	Say(" B¹n muèn t×m hiÓu môc nµo?", 5,"C«ng thøc ghĞp thuyÒn rång/aboutmaking","LŞch sö ®ua thuyÒn rång/abouthistory","Liªn quan b¸o danh/aboutjoin","H¹ng môc chó ı /aboutnotice","Ta ®· biÕt råi!/OnCancel");
end

function aboutmaking()
	local a = "ThuyÒn rång nhá = 1 ®Çu rång + 1 ®u«i rång + 1 th©n rång + 1s­ên rång + 4 m¸i chÌo + 1 b¸nh l¸i + 1 trèng";
	local b = "<enter>ThuyÒn rång truyÒn thèng = 1 ThuyÒn rång nhá + 4 m¸i chÌo";
	local c = "<enter>M· ®Çu thuyÒn rång = 1 ThuyÒn rång nhá + 1 ThuyÒn rång truyÒn thèng + 1 ®Çu rång";
	local d = " ThuyÒn rång ®Çu phông = 1 ThuyÒn rång ®Çu ngùa + 1 ThuyÒn rång truyÒn thèng + 1 ®Çu rång";
	local e = "<enter>ThuyÒn rång h×nh thó = 1 ThuyÒn rång ®Çu phông + 1 ThuyÒn rång ®Çu ngùa + 1 ®Çu rång";
	local f = "<enter>ThuyÒn rång lo¹i lín = 1 ThuyÒn rång h×nh thó + 1 ThuyÒn rång ®Çu phông + 1 ThuyÒn rång ®Çu ngùa";
	Talk(2,"",a..b..c,d..e..f);
end

function abouthistory()
	Talk(1,"","TruyÒn thuyÕt nãi r»ng sau khi KhuÊt Nguyªn trÇm m×nh trªn s«ng MŞch La. Ng­êi bµ con th©n thuéc ë quª nhµ «ng n»m méng thÊy KhuÊt Nguyªn th©n h×nh tiÒu tôy bÌn dïng l¸ tróc gãi c¬m thµnh nh÷ng chiÕc b¸nh cã gãc (B¸nh ch­ng) , chÊt lªn thuyÒn rång råi ®Èy ra dßng s«ng ®Ó c¸c loµi thñy téc do Long Vuong cai qu¶n d­íi n­íc nh×n thÊy rång sÏ cho lµ ®å cña Long V­¬ng ®­a tíi sÏ kh«ng d¸m ¨n nªn cã thÓ cóng tÕ cho KhuÊt Nguyªn dïng. §©y chİnh lµ nguyªn do cã cuéc ®ua thuyÒn rång vµ tôc ¨n B¸nh ch­ng.");
end

function aboutjoin()
	Talk(2,"","Ng­êi ch¬i gi÷ <color=red>ThuyÒn rång nhá vµ ThuyÒn rång truyÒn thèng<color> lµm <color=red>®éi tr­ëng<color>, dÉn theo c¸c ®éi viªn ®Õn <color=red>LÔ quan<color> b¸o danh tham gia ®ua thuyÒn rång s¬ vµ cao cÊp, mçi giê tæ chøc 1 lÇn, <color=red>®óng giê <color> ®­a ra th«ng b¸o b¾t ®Çu tiÕp nhËn b¸o danh. Thêi gian b¸o danh lµ 5phót.","Thi ®Êu s¬ cÊp cho phĞp nhiÒu nhÊt <color=red>8<color> ®éi cïng tham gia ®èi øng víi 8 tÊm b¶n ®å thuyÒn rång;Thi ®Êu cao cÊp cho phĞp nhiÒu nhÊt <color=red>16<color> ®éi cïng tham gia ®èi øng víi 16 tÊm b¶n ®å thuyÒn rång. NÕu sè tªn b¸o danh LÔ quan ë thµnh thŞ nµo ®ã ®· ®Çy. Mêi ng­êi ch¬i ®Õn LÔ quan c¸c thµnh thŞ kh¸c b¸o danh.");
end

function aboutnotice()
	Talk(3,"","Sau khi b¸o danh thµnh c«ng, tÊt c¶ c¸c ®éi ®­îc chuyÓn ®Õn b¶n ®å thuyÒn rång. Trong lóc ®îi thêi gian thi ®Êu b¾t ®Çu, ng­êi ch¬i bŞ <color=red>rít m¹ng hoÆc bŞ h¹ gôc<color> th× ®­îc ph¸n ®Şnh mÊt ®i t­ c¸ch thi ®Êu. NÕu ®éi tr­ëng bŞ rít m¹ng hoÆc bŞ h¹ gôc, c¸c thµnh viªn cßn l¹i vÉn cã thÓ tiÕp tôc thi ®Êu vµ nhËn ®­îc phÇn th­ëng cña vßng ®Êu, nh­ng thµnh tİch kh«ng ®­îc ghi lªn b¶ng xÕp h¹ng.","Sau khi <color=red>2 tuÇn<color> ho¹t ®éng ®ua thuyÒn rång kÕt thóc, ®éi tr­ëng<color=red> 10 ®éi ®øng ®Çu b¶ng xÕp h¹ng cuéc ®ua thuyÒn rång s¬ vµ cao cÊp<color> cã thÓ ®Õn LÔ quan l·nh §Şnh Quèc An Bang, 1 bé trang bŞ hoµng kim ngÉu nhiªn HiÖp Cèt Nhu T×nh.","§Ó biÕt th«ng tin chi tiÕt xin xem trang chñ: www.volam.com.vn");
end

function dousha()
	Say(" ¡n B¸nh ch­ng nh©n ®Ëu ngÉu nhiªn nhËn ®­îc <color=red>1 v¹n, 2 v¹n, 5 v¹n ®iÓm kinh nghiÖm<color> hoÆc tham gia <color=red>®ua thuyÒn rång s¬ cÊp<color>, cã thËt b¹n muèn ®æi kh«ng?",2,"ta muèn ®æi/dousha_yes","Kh«ng cÇn!/OnCancel");
end

function dousha_yes()
	if(CalcEquiproomItemCount(6,1,422,1) <= 0) then
		Say(" B¹n kh«ng cã thuyÒn rång nhá, kh«ng thÓ ®æi phÇn th­ëng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" Chç trèng hµnh trang cña b¹n kh«ng ®ñ. S¾p xÕp l¹i råi h·y ®æi nhĞ!",0);
		return
	end
	DelCommonItem(6,1,422);
	AddItem(6,1,435,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]:l·nh 1 c¸i B¸nh ch­ng nh©n ®Ëu");
	Say(" B¹n nhËn ®­îc B¸nh ch­ng nh©n ®Ëu.",0);
end

function xianggu()
	Say(" ¡n B¸nh ch­ng nh©n nÊm ngÉu nhiªn nhËn ®­îc <color=red>5 v¹n, 10 v¹n, 25 v¹n ®iÓm kinh nghiÖm<color>hoÆc tham gia<color=red>thuyÒn rång cao cÊp<color>, cã thËt b¹n muèn ®æi kh«ng?",2,"ta muèn ®æi/xianggu_yes","Kh«ng cÇn!/OnCancel");
end

function xianggu_yes()
	if(CalcEquiproomItemCount(6,1,423,1) <= 0) then
		Say(" B¹n kh«ng cã <color=red>ThuyÒn rång truyÒn thèng<color>, kh«ng thÓ ®æi phÇn th­ëng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" Chç trèng hµnh trang cña b¹n kh«ng ®ñ. S¾p xÕp l¹i råi h·y ®æi nhĞ!",0);
		return
	end
	DelCommonItem(6,1,423);
	AddItem(6,1,436,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: l·nh 1 c¸i B¸nh ch­ng nh©n nÊm");	
	Say(" B¹n nhËn ®­îc 1 c¸i B¸nh ch­ng nh©n nÊm.",0);
end

function danhuang()
	Say(" ¡n B¸nh ch­ng nh©n trøng ngÉu nhiÖn nhËn ®­îc <color=red>15 v¹n, 30 v¹n, 75 v¹n ®iÓm kinh nghiÖm<color>, b¹n thËt sù muèn ®æi?",2,"ta muèn ®æi/danhuang_yes","Kh«ng cÇn!/OnCancel");
end

function danhuang_yes()
	if(CalcEquiproomItemCount(6,1,424,1) <= 0) then
		Say(" B¹n kh«ng cã <color=red>M· ®Çu thuyÒn rång<color>, kh«ng thÓ ®æi phÇn th­ëng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" Chç trèng hµnh trang cña b¹n kh«ng ®ñ. S¾p xÕp l¹i råi h·y ®æi nhĞ!",0);
		return
	end
	DelCommonItem(6,1,424);
	AddItem(6,1,437,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]:l·nh 1 c¸i B¸nh ch­ng nh©n trøng");		
	Say(" B¹n nhËn ®­îc1 c¸i B¸nh ch­ng nh©n trøng.",0);
end

function birdboat_award()
	local awardpro = {}
	if(CalcEquiproomItemCount(6,1,425,1) <= 0) then
		Say(" B¹n kh«ng cã <color=red>ThuyÒn rång ®Çu phông<color>, kh«ng thÓ ®æi phÇn th­ëng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" Chç trèng hµnh trang cña b¹n kh«ng ®ñ. S¾p xÕp l¹i råi h·y ®æi nhĞ!",0);
		return
	end
	for i = 1, getn(AWARD_BIRDBOAT) do
		awardpro[i] = AWARD_BIRDBOAT[i][3];
	end
	numth = randomaward(awardpro);
	if( getn(AWARD_BIRDBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_BIRDBOAT[numth][2][1],AWARD_BIRDBOAT[numth][2][2],AWARD_BIRDBOAT[numth][2][3],AWARD_BIRDBOAT[numth][2][4],AWARD_BIRDBOAT[numth][2][6],AWARD_BIRDBOAT[numth][2][6]);
	else
		AddEventItem(AWARD_BIRDBOAT[numth][2][1])
	end
	DelCommonItem(6,1,425);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: l·nh 1 c¸i"..AWARD_BIRDBOAT[numth][1]);		
	Say(" B¹n nhËn ®­îc 1 c¸i"..AWARD_BIRDBOAT[numth][1]..".",0);
end

function beastboat_award()
	local awardpro = {};
	if(CalcEquiproomItemCount(6,1,426,1) <= 0) then
		Say(" B¹n kh«ng cã <color=red>ThuyÒn rång h×nh thó<color>, kh«ng thÓ ®æi phÇn th­ëng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" Chç trèng hµnh trang cña b¹n kh«ng ®ñ. S¾p xÕp l¹i råi h·y ®æi nhĞ!",0);
		return
	end
	
	local nNowDate = tonumber(date("%d"));	
	if ( nNowDate == DWORELASTDATE ) then	--Èç¹ûÉÏ´ÎÓÃÊŞĞÎÁúÖÛ»»È¡Ğş¾§¡¢ÉñÃØ¿óÊ¯ÊÇµ±ÌìµÄ»°
		if ( DWORENOWCOUNT >= DWOREMAXCOUNT ) then	--´ïµ½ÓÃÊŞĞÎÁúÖÛ»»È¡Ğş¾§¡¢ÉñÃØ¿óÊ¯×î´óÊı²»ÄÜÔÙ»»
			print(" H«m nay dïng thuyÒn rång h×nh thó ®æi huyÒn tinh vµ kho¸ng th¹ch thÇn bİ ®· v­ît møc.")
			Say(" H«m nay dïng thuyÒn rång h×nh thó ®æi huyÒn tinh vµ kho¸ng th¹ch thÇn bİ qu¸ nhiÒu.L·o phu kh«ng cßn hµng n÷a. H·y thö ®i c¸c thµnh thŞ kh¸c hoÆc ngµy mai h·y ®Õn!",0);
			return
		end
	else	--Èç¹ûÓÃÊŞĞÎÁúÖÛ»»È¡Ğş¾§¡¢ÉñÃØ¿óÊ¯ÊıÈÕÆÚÓëµ±Ç°²»ÊÇÍ¬Ò»Ìì
		DWORELASTDATE = nNowDate;	--¸üĞÂ×î½üµÄÈÕÆÚ
		DWORENOWCOUNT = 0;	--µ±Ç°ÓÃÊŞĞÎÁúÖÛ»»È¡Ğş¾§¡¢ÉñÃØ¿óÊ¯ÊıÖÃ0
	end
	
	for i = 1, getn(AWARD_BEASTBOAT) do
		awardpro[i] = AWARD_BEASTBOAT[i][3];
	end
	numth = randomaward(awardpro);
	if( getn(AWARD_BEASTBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_BEASTBOAT[numth][2][1],AWARD_BEASTBOAT[numth][2][2],AWARD_BEASTBOAT[numth][2][3],AWARD_BEASTBOAT[numth][2][4],AWARD_BEASTBOAT[numth][2][6],AWARD_BEASTBOAT[numth][2][6]);
	else
		AddEventItem(AWARD_BEASTBOAT[numth][2][1])
	end
	DWORENOWCOUNT = DWORENOWCOUNT + 1;
	DelCommonItem(6,1,426);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: l·nh 1 c¸i"..AWARD_BEASTBOAT[numth][1]);		
	Say(" B¹n nhËn ®­îc 1 c¸i"..AWARD_BEASTBOAT[numth][1]..".",0);	
end

function hugeboat_award()
	local awardpro = {};
	if(CalcEquiproomItemCount(6,1,427,1) <= 0) then
		Say(" B¹n kh«ng cã <color=red>ThuyÒn rång lo¹i lín<color>, kh«ng thÓ ®æi phÇn th­ëng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 6) then
		Say(" Chç trèng hµnh trang cña b¹n kh«ng ®ñ. S¾p xÕp l¹i råi h·y ®æi nhĞ!",0);
		return
	end
	
	local nNowDate = tonumber(date("%d"));	
	if ( nNowDate == DWGOLDENLASTDATE ) then	--Èç¹ûÉÏ´ÎÓÃ¾ŞĞÍÁúÖÛ»»È¡»Æ½ğ×°±¸ÊÇµ±ÌìµÄ»°
		if ( DWGOLDENNOWCOUNT >= DWGOLDENMAXCOUNT ) then	--´ïµ½ÓÃ¾ŞĞÍÁúÖÛ»»È¡»Æ½ğ×°±¸×î´óÊı²»ÄÜÔÙ»»
			print(" H«m nay dïng thuyÒn rång lo¹i lín ®æi Trang bŞ hoµng kim ®· ®¹t møc.")
			Say(" H«m nay dïng thuyÒn rång lo¹i lín ®æi Trang bŞ hoµng kim ®· qu¸ nhiÒu. L·o phu kh«ng cßn hµng n÷a. H·y ®i thµnh thŞ kh¸c thö xem, hoÆc ngµy mai h·y ®Õn!",0);
			return
		end
	else	--Èç¹ûÓÃ¾ŞĞÍÁúÖÛ»»È¡»Æ½ğ×°±¸ÈÕÆÚÓëµ±Ç°²»ÊÇÍ¬Ò»Ìì
		DWGOLDENLASTDATE = nNowDate;	--¸üĞÂ×î½üµÄÈÕÆÚ
		DWGOLDENNOWCOUNT = 0;	--µ±Ç°ÓÃ¾ŞĞÍÁúÖÛ»»È¡»Æ½ğ×°±¸ÊıÖÃ0
	end
	
	for i = 1, getn(AWARD_HUGEBOAT) do
		awardpro[i] = AWARD_HUGEBOAT[i][3];
	end	
	numth = randomaward(awardpro);
	if( getn(AWARD_HUGEBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_HUGEBOAT[numth][2][1],AWARD_HUGEBOAT[numth][2][2],AWARD_HUGEBOAT[numth][2][3],AWARD_HUGEBOAT[numth][2][4],AWARD_HUGEBOAT[numth][2][6],AWARD_HUGEBOAT[numth][2][6]);
	else
		AddGoldItem(0,AWARD_HUGEBOAT[numth][2][1])
	end
	DWGOLDENNOWCOUNT = DWGOLDENNOWCOUNT + 1;
	DelCommonItem(6,1,427);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: l·nh 1 c¸i"..AWARD_HUGEBOAT[numth][1]);		
	Say(" B¹n nhËn ®­îc 1 c¸i"..AWARD_HUGEBOAT[numth][1]..".",0);	
end

function randomaward(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	local nCompareSum = 0;
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = random(1,nSum);
	for i = 1,nArgCount do
		nCompareSum = nCompareSum + aryProbability[i]
		if( nRandNum <= nCompareSum) then
			return i;
		end
	end
end

function dragon_givegolden()
	local awardpro = {};
	for i = 1, getn(AWARD_HUGEBOAT) do
		awardpro[i] = AWARD_HUGEBOAT[i][3];
	end	
	numth = randomaward(awardpro);
	AddGoldItem(0,AWARD_HUGEBOAT[numth][2][1])
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 10 tªn ®øng ®Çu trong b¶ng xÕp h¹ng thuyÒn rång nhËn ®­îc 1 c¸i"..AWARD_HUGEBOAT[numth][1]);		
	Say(" B¹n nhËn ®­îc 1 c¸i"..AWARD_HUGEBOAT[numth][1]..".",0);	
end	
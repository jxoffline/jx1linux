IL("TITLE");
IncludeLib("ITEM");
IncludeLib("TIMER");
IncludeLib("FILESYS");
IncludeLib("SETTING");
IncludeLib("TASKSYS")
IncludeLib("PARTNER");
IncludeLib("BATTLE");
IncludeLib("RELAYLADDER")
IncludeLib("TONG")
IncludeLib("LEAGUE")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\npcdailog.lua");

TITLEDIALOG = "Tªn nh©n vËt: <color=green>%s<color>\n".."Tªn tµi kho¶n: <color=green>%s<color>\n".."Täa ®é: <color=green>%d, %d/%d<color>"

function main()
	dofile("script/global/eurofun/item/lenhbaitestserver.lua")
		local strFaction = GetFaction()
		local nW,nX,nY = GetWorldPos();
		local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY)};
			tinsert(tbSay, "NhËn Point/CacLoaiDiem");
			tinsert(tbSay, "Céng §iÓm Nhanh/add_prop");
			tinsert(tbSay, "Boss/bosshk1");
			tinsert(tbSay, "Hæ trî lµm nhiÖm vô Hoµng Kim/helpgoldquest");
			tinsert(tbSay, "Hæ trî lµm nhiÖm vô M«n Ph¸i/help_quest");
			tinsert(tbSay, "Thay §æi Tr¹ng Th¸i/trangthai");
			tinsert(tbSay, "Söa lçi ThÇn Hµnh Phï/fixthanhanhphu");
			tinsert(tbSay, "KÕt thóc ®èi tho¹i./no")
		CreateTaskSay(tbSay)
	return 1;
end
--------------------------------------------------------------
--			 		Söa ThÇn Hµnh Phï						--
--------------------------------------------------------------
function fixthanhanhphu()
	DisabledUseTownP(0)
	Msg2Player("Tr¹ng th¸i sö dông thæ ®Þa phï vµ thÇn hµnh phï cña Quý nh©n sÜ ®· trë vÒ ban ®Çu!<enter> Nh÷ng Map chØ ®Þnh kh«ng sö dông thÇn hµnh phï kh«ng thÓ sö dông tÝnh n¨ng nµy")
end
--------------------------------------------------------------
--			 		Thay §æi Tr¹ng Th¸i						--
--------------------------------------------------------------
function trangthai()
local szTitle = "Xin chµo <color=red>"..GetName().."<color>"
local tbOpt =
	{
		{"LuyÖn C«ng",luyencong},
		{"ChÝnh Ph¸i",chinhphai},
		{"Trung LËp",trunglap},
		{"Tµ Ph¸i",taphai},
		{"S¸t Thñ",satthu},
		{"Trë L¹i",main},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function luyencong()
SetCurCamp(0)
SetCamp(0)
end
function chinhphai()
SetCurCamp(1)
SetCamp(1)
end
function trunglap()
SetCurCamp(3)
SetCamp(3)
end
function taphai()
SetCurCamp(2)
SetCamp(2)
end
function satthu()
SetCurCamp(4)
SetCamp(4)
end
--------------------------------------------------------------
--			 		Hæ Trî Lµm nv m«n ph¸i					--
--------------------------------------------------------------
tb_HelpQuest = {
	[0] = {--Thieu lam OK
		[1] = {
			[1] = {"SÏ ®­îc phong lµ: Hé ViÖn Vâ T¨ng. Häc ®­îc vâ c«ng: ThiÕu L©m §ao Ph¸p, C«n ph¸p, QuyÒn ph¸p. N¬i tiÕp nhËn nhiÖm vô: Tõ Nh©n Ph­¬ng Tr­îng.<enter><color=red>B­íc 1<color>: §Õn Ph­¬ng Tr­îng ThiÒn phßng (230/184), gÆp Tõ Nh©n Ph­¬ng Tr­îng, tiÕp nhËn nhiÖm vô.<enter><color=red>B­íc 2<color>: Vµo trong §¹t Ma §­êng (210/188), phÝa sau pho t­îng trong §¹t Ma §­êng cã 1 con hÎm nhá, vµo trong ®ã ®¸nh b¹i nh÷ng tªn C¬ Quan Nh©n (192/197), (203/200), (216/201) ®Õn khi lÊy ®­îc Kim Liªn Hoa.<enter><color=red>B­íc 3<color>: Mang Kim Liªn Hoa vÒ giao cho Tõ Nh©n Ph­¬ng Tr­îng , hoµn thµnh nhiÖm vô"},
			[2] = {"GÆp Tõ Nh©n Ph­¬ng Tr­îng","§Õn Ph­¬ng Tr­îng ThiÒn phßng (230/184), gÆp Tõ Nh©n Ph­¬ng Tr­îng, tiÕp nhËn nhiÖm vô",0,1,109,1598,3178},
			[3] = {"§¸nh b¹i nh÷ng tªn C¬ Quan Nh©n","Vµo trong §¹t Ma §­êng, phÝa sau pho t­îng trong §¹t Ma §­êng cã 1 con hÎm nhá, vµo trong ®ã ®¸nh b¹i nh÷ng tªn C¬ Quan Nh©n ®Õn khi lÊy ®­îc Kim Liªn Hoa.",1,1,111,1544,3162},
			[4] = {"GÆp Tõ Nh©n Ph­¬ng Tr­îng","Mang Kim Liªn Hoa vÒ giao cho Tõ Nh©n Ph­¬ng Tr­îng , hoµn thµnh nhiÖm vô",0,1,109,1598,3178},
		},
		[2] = {
			[1] = {"SÏ ®­îc phong lµ: Hé Tù Kim Cang. Häc ®­îc vâ c«ng: BÊt §éng Minh V­¬ng. N¬i tiÕp nhËn nhiÖm vô: HuyÒn Bi..<enter><color=red>B­íc 1<color>: §Õn §¹t Ma §­êng (210/188), t×m gÆp HuyÒn Bi, tiÕp nhËn nhiÖm vô.<enter><color=red>B­íc 2<color>: §Õn BiÖn Kinh Phñ -> T©y Phôc Ng­u S¬n t×m n¨m tªn Man Di (280/185), (269/184), (264/185), (262/183), (277/187). Sau khi ®¸nh ®ñ 5 con ë 5 ®Þa chØ trªn sÏ cã dßng ch÷ hiÖn lªn: <color=yellow>B¹n ®· d¹y dç ®­îc 5 tªn Man Di, chóng høa tõ nay sÏ kh«ng quËy ph¸ n÷a...<color>.<enter><color=red>B­íc 3<color>: Trë l¹i §¹t Ma §­êng gÆp HuyÒn Bi phôc mÖnh, hoµn thµnh nhiÖm vô"},
			[2] = {"GÆp HuyÒn Bi","§Õn §¹t Ma §­êng (210/188), t×m gÆp HuyÒn Bi, tiÕp nhËn nhiÖm vô.",0,1,105,1599,3191},
			[3] = {"§¸nh b¹i Man Di thø nhÊt ë Phôc Ng­u S¬n T©y","§¸nh b¹i Man Di thø nhÊt ë Phôc Ng­u S¬n T©y",1,1,41,2235,2970},
			[4] = {"§¸nh b¹i Man Di thø hai ë Phôc Ng­u S¬n T©y","§¸nh b¹i Man Di thø hai ë Phôc Ng­u S¬n T©y",1,1,41,2160,2943},
			[5] = {"§¸nh b¹i Man Di thø ba ë Phôc Ng­u S¬n T©y","§¸nh b¹i Man Di thø ba ë Phôc Ng­u S¬n T©y",1,0,41,264,185},
			[6] = {"§¸nh b¹i Man Di thø t­ ë Phôc Ng­u S¬n T©y (Ngay gÇn con thø 3)","§¸nh b¹i Man Di thø t­ ë Phôc Ng­u S¬n T©y (Ngay gÇn con thø 3)",1,1,41,2094,2926},
			[7] = {"§¸nh b¹i Man Di thø n¨m ë Phôc Ng­u S¬n T©y","§¸nh b¹i Man Di thø n¨m ë Phôc Ng­u S¬n T©y",1,1,41,2210,3010},
			[8] = {"Trë vÒ phông mÖnh HuyÒn Bi","Trë l¹i §¹t Ma §­êng gÆp HuyÒn Bi phôc mÖnh, hoµn thµnh nhiÖm vô",0,1,105,1599},
		},
		[3] = {
			[1] = {"SÏ ®­îc phong lµ: Hé Ph¸p La H¸n. Häc ®­îc vâ c«ng: La H¸n TrËn. N¬i tiÕp nhËn nhiÖm vô: HuyÒn Gi¸c.<enter><color=red>B­íc 1<color>: §Õn hå Phãng sinh t×m gÆp HuyÒn Gi¸c <color=yellow>(220/193)<color>, tiÕp nhËn nhiÖm vô.<enter><color=red>B­íc 2<color>: §Õn rõng th¸p bªn ngoµi chïa, ph¸t hiÖn nh÷ng kÎ cã hµnh tung mê ¸m. §¸nh b¹i M¹ch Anh <color=yellow>(238/200), (231/204)<color>, cho ®Õn khi nµo biÕt ®­îc bän chóng chÝnh lµ gi¸n ®iÖp cña Kim quèc, ®ång ®¶ng cña bän chóng ®· ®¸nh c¾p thµnh c«ng <color=yellow>B¸t Nh· Ba La MËt §a T©m Kinh<color> hiÖn giê ®· ch¹y ®Õn Kim Quang ®éng ë KiÕm C¸c T©y B¾c.<enter><color=red>B­íc 3<color>: §Õn Ph­îng T­êng Phñ -> KiÕm C¸c Thôc §¹o -> Kim Quang §éng, ®¸nh bän Trém kinh <color=yellow>(218/182), (179/186), (198/196)<color> ®Õn khi lÊy lÊy l¹i ®­îc <color=yellow>B¸t Nh· Ba La MËt §a T©m Kinh<color>.<enter><color=red>B­íc 4<color>: Trë l¹i ThiÕu L©m, ®Õn hå Phãng sinh, mang kinh giao cho HuyÒn Gi¸c, hoµn thµnh nhiÖm vô"},
			[2] = {"§Õn Hå Phãng Sinh gÆp HuyÒn Gi¸c","§Õn hå Phãng sinh t×m gÆp HuyÒn Gi¸c <color=yellow>(220/193)<color>, tiÕp nhËn nhiÖm vô.",0,0,103,220,193},
			[3] = {"§¸nh b¹i M¹ch Anh","§¸nh b¹i M¹ch Anh",1,1,103,1908,3210},
			[4] = {"§¸nh b¹i bän trém kinh ë Kim Quang §éng",	"§Õn rõng th¸p bªn ngoµi chïa, ph¸t hiÖn nh÷ng kÎ cã hµnh tung mê ¸m. §¸nh b¹i M¹ch Anh",1,0,4,218,182},
			[5] = {"Trë l¹i gÆp HuyÒn Gi¸c","Trë l¹i ThiÕu L©m, ®Õn hå Phãng sinh, mang kinh giao cho HuyÒn Gi¸c, hoµn thµnh nhiÖm vô",0,0,103,220,193},
		},
		[4] = {
			[1] = {"SÏ ®­îc phong lµ: TruyÒn Kinh La H¸n. Häc ®­îc vâ c«ng: S­ Tö Hèng. N¬i tiÕp nhËn nhiÖm vô: Tõ Nh©n Ph­¬ng Tr­îng.<enter><color=red>B­íc 1<color>: §Õn Ph­¬ng Tr­îng ThiÒn phßng <color=yellow>(230/184)<color> t×m gÆp <color=green>Tõ Nh©n Ph­¬ng tr­îng<color>, tiÕp nhËn nhiÖm vô.<enter><color=red>B­íc 2<color>: §Õn ThiÕu L©m MËt ThÊt <color=yellow>(168/166)<color> ë phÝa B¾c Chïa ThiÕu L©m, tr¶ lêi 3 c©u hái ®Ó vµo ®­îc trong MËt ThÊt <color=yellow>(thø tù tr¶ lêi lµ 1 - 2 - 1)<color>.<enter><color=red>B­íc 3<color>: §¸nh <color=green>Kim Cang Nh©n<color> <color=yellow>(213/205), (203/198), (204/205), (208/201)<color> ®Ó lÊy ®­îc khÈu quyÕt.<enter><color=red>B­íc 4<color>: §Õn cuèi hang ®éng <color=yellow>(230/207)<color> sÏ nh×n thÊy mét th¹ch thÊt, nhÊp vµo phiÕn ®¸, ®äc ®óng khÈu quyÕt sÏ cã thÓ cïng <color=green>NhÞ T¨ng<color> ®èi tho¹i, ph¶i chó ý nghe thø tù n¨m c©u nãi cña <color=green>NhÞ T¨ng<color> (c¸c b¹n nªn ghi l¹i).<enter><color=red>B­íc 5<color>: Trë l¹i Ph­¬ng tr­îng ThiÒn phßng, gÆp <color=green>Tõ Nh©n Ph­¬ng Tr­îng<color>, thuËt l¹i thø tù n¨m c©u nãi cña <color=green>NhÞ T¨ng<color>:<enter>\t\t- NÕu nh­ thø tù chÝnh x¸c, hoµn thµnh nhiÖm vô.<enter>\t\t- NÕu nh­ thø tù bÞ sai, <color=green>Tõ Nh©n Ph­¬ng tr­îng<color> : <color=yellow>Ta kh«ng hiÓu ®­îc ý nghÜa n¨m c©u nµy, cã ph¶i ng­¬i ®· bÞ lÇm lÉn thø tù kh«ng?<color> B¹n ph¶i thùc hiÖn l¹i nhiÖm vô"},
			[2] = {"§Õn gÆp Tõ Nh©n Ph­¬ng Tr­îng.","§Õn gÆp Tõ Nh©n Ph­¬ng Tr­îng.",0,1,109,1598,3178},
			[3] = {"§Õn ThiÕu L©m mËt thÊt","§Õn ThiÕu L©m MËt ThÊt ë phÝa B¾c Chïa ThiÕu L©m, tr¶ lêi 3 c©u hái ®Ó vµo ®­îc trong MËt ThÊt",1,0,103,168,166},
			[4] = {"§¸nh b¹i kim cang nh©n thø nhÊt","§¸nh b¹i kim cang nh©n thø nhÊt",1,0,113,213,206},
			[5] = {"§¸nh b¹i kim cang nh©n thø hai","§¸nh b¹i kim cang nh©n thø hai",1,0,113,203,199},
			[6] = {"§¸nh b¹i kim cang nh©n thø ba","§¸nh b¹i kim cang nh©n thø ba",1,0,113,204,205},
			[7] = {"§¸nh b¹i kim cang nh©n thø t­","§¸nh b¹i kim cang nh©n thø t­",1,0,113,208,201},
			[8] = {"§èi tho¹i cïng NhÞ T¨ng","§èi tho¹i cïng NhÞ T¨ng",1,0,113,230,207},
			[9] = {"Trë l¹i gÆp Tõ Nh©n Ph­¬ng Tr­îng","Trë l¹i gÆp Tõ Nh©n Ph­¬ng Tr­îng",0,1,109,1598,3178},
		},
		[5] = {
			[1] = {"SÏ ®­îc phong lµ: Phôc Ma Thiªn Vu¬ng. Häc ®­îc vâ c«ng: Hoµnh T¶o Lôc Hîp, Ma Ha V« L­îng, Long Hæ Tr¶o. N¬i tiÕp nhËn nhiÖm vô: HuyÒn Tõ.<enter><color=red>B­íc 1<color>: §Õn Tµng Kinh C¸c(218/190) , gÆp HuyÒn Tõ, tiÕp nhËn nhiÖm vô.<enter><color=red>B­íc 2<color>: §Õn s©n luyÖn vâ gÆp Trõng T©m (224/178). H¾n muèn b¹n kiÕm cho h¾n 1 con gµ quay.<enter><color=red>B­íc 3<color>: §Õn Töu lÇu ë BiÖn Kinh (210/193), bá 500 l­îng mua gµ quay mang vÒ giao cho Trõng T©m.<enter><color=red>B­íc 4<color>: §Õn rõng th«ng, trong rõng lµ mét mª cung c©y th«ng, trong mª cung cã rÊt nhiÒu ®¸, c¨n cø theo sù s¾p xÕp Tø, Ngò, Tam, sÏ t×m ®­îc t¶ng ®¸ cã giÊu tµng th­ (231/170), ®Èy nã ra sÏ lÊy ®­îc <color=yellow>DÞch C©n Kinh<color>.<enter><color=red>B­íc 5<color>: Trë l¹i Tµng Kinh C¸c, mang DÞch C©n Kinh giao cho HuyÒn Tõ, hoµn thµnh nhiÖm vô"},
			[2] = {"§Õn Tµng Kinh C¸c gÆp HuyÒn Tõ","§Õn Tµng Kinh C¸c gÆp HuyÒn Tõ",0,1,104,1594,3183},
			[3] = {"GÆp Trõng T©m t¹i s©n luyÖn vâ","GÆp Trõng T©m t¹i s©n luyÖn vâ",0,0,103,224,178},
			[4] = {"Mua gµ quay t¹i töu lÇu BiÖn Kinh","Mua gµ quay t¹i töu lÇu BiÖn Kinh",0,0,37,210,193},
			[5] = {"Mang gµ quay vÒ cho Trõng T©m","Mang gµ quay vÒ cho Trõng T©m",0,0,103,224,178},
			[6] = {"§Õn rõng th«ng t×m DÞch Ch©n Kinh","§Õn rõng th«ng t×m DÞch Ch©n Kinh",1,0,103,231,170},
			[7] = {"Mang DÞch C©n Kinh cho HuyÒn Tõ","Mang DÞch C©n Kinh cho HuyÒn Tõ",0,1,104,1594,3183},
		},
		[6] = {
			[1] = {"SÏ ®­îc phong lµ: V« L­îng ThÝch T«n. N¬i nhËn nhiÖm vô: HuyÒn Nan.<enter><color=red>B­íc 1<color>: §Õn La H¸n ®­êng <color=yellow>(202/192)<color>, gÆp HuyÒn Nan, tiÕp nhËn nhiÖm vô.<enter><color=red>B­íc 2<color>: §Õn La H¸n trËn (lèi ®i vµo phÝa sau t­îng PhËt trong La H¸n ®­êng), ®¸nh b¹i c¸c tªn T¨ng Binh §Çu LÜnh <color=yellow>(197/211), (211/224), (206/196), (229/208)<color>, b¹n sÏ lÊy ®­îc NiÖm Ch©u, ThiÒn tr­îng, Méc Ng­ vµ B¸t Vu.<enter><color=red>B­íc 3<color>: Mang 4 b¶o vËt trªn vÒ giao cho HuyÒn Nan, hoµn thµnh nhiÖm vô."},
			[2] = {"§Õn La H¸n ®­êng gÆp HuyÒn Nan","§Õn La H¸n ®­êng gÆp HuyÒn Nan",0,0,103,202,192},
			[3] = {"§¸nh b¹i t¨ng ®Çu lÜnh","§Õn La H¸n trËn (lèi ®i vµo phÝa sau t­îng PhËt trong La H¸n ®­êng), ®¸nh b¹i c¸c tªn T¨ng Binh §Çu LÜnh",1,1,114,1580,3380},
			[4] = {"Mang 4 b¶o vËt vÒ cho HuyÒn Nan",0,0,103,202,192},
		},
		[7] = {
			[1] = {"<color=red>Yªu cÇu<color>: ng­êi ch¬i ®· xuÊt s­, ®¼ng cÊp trªn 60, ch­a gia nhËp bang ph¸i nµo, cã thÓ ®Õn gÆp tr­ëng m«n cña ph¸i giao 5 v¹n l­îng ®Ó trïng ph¶n s­ m«n. Tõ ®ã vÒ sau cã thÓ tïy ý ra vµo s­ m«n.<enter><color=red>Häc ®­îc vâ c«ng<color>: Nh­ Lai Thiªn DiÖp, DÞch C©n Kinh.<enter>§­îc phßng lµm Hé Ph¸p Tr­ëng L·o."},
		},
		[8] = {
			[1] = {"<color=red>Yªu cÇu<color>: Tõ cÊp <color=yellow>90<color> trë lªn, danh väng trªn <color=yellow>240<color> ®iÓm, lµ <color=yellow>ThiÕu L©m ký danh ®Ö tö<color>, tr­íc m¾t ch­a gia nhËp m«n ph¸i nµo.(Ch÷ ®á)<enter><color=red>PhÇn th­ëng<color>: häc ®­îc <color=yellow>§¹t Ma §é Giang , Hoµnh T¶o Thiªn Qu©n , V« T­íng Tr¶m<color>. Danh väng ®­îc <color=yellow>30<color> ®iÓm. (TÊt c¶ c¸c m«n ph¸i kh¸c ®Òu cã thÓ lµm nhiÖm vô nµy ®Ó nhËn phÇn th­ëng ®iÓm danh väng, nh­ng kh«ng häc ®­îc chiªu thøc).<enter><color=red>B­íc 1<color>: Tõ bÊt kú thµnh chÝnh nµo b¹n ®i Xa phu -> Hoa S¬n C¶nh kü tr­êng gÆp Th­êng B¸ch Lý vµ Lý §Þch Phong <color=yellow>(326/224)<color>, nhËn nhiÖm vô.<enter><color=red>B­íc 2<color>: VÒ ThiÕu L©m ®Õn §¹t Ma §­êng <color=yellow>(210/188)<color> t×m gÆp HuyÒn Bi.<enter><color=red>B­íc 3<color>: Sang La H¸n ®­êng <color=yellow>(202/192)<color>, gÆp HuyÒn Nan.<enter><color=red>B­íc 4<color>: Trë l¹i §¹t Ma §­êng nãi chuyÖn víi HuyÒn Bi nhËn lÖnh bµi ®Ó ®i thùc hiÖn nhiÖm vô.<enter><color=red>B­íc 5<color>: Quay l¹i Hoa S¬n C¶nh kü tr­êng gÆp Th­êng B¸ch Lý vµ Lý §Þch Phong ®Ó ®­a lÖnh bµi.<enter><color=red>B­íc 6<color>: §¸nh b¹i Kim Quèc T­íng LÜnh <color=yellow>(323/240)<color> råi gÆp Th­êng B¸ch Lý vµ Lý §Þch Phong b¸o tin.<enter><color=red>B­íc 7<color>: VÒ ThiÕu L©m ®Õn §¹t Ma §­êng t×m gÆp HuyÒn Bi b¸o tin.<enter><color=red>B­íc 8<color>: Sang La H¸n ®­êng, gÆp HuyÒn Nan b¸o tin, hoµn thµnh nhiÖm vô."},
			[2] = {"Lªn Hoa S¬n C¶nh Kü Tr­êng gÆp Th­êng B¸ch Lý vµ Lý DÞch Phong","Lªn Hoa S¬n C¶nh Kü Tr­êng gÆp Th­êng B¸ch Lý vµ Lý DÞch Phong",0	,0,	2,	326,	224},
			[3] = {"T×m gÆp HuyÒn Bi","VÒ ThiÕu L©m ®Õn §¹t Ma §­êng <color=yellow>(210/188)<color> t×m gÆp HuyÒn Bi."	,0,	1	,105,1599	,3191},
			[4] = {"§Õn La H¸n ®­êng gÆp HuyÒn Nan","Sang La H¸n ®­êng <color=yellow>(202/192)<color>, gÆp HuyÒn Nan."	,0,	0	,103	,202	,192},
			[5] = {"T×m gÆp HuyÒn Bi nhËn lÖnh bµi.","Trë l¹i §¹t Ma §­êng nãi chuyÖn víi HuyÒn Bi nhËn lÖnh bµi ®Ó ®i thùc hiÖn nhiÖm vô.",0,1,105,1599,3191},
			[6] = {"Trë l¹i t×m Th­êng B¸ch Lý vµ Lý DÞch Phong ®­a lÖnh bµi.","Quay l¹i Hoa S¬n C¶nh kü tr­êng gÆp Th­êng B¸ch Lý vµ Lý §Þch Phong ®Ó ®­a lÖnh bµi.",	0,	0,	2,	326,	224},
			[7] = {"Tiªu diÖt Kim Quèc t­íng lÜnh","§¸nh b¹i Kim Quèc T­íng LÜnh <color=yellow>(323/240)",	1,	0,	2,	323,	240},
			[8] = {"Trë l¹i t×m Th­êng B¸ch Lý vµ Lý DÞch Phong b¸o tin tiªu diÖt Kim Quèc t­íng lÜnh.","Trë l¹i t×m Th­êng B¸ch Lý vµ Lý DÞch Phong b¸o tin tiªu diÖt Kim Quèc t­íng lÜnh",	0,	0,	2,	326,	224},
			[9] = {"Trë vÒ t×m gÆp HuyÒn Bi b¸o tin","Trë vÒ t×m gÆp HuyÒn Bi b¸o tin",	0,	1,	105,	1599,	3191},
			[10] = {"B¸o tin cho HuyÒn Nan","B¸o tin cho HuyÒn Nan",	0,	0,	103,	202,	192},
		},
		[9] = {
			[1] = {"MËt tÞch kü n¨ng 120 cã thÓ ®æi t¹i ch­ëng m«n. <enter>VËt phÈm cÇn thiÕt ®Ó ®æi:<enter>1 quyÓn Bµn Nh­îc T©m Kinh, 1 bé s¸ch kü n¨ng 90 cña m«n ph¸i m×nh, 1 viªn Tinh Hång B¶o Th¹ch vµ 1 viªn Thñy Tinh."},
		},
		[10] = {
			[1] = {"<color=red>B­íc 1<color>: §Õn BiÖn Kinh phñ råi ®i theo h­íng t©y nam ®Õn chïa ThiÕu L©m. Vµo trong chïa gÆp Tri T¨ng Kh¸ch (211/195) «ng ta muèn b¹n chøng tá 4 phÈm chÊt: XÝch ®¶m trung t©m, h¹o nhiªn chÝnh khÝ, kiªn nhÉn b¸t ®¹t vµ v« t­ v« ng·.<enter><color=red>B­íc 2<color>: Quay l¹i BiÖn Kinh phñ, ®Õn t×m T©n Khëi TËt (220/187) lÊy ®­îc Qu¶ng Ho¾c H­¬ng.<enter><color=red>B­íc 3<color>: GÆp Kim Quèc Vâ SÜ (209/201) nhËn ®­îc Kiªn Tinh Th¹ch.<enter><color=red>B­íc 4<color>: §Õn cæng thµnh phÝa B¾c T¸n gÉu víi VÖ Binh Thµnh M«n (198/187), h¾n sÏ hái b¹n vÒ lßng trung thµnh, b¹n h·y chän c©u tr¶ lêi thõ hai ®­îc tÆng XÝch §ång Kho¸ng.<enter><color=red>B­íc 5<color>: Mang c¶ 3 mãn nµy tÆng cho Ng­êi ¨n mµy (210/186) vµ ®­îc giao cho mét L¸ th­. CÇm l¸ th­ ®ã vÒ chïa ThiÕu L©m giao l¹i cho Tri T¨ng Kh¸ch , thÕ lµ ®­îc tiÕp nhËn lµm ®Ö tö ký danh"},
			[2] = {"GÆp Tri Kh¸ch T¨ng	","§Õn BiÖn Kinh phñ råi ®i theo h­íng t©y nam ®Õn chïa ThiÕu L©m. Vµo trong chïa gÆp Tri T¨ng Kh¸ch",0	,0	,103,	211,	195},
			[3] = {"§Õn BiÖn Kinh t×m TÇn Khëi TËt lÊy Qu¶ng H¾c H­¬ng","Quay l¹i BiÖn Kinh phñ, ®Õn t×m T©n Khëi TËt (220/187) lÊy ®­îc Qu¶ng Ho¾c H­¬ng",	0,	0,	37,	220	,187},
			[4] = {"GÆp Kim Quèc Vâ SÜ lÊy Kim Tinh Th¹ch","GÆp Kim Quèc Vâ SÜ (209/201) nhËn ®­îc Kiªn Tinh Th¹ch"	,0,	0,	37,	209	,201},
			[5] = {"Nãi chuyÖn víi vÖ binh thµnh m«n phÝa b¾c",	"§Õn cæng thµnh phÝa B¾c T¸n gÉu víi VÖ Binh Thµnh M«n (198/187), h¾n sÏ hái b¹n vÒ lßng trung thµnh, b¹n h·y chän c©u tr¶ lêi thõ hai ®­îc tÆng XÝch §ång Kho¸ng",0	,0,	37,	198	,187},
			[6] = {"T×m gÆp ng­êi ¨n mµy tÆng 3 b¶o vËt","Mang c¶ 3 mãn nµy tÆng cho Ng­êi ¨n mµy (210/186) vµ ®­îc giao cho mét L¸ th­"	,0	,1,	37,	1685,	2998},
			[7] = {"Trë vÒ giao th­ cho Tri Kh¸ch T¨ng","CÇm l¸ th­ ®ã vÒ chïa ThiÕu L©m giao l¹i cho Tri T¨ng Kh¸ch , thÕ lµ ®­îc tiÕp nhËn lµm ®Ö tö ký danh",	0,	0,	103,	211,	195},
		},
	},
	[1] = {--Thien vuong OK
		[1] = {
			[1] = {"SÏ ®­îc phong lµ: Tr­ëng ThÞ VÖ. Häc ®­îc vâ c«ng: Thiªn V­¬ng Th­¬ng Ph¸p, Thiªn V­¬ng §ao ph¸p, Thiªn V­¬ng Chïy ph¸p, N¬i tiÕp nhËn nhiÖm vô: TiÒn Sø V­¬ng T¸.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1<color>: §Õn §¹i §iÖn (201/198) gÆp TiÒn Sø V­¬ng T¸ nhËn nhiÖm vô. §i t×m 3 viªn Kª HuyÕt Th¹ch.<enter><color=red>B­íc 2<color>: §Õn S¬n §éng (225/185) phÝa ®«ng b¾c cña ®¶o, t×m ®¸nh Kim Miªu V­¬ng (225/201),(196/191), X¸ LÞ Tinh (234/196), §¹i Hoµn Hïng (210/195),(209/185) cho ®Õn khi nhËn ®ñ 3 viªn Kª HuyÕt Th¹ch<enter><color=red>B­íc 3<color>: Mang Kª HuyÕt Th¹ch vÒ giao cho TiÒn Sø V­¬ng T¸, hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp V­¬ng T¸","",0,1,60,1599,3185},
			[3] = {"§¸nh Kim Miªu V­¬ng","",1,1,65,1810,3210},
			[4] = {"VÒ gÆp V­¬ng T¸","",0,1,60,1599,3185},
		},
		[2] = {
			[1] = {"SÏ ®­îc phong lµ: Thñ Tr¹i H·n T­íng. Häc ®­îc vâ c«ng: TÜnh T©m quyÕt. N¬i tiÕp nhËn nhiÖm vô: H÷u Sø D­¬ng Hå.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1<color>: §Õn phÝa Nam TÈm Cung gÆp H÷u Sø D­¬ng Hå (218/198) nhËn nhiÖm vô.<enter><color=red>B­íc 2<color>: §i Ba L¨ng HuyÖn -> Vò L¨ng S¬n -> B¹ch Thñy §éng. Vµo ®éng ®¸nh tªn Thæ PhØ ®Çu môc (203/194), (194/196), (206/201) ®Õn khi nhËn ®­îc 1 l¸ cê GÊm.<enter><color=red>B­íc 3<color>: Mang cê vÒ giao cho H÷u Sø D­¬ng Hå (218/198), hoµn thµnh nhiÖm vô.<enter><color=red>Chó ý<color>: §¸nh ®i ®¸nh l¹i c¶ 3 Thæ PhØ §Çu Môc ®Õn khi nhËn ®­îc Cê GÊm"},
			[2] = {"GÆp D­¬ng Hå","",0,1,59,1749,3173},
			[3] = {"Thá phØ ®Çu môc 1","",1,1,71,1630,3114},
			[4] = {"Thæ phØ ®Çu môc 2","",1,1,71,1554,3149},
			[5] = {"Thæ phØ ®Çu môc 3","",1,1,71,1650,3216},
			[6] = {"GÆp D­¬ng Hå","",0,1,59,1749,3173},
		},
		[3] = {
			[1] = {"SÏ ®­îc phong lµ: Ch­ëng §µ §Çu LÜnh. Häc ®­îc vâ c«ng: B¸t Phong Tr¶m, D­¬ng Quan Tam DiÖp, Hµng V©n QuyÕt, N¬i tiÕp nhËn nhiÖm vô: T¶ Sø Cæ B¸ch.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1<color>: §Õn phÝa T©y Qu¶ng Tr­¬ng gÆp T¶ Sø Cæ B¸ch (202/193). NhËn lêi gióp «ng ta t×m Thiªn V­¬ng LÖnh.<enter><color=red>B­íc 2<color>: §i Ba L¨ng huyÖn -> Miªu LÜnh -> YÕn Tö §éng, ®¸nh b¹i B¸o Tö §Çu (191/210) cho ®Õn khi nhËn ®­îc Thiªn V­¬ng LÖnh míi th«i.<enter><color=red>B­íc 3<color>: Mang Trë vÒ giao Thiªn V­¬ng LÖnh cho T¶ Sø Cæ B¸ch (202/193), hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp Cæ B¸ch","",0,1,59,1619,3092},
			[3] = {"§¸nh B¸o tö ®Çu lÊy Thiªn V­¬ng lÖnh","",1,1,77,1528,3360},
			[4] = {"VÒ gÆp Cæ B¸ch","",0,1,59,1619,3092},
		},
		[4] = {
			[1] = {"SÏ ®­îc phong lµ: Thñy §¹o Thèng LÜnh. Häc ®­îc vâ c«ng: §o¹n Hån ThÝch, N¬i tiÕp nhËn nhiÖm vô: Lé V©n ViÔn.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1<color>: §Õn Thiªn V­¬ng §¹i §iÖn (214/192) gÆp Thiªn Hé Ph¸p Lé V©n ViÔn nhËn nhiÖm vô.<enter><color=red>B­íc 2<color>: §Õn Ba L¨ng HuyÖn gÆp Ng« thÇn Y (199/200). ¤ng ta nãi cÇn ph¶i cã 2 lo¹i d­îc liÖu lµ v¶y th»n l»n löa vµ l«ng mai rïa lôc m·o.<enter><color=red>B­íc 3<color>: Tõ Ba L¨ng HuyÖn -> Vò L¨ng S¬n -> Phôc L­u §éng. §¸nh c¸c con Th»n L»n ®á (179/190), (216/190), (204/192), (188/183) lÊy v¶y th»n l»n löa.<enter><color=red>B­íc 4<color>: VÒ Thiªn V­¬ng §¶o gÆp l·o Ng­ ¤ng (179/210). ¤ng Êy chÊp nhËn cho b¹n con rïa xanh víi ®iÒu kiÖn b¹n ph¶i t×m cho «ng Êy vµi con giun ®Êt vÒ lµm måi c©u.<enter><color=red>B­íc 5<color>: Qua gÆp cËu bÐ Thñy Sinh (184/212). CËu ta ®ång ý ®µo cho b¹n vµi con giun ®Êt nÕu b¹n t×m cho cËu ta mãn trøng luéc cËu ta ­a thÝch.<enter><color=red>B­íc 6<color>: GÆp Ng­ Phô Hµ TÈu (190/213). NhËn lêi ®i mua dïm mét Ýt Liªn Tö.<enter><color=red>B­íc 7<color>: VÒ Ba l¨ng HuyÖn, ®Õn TiÖm t¹p hãa (199/198) mua h¹t sen ®em vÒ cho Ng­ Phô Hµ TÈu.<enter><color=red>B­íc 8<color>: LÇn l­ît gÆp : Ng­ Phô Hµ TÈu -> bÐ Thñy Sinh -> l·o Ng­ ¤ng.<enter><color=red>B­íc 9<color>: LÊy ®­îc 2 vËt phÈm, ®em vÒ §¹i §iÖn cho Lé V©n ViÔn, hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp Lé V¨n ViÔn","",0,1,61,1603,3191},
			[3] = {"Ng« thÇn y","",0,1,53,1600,3211},
			[4] = {"§¸nh th»n l»n ®á lÊy vÈy th»n l»n löa","",1,1,73,1431,3052},
			[5] = {"GÆp Ng­ «ng","",0,1,59,1429,3378},
			[6] = {"Thñy Sinh","",0,1,59,1479,3405},
			[7] = {"Hµ TÈu","",0,0,59,190,213},
			[8] = {"T¹p hãa Ba L¨ng HuyÖn","",0,0,53,199,198},
			[9] = {"Hµ TÈu","",0,0,59,190,213},
			[10] = {"Thñy Sinh","",0,1,59,1479,3405},
			[11] = {"GÆp Ng­ «ng","",0,1,59,1429,3378},
			[12] = {"GÆp Lé V¨n ViÔn","",0,1,61,1603,3191},
		},
		[5] = {
			[1] = {"SÏ ®­îc phong lµ: Hé §¶o T­íng Qu©n. Häc ®­îc vâ c«ng: Kim Chung Tr¸o. N¬i tiÕp nhËn nhiÖm vô: §Þa Hé Ph¸p H¹ Thµnh.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1<color>: GÆp §Þa Hé Ph¸p H¹ Thµnh (209/196) nhËn nhiÖm vô.<enter><color=red>B­íc 2<color>: §Õn §éng §×nh hå (209/196) ë phÝa ®«ng Thiªn V­¬ng §¶o. Vµo tÇng 2, ®¸nh Thñy Qu¸i (209/196) ®Õn khi nµo l­îm ®­îc ®¸ ngò s¾c.<enter><color=red>B­íc 3<color>: Trë VÒ trao ®¸ ngò s¾c cho §Þa Hé Ph¸p H¹ Thµnh (209/196), hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp H¹ Thµnh","",0,1,59,1672,3145},
			[3] = {"§¸nh Thñy Qu¸i lÊy §¸ ngò s¾c","",1,1,67,1420,3140},
			[4] = {"GÆp H¹ Thµnh","",0,1,59,1672,3145},
		},
		[6] = {
			[1] = {"SÏ ®­îc phong lµ: K×nh Thiªn Nguyªn So¸i. N¬i tiÕp nhËn nhiÖm vô: Thiªn V­¬ng Bang Chñ D­¬ng Anh.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1<color>: §Õn TÈm Cung gÆp bang chñ D­¬ng Anh (223/196), nhËn nhiÖm vô ®i lÊy Thiªn V­¬ng Di Th­.<enter><color=red>B­íc 2<color>: Ra bÕn tµu (177/216), ®Õn Thanh Loa ®¶o.<enter><color=red>B­íc 3<color>: §¸nh mét trong 5 con m·nh thó: Cãc Tinh (194/195), (201/187), C¸ SÊu Tinh (184/188), (186/197), Th»n L»n Tinh (206/194) lÊy ch×a khãa.<enter><color=red>B­íc 4<color>: Cã ®­îc ch×a khãa, ®Õn më r­¬ng trªn Thanh Loa ®¶o (205/186). Ph¸t hiÖn r­¬ng trèng kh«ng. Di Th­ ®· bÞ mét nhãm ng­êi lÊy ®i, ch¹y vµo Thanh Loa s¬n ®éng.<enter><color=red>B­íc 5<color>: Vµo Thanh Loa s¬n ®éng ®¸nh b¹i §å TÓ (240/199). LÊy l¹i ®­îc Di Th­.<enter><color=red>B­íc 6<color>: Mang Di th­ vÒ cho bang chñ D­¬ng Anh (223/196), hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp D­¬ng Anh","",0,1,62,1609,3199},
			[3] = {"Ra bÕn tµu ®i Thanh Loa §¶o","",1,1,59,1416,3467},
			[4] = {"Tiªu diÖt Cãc tinh kiÕm ch×a khãa","",1,1,68,1552,3125},
			[5] = {"Më r­¬ng t×m kiÕm bøc th­","",1,1,68,1643,2985},
			[6] = {"§¸nh b¹i §å TÓ lÊy thiªn v­¬ng di th­","",1,1,69,1920,3190},
			[7] = {"Mang di th­ cho bang chñ D­¬ng Anh","",0,1,62,1609,3199},
		},
		[7] = {
			[1] = {"NhiÖm vô trõng ph¶n s­ m«n. ChØ cÇn nép 5 v¹n l­îng lµ cã thÓ hoµn thµnh"},
		},
		[8] = {
			[1] = {"Kü n¨ng 90 cã b¸n t¹i cöa hµng tinh lùc hay kú tr©n c¸c"},
		},
		[9] = {
			[1] = {"Cã b¸n t¹i kú tr©n c¸c"},
		},
		[10] = {
			[1] = {"Chøc n¨ng ch­a ph¸t triÓn"},
		},
	},
	[2] = { --§­êng M«n OK
		[1] = {
			[1] = {"SÏ ®­îc phong lµ: <color=yellow>Tr¸ng §inh<color>.<enter>Häc ®­îc vâ c«ng: §­êng M«n ¸m khÝ , §Þa DiÖm Háa <enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1:<color> §Õn phßng vâ c«ng (510,317), gÆp §­êng H¹c tiÕp nhËn nhiÖm vô truy t×m Ma Vò Ch©m.<enter><color=red>B­íc 2:<color> §Õn Thµnh §« (tõ §­êng M«n ch¹y xuèng cæng phÝa d­íi), t×m Mai N­¬ng (389,315).<enter><color=red>B­íc 3:<color> §Õn nhµ T«n UyÓn (394,323). C« Êy chÊp nhËn ®æi cho b¹n Ma Vò Ch©m lÊy 1 c¸i NhÉn M· N·o.<enter><color=red>B­íc 4:<color> §Õn TiÖm t¹p hãa trong Thµnh §« (386,321) dïng 500 l­îng mua chiÕc NhÉn M· N·o , trë vÒ ®æi cho T«n UyÓn lÊy Ma Vò Ch©m.<enter><color=red>B­íc 5:<color> Trë vÒ §­êng M«n, giao Ma Vò Ch©m cho §­êng H¹c , hoµn thµnh nhiÖm vô."},
			[2] = {"§Õn phßng vâ c«ng gÆp §­êng H¹c","§Õn phßng vâ c«ng (510,317), gÆp §­êng H¹c tiÕp nhËn nhiÖm vô truy t×m Ma Vò Ch©m.",0,1,31,1607,3204},
			[3] = {"§Õn Thµnh §« gÆp Mai N­¬ng","§Õn Thµnh §« (tõ §­êng M«n ch¹y xuèng cæng phÝa d­íi), t×m Mai N­¬ng (389,315).",0,1,11,3116,5053},
			[4] = {"GÆp T«n UyÓn ®æi Ma Vò Ch©m","§Õn nhµ T«n UyÓn (394,323). C« Êy chÊp nhËn ®æi cho b¹n Ma Vò Ch©m lÊy 1 c¸i NhÉn M· N·o.",0,1,11,3155,5184},
			[5] = {"Mua nhÉn m· n·o t¹i t¹p hãa","§Õn TiÖm t¹p hãa trong Thµnh §« (386,321) dïng 500 l­îng mua chiÕc NhÉn M· N·o",0,1,11,3094,5139},
			[6] = {"Mang nhÉn M· N·o ®æi Ma Vò Ch©m cña T«n UyÓn","Trë vÒ ®æi NhÉn M· N·o lÊy Ma Vò Ch©m",0,1,11,3155,5184},
			[7] = {"Giao Ma Vò Ch©m cho §­êng H¹c","Trë vÒ §­êng M«n, giao Ma Vò Ch©m cho §­êng H¹c , hoµn thµnh nhiÖm vô.",0,1,31,1607,3204},
		},
		[2] = {
			[1] = {"SÏ ®­îc phong lµ: <color=yellow>Hé ViÖn<color>.<enter>Häc ®­îc vâ c«ng: §éc ThÝch Cèt<enter>N¬i tiÕp nhËn nhiÖm vô: §­êng NhÊt TrÇn.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1:<color> §Õn §¹i s¶nh Phßng nghÞ sù (507,319) gÆp §­êng NhÊt TrÇn , nhËn nhiÖm vô.<enter><color=red>B­íc 2:<color> §Õn V« T©m Cèc (tõ §­êng M«n ®i sang cæng bªn phÝa ®«ng b¾c) ®¸nh b¹i 2 con GÊu Ngùa (526,291), (531,293) vµ 2 con X¸ LÞ tinh (528,294), (524,290) lÊy ®­îc 4 sîi t¬ trªn ®ã ghi khÈu quyÕt.<enter><color=red>B­íc 3:<color> §Õn tr­íc c¨n nhµ ë V« T©m Cèc (528,291), nhÊp vµo khung cöa sÏ ®èi tho¹i víi §­êng U.<enter><color=red>B­íc 4:<color> §Õn hå PhØ Thóy ë phÝa T©y §­êng M«n, ph¸t hiÖn ra mét con XÝch DiÖm Ng¹c (c¸ sÊu) (472,324), ®¸nh b¹i nã lÊy ®­îc Kim H¹ng QuyÒn (X¸c suÊt 50 %).<enter><color=red>B­íc 5:<color> Trë l¹i V« T©m Cèc, nhÊp vµo cöa gç, ®èi tho¹i víi §­êng U. Bµ ta yªu cÇu b¹n mang sîi d©y chuyÒn vÒ giao cho ch­ëng m«n §­êng Cõu.<enter><color=red>B­íc 6:<color> §Õn phßng kh¸ch (508,322) gÆp Ch­ëng m«n §­êng Cõu giao Kim H¹ng QuyÒn , hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp §­êng NhÊt TrÇn","§Õn §¹i s¶nh Phßng nghÞ sù (507,319) gÆp §­êng NhÊt TrÇn , nhËn nhiÖm vô.",0,1,34,1593,3204},
			[3] = {"§¸nh b¹i GÊu Ngùa - Täa §é 1","LÊy ®­îc mét trong 4 sîi t¬ trªn ®ã ghi khÈu quyÕt.",1,1,25,4211,4674},
			[4] = {"§¸nh b¹i GÊu Ngùa - Täa ®é 2","LÊy ®­îc mét trong 4 sîi t¬ trªn ®ã ghi khÈu quyÕt.",1,1,25,4248,4688},
			[5] = {"§¸nh b¹i X¸ LÞ Tinh - Täa ®é 1","LÊy ®­îc mét trong 4 sîi t¬ trªn ®ã ghi khÈu quyÕt.",1,1,25,230,4724},
			[6] = {"§¸nh b¹i X¸ LÞ Tinh - Täa ®é 2","LÊy ®­îc mét trong 4 sîi t¬ trªn ®ã ghi khÈu quyÕt.",1,1,25,4197,4635},
			[7] = {"§èi tho¹i víi §­êng U trong c¨n nhµ gç","§Õn tr­íc c¨n nhµ ë V« T©m Cèc (528,291), nhÊp vµo khung cöa sÏ ®èi tho¹i víi §­êng U.",1,1,25,4227,4667},
			[8] = {"§¸nh XÝch DiÖm Ng¹c [C¸ SÊu §á] lÊy Kim H¹ng QuyÒn","§Õn hå PhØ Thóy ë phÝa T©y §­êng M«n, ph¸t hiÖn ra mét con XÝch DiÖm Ng¹c (c¸ sÊu) (472,324), ®¸nh b¹i nã lÊy ®­îc Kim H¹ng QuyÒn (X¸c suÊt 50 %).",1,1,25,3716,5050},
			[9] = {"Trë l¹i gÆp §­êng U nãi chuyÖn","Trë l¹i V« T©m Cèc, nhÊp vµo cöa gç, ®èi tho¹i víi §­êng U. Bµ ta yªu cÇu b¹n mang sîi d©y chuyÒn vÒ giao cho ch­ëng m«n §­êng Cõu.",1,1,25,4227,4667},
			[10] = {"Giao Kim H¹ng QuyÒn cho §­êng Cõu","§Õn phßng kh¸ch (508,322) gÆp Ch­ëng m«n §­êng Cõu giao Kim H¹ng QuyÒn , hoµn thµnh nhiÖm vô.",0,1,33,1617,3191},
		},
		[3] = {
			[1] = {"SÏ ®­îc phong lµ: <color=yellow>Giíi TiÒn Hé VÖ<color>.<enter>Häc ®­îc vâ c«ng:<enter>Truy T©m TiÔn<enter>M¹n Thiªn Hoa Vò <enter>§o¹t Hån Tiªu<enter>Xuyªn T©m Thø <enter>N¬i tiÕp nhËn nhiÖm vô: <color=yellow>§­êng BÊt NhiÔm<color>.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1:<color> §Õn phßng TÕ tæ phßng (514,318), gÆp §­êng BÊt NhiÔm, nhËn nhiÖm vô. Gióp §­êng V©n s­ thóc tr¶ thï vµ lÊy l¹i Háa KhÝ phæ.<enter><color=red>B­íc 2:<color> §Õn Thµnh §« -> Thanh Thµnh S¬n -> B¹ch V©n ®éng (356,242) ®¸nh b¹i §¹i ®Çu môc Cuång Sa (229,200), biÕt ®­îc Háa KhÝ phæ ®· bÞ giÊu trong r­¬ng. Cßn ch×a khãa bÞ giÊu t¹i mét n¬i nµo ®ã trong ®éng.<enter><color=red>B­íc 3:<color> §¸nh b¹i 4 tªn tiÓu ®Çu môc: §éc NhÜ (218,200), ThiÕt TÝ (219,207), Quû ¶nh (239,202), LÞch QuyÒn (228,197), lÊy ®­îc ch×a khãa (x¸c suÊt 50%), më r­¬ng (230,199) lÊy ®­îc Háa KhÝ phæ.<enter><color=red>B­íc 4:<color> Trë vÒ §­êng M«n, ®Õn phßng Háa d­îc (512,324) giao Háa KhÝ phæ cho §­êng V©n, hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp §­êng BÊt NhiÔm","§Õn phßng TÕ tæ phßng (514,318), gÆp §­êng BÊt NhiÔm, nhËn nhiÖm vô. Gióp §­êng V©n s­ thóc tr¶ thï vµ lÊy l¹i Háa KhÝ phæ.",0,1,36,1595,3189},
			[3] = {"§¸nh §¹i §Çu Môc Cuång Sa - B¹ch V©n §éng","§Õn Thµnh §« -> Thanh Thµnh S¬n -> B¹ch V©n ®éng (356,242) ®¸nh b¹i §¹i ®Çu môc Cuång Sa (229,200), biÕt ®­îc Háa KhÝ phæ ®· bÞ giÊu trong r­¬ng. Cßn ch×a khãa bÞ giÊu t¹i mét n¬i nµo ®ã trong ®éng.",1,1,22,1831,3200},
			[4] = {"§¸nh b¹i §éc NhÜ","§¸nh b¹i §éc NhÜ lÊy ®­îc ch×a khãa (x¸c suÊt 50%)",1,1,22,1748,3201},
			[5] = {"§¸nh b¹i ThiÕt TÝ","§¸nh b¹i ThiÕt TÝ lÊy ®­îc ch×a khãa (x¸c suÊt 50%)",1,1,22,1757,3313},
			[6] = {"§¸nh b¹i Quû ¶nh","§¸nh b¹i Quû ¶nh lÊy ®­îc ch×a khãa (x¸c suÊt 50%)",1,1,22,1910,3241},
			[7] = {"§¸nh b¹i LÞch QuyÒn","§¸nh b¹i LÞch QuyÒn lÊy ®­îc ch×a khãa (x¸c suÊt 50%)",1,1,22,1833,3148},
			[8] = {"Më R­¬ng lÊy háa KhÝ Phæ","Më R­¬ng lÊy háa KhÝ Phæ",1,1,22,1841,3194},
			[9] = {"Mang háa KhÝ Phæ cho §­êng V©n","Trë vÒ §­êng M«n, ®Õn phßng Háa d­îc (512,324) giao Háa KhÝ phæ cho §­êng V©n, hoµn thµnh nhiÖm vô.",0,1,30,1599,3203},
		},
		[4] = {
			[1] = {"SÏ ®­îc phong lµ: <color=yellow>NhËp C¸c §Ö Tö<color>.<enter>Häc ®­îc vâ c«ng: Hµn B¨ng ThÝch <enter>N¬i tiÕp nhËn nhiÖm vô: §­êng D·<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1:<color> §Õn phßng Y D­îc (515,322) gÆp §­êng D·, nhËn nhiÖm vô.<enter><color=red>B­íc 2:<color> §Õn Thµnh §« -> Thanh Thµnh S¬n, ®i th¼ng vÒ phÝ t©y gÆp C¶nh Tö Kú (230,245). ¤ng ta b¾t b¹n ph¶i v­ît qua mét thö th¸ch lµ ®¸nh b¹i n¨m con gia sóc cña «ng ta lµ: Sãi x¸m (238,244), M·nh Hæ (241,259), Kim TiÒn B¸o (224,247), Heo Rõng (234,236), T«ng Hïng (241,238).<enter><color=red>B­íc 3:<color> Sau khi ®¸nh b¹i n¨m con thó, quay l¹i gÆp C¶nh Tö Kú. C¶nh Tö Kú nhê b¹n t×m c¸ch cøu con g¸i «ng ta ®ang l©m träng bÖnh.<enter><color=red>B­íc 4:<color> Trë l¹i §­êng M«n ®Õn phßng Y D­îc, gÆp §­êng D· . ¤ng ta b¶o cho b¹n biÕt ph­¬ng thuèc ch÷a c¨n bÖnh kú l¹ ®ã.<enter><color=red>B­íc 5:<color> Trë lªn Thanh Thµnh S¬n , t¹i Thanh D­¬ng phong (297,233) ë §«ng B¾c Thanh Thµnh s¬n, ®¸nh b¹i Hung Thó vµ Linh §iªu (316,215), (304,227), (304,218), (308,225), (314,223), H¾c ­ng (297,231) lÊy ®­îc n¨m lo¹i d­îc liÖu: da cña Ve sÇu, gan r¾n ®éc, vá h¹t Anh Tóc, ®u«i rÕt ®éc, ®Çu cña Thiªn t»m.<enter><color=red>B­íc 6:<color> Quay l¹i gÆp C¶nh Tö Kú . C¶nh Tö Kú tá ý hèi hËn v× ®· hiÓu lÇm §­êng D· tr­íc ®©y.<enter><color=red>B­íc 7:<color> Trë l¹i §­êng M«n ®Õn phßng Y D­îc, b¸o l¹i kÕt qu¶ víi §­êng D· . Hoµn thµnh nhiÖm vô"},
			[2] = {"GÆp §­êng D·","§Õn phßng Y D­îc (515,322) gÆp §­êng D·, nhËn nhiÖm vô.",0,1,32,1603,3210},
			[3] = {"GÆp C¶nh Tö Kú","§Õn Thµnh §« -> Thanh Thµnh S¬n, ®i th¼ng vÒ phÝ t©y gÆp C¶nh Tö Kú (230,245). ¤ng ta b¾t b¹n ph¶i v­ît qua mét thö th¸ch lµ ®¸nh b¹i n¨m con gia sóc cña «ng ta lµ: Sãi x¸m (238,244), M·nh Hæ (241,259), Kim TiÒn B¸o (224,247), Heo Rõng (234,236), T«ng Hïng (241,238).",1,1,21,1846,3924},
			[4] = {"§¸nh b¹i Sãi X¸m","§¸nh b¹i Sãi X¸m",1,1,21,1906,3913},
			[5] = {"§¸nh b¹i M·nh Hæ","§¸nh b¹i M·nh Hæ",1,0,21,241,259},
			[6] = {"§¸nh b¹i Kim TiÒn B¸o","§¸nh b¹i Kim TiÒn B¸o",1,1,21,1797,3952},
			[7] = {"§¸nh b¹i Heo Rõng","§¸nh b¹i Heo Rõng",1,1,21,1881,3788},
			[8] = {"§¸nh b¹i T«ng Hïng","§¸nh b¹i T«ng Hïng",1,0,21,241,238},
			[9] = {"Quay l¹i gÆp C¶nh Tö Kú","Sau khi ®¸nh b¹i n¨m con thó, quay l¹i gÆp C¶nh Tö Kú. C¶nh Tö Kú nhê b¹n t×m c¸ch cøu con g¸i «ng ta ®ang l©m träng bÖnh.",1,1,21,1846,3924},
			[10] = {"Trë l¹i §­êng M«n ®Õn phßng Y D­îc, gÆp §­êng D·","Trë l¹i §­êng M«n ®Õn phßng Y D­îc, gÆp §­êng D· . ¤ng ta b¶o cho b¹n biÕt ph­¬ng thuèc ch÷a c¨n bÖnh kú l¹ ®ã.",0,1,32,1603,3210},
			[11] = {"§¸nh b¹i Hung Thó - Täa §é 1","LÊy ®­îc mét trong n¨m lo¹i d­îc liÖu: da cña Ve sÇu, gan r¾n ®éc, vá h¹t Anh Tóc, ®u«i rÕt ®éc, ®Çu cña Thiªn t»m.",1,1,21,2545,3415},
			[12] = {"§¸nh b¹i Hung Thó - Täa §é 2","LÊy ®­îc mét trong n¨m lo¹i d­îc liÖu: da cña Ve sÇu, gan r¾n ®éc, vá h¹t Anh Tóc, ®u«i rÕt ®éc, ®Çu cña Thiªn t»m.",1,1,21,2436,3635},
			[13] = {"§¸nh b¹i Linh §iªu - Täa §é 1","LÊy ®­îc mét trong n¨m lo¹i d­îc liÖu: da cña Ve sÇu, gan r¾n ®éc, vá h¹t Anh Tóc, ®u«i rÕt ®éc, ®Çu cña Thiªn t»m.",1,1,21,2535,3448},
			[14] = {"§¸nh b¹i Linh §iªu - Täa §é 2","LÊy ®­îc mét trong n¨m lo¹i d­îc liÖu: da cña Ve sÇu, gan r¾n ®éc, vá h¹t Anh Tóc, ®u«i rÕt ®éc, ®Çu cña Thiªn t»m.",1,1,21,2434,3492},
			[15] = {"§¸nh b¹i Linh §iªu - Täa §é 3","LÊy ®­îc mét trong n¨m lo¹i d­îc liÖu: da cña Ve sÇu, gan r¾n ®éc, vá h¹t Anh Tóc, ®u«i rÕt ®éc, ®Çu cña Thiªn t»m.",1,1,21,2502,3578},
			[16] = {"§¸nh b¹i H¾c ¦ng","LÊy ®­îc mét trong n¨m lo¹i d­îc liÖu: da cña Ve sÇu, gan r¾n ®éc, vá h¹t Anh Tóc, ®u«i rÕt ®éc, ®Çu cña Thiªn t»m.",1,1,21,2370,3708},
			[17] = {"Quay l¹i gÆp C¶nh Tö Kú","Quay l¹i gÆp C¶nh Tö Kú . C¶nh Tö Kú tá ý hèi hËn v× ®· hiÓu lÇm §­êng D· tr­íc ®©y.",1,1,21,1846,3924},
			[18] = {"Trë l¹i §­êng M«n ®Õn phßng Y D­îc, gÆp §­êng D·","Trë l¹i §­êng M«n ®Õn phßng Y D­îc, b¸o l¹i kÕt qu¶ víi §­êng D· . Hoµn thµnh nhiÖm vô",0,1,32,1603,3210},
		},
		[5] = {
			[1] = {"SÏ ®­îc phong lµ: Tø L·o M«n Nh©n.<enter>Häc ®­îc vâ c«ng: L«i KÝch thuËt<enter>N¬i tiÕp nhËn nhiÖm vô: §­êng Nhµn.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1:<color> §Õn phßng ¸m khÝ (504/317) gÆp §­êng Nhµn, nhËn nhiÖm vô truy t×m bÝ kÝp bÞ mÊt.<enter><color=red>B­íc 2:<color> §Õn phßng NghÞ sù (507/319) gÆp §­êng NhÊt TrÇn , biÕt ®­îc cã 2 kÎ ®¸ng kh¶ nghi.<enter><color=red>B­íc 3:<color> §Õn Thµnh §« -> th«n Giang T©n, gÆp §­êng Nguyªn (430/385). §­êng Nguyªn cho biÕt ®· thÊy §­êng Hßa ®· ®i ®Õn H­ëng Thñy §«ng.<enter><color=red>B­íc 4:<color> §Õn Thµnh §« -> Thanh Thµnh S¬n -> H­ëng Thñy ®éng (214/242) n»m ë cùc t©y cña nói Thanh Thµnh. Vµo ®éng ®¸nh b¹i §­êng Hßa (234/207), biÕt ®­îc ¸m KhÝ phæ ®ang giÊu trong s¬n ®éng.<enter><color=red>B­íc 5:<color> §¸nh b¹i c¸c tªn ®ång ®¶ng cña §­êng Hßa lµ: ThiÕt QuyÒn DiÖm La (232/210; 214/203; 224/201; 246/204) hoÆc ThiÕt Chïy Ma Qu©n (217/205; 234/200). §¸nh b¹i bän chóng sÏ lÊy l¹i ®­îc ¸m KhÝ phæ (X¸c suÊt 50%).<enter><color=red>B­íc 6:<color> Trë l¹i phßng ¸m khÝ, giao ¸m KhÝ phæ cho §­êng Nhµn , hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp §­êng Nhµn","§Õn phßng ¸m khÝ (504,317) gÆp §­êng Nhµn, nhËn nhiÖm vô truy t×m bÝ kÝp bÞ mÊt.",0,1,29,1599,3203},
			[3] = {"GÆp §­êng NhÊt TrÇn","§Õn phßng NghÞ sù (507,319) gÆp §­êng NhÊt TrÇn , biÕt ®­îc cã 2 kÎ ®¸ng kh¶ nghi.",0,1,34,1593,3204},
			[4] = {"GÆp §­êng Nguyªn","§Õn Thµnh §« -> th«n Giang T©n, gÆp §­êng Nguyªn (430,385). §­êng Nguyªn cho biÕt ®· thÊy §­êng Hßa ®· ®i ®Õn H­ëng Thñy §«ng.",0,1,20,3444,6169},
			[5] = {"§¸nh b¹i §­êng Hßa","§Õn Thµnh §« -> Thanh Thµnh S¬n -> H­ëng Thñy ®éng (214,242) n»m ë cùc t©y cña nói Thanh Thµnh. Vµo ®éng ®¸nh b¹i §­êng Hßa (234,207), biÕt ®­îc ¸m KhÝ phæ ®ang giÊu trong s¬n ®éng.",1,0,24,234,207},
			[6] = {"§¸nh b¹i ThiÕt QuyÒn DiÖm La","§¸nh b¹i tªn ®ång ®¶ng cña §­êng Hßa: ThiÕt QuyÒn DiÖm La lÊy l¹i ®­îc ¸m KhÝ phæ (X¸c suÊt 50%)",1,0,24,232,210},
			[7] = {"§¸nh b¹i ThiÕt Chïy Ma Qu©n","§¸nh b¹i tªn ®ång ®¶ng cña §­êng Hßa: ThiÕt Chïy Ma Qu©n lÊy l¹i ®­îc ¸m KhÝ phæ (X¸c suÊt 50%)",1,1,24,1736,3295},
			[8] = {"Giao ¸m KhÝ phæ cho §­êng Nhµn","Trë l¹i phßng ¸m khÝ, giao ¸m KhÝ phæ cho §­êng Nhµn , hoµn thµnh nhiÖm vô.",0,1,29,1599,3203},
		},
		[6] = {
			[1] = {"SÏ ®­îc phong lµ: Thiªn Thñ ThÇn VÖ.<enter>N¬i tiÕp nhËn nhiÖm vô: Ch­ëng M«n §­êng Cöu.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1:<color> §Õn Phßng kh¸ch (508,322) gÆp Ch­ëng m«n §­êng Cõu , nhËn nhiÖm vô thu håi ThÊt Tinh TuyÖt MÖnh KiÕm.<enter><color=red>B­íc 2:<color> §Õn Tróc T¬ ®éng (523,326) (®i cöa bªn ph¶i cña §­êng M«n).<enter><color=red>B­íc 3:<color> T¹i tÇng 1 ®¸nh b¹i tªn M·ng H¸n §Çu LÜnh (189,205; 185,204; 190,202; 192,200; 197,201) sÏ lÊy ®­îc ch×a kho¸ tÇng 2.<enter><color=red>B­íc 4:<color> T¹i tÇng 2 ®¸nh b¹i Tinh Hæ (194,198; 197,201) sÏ lÊy ®­îc ch×a kho¸ lªn tÇng 3.<enter><color=red>B­íc 5:<color> Lªn tÇng 3 cã 2 r­¬ng: trªn vµ d­íi (1 chøa tiÒn, 1 chøa §o¹t Hån KiÕm). Chän r­¬ng ë trªn sÏ lÊy ®­îc ThÊt Tinh TuyÖt MÖnh KiÕm.<enter><color=red>B­íc 6:<color> VÒ giao kiÕm cho Ch­ëng m«n §­êng Cõu lµ hoµn thµnh nhiÖm vô. Cßn nÕu chän nhÇm r­¬ng chøa tiÒn th× vÒ gÆp Ch­ëng m«n §­êng Cõu nép ph¹t 4 v¹n l­îng råi lµm l¹i nhiÖm vô.<enter><color=red>L­u ý:<color><enter>NÕu ®· lªn ®­îc tÇng 2 råi mµ bÞ chÕt th× khi vµo ®éng l¹i cø viÖc lªn tÇng 2, kh«ng cÇn ®¸nh l¹i ë tÇng 1."},
			[2] = {"GÆp Ch­ëng m«n §­êng Cõu","§Õn Phßng kh¸ch (508,322) gÆp Ch­ëng m«n §­êng Cõu , nhËn nhiÖm vô thu håi ThÊt Tinh TuyÖt MÖnh KiÕm.",0,1,33,1617,3191},
			[3] = {"§¸nh b¹i tªn M·ng H¸n §Çu LÜnh","T¹i tÇng 1 Tróc T¬ ®éng ®¸nh b¹i tªn M·ng H¸n §Çu LÜnh sÏ lÊy ®­îc ch×a kho¸ tÇng 2",1,1,26,1512,3290},
			[4] = {"Sö dông ch×a khãa lªn tÇng 2","Sö dông ch×a khãa võa lÊy ®­îc tõ M·ng H¸n §Çu LÜnh më ra lèi lªn tÇng 2 Tróc T¬ §éng.",1,1,26,1597,3216},
			[5] = {"§¸nh b¹i Tinh Hæ","T¹i tÇng 2 ®¸nh b¹i Tinh Hæ (194,198; 197,201) sÏ lÊy ®­îc ch×a kho¸ lªn tÇng 3",1,0,27,194,198},
			[6] = {"Sö dông ch×a khãa lªn tÇng 3","Sö dông ch×a khãa võa lÊy ®­îc tõ Tinh Hæ më ra lèi lªn tÇng 3 Tróc T¬ §éng. Chän r­¬ng ë trªn.",1,1,27,1602,3210},
			[7] = {"GÆp Ch­ëng m«n §­êng Cõu","VÒ giao kiÕm cho Ch­ëng m«n §­êng Cõu lµ hoµn thµnh nhiÖm vô. ",0,1,33,1617,3191},
		},
		[7] = {
			[1] = {"Yªu cÇu: ng­êi ch¬i ®· xuÊt s­, ®¼ng cÊp trªn 60, ch­a gia nhËp bang ph¸i nµo, cã thÓ ®Õn gÆp tr­ëng m«n cña ph¸i giao 5 v¹n l­îng ®Ó trïng ph¶n s­ m«n. Tõ ®ã vÒ sau cã thÓ tïy ý ra vµo s­ m«n.<enter>PhÇn Thuëng:<enter>TiÓu Lý Phi §ao<enter>T¸n Hoa Tiªu<enter>Thiªn La §Þa Vâng<enter>T©m Nh·n<enter>§­îc phong lµm: Lôc C¸c Tr­ëng L·o."},
		},
		[8] = {
			[1] = {"Yªu cÇu: Tõ cÊp 90 trë lªn, danh väng trªn 240 ®iÓm, lµ §­êng M«n ký danh ®Ö tö, tr­íc m¾t ch­a gia nhËp m«n ph¸i nµo.<enter>PhÇn th­ëng:<enter>NhiÕp Hån NguyÖt ¶nh<enter>Cöu Cung Phi TÝnh<enter>B¹o Vò Lª Hoa<enter>Lo¹n Hoµn KÝch<enter>Danh väng ®­îc 30 ®iÓm. (TÊt c¶ c¸c m«n ph¸i kh¸c ®Òu cã thÓ lµm nhiÖm vô nµy ®Ó nhËn phÇn th­ëng ®iÓm danh väng, nh­ng kh«ng häc ®­îc chiªu thøc)<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1: <color>§Õn Thµnh §« -> th«n Giang T©n, gÆp §­êng Nguyªn (430,385), biÕt ®­îc §­êng BÊt NhiÔm cã nh÷ng dÊu hiÖu bÊt th­êng vµ b¹n quyÕt t©m t×m hiÓu cho cÆn kÏ mäi viÖc.<enter><color=red>B­íc 2: <color>§Õn §­êng M«n t¹i phßng TÕ tæ phßng (513,317), gÆp §­êng BÊt NhiÔm... H¾n nhê b¹n chuyÓn dïm 1 bøc th­.<enter><color=red>B­íc 3: <color>§Õn BiÖn Kinh gÆp B¹ch C«ng Tö (207,191) giao th­. H¾n ®äc th­ mét håi råi giao l¹i cho b¹n 1 bøc th­ håi ©m.<enter><color=red>B­íc 4: <color>Quay l¹i §­êng M«n giao th­ cho §­êng BÊt NhiÔm . §¸nh b¹i §­êng BÊt NhiÔm, nhËn quyÓn s¸ch §­êng M«n TuyÖt Häc MËt TÞch. (L­u ý: nÕu nh­ trong lóc ®¸nh, b¹n cã bÞ tö th­¬ng, b¹n vÉn cã thÓ vµo ®¸nh tiÕp, m¸u cña §­êng BÊt NhiÔm vÉn bÞ mÊt nh­ thêi ®iÓm b¹n chÕt).<enter><color=red>B­íc 5: <color>§Õn BiÖn Kinh -> Thiªn NhÉn gi¸o -> tÇng 1 -> tÇng 2 -> tÇng 3 gÆp §oan Méc DuÖ (225,199) giao s¸ch. §oan Méc DuÖ l¹i nhê b¹n göi lêi ®Õn §­êng BÊt NhiÔm.<enter><color=red>B­íc 6: <color>Quay l¹i §­êng M«n gÆp §­êng BÊt NhiÔm, hoµn thµnh nhiÖm vô.<enter>L­u ý:<enter>NÕu ®· lªn ®­îc tÇng 2 råi mµ bÞ chÕt th× khi vµo ®éng l¹i cø viÖc lªn tÇng 2, kh«ng cÇn ®¸nh l¹i ë tÇng 1."},
			[2] = {"GÆp §­êng Nguyªn","§Õn th«n Giang T©n, gÆp §­êng Nguyªn, biÕt ®­îc §­êng BÊt NhiÔm cã nh÷ng dÊu hiÖu bÊt th­êng vµ b¹n quyÕt t©m t×m hiÓu cho cÆn kÏ mäi viÖc.",0,1,20,3444,6169},
			[3] = {"GÆp §­êng BÊt NhiÔm","§Õn §­êng M«n t¹i phßng TÕ tæ phßng, gÆp §­êng BÊt NhiÔm... H¾n nhê b¹n chuyÓn dïm 1 bøc th­.",0,1,36,1595,3189},
			[4] = {"GÆp B¹ch C«ng Tö","§Õn BiÖn Kinh gÆp B¹ch C«ng Tö giao th­. H¾n ®äc th­ mét håi råi giao l¹i cho b¹n 1 bøc th­ håi ©m.",0,1,37,1656,3062},
			[5] = {"Giao th­ cho §­êng BÊt NhiÔm","Quay l¹i §­êng M«n giao th­ cho §­êng BÊt NhiÔm . §¸nh b¹i §­êng BÊt NhiÔm, nhËn quyÓn s¸ch §­êng M«n TuyÖt Häc MËt TÞch.",0,1,36,1595,3189},
			[6] = {"GÆp §oan Méc DuÖ","§Õn Thiªn NhÉn gi¸o tÇng 3 gÆp §oan Méc DuÖ giao s¸ch. §oan Méc DuÖ l¹i nhê b¹n göi lêi ®Õn §­êng BÊt NhiÔm.",0,0,49,225,199},
			[7] = {"GÆp §­êng BÊt NhiÔm","Quay l¹i §­êng M«n gÆp §­êng BÊt NhiÔm, hoµn thµnh nhiÖm vô.",0,1,36,1595,3189},
		},
		[9] = {
			[1] = {"MËt tÞch kü n¨ng 120 cã thÓ ®æi t¹i ch­ëng m«n. <enter>VËt phÈm cÇn thiÕt ®Ó ®æi:<enter>1 quyÓn Bµn Nh­îc T©m Kinh, 1 bé s¸ch kü n¨ng 90 cña m«n ph¸i m×nh, 1 viªn Tinh Hång B¶o Th¹ch vµ 1 viªn Thñy Tinh."},
		},
		[10] = {
			[1] = {"<color=red>B­íc 1: <color>T×m c¸ch vÒ Thµnh §« Phñ, råi ch¹y bé theo h­íng §«ng-Nam ®Ó sang §­êng M«n. §Õn lèi vµo Tróc H¶i Tam Quan, b¹n h·y nãi chuyÖn víi §­êng M«n Tr¸ng §inh thø nhÊt (453,357), vµ xin nhËn lµm ®Ö tö Ký danh, y sÏ nãi cho b¹n biÕt ph¶i lµm g×.<enter><color=red>B­íc 2: <color>ChØ cÇn giÕt 1 trong 3 con §¹i M· HÇu (461,357), (460,354), (455,354) lÊy ®­îc Thanh S¾c Tróc Tr­îng (gËy tróc mµu xanh).<enter><color=red>B­íc 3: <color>Råi ®i tiÕp gÆp §­êng M«n Tr¸ng §inh thø 2 (468,349), tªn nµy sÏ b¾t b¹n gi¶i mét bµi to¸n ma trËn, nÕu b¹n c¶m thÊy khã kh¨n khi gi¶i bµi to¸n nµy h·y tr· lêi nh­ sau: [2-9-4], [7-5-3], [6-1-8]. Gi¶i xong bµi to¸n ®ã, y sÏ tÆng b¹n B¹ch S¾c Tróc Tr­îng (gËy tróc mµu tr¾ng).<enter><color=red>B­íc 4: <color>C¸c h¹ t×m ®Õn tªn §­êng M«n Tr¸ng §inh thø ba (474,342). H¾n sÏ ®­a ra mét sè c©u quÎ cña Khæng Minh cho b¹n gi¶i. (®¸p ¸n: LiÖt ho¶ oanh l«i - M­a giã khëi sinh - Thiªn tai dÞch häa. Sau khi tr¶ lêi xong, y sÏ tÆng b¹n Tö S¾c Tróc Tr­îng (gËy tróc mµu tÝm).<enter><color=red>B­íc 5: <color>Mang c¶ 3 c©y gËy ®ã tíi gÆp tªn §­êng M«n Tr¸ng §inh thø t­ (479,339) vµ giao cho h¾n. Hoµn thµnh nhiÖm vô!"},
			[2] = {"GÆp §­êng M«n Tr¸ng §inh thø nhÊt","§Õn lèi vµo Tróc H¶i Tam Quan, nãi chuyÖn víi §­êng M«n Tr¸ng §inh thø nhÊt , vµ xin nhËn lµm ®Ö tö Ký danh.",1,1,25,3630,5741},
			[3] = {"GiÕt §¹i M· HÇu","ChØ cÇn giÕt 1 trong 3 con §¹i M· HÇu lÊy ®­îc Thanh S¾c Tróc Tr­îng",1,0,25,461,357},
			[4] = {"GÆp §­êng M«n Tr¸ng §inh thø 2","GÆp §­êng M«n Tr¸ng §inh thø 2, tªn nµy sÏ b¾t b¹n gi¶i mét bµi to¸n ma trËn, tr· lêi nh­ sau: [2-9-4], [7-5-3], [6-1-8]. Gi¶i xong ®­îc B¹ch S¾c Tróc Tr­îng.",1,1,25,3749,5599},
			[5] = {"GÆp §­êng M«n Tr¸ng §inh thø 3","GÆp §­êng M«n Tr¸ng §inh thø ba. H¾n sÏ ®­a ra mét sè c©u quÎ cña Khæng Minh. §¸p ¸n: LiÖt ho¶ oanh l«i - M­a giã khëi sinh - Thiªn tai dÞch häa. Sau khi tr¶ lêi xong, y sÏ tÆng b¹n Tö S¾c Tróc Tr­îng",1,1,25,3792,5480},
			[6] = {"GÆp §­êng M«n Tr¸ng §inh thø t­","Mang c¶ 3 c©y gËy ®ã tíi gÆp tªn §­êng M«n Tr¸ng §inh thø t­ vµ giao cho h¾n. Hoµn thµnh nhiÖm vô!",0,0,25,479,339},
		},
	},
	[3] = { --Ngu doc OK
		[1] = {
			[1] = {"SÏ ®­îc phong lµ: §o¹t Hån T¸n Nh©n. Häc ®­îc vâ c«ng: Ngò §éc §ao ph¸p, Ngò §éc Ch­ëng ph¸p, Cöu Thiªn Cuång L«i. N¬i tiÕp nhËn nhiÖm vô: MÆc Thï tr¹i, chñ tr¹i §éc Nha."},
			[2] = {"GÆp Tang Chu","",0,1,186,1599,3193},
			[3] = {"NhÖn 1 (Thu thËp ®ñ 10 con)","",1,1,195,716,2920},
			[4] = {"NhÖn 2 (Thu thËp ®ñ 10 con)","",1,1,195,713,3048},
			[5] = {"NhÖn 3 (Thu thËp ®ñ 10 con)","",1,1,195,726,3169},
			[6] = {"NhÖn 4 (Thu thËp ®ñ 10 con)","",1,1,195,790,3126},
			[7] = {"Mua 10 bao tÝn th¹ch","",0,1,174,1574,3255},
			[8] = {"Quay vÒ gÆp Tang Chu","",0,1,186,1599,3193},
		},
		[2] = {
			[1] = {"SÏ ®­îc phong lµ: Th«i MÖnh Sø gi¶. Häc ®­îc vâ c«ng: XÝch DiÖm Thùc Thiªn, T¹p Nan D­îc Kinh, N¬i tiÕp nhËn nhiÖm vô: Ng©n ThiÒm tr¹i chñ B¹ch Doanh Doanh."},
			[2] = {"GÆp B¹ch Doanh Doanh","",0,1,188,1602,3189},
			[3] = {"S¾c Quû 1 (Thu thËp 7 ®Çu ng­êi)","",1,1,179,1962,2661},
			[4] = {"S¾c Quû 2 (Thu thËp 7 ®Çu ng­êi)","",1,1,179,1976,2724},
			[5] = {"S¾c Quû 3 (Thu thËp 7 ®Çu ng­êi)","",1,1,179,1932,2706},
			[6] = {"S¾c Quû 4 (Thu thËp 7 ®Çu ng­êi)","",1,1,179,1851,2557},
			[7] = {"S¾c Quû 5 (Thu thËp 7 ®Çu ng­êi)","",1,1,179,1809,2599},
			[8] = {"S¾c Quû 6 (Thu thËp 7 ®Çu ng­êi)","",1,1,179,1828,2666},
			[9] = {"S¾c Quû 7 (Thu thËp 7 ®Çu ng­êi)","",1,1,179,1859,2712},
			[10] = {"GÆp B¹ch Doanh Doanh","",0,1,188,1602,3189},
		},
		[3] = {
			[1] = {"SÏ ®­îc phong lµ: H¾c ¸m Diªm La. Häc ®­îc vâ c«ng: U Minh Kh« L©u, V« H×nh §éc, B¸ch ®éc Xuyªn T©m, B¨ng Lam HuyÒn Tinh. N¬i tiÕp nhËn nhiÖm vô: XÝch YÕt tr¹i chñ §å DÞ."},
			[2] = {"GÆp §å DÞ","",0,1,184,1599,3197},
			[3] = {"§¸nh b¹i Ph¶n TÆc (lÊy Méc H­¬ng §Ønh)","",1,1,193,1170,2928},
			[4] = {"Giao l¹i cho §å DÞ","",0,1,184,1599,3197},
			[5] = {"§¸nh Ph¶n TÆc §Çu Môc (lÊy Méc H­¬ng §Ønh thËt)","",1,1,193,1170,2928},
			[6] = {"Giao cho §å DÞ","",0,1,184,1599,3197},
		},
		[4] = {
			[1] = {"SÏ ®­îc phong lµ: V« §éng La S¸t. Häc ®­îc vâ c«ng: V¹n §éc Thùc T©m, Xuyªn Y Ph¸ Gi¸p. N¬i tiÕp nhËn nhiÖm vô: Kim Xµ tr¹i chñ V©n BÊt Tµ."},
			[2] = {"GÆp V©n BÊt Tµ","",0,1,185,1607,3200},
			[3] = {"§Õn HiÖu thuèc (Mua X¹ H­¬ng)","",0,1,80,1771,3079},
			[4] = {"§¸nh Nh·n KÝnh V­¬ng M·ng Xµ (B¾t 1 con)","",1,1,183,944,2240},
			[5] = {"GÆp V©n BÊt Tµ","",0,1,185,1607,3200},
		},
		[5] = {
			[1] = {"SÏ ®­îc phong lµ: C« §éc T«n Gi¶. Häc ®­îc vâ c«ng: Xuyªn T©m §éc Thø. N¬i tiÕp nhËn nhiÖm vô: Thanh Ng« tr¹i chñ Thang BËt."},
			[2] = {"GÆp Thang BËt","",0,1,187,1598,3192},
			[3] = {"L­u KhÊu 1 (lÊy tin tøc vÒ Ngäc San H«","",1,1,194,1835,3215},
			[4] = {"L­u KhÊu 2 (lÊy tin tøc vÒ Ngäc San H«","",1,1,194,1561,2816},
			[5] = {"§¸nh tªn C­êng §¹o (lÊy Ngäc San H«)","",1,1,182,1896,3464},
			[6] = {"Giao cho Thang BËt","",0,1,187,1598,3192},
		},
		[6] = {
			[1] = {"SÏ ®­îc phong lµ: U Minh Quû Sø. N¬i tiÕp nhËn nhiÖm vô: Gi¸o chñ Ngò §éc gi¸o H¾c DiÖn Lang Qu©n."},
			[2] = {"GÆp H¾c DiÖn Lang Qu©n","",0,1,189,1606,3189},
			[3] = {"§¸nh Nh¹n ®¨ng ph¸i ®Ö tö (§Õn khi ch­ëng m«n xuÊt hiÖn, ®¸nh b¹i ch­ëng m«n lÊy Tõ §éc Chu)","",1,1,196,1648,2944},
			[4] = {"GÆp H¾c DiÖn Lang Qu©n","",0,1,189,1606,3189},
		},
		[7] = {
			[1] = {"GÆp H¾c DiÖn Lang Qu©n nép tiÒn"},
			[2] = {"GÆp H¾c DiÖn Lang Qu©n","",0,1,189,1606,3189},
		},
		[8] = {
			[1] = {"Cã b¸n trong Kú Tr©n C¸c"},
		},
		[9] = {
			[1] = {"Cã b¸n trong Kú Tr©n C¸c"},
		},
		[10] = {
			[1] = {"Ch­a hoµn thiÖn"},
		},
	},
	[4] = { --Nga Mi. OK
		[1] = {
			[1] = {"SÏ ®­îc phong lµ: <color=yellow>Vò Y Ni<color>.<enter>Häc ®­îc vâ c«ng:<color=yellow>Nga My KiÕm ph¸p<color>, <color=yellow>Nga My Ch­ëng ph¸p<color><enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1: <color>§Õn TiÒn ®iÖn (238,310) gÆp DiÖu Èn , tiÕp nhËn nhiÖm vô gióp c« Êy hµn g¾n chiÕc g­¬ng ®ång.<enter><color=red>B­íc 2: <color>Xuèng nói, t×m DiÖu Èn t­íng c«ng (241,328), nhÊp vµo lêi tho¹i, nhËn ®­îc nöa miÕng g­¬ng cßn l¹i.<enter><color=red>B­íc 3: <color>§Õn Thµnh §« gÆp thî rÌn (388,320).<enter><color=red>B­íc 4: <color>§Ó hai miÕng g­¬ng l¹i chç ng­êi thî rÌn, ®i t×m L­îng Ng©n Kho¸ng trong rõng phÝa t©y Thµnh §« (378,303; 379,299; 386,302; 386,300; 375,301; 375,297; 370,299). ChØ cÇn lÊy 1 viªn.<enter><color=red>B­íc 5: <color>Giao L­îng Ng©n Kho¸ng cho thî rÌn, nhËn ®­îc tÊm g­¬ng ®· söa xong.<enter><color=red>B­íc 6: <color>Trë vÒ Nga My ph¸i gÆp DiÖu Èn.<enter><color=red>B­íc 7: <color>Xuèng nói, gÆp DiÖu Èn t­íng c«ng , truyÒn lêi cña DiÖu Èn.<enter><color=red>B­íc 8: <color>Trë vÒ Nga My ph¸i, gÆp DiÖu Èn , hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp DiÖu ¢n","§Õn TiÒn ®iÖn gÆp DiÖu Èn , tiÕp nhËn nhiÖm vô gióp c« Êy hµn g¾n chiÕc g­¬ng ®ång",0,1,16,1604,3170},
			[3] = {"T×m DiÖu Èn t­íng c«ng","Xuèng nói, t×m DiÖu Èn t­íng c«ng, nhËn ®­îc nöa miÕng g­¬ng cßn l¹i.",1,1,13,1927,5260},
			[4] = {"T×m thî rÌn Thµnh §«","§Õn Thµnh §« gÆp thî rÌn",0,0,11,388,320},
			[5] = {"§i lÊy L­îng Ng©n Kho¸ng","§Ó hai miÕng g­¬ng l¹i chç ng­êi thî rÌn, ®i t×m L­îng Ng©n Kho¸ng trong rõng phÝa t©y Thµnh §«, ChØ cÇn lÊy 1 viªn",1,0,11,378,303},
			[6] = {"Giao L­îng Ng©n Kho¸ng cho thî rÌn","Giao L­îng Ng©n Kho¸ng cho thî rÌn, nhËn ®­îc tÊm g­¬ng ®· söa xong.",0,0,11,388,320},
			[7] = {"GÆp DiÖu ¢n","Trë vÒ Nga My ph¸i gÆp DiÖu Èn.",0,1,16,1604,3170},
			[8] = {"T×m DiÖu Èn t­íng c«ng","Xuèng nói, gÆp DiÖu Èn t­íng c«ng , truyÒn lêi cña DiÖu Èn..",1,1,13,1927,5260},
			[9] = {"GÆp DiÖu ¢n","Trë vÒ Nga My ph¸i gÆp DiÖu Èn.",0,1,16,1604,3170},
		},
		[2] = {
			[1] = {"SÏ ®­îc phong lµ: <color=yellow>CÈm Y Ni<color>.<enter>Häc ®­îc vâ c«ng: <color=yellow>Tõ Hµng Phæ §é<color><enter>N¬i tiÕp nhËn nhiÖm vô: Gi¶ng Kinh §­êng, DiÖu Nh­.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1: <color>§Õn Gi¶ng Kinh ®­êng (240,307) gÆp DiÖu Nh­, tiÕp nhËn nhiÖm vô thu phôc M·nh hæ.<enter><color=red>B­íc 2: <color>§Õn M·nh Hæ huyÖt ®éng phÝa sau nói, trong ®ã cã ba con B¹ch Hæ (Hæ Tr¾ng) (222,199; 225,201; 222,202), ph¶i ®¸nh ba con nµy liªn tôc ba lÇn, sÏ khuÊt phôc ®­îc chóng.<enter><color=red>B­íc 3: <color>Trë vÒ Gi¶ng Kinh ®­êng gÆp DiÖu Nh­ phôc mÖnh, hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp DiÖu Nh­","§Õn Gi¶ng Kinh ®­êng gÆp DiÖu Nh­, tiÕp nhËn nhiÖm vô thu phôc M·nh hæ",0,1,15,1586,3199},
			[3] = {"§Õn M·nh Hæ huyÖt ®éng","§Õn M·nh Hæ huyÖt ®éng phÝa sau nói, trong ®ã cã ba con B¹ch Hæ, ph¶i ®¸nh ba con nµy liªn tôc ba lÇn, sÏ khuÊt phôc ®­îc chóng.",1,1,14,1784,3197},
			[4] = {"GÆp DiÖu Nh­","Trë vÒ Gi¶ng Kinh ®­êng gÆp DiÖu Nh­ phôc mÖnh, hoµn thµnh nhiÖm vô",0,1,15,1586,3199},
		},
		[3] = {
			[1] = {"SÏ ®­îc phong lµ: B¹ch Liªn Tiªn Tö.<enter>Häc ®­îc vâ c«ng:<enter>Th«i Song Väng NguyÖt<enter>Tø T­îng §ång Quy<enter>Méng §iÖp<enter>N¬i tiÕp nhËn nhiÖm vô: Môc V©n Tõ.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1: <color>§Õn phÝa sau HËu ®iÖn (242,305), gÆp Môc V©n Tõ, tiÕp nhËn nhiÖm vô.<enter><color=red>B­íc 2: <color>§Õn tiÖm t¹p hãa ë Thµnh §« (386,321) mua ch©n gµ<enter><color=red>B­íc 3: <color>§Õn phÝa sau nói, t×m thÊy mét ®Çm n­íc, ®¸nh b¹i n¨m con Th»n L»n Chóa (297,302; 327,294; 312,304; 324,298; 311,300) sÏ cøu ®­îc Háa Hå (X¸c suÊt 50%). Háa Hå sÏ ph¸n ®o¸n xem b¹n cã ch©n gµ hay kh«ng, nÕu cã th× b¹n cøu nã thµnh c«ng. NÕu b¹n kh«ng cã ch©n gµ th× xem nh­ ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu.<enter><color=red>B­íc 4: <color>Trë vÒ giao Háa Hå giao cho Môc V©n Tõ hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp Môc V©n Tõ","§Õn phÝa sau HËu ®iÖn, gÆp Môc V©n Tõ, tiÕp nhËn nhiÖm vô",0,1,13,1937,4893},
			[3] = {"§Õn tiÖm t¹p hãa ë Thµnh §«","§Õn tiÖm t¹p hãa ë Thµnh §« mua ch©n gµ",0,1,11,3095,5137},
			[4] = {"§¸nh Th»n L»n Chóa","§Õn phÝa sau nói, t×m thÊy mét ®Çm n­íc, ®¸nh b¹i Th»n L»n Chóa cøu ®­îc Háa Hå (X¸c suÊt 50%).NÕu cã ch©n gµ th× b¹n cøu nã thµnh c«ng. NÕu b¹n kh«ng cã ch©n gµ th× xem nh­ ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu",1,0,13,297,302},
			[5] = {"GÆp Môc V©n Tõ","Trë vÒ giao Háa Hå giao cho Môc V©n Tõ hoµn thµnh nhiÖm vô.",0,1,13,1937,4893},
		},
		[4] = {
			[1] = {"SÏ ®­îc phong lµ: Thanh Liªn Tiªn Tö.<enter>Häc ®­îc vâ c«ng: L­u Thñy<enter>N¬i tiÕp nhËn nhiÖm vô: T¶ Thiªn ®iÖn <color=yellow>B¸i NguyÖt Tiªn Tö<color> T« Tõ Hinh.<enter>C¸c b­íc thùc hiÖn nhiÖm vô<enter><color=red>B­íc 1: <color>§Õn T¶ Thiªn ®iÖn (246,304) gÆp T« Tõ Hinh, tiÕp nhËn nhiÖm vô t×m B¹ch §iÓu TriÒu Phông khóc phæ.<enter><color=red>B­íc 2: <color>§Õn Thµnh §« -> Thanh Thµnh S¬n -> ThÇn Tiªn §éng. Vµo trong ®éng t×m Cao nh©n (234,204), «ng ta sÏ yªu cÇu B¹n ®¸nh b¹i con Linh thó (235,203).<enter><color=red>B­íc 3: <color>Sau khi ®¸nh b¹i nã, b¹n l¹i nhÊp vµo lêi tho¹i víi Cao nh©n. ¤ng ta yªu cÇu b¹n mang bøc tranh Phï Dung CÈm Kª ®Õn ®æi khóc phæ.<enter><color=red>B­íc 4: <color>§Õn Th¸i B×nh Tiªu Côc ë Thµnh §« phñ, gÆp «ng chñ Tiªu Côc (376,316), nhÊp vµo lêi tho¹i, «ng ta yªu cÇu b¹n t×m Linh X¹ H­¬ng nang, ¦ng T×nh Hé Th©n phï vµ BÝch Tû Giíi ChØ, sÏ giao Phï Dung CÈm Kª.<enter><color=red>B­íc 5: <color>Vµo trong thµnh ®i t×m ba ng­êi, b¹n sÏ lÊy ®­îc ba mãn b¶o vËt nãi trªn :<enter>- Linh X¹ H­¬ng nang: §Õn Thµnh §« t×m TiÕt TiÓu muéi (383,315), nhÊp vµo lêi tho¹i, TiÕt TiÓu muéi yªu cÇu b¹n mang Ng©n thiÒm (Tr©m cµi) ®Õn ®æi. §Õn tiÖm t¹p hãa mua Ng©n thiÒm (386,321) víi gi¸ 200 l­îng. Trë l¹i gÆp TiÕt TiÓu muéi, dïng Ng©n thiÒm (Tr©m cµi) ®æi H­¬ng nang. <enter>- ¦ng T×nh Hé Th©n phï: T×m gÆp Tõ V©n Ph¸p S­ t¹i TÝn T­íng tù (403,319) ë Thµnh §« phñ, lÇn l­ît tr¶ lêi ba c©u hái, sÏ nhËn ®­îc ¦ng T×nh Hé Th©n phï. (§¸p ¸n lÇn l­ît lµ: B, D, C). NÕu nh­ ®¸p sai, b¹n cã thÓ nhÊp vµo lêi tho¹i ®Ó thùc hiÖn l¹i. <enter>- BÝch Tû Giíi ChØ: §Õn Thµnh §« t×m T©n Viªn Ngo¹i (400,309), tr¶ lêi hai c©u hái sÏ nhËn ®­îc BÝch Tû Giíi ChØ (§¸p ¸n lµ : B, C). NÕu nh­ ®¸p sai, b¹n cã thÓ nhÊp vµo lêi tho¹i ®Ó thùc hiÖn l¹i.<enter><color=red>B­íc 6: <color>Trë l¹i Th¸i B×nh Tiªu Côc ë Thµnh §« phñ, giao Linh X¹ H­¬ng nang, ¦ng T×nh Hé Th©n phï vµ BÝch Tû Giíi ChØ ®Ó ®æi Phï Dung CÈm Kª.<enter><color=red>B­íc 7: <color>Trë vÒ ThÇn Tiªn ®éng, gÆp Cao nh©n, nhÊp vµo lêi tho¹i, dïng Phï Dung CÈm Kª ®æi B¸ch §iÓu TriÒu Phong.<enter><color=red>B­íc 8: <color>Trë vÒ Nga My ph¸i, ®Õn T¶ Thiªn ®iÖn gÆp T« Tõ Hinh, giao B¸ch §iÓu TriÒu Phong, hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp T« Tõ Hinh","§Õn T¶ Thiªn ®iÖn gÆp T« Tõ Hinh, tiÕp nhËn nhiÖm vô t×m B¹ch §iÓu TriÒu Phông khóc phæ.",0,1,18,1603,3190},
			[3] = {"T×m  Cao nh©n","§Õn Thµnh §« -> Thanh Thµnh S¬n -> ThÇn Tiªn §éng. Vµo trong ®éng t×m Cao nh©n, «ng ta sÏ yªu cÇu B¹n ®¸nh b¹i con Linh thó. Sau khi ®¸nh b¹i nã, b¹n l¹i nhÊp vµo lêi tho¹i víi Cao nh©n. ¤ng ta yªu cÇu b¹n mang bøc tranh Phï Dung CÈm Kª ®Õn ®æi khóc phæ.",1,0,23,234,204},
			[4] = {"GÆp «ng chñ Tiªu Côc","§Õn Th¸i B×nh Tiªu Côc ë Thµnh §« phñ, gÆp «ng chñ Tiªu Côc, nhÊp vµo lêi tho¹i, «ng ta yªu cÇu b¹n t×m Linh X¹ H­¬ng nang, ¦ng T×nh Hé Th©n phï vµ BÝch Tû Giíi ChØ, sÏ giao Phï Dung CÈm Kª.",0,1,11,3012,5060},
			[5] = {"T×m TiÕt TiÓu muéi","§Õn Thµnh §« t×m TiÕt TiÓu muéi (383,315), nhÊp vµo lêi tho¹i, TiÕt TiÓu muéi yªu cÇu b¹n mang Ng©n thiÒm (Tr©m cµi) ®Õn ®æi",0,1,11,3068,5048},
			[6] = {"§Õn tiÖm t¹p hãa mua Ng©n thiÒm","§Õn tiÖm t¹p hãa mua Ng©n thiÒm (386,321) víi gi¸ 200 l­îng.",0,1,11,3096,5136},
			[7] = {"Trë l¹i gÆp TiÕt TiÓu muéi","Trë l¹i gÆp TiÕt TiÓu muéi, dïng Ng©n thiÒm (Tr©m cµi) ®æi H­¬ng nang.",0,1,11,3068,5048},
			[8] = {"T×m gÆp Tõ V©n Ph¸p S­","T×m gÆp Tõ V©n Ph¸p S­ t¹i TÝn T­íng tù (403,319) ë Thµnh §« phñ, lÇn l­ît tr¶ lêi ba c©u hái, sÏ nhËn ®­îc ¦ng T×nh Hé Th©n phï",0,1,11,3223,5108},
			[9] = {"T×m T©n Viªn Ngo¹i","§Õn Thµnh §« t×m T©n Viªn Ngo¹i (400,309), tr¶ lêi hai c©u hái sÏ nhËn ®­îc BÝch Tû Giíi ChØ (§¸p ¸n lµ : B, C)",0,1,11,3202,4951},
			[10] = {"Trë l¹i Th¸i B×nh Tiªu Côc","Trë l¹i Th¸i B×nh Tiªu Côc ë Thµnh §« phñ, giao Linh X¹ H­¬ng nang, ¦ng T×nh Hé Th©n phï vµ BÝch Tû Giíi ChØ ®Ó ®æi Phï Dung CÈm Kª.",0,1,11,3012,5060},
			[11] = {"Trë l¹i gÆp Cao nh©n","Trë vÒ ThÇn Tiªn ®éng, gÆp Cao nh©n, nhÊp vµo lêi tho¹i, dïng Phï Dung CÈm Kª ®æi B¸ch §iÓu TriÒu Phong.",1,0,23,234,204},
			[12] = {"Trë vÒ gÆp T« Tõ Hinh","Trë vÒ Nga My ph¸i, ®Õn T¶ Thiªn ®iÖn gÆp T« Tõ Hinh, giao B¸ch §iÓu TriÒu Phong, hoµn thµnh nhiÖm vô.",0,1,18,1603,3190},
		},
		[5] = {
			[1] = {"SÏ ®­îc phong lµ: T¸n Hoa Thiªn N÷. Häc ®­îc vâ c«ng: PhËt T©m Tõ H÷u, N¬i tiÕp nhËn nhiÖm vô: Ch¸nh ®iÖn, Ch­ëng m«n Thanh HiÓu S­ Th¸i."},
			[2] = {"GÆp Thanh HiÓu S­ Th¸i","",0,1,17,1595,3207},
			[3] = {"GÆp Tõ V©n Ph¸p S­","",0,1,11,3222,5107},
			[4] = {"§¸nh b¹i Ph¶n T¨ng §Çu Môc cøu Tõ H¶i §¹i S­","",1,1,12,1841,3181},
			[5] = {"GÆp Thanh HiÓu S­ Th¸i","",0,1,17,1595,3207},
		},
		[6] = {
			[1] = {"SÏ ®­îc phong lµ: Th¸nh N÷. N¬i tiÕp nhËn nhiÖm vô: Ch¸nh ®iÖn, Ch­ëng m«n Thanh HiÓu S­ Th¸i."},
			[2] = {"GÆp Thanh HiÓu S­ Th¸i","",0,1,17,1595,3207},
			[3] = {"§¸nh Thanh Hßa lÊy Yªn Ngäc ChØ Hoµn","",1,1,9,2111,5992},
			[4] = {"GÆp Thanh HiÓu S­ Th¸i","",0,1,17,1595,3207},
		},
		[7] = {
			[1] = {"Yªu cÇu: ng­êi ch¬i ®· xuÊt s­, ®¼ng cÊp trªn 60, ch­a gia nhËp bang ph¸i nµo, cã thÓ ®Õn gÆp tr­ëng m«n cña ph¸i giao 5 v¹n l­îng ®Ó trïng ph¶n s­ m«n. Tõ ®ã vÒ sau cã thÓ tïy ý ra vµo s­ m«n. PhÇn Thuëng: BÊt DiÖt BÊt TuyÖt, PhËt Quang Phæ ChiÕu, Phan ¢m Ph¹n X­íng, PhËt Ph¸p V« Biªn. §­îc phong lµm:Kim §Ønh Th¸nh N÷."},
		},
		[8] = {
			[1] = {"Yªu cÇu: Tõ cÊp 90 trë lªn, danh väng trªn 240 ®iÓm, lµ Nga My ký danh ®Ö tö, tr­íc m¾t ch­a gia nhËp m«n ph¸i nµo. PhÇn th­ëng: Tam Nga TÕ NguyÖt, Phong S­¬ng To¸i ¶nh, Phæ §é Chóng Sinh. Danh väng ®­îc 30 ®iÓm."},
			[2] = {"GÆp Tiªu Bµ Bµ","",0,1,11,3109,5011},
			[3] = {"§¸nh D¹ Xoa, lÊy V« Tù Thiªn Th­","",1,1,23,1669,3164},
			[4] = {"GÆp Tiªu Bµ Bµ","",0,1,11,3109,5011},
			[5] = {"GÆp Thanh HiÓu S­ Th¸i","",0,1,17,1595,3207},
			[6] = {"GÆp Tiªu Bµ Bµ","",0,1,11,3109,5011},
			[7] = {"GÆp Thanh HiÓu S­ Th¸i","",0,1,17,1595,3207},
		},
		[9] = {
			[1] = {"Kü n¨ng cÊp 120 cã thÓ mua trong kú tr©n c¸c"},
		},
		[10] = {
			[1] = {"NhiÖm vô ký danh ®Ö tö ph¸i Nga My. Ph¶i xuÊt s­ míi cã thÓ lµm nhiÖm vô nµy."},
			[2] = {"GÆp DiÖp B¨ng Hµn. §¸p ¸n 3-3-1","",1,1,13,1916,5320},
			[3] = {"GÆp TÇn Kú Phong. §¸p ¸n 3-1-2","",1,1,13,1817,5157},
			[4] = {"GÆp Hµ Linh Phiªu. §¸p ¸n 1-2-3","",1,1,13,1836,5126},
			[5] = {"GÆp T¹ V©n La","",1,1,13,1775,5145},
			[6] = {"§¸nh b¹i Vò Y Ni lÊy B¹ch Ngäc Nh­ ý","",1,1,13,1733,5116},
			[7] = {"GÆp DiÖu TrÇn","",1,1,13,1845,5010},
		},
	},
	[5] = { --Thuy yen OK
		[1] = {
			[1] = {"SÏ ®­îc phong lµ: Tam PhÈm Hoa Sø. Häc ®­îc vâ c«ng: Thóy Yªn §ao Ph¸p, Thóy Yªn Song §ao. N¬i tiÕp nhËn nhiÖm vô: Chñ phßng, Ch­ëng m«n Do·n Hµm Yªn.\n<color=red>B­íc 1<color>: §Õn Chñ phßng <color=yellow>(35/75)<color> gÆp Ch­ëng m«n Do·n Hµm Yªn , tiÕp nhËn nhiÖm vô truy t×m c©y Tr©m bÞ thÊt l¹c.\n<color=red>B­íc 2<color>: §Õn khu rõng phÝa §«ng cña Thuý Yªn, b¹n h·y ®¸nh nh÷ng con Hång Hå (C¸o ®á) <color=yellow>(83/105; 90/99; 82/ 99; 87/ 97)<color> lÊy ®­îc Thóy Vò Tr©m.\n<color=red>B­íc 3<color>: Mang Thóy Vò Tr©m vÒ giao cho Ch­ëng m«n Do·n Hµm Yªn, hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp Do·n Hµm Yªn","",0,1,161,1591,3203},
			[3] = {"§¸nh b¹i C¸o §á","",1,1,154,667,1691},
			[4] = {"Trë vÒ giao Thóy Vò Tr©m cho Do·n Hµm Yªn","",0,1,161,1591,3203},
		},
		[2] = {
			[1] = {"SÏ ®­îc phong lµ: NhÞ PhÈm Hoa Sø. Häc ®­îc vâ c«ng: B¨ng T©m Tr¸i ¶nh. N¬i tiÕp nhËn nhiÖm vô: Thiªn §iÖn, Yªn HiÓu Tr¸i..\n<color=red>B­íc 1<color>: §Õn Thñ Ngäc §×nh <color=yellow>(43/90)<color> gÆp Yªn HiÓu Tr¸i , tiÕp nhËn nhiÖm vô ®i h¸i hoa. (M¹n §µ La Hoa lµ mét lo¹i hoa kÞch ®éc, v× vËy néi trong thêi gian quy ®Þnh ph¶i h¸i ®ñ ®em vÒ ®Ó ®­îc ch­ëng m«n gi¶i ®éc, nÕu kh«ng b¹n sÏ chÕt).\n<color=red>B­íc 2<color>: §i vÒ h­íng T©y B¾c (bªn tr¸i gÇn Mª Cung cÊm ®Þa), h·y h¸i 10 ®ãa §¹i M¹n §µ La hoa (56/59; 55/63; 72/42; 69/53; 61/48; 73/47; 80/43; 72/39; 66/39; 63/40). Khi b¹n b¾t ®Çu h¸i ®ãa hoa ®Çu tiªn th× thêi gian tróng ®éc cña b¹n b¾t ®Çu ®­îc tÝnh. Tróng ®éc chia lµm bèn giai ®o¹n, mçi giai ®o¹n lµ 30 phót.\n<color=red>B­íc 3<color>: Mçi giai ®o¹n bÞ tróng ®éc, hÖ thèng ®Òu ph¸t ra th«ng b¸o cho ng­êi ch¬i biÕt, sau khi giai ®o¹n thø t­ kÕt thóc, ng­êi ch¬i sÏ bÞ chÕt. Lóc nµy b¹n sÏ ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu. Tr­íc khi giai ®o¹n thø t­ kÕt thóc, b¹n ph¶i ®i t×m Yªn HiÓu Tr¸i ®Ó ®­îc gi¶i ®éc vµ tÝnh sè l­îng hoa. Néi trong thêi gian h¹n ®Þnh b¹n h¸i ®ñ 10 ®ãa hoa ®em vÒ giao th× míi hoµn thµnh ®­îc nhiÖm vô.\nMang ®ñ 10 ®ãa hoa vÒ cho Yªn HiÓu Tr¸i , hoµn thµnh nhiÖm vô."},
			[2] = {"GÆp Yªn HiÓu Tr¸i","",0,1,160,1593,3195},
			[3] = {"§Õn n¬i h¸i §¹i M¹n §µ La Hoa 1","",1,0,154,56,59},
			[4] = {"§Õn n¬i h¸i §¹i M¹n §µ La Hoa 2","",1,1,154,446,1020},
			[5] = {"§Õn n¬i h¸i §¹i M¹n §µ La Hoa 3","",1,1,154,579,680},
			[6] = {"§Õn n¬i h¸i §¹i M¹n §µ La Hoa 4","",1,0,154,69,53},
			[7] = {"§Õn n¬i h¸i §¹i M¹n §µ La Hoa 5","",1,0,154,60,49},
			[8] = {"§Õn n¬i h¸i §¹i M¹n §µ La Hoa 6","",1,1,154,587,769},
			[9] = {"§Õn n¬i h¸i §¹i M¹n §µ La Hoa 7","",1,0,154,80,43},
			[10] = {"§Õn n¬i h¸i §¹i M¹n §µ La Hoa 8","",1,0,154,72,39},
			[11] = {"§Õn n¬i h¸i §¹i M¹n §µ La Hoa 9","",1,0,154,66,39},
			[12] = {"§Õn n¬i h¸i §¹i M¹n §µ La Hoa 10","",1,1,154,509,648},
			[13] = {"Trë vÒ giao cho Yªn HiÓu Tr¸i","",0,1,160,1593,3195},
		},
		[3] = {
			[1] = {"SÏ ®­îc phong lµ: <color=yellow>NhÊt PhÈm Hoa Sø<color>. Häc ®­îc vâ c«ng: <color=yellow>Vò §¶ Lª Hoa, Phï V©n Tµn TuyÕt<color>. N¬i tiÕp nhËn nhiÖm vô: <color=yellow>B¸ch Hoa ®iÖn, Hµ Mé TuyÕt<color>.<enter><color=red>B­íc 1<color>: §Õn B¸ch Hoa §iÖn <color=yellow>(53/85)<color> gÆp <color=yellow>Hµ Mé TuyÕt<color>, tiÕp nhËn nhiÖm vô.<enter><color=red>B­íc 2<color>: §Õn <color=yellow>§¹i Lý<color> t×m <color=yellow>§oµn L·o H¸n (189/204)<color>, võa gÆp th× thÊy <color=yellow>§oµn L·o H¸n<color> ®ang khãc lãc ®au buån, biÕt ®­îc con g¸i l·o bÞ <color=yellow>Thæ PhØ<color> b¾t ®i.<enter><color=red>B­íc 3<color>: §i vÒ phÝa t©y thµnh, ®Õn §iÓm Th­¬ng S¬n, ®i vµo Thæ phØ s¬n ®éng <color=yellow>(232/172)<color>, giÕt tªn Thæ phØ <color=yellow>(232/193)<color> b¹n cã thÓ cøu ®­îc con g¸i cña §oµn L·o H¸n nh­ng x¸c suÊt rÊt thÊp.<enter><color=red>B­íc 4<color>: Trë l¹i gÆp <color=yellow>§oµn L·o H¸n<color>, nhÊp vµo lêi tho¹i, biÕt ®­îc cÇn ph¶i ®i t×m ba lo¹i d­îc liÖu.<enter><color=red>B­íc 5<color>: §Õn BÕn Tµu t×m mét ThuyÒn gia <color=yellow>(204/183)<color>, bá 1000 l­îng mua ®­îc vµi con Ng©n TuyÕt Ng­.<enter><color=red>B­íc 6<color>: Vµo Thµnh §¹i Lý ®Õn suèi Hå §iÖp, sÏ thÊy hai con b­ím BÝch Th­êng Phông §iÖp <color=yellow>(184/196)<color>, b¹n chØ cÇn nhÊp chuét vµo mét con, sÏ thÊy xuÊt hiÖn dßng ch÷ <color=yellow>NhËn ®­îc BÝch Th­êng Phông §iÖp<color>, b¹n chØ cÇn lÊy mét con lµ ®ñ.<enter><color=red>B­íc 7<color>: §Õn V©n Léng §×nh, t×m mét con Th»n l»n ®á <color=yellow>(182/197)<color>, nhÊp chuét vµo nã, sÏ thÊy xuÊt hiÖn dßng ch÷: <color=yellow>NhËn ®­îc th»n l»n ®á<color> (SÏ h¬i khã t×m v× nã bi m¸i ®×nh che khuÊt), b¹n chØ cÇn lÊy mét con lµ ®ñ.<enter><color=red>B­íc 8<color>: Sau khi t×m ®­îc ba lo¹i d­îc liÖu trªn, trë vÒ Thóy Yªn m«n, giao cho Hµ Mé TuyÕt, hoµn thµnh nhiÖm vô."},
			[2] = {"§Õn B¸ch Hoa §iÖn gÆp Hµ Mé TuyÕt","",0,1	,155,	1586,	3205},
			[3] = {"§Õn §¹i Lý t×m §oµn L·o Ho¸n","",	0,	1,	162,	1512,	3277},
			[4] = {"Vµo Thæ PhØ S¬n §éng giÕt Thæ PhØ cøu con g¸i §oµn L·o Ho¸n","",	1,	1,	170,	1858,	3094},
			[5] = {"Trë l¹i gÆp §oµn L·o Ho¸n","",	0,	1	,162,	1512,	3277},
			[6] = {"§Õn bÕn tµu mua Ng©n TuyÕt Ng­ cña ThuyÒn Gia","",	1,	1,	162,	1640,	2935},
			[7] = {"§Õn suèi Hå §iÖp thµnh §¹i Lý b¾t BÝch Th­êng Phông §iÖp","",	0,	1,	162,	1472,	3145},
			[8] = {"§Õn V©n Léng §×nh b¾t Th»n L»n §á","",	0,	1,	162,	1459,	3146},
			[9] = {"Quay trë vÒ gÆp Hµ Mé TuyÕt","",	0,	1,	155,	1586,	3205},
		},
		[4] = {
			[1] = {"SÏ ®­îc phong lµ: Hoa ThÇn Sø Gi¶. Häc ®­îc vâ c«ng: <color=yellow>Hé ThÓ Hµn B¨ng<color>. N¬i tiÕp nhËn nhiÖm vô: Thiªn §iÖn, Yªn HiÓu Tr¸i.<enter><color=red>B­íc 1<color>: §Õn Thñ Ngäc §×nh (43/90) gÆp Yªn HiÓu Tr¸i, tiÕp nhËn nhiÖm vô ®i cøu nh÷ng c« g¸i bÞ ¸c b¸ b¾t ®i.<enter><color=red>B­íc 2<color>: §Õn §¹i Lý, t×m nhµ tªn ¸c b¸ (206/200), trong nhµ sÏ kh«ng cã ai, trong s©n b¹n sÏ ph¸t hiÖn ra mét lèi ®i vµo mËt ®¹o. §i vµo trong MËt ®¹o ®¸nh b¹i nh÷ng tªn ¸c b¸ ®¶ thñ (223/199; 201/204; 197/195), ph¸t hiÖn ra ¸c b¸ ®· mang nh÷ng c« g¸i kia lªn §iÓm Th­¬ng S¬n.<enter><color=red>B­íc 3<color>: LËp tøc lªn §iÓm Th­¬ng S¬n, tiÕn vµo §iÓm Th­¬ng ®éng (210/195), bªn trong lµ mét mª cung cã rÊt nhiÒu <color=yellow>§¶ Thñ<color>\n\t\t\t-T¹i tÇng mét b¹n ®¸nh b¹i hai tªn ¸c B¸ B¶o Tiªu (199/191; 186/189), lÊy ®­îc chiÕc ch×a khãa thø nhÊt (X¸c suÊt 50%).\n\t\t\t- T¹i tÇng thø hai ®¸nh hai tªn ¸c B¸ Hé ViÖn (193/190; 186/195), lÊy ®­îc chiÕc ch×a khãa thø hai (X¸c suÊt 40%).\n\t\t\t- Lªn tÇng thø ba ®¸nh mét tªn ¸c B¸ §¶ Thñ (197/185; 196/186), lÊy ®­îc chiÕc ch×a khãa thø ba (X¸c suÊt 30%).<enter><color=red>B­íc 4<color>: Sau khi lÊy ®ñ ba chiÕc ch×a khãa, nhÊp chuét vµo c¬ quan (197/186), hÖ thèng sÏ xuÊt hiÖn dßng ch÷ <color=yellow>¸c B¸ ®· qu¸ sî b¹n nªn bá trèn råi ! H·y dïng ba chiÕc ch×a khãa më '¸m ThÊt' cøu c¸c c« g¸i ra<color>.<enter><color=red>B­íc 5<color>: Trë vÒ Thóy Yªn m«n gÆp Yªn HiÓu Tr¸i phôc mÖnh, hoµn thµnh nhiÖm vô."},
			[2] = {"§Õn Thñ Ngäc §×nh gÆp Yªn HiÓu Tr¸i","",	0,	1,	160,	1593,	3195},
			[3] = {"§Õn ¸c B¸ gia ®Þa ®¹o tiªu diÖt ¸c B¸ §¶ Thñ","",	1,	1,	163,	1789,	3195},
			[4] = {"Tiªu diÖt ¸c B¸ B¶o Tiªu","",	1,	0,	171,	199,	191},
			[5] = {"Tiªu diÖt ¸c B¸ Hé ViÖn","",	1,	1,	172,	1550,	3040},
			[6] = {"Tiªu diÖt ¸c B¸ §¶ Thñ t¹i tÇn 3 §iÓm Th­¬ng §éng","",	1,	1,	173,	1582,	2966},
			[7] = {"Dïng 3 ch×a khãa më c¬ quan","",	1,	1,	173,	1582,	2966},
			[8] = {"Trë vÒ gÆp Yªn HiÓu Tr¸i","",	0,	1,	160,	1593,	3195},
		},
		[5] = {
			[1] = {"SÏ ®­îc phong lµ: Hoa Tinh. Häc ®­îc vâ c«ng: <color=yellow>TuyÕt ¶nh<color>. N¬i tiÕp nhËn nhiÖm vô: Ch­ëng m«n Do·n Hµm Yªn.<enter><color=red>B­íc 1<color>: §Õn Chñ phßng (35/75) gÆp Ch­ëng m«n Do·n Hµm Yªn , tiÕp nhËn nhiÖm vô gióp H­ Viªn ph­¬ng tr­îng ®o¹t l¹i Vò §ång Quan ¢m.<enter><color=red>B­íc 2<color>: §Õn §¹i Lý tr­íc mÆt Sïng Th¸nh tù lµ Thiªn TÇm th¸p. GÆp H­ Viªn ph­¬ng tr­îng (219/196), nhÊp vµo lêi tho¹i.<enter><color=red>B­íc 3<color>: §i Vµo Thiªn TÇm Th¸p, Mçi tÇng chØ cÇn ®¸nh mét tªn trém b¶o tÆc. TÇng 1 (214/193), TÇng 2 (195/202), TÇng 3 (198/200), sau khi ®¸nh b¹i hÕt ba tªn sÏ lÊy l¹i ®­îc Vò §ång Quan ¢m .<enter><color=red>B­íc 4<color>: Mang Vò §ång Quan ¢m VÒ cho H­ Viªn ph­¬ng tr­îng.<enter><color=red>B­íc 5<color>: Trë l¹i Thóy Yªn m«n gÆp Ch­ëng m«n Do·n Hµm Yªn phôc mÖnh, hoµn thµnh nhiÖm vô."},
			[2] = {"§Õn chñ phßng gÆp Do·n Hµm Yªn","",	0,	1,	161,	1591,	3203},
			[3] = {"§Õn §¹i Lý gÆp H­ Viªn Ph­¬ng Tr­îng","",	0,	1,	162,	1750,	3136},
			[4] = {"Tiªu diÖt Trém B¶o TÆc t¹i tÇng 1 Thiªn T©m Th¸p","",	1,	1,	164,	1710,	3088},
			[5] = {"Tiªu diÖt Trém B¶o TÆc t¹i tÇng 2 Thiªn T©m Th¸p","",	1,	1,	165	,1558,	3232},
			[6] = {"Tiªu diÖt Trém B¶o TÆc t¹i tÇng 3 Thiªn T©m Th¸p","",	1,	1,	166,	1582,	3200},
			[7] = {"Mang Vò §ång Quan ¢m cho H­ Viªn Ph­¬ng Tr­îng","",	0,	1,	162,	1750,	3136},
			[8] = {"Trë vÒ gÆp Do·n Hµm Yªn","",	0,	1,	161,	1591,	3203},
		},
		[6] = {
			[1] = {"SÏ ®­îc phong lµ: Hoa Tiªn. N¬i tiÕp nhËn nhiÖm vô: Xu©n Hoa Bµ Bµ.<enter><color=red>B­íc 1<color>: §Õn HËu Hoa Viªn (40/74) gÆp Xu©n Hoa Bµ Bµ, tiÕp nhËn nhiÖm vô ®iÒu tra sù thËt trong cÊm ®Þa Thóy Yªn m«n.<enter><color=red>B­íc 2<color>: §Õn §Çm Ngäc n÷ sÏ thÊy lèi vµo CÊm §Þa s¬n ®éng (78/78).<enter><color=red>B­íc 3<color>: Vµo CÊm §Þa s¬n ®éng, ®¸nh hai tªn Th¶o khÊu (187/193; 209/175), lÊy ®­îc mét chiÕc kh¨n t¬ (X¸c suÊt rÊt thÊp).<enter><color=red>B­íc 4<color>: §i vµo trong gÆp mét «ng giµ (228/191) nhËn 1 bøc th­.<enter><color=red>B­íc 5<color>: Quay l¹i giao th­ cho Xu©n Hoa Bµ Bµ.<enter><color=red>B­íc 6<color>: Sau ®ã ®Õn Chñ phßng (35/75) gÆp Ch­ëng m«n Do·n Hµm Yªn, hoµn thµnh nhiÖm vô."},
			[2] = {"§Õn hËu hoa viªn gÆp Xu©n Hoa Bµ Bµ","",	0,	0,	154,	40,	74},
			[3] = {"Tiªu diÖt th¶o khÊu t¹i cÊm ®Þa s¬n ®éng lÊy kh¨n t¬","",	1,	1,	158,	1504,	3098},
			[4] = {"NhËn bøc th­ tõ mét «ng giµ","",	1,	1,	158,	1832,	3066},
			[5] = {"Quay l¹i gÆp Xu©n Hoa Bµ Bµ","",	0,	0,	154,	40,	74},
			[6] = {"GÆp tr­ëng m«n Do·n Hµm Yªn","",	0,	1,	161,	1591,	3203},
		},
		[7] = {
			[1] = {"SÏ ®­îc phong lµ: Hoa ThÇn. Häc ®­îc vâ c«ng: <color=yellow>Môc D· L­u Tinh, BÝch H¶i TriÒu Sinh, B¨ng Cèt TuyÕt T©m<color>. N¬i tiÕp nhËn nhiÖm vô: Ch­ëng m«n Do·n Hµm Yªn.<enter><color=yellow>Yªu cÇu<color>: ng­êi ch¬i ®· xuÊt s­, ®¼ng cÊp trªn 60, ch­a gia nhËp bang ph¸i nµo, cã thÓ ®Õn gÆp tr­ëng m«n cña ph¸i giao 5 v¹n l­îng ®Ó trïng ph¶n s­ m«n. Tõ ®ã vÒ sau cã thÓ tïy ý ra vµo s­ m«n."},
		},
		[8] = {
			[1] = {"Kü n¨ng cÊp 90 cã thÓ mua t¹i cöa hµng tinh lùc hay kú tr©n c¸c"},
		},
		[9] = {
			[1] = {"Kü n¨ng 120 cã thÓ mua t¹i kú tr©n c¸c"},
		},
		[10] = {
			[1] = {"Chøc n¨ng ch­a ph¸t triÓn"},
		},
	},
	[6] = { --Cai bang OK
		[1] = {
			[1] = {"SÏ ®­îc phong lµ: ChÊp §¹i §Ö tö. Häc ®­îc vâ c«ng: C¸i Bang Bæng ph¸p, C¸i Bang Ch­ëng ph¸p. N¬i tiÕp nhËn nhiÖm vô: Bang chñ Hµ Nh©n Ng·.<enter><color=red>Chó ý<color>§èi tho¹i víi Tóy B¸n Tiªn ®øng c¹nh «ng chñ Töu LÇu ®¸p ¸n CBD"},
			[2] = {"§Õn gÆp Bang chñ Hµ Nh©n Ng·","§Õn gÆp Bang chñ Hµ Nh©n Ng· (191/231), tiÕp nhËn nhiÖm vô ®i mua r­îu.",0,1,115,1527,3706},
			[3] = {"§Õn Töu lÇu (mua 4 lo¹i r­îu, cÇn ng©n l­îng)","§Õn Töu lÇu ë D­¬ng Ch©u, gÆp «ng chñ töu ®iÕm (216/189), nhÊp vµo lêi tho¹i. Mua ®­îc bèn lo¹i r­îu , duy chØ cã HuÖ TuyÒn töu th× võa b¸n cho Tóy B¸n Tiªn mÊt råi!",0,1,80,1731,3033},
			[4] = {"GÆp Tóy b¸n tiªn (ngay bªn c¹nh - ®¸p ¸n B-C-D)","",0,1,80,1731,3033},
			[5] = {"Mang 5 lo¹i r­îu vÒ cho Hµ Nh©n Ng·","Mang n¨m lo¹i r­îu vÒ giao cho Bang chñ Hµ Nh©n Ng· , hoµn thµnh nhiÖm vô.",0,1,115,1527,3706},
		},
		[2] = {
			[1] = {"SÏ ®­îc phong lµ: ChÊp B¸t §Ö tö. Häc ®­îc vâ c«ng: Hãa HiÓm Vi Di. N¬i tiÕp nhËn nhiÖm vô: §Ö tö C¸i Bang."},
			[2] = {"GÆp ®Ö tö c¸i bang","",0,1,115,1477,3575},
			[3] = {"§¸nh b¹i M¹nh ViÔn Tµi","",1,1,115,1529,3040},
			[4] = {"GÆp M¹nh Th­¬ng L­¬ng","",0,1,115,1555,3792},
		},
		[3] = {
			[1] = {"SÏ ®­îc phong lµ: ChÊp Bæng §Ö tö. Häc ®­îc vâ c«ng: Gi¸ng Long Ch­ëng, §¶ CÈu TrËn. N¬i tiÕp nhËn nhiÖm vô: Ch­ëng Bæng Tr­ëng l·o La Khu«ng Sinh."},
			[2] = {"GÆp La Khu«ng Sinh","",0,1,115,1520,3616},
			[3] = {"T×m TriÖu §µ Chñ","",0,0,80,213,177},
			[4] = {"§¸nh b¹i Kim Binh (cøu ®Ö tö c¸i bang)","",1,1,92,1832,2487},
			[5] = {"T×m TriÖu §µ Chñ (nhËn V¨n Th­)","",0,0,80,213,177},
			[6] = {"Giao cho La Khu«ng Sinh","",0,1,115,1520,3616},
		},
		[4] = {
			[1] = {"SÏ ®­îc phong lµ: Long §Çu §Ö tö. Häc ®­îc vâ c«ng: Ho¹t BÊt L­u Thñ, N¬i tiÕp nhËn nhiÖm vô: TruyÒn C«ng Tr­ëng l·o Ngôy LiÔu ¤ng.<enter><color=red>Chó ý<color>§¸nh Kim Quèc ThÝch Kh¸ch cho tíi khi nhËn ThÝch s¸t mËt hµm"},
			[2] = {"§Õn gÆp Ngôy LiÔu ¤ng","",0,1,115,1530,3867},
			[3] = {"§¸nh b¹i Kim Quèc ThÝch Kh¸ch 1 (lÊy ThÝch s¸t mËt hµm - tû lÖ thÊp)","",1,0,180,226,183},
			[4] = {"§¸nh b¹i Kim Quèc ThÝch Kh¸ch 2 (lÊy ThÝch s¸t mËt hµm - tû lÖ thÊp)","",1,0,180,178,195},
			[5] = {"VÒ gÆp Ngôy LiÔu ¤ng","",0,1,115,1529,3866},
			[6] = {"GÆp Tr­¬ng TuÊn","",0,1,80,1608,3154},
			[7] = {"Trë l¹i gÆp Ngôy LiÔu ¤ng","",0,1,115,1529,3866},
		},
		[5] = {
			[1] = {"SÏ ®­îc phong lµ: §¹i Long §Çu. Häc ®­îc vâ c«ng: Bæng §¶ ¸c CÈu, Hµng Long H÷u Hèi. N¬i tiÕp nhËn nhiÖm vô: Bang chñ Hµ Nh©n Ng·.<enter><color=red>Chó ý<color> Sau khi vµo ®­îc Hoµng Cung, tù ch¹y ®Õn 202 200 ®Ó vµo mËt thÊt, ®Õn 210 187 ®Ó ®­a ®Þa ®å cho Tµo C«ng C«ng.<enter><enter>Sau khi ph¸t hiÖn Tµo C«ng C«ng lµ néi gi¸n, quay l¹i mËt ®¹o, nhÊp nãi chuyÖn víi Tµo C«ng C«ng råi míi quay ra ®¸nh §éi Tr­ëng VÖ Binh, thÊy cã th«ng b¸o <color=red>(®¸nh ng· tªn vÖ sÜ hoµng cung ®ang b¶o vÖ tµo c«ng c«ng)<color> th× nãi chuyÖn víi Tµo C«ng C«ng."},
			[2] = {"§Õn gÆp Bang chñ Hµ Nh©n Ng·","",0,1,115,1527,3706},
			[3] = {"GÆp vÖ binh hoµng cung L©m An (bÞ ng¨n l¹i kh«ng cho vµo)","",0,1,176,1634,3203},
			[4] = {"T×m Tr­¬ng Tu©n","",0,1,176,1482,3416},
			[5] = {"Trë l¹i gÆp vÖ binh hoµng cung L©m An","",0,1,176,1634,3203},
			[6] = {"Sau khi ®­a ®Þa ®å cho Tµo C«ng C«ng, trë vÒ gÆp Tr­¬ng TuÊn","",0,1,176,1482,3416},
			[7] = {"§ót lãt TiÓu Th¸i Gi¸m ®Ó vµo Hoµng Cung","",0,1,176,1634,3203},
			[8] = {"§¸nh b¹i Tµo C«ng C«ng råi quay vÒ t×m Tr­¬ng Tu©n","",0,1,176,1482,3416},
			[9] = {"§Õn gÆp Bang chñ Hµ Nh©n Ng·","",0,1,115,1527,3706},
		},
		[6] = {
			[1] = {"SÏ ®­îc phong lµ: Tiªu Dao ThÇn C¸i. N¬i tiÕp nhËn nhiÖm vô: Ch­ëng B¸t Tr­ëng l·o Tõ Tam Tr­îng.<enter><color=red>Chó ý<color> : ë nhiÖm vô nµy, ë c¸c r­¬ng cÇn ch×a khãa ®Ó më, b¹n cã thÓ ®¸nh b¹i qu¸i vËt t­¬ng øng ®Ó nhËn ch×a khãa nhiÒu lÇn. VÝ dô: sau khi ®· më r­¬ng b¹n cã thÓ quay l¹i ®¸nh Hæ QuyÒn lÇn n÷a ®Ó lÊy ch×a khãa ra më r­¬ng, cho ®Õn khi b¹n nhËn ®­îc 2 c¸i tói th× th«i.<enter>T©ng 1 : §¸nh Hæ QuyÒn më r­¬ng cho ®Õn khi lÊy ®­îc 2 tói v¶i<enter>T©ng 2 cã 2 r­¬ng nh­ng chØ lÊy ®­îc 1 tói v¶i hoÆc kh«ng lÊy ®­îc tói nµo. T©ng 5 NhiÒu nhÊt lÊy ®­îc 2 tói v¶i. "},
			[2] = {"GÆp Tõ Tam Tr­îng","",0,1,115,1512,3790},
			[3] = {"T1 ®¸nh b¹i Hæ QuyÒn (lÊy ch×a khãa - max 2 c¸i)","",1,1,116,1711,3016},
			[4] = {"T1 më r­¬ng Hæ QuyÒn. Max 2 tói","",1,1,116,1775,3087},
			[5] = {"T2 kh«ng cÇn ch×a më r­¬ng 1. T2 2 r­¬ng max 1 tói","",1,1,117,1615,3131},
			[6] = {"T2 kh«ng cÇn ch×a më r­¬ng 2. T2 2 r­¬ng max 1 tói","",1,1,117,1688,3022},
			[7] = {"T4 kh«ng cÇn ch×a më r­¬ng 1. R­¬ng 1&2 max 2 tói","",1,1,119,1518,3122},
			[8] = {"T4 kh«ng cÇn ch×a më r­¬ng 2. R­¬ng 1&2 max 2 tói","",1,1,119,1526,3192},
			[9] = {"T4 ®¸nh b¹i VËt H¹c Hµnh (lÊy ch×a khãa)","",1,1,119,1511,3301},
			[10] = {"T4 më r­¬ng (lÊy tói råi quay l¹i ®¸nh H¹c Hµnh lÊy ch×a khãa 2). Max 2 tói","",1,1,119,1504,3327},
			[11]= {"T5 ®¸nh b¹i XÝch diÖm (lÊy ch×a khãa)","",1,1,120,1757,3041},
			[12]= {"T5 më r­¬ng 1. Max 2 tói","",1,1,120,1738,3024},
			[13]= {"T5 më r­¬ng 2. Max 2 tói","",1,1,120,1696,3051},
			[14] = {"§ñ 9 tói v¶i vÒ gÆp Tõ Tam Tr­îng","",0,1,115,1512,3790},
		},
		[7] = {
			[1] = {"Yªu cÇu: ng­êi ch¬i ®· xuÊt s­, ®¼ng cÊp trªn 60, ch­a gia nhËp bang ph¸i nµo, cã thÓ ®Õn gÆp tr­ëng m«n cña ph¸i giao 5 v¹n l­îng ®Ó trïng ph¶n s­ m«n. Tõ ®ã vÒ sau cã thÓ tïy ý ra vµo s­ m«n. Tiªu Diªu C«ng, Tóy §iÖp Cuång Vò. §­îc phong lµm:Cöu §¹i Tr­ëng L·o."},
		},
		[8] = {
			[1] = {"Yªu cÇu: Tõ cÊp 90 trë lªn, danh väng trªn 240 ®iÓm, lµ C¸i Bang ký danh ®Ö tö, tr­íc m¾t ch­a gia nhËp m«n ph¸i nµo (Ch÷ ®á). Häc ®­îc Phi Long T¹i Thiªn, Thiªn H¹ V« CÈu. Danh väng ®­îc 30 ®iÓm. (TÊt c¶ c¸c m«n ph¸i kh¸c ®Òu cã thÓ lµm nhiÖm vô nµy ®Ó nhËn phÇn th­ëng ®iÓm danh väng, nh­ng kh«ng häc ®­îc chiªu thøc).<enter><color=red>Chó ý<color> Sau khi ®¸nh b¹i ®¸m cao thñ cøu ®­îc Giíi V« Tµ råi ph¶i nãi chuyÖn víi nã th× míi quay vÒ gÆp La Khu«ng Sinh"},
			[2] = {"GÆp Giíi V« Tµ",""},
			[3] = {"Mua HuÖ TuyÒn Töu",""},
			[4] = {"Mang r­îu cho Giíi V« Tµ",""},
			[5] = {"GÆp La Khu«ng Sinh",""},
			[6] = {"Quay trë l¹i gÆp Giíi V« Tµ",""},
			[7] = {"Cøu ®­îc Giíi V« Tµ, quay vÒ gÆp La Khu«ng Sinh",""},
		},
		[9] = {
			[1] = {"Kü n¨ng cÊp 120 cã thÓ mua trong Kú Tr©n C¸c"},
		},
		[10] = {
			[1] = {"NhiÖm vô ký danh ®Ö tö"},
			[2] = {"GÆp Tõ Tam Tr­îng","",0,1,115,1512,3790},
			[3] = {"GÆp LiÔu §¹i Gia, nãi vÒ chuyÖn Con Ch¸u","",0,1,80,1666,3220},
			[4] = {"NhiÖm Thiªn Nhai, nãi vÒ chuyÖn C«ng Danh","",0,1,80,1769,3124},
			[5] = {"Nh­ ý, nãi vÒ t­íng m¹o","",0,1,80,1689,3085},
			[6] = {"T«n Viªn Ngo¹i, nãi vÒ Tµi Phóc","",0,1,80,1621,3051},
			[7] = {"GÆp Tõ Tam Tr­îng","",0,1,115,1512,3790},
		},
	},
	[7] = { --Thien nhan
		[1] = {
			[1] = {"SÏ ®­îc phong lµ: V« ¶nh S¸t Thñ. Häc ®­îc vâ c«ng: Thiªn NhÉn §ao ph¸p, Thiªn NhÉn M©u ph¸p, Háa PhÇn Liªn Hoa. N¬i tiÕp nhËn nhiÖm vô: Háa §­êng §­êng chñ Ngét Ng¹o."},
			[2] = {"GÆp Ngét Ng¹o","",0,1,49,1642,3156},
			[3] = {"Tö tï 1 (lÊy LÖnh bµi 1)","",1,1,50,1500,3259},
			[4] = {"Tö tï 2 (lÊy LÖnh bµi 2)","",1,1,50,1495,3183},
			[5] = {"Tö tï 3 (lÊy LÖnh bµi 3)","",1,1,50,1569,3187},
			[6] = {"Tö tï 4 (lÊy LÖnh bµi 4)","",1,1,50,1569,3257},
			[7] = {"Tö tï 5 (lÊy LÖnh bµi 5)","",1,1,50,1526,3144},
			[8] = {"Tö tï 6 (lÊy LÖnh bµi 6)","",1,1,50,1601,3214},
			[9] = {"Tö tï 7 (lÊy LÖnh bµi 7)","",1,1,50,1533,3219},
			[10] = {"GÆp Ngét Ng¹o","",0,1,49,1642,3156},
		},
		[2] = {
			[1] = {"SÏ ®­îc phong lµ: Tö SÜ. Häc ®­îc vâ c«ng: ¶o ¶nh Phi Hå. N¬i tiÕp nhËn nhiÖm vô: NhËt NguyÖt §µn Chñ ¤ Hîp T¸t."},
			[2] = {"GÆp ¤ Hîp T¸t (®¸p ¸n lµ H­íng xuèng ®Êt)","",1,1,45,1604,3181},
			[3] = {"gÆp bÐ trai (®¸p ¸n Anh Hai)","",1,1,45,1709,3251},
			[4] = {"T×m con chã nhá","",1,1,45,1685,3063},
			[5] = {"T×m con la x¸m","",1,1,45,1568,3123},
			[6] = {"gÆp bÐ trai (®æi NhËt nguyÖt song lu©n)","",1,1,45,1709,3251},
			[7] = {"Mang vÒ cho ¤ Hîp T¸t","",1,1,45,1604,3181},
		},
		[3] = {
			[1] = {"SÏ ®­îc phong lµ: U Minh Tö SÜ. Häc ®­îc vâ c«ng: Phi Hång V« TÝch, LiÖt Háa T×nh Thiªn, LiÖt Th«i S¬n §iÒn H¶i. N¬i tiÕp nhËn nhiÖm vô: Phong ®­êng ®­êng chñ: Hoµn Nhan TuyÕt Y."},
			[2] = {"GÆp Hoµn Nhan TuyÕt Y","",0,1,49,1708,3226},
			[3] = {"T×m N«ng phu (mua V©n Méng Tö)","",1,1,7,2373,2530},
			[4] = {"Trém b¶o tÆc 1 (lÊy C¸p huyÕt hång)","",1,1,8,1465,3255},
			[5] = {"Trém b¶o tÆc 2 ( lÊy B¨ng tinh lam)","",1,1,8,1676,3358},
			[6] = {"Trém b¶o tÆc 3 (lÊy Tæ mÉu lôc)","",1,1,8,1610,3207},
			[7] = {"Mang vÒ cho Hoµn Nhan TuyÕt Y","",0,1,49,1708,3226},
		},
		[4] = {
			[1] = {"SÏ ®­îc phong lµ: Ch­ëng Kú Sø. Häc ®­îc vâ c«ng: Bi T« Thanh Phong. N¬i tiÕp nhËn nhiÖm vô: H÷u Hé ph¸p Gia LuËt TÞ Li."},
			[2] = {"GÆp Gia LuËt TÞ Li","",0,1,49,1657,3032},
			[3] = {"§¸nh LiÖu Kú (lÊy Thiªn NhÉn mËt hµm)","",1,1,6,1570,3241},
			[4] = {"Giao l¹i cho Gia LuËt TÞ Li","",0,1,49,1657,3032},
		},
		[5] = {
			[1] = {"SÏ ®­îc phong lµ: Hé Gi¸o Sø. Häc ®­îc vâ c«ng: LÖ Ma §o¹t Hån. N¬i tiÕp nhËn nhiÖm vô: T¶ Hé ph¸p §oan Méc DuÖ."},
			[2] = {"GÆp §oan Méc DuÖ","",0,1,49,1800,3184},
			[3] = {"§¸nh §ao binh ®éi tr­ëng (lÊy ch×a khãa)","",1,1,38,1729,3033},
			[4] = {"Më r­¬ng tÇng 1 (®Ó më c¬ quan lªn tÇng 2)","",1,1,38,1665,3246},
			[5] = {"NhÊn vµo c¬ quan (®Ó lªn tÇng 2)","",1,1,38,1705,3131},
			[6] = {"§¸nh §ao binh thèng lÜnh (lÊy ch×a khãa)","",1,1,39,1734,3128},
			[7] = {"Më r­¬ng tÇng 2 (®Ó më c¬ quan lªn tÇng 3)","",1,1,39,1639,3201},
			[8] = {"NhÊn vµo c¬ quan (®Ó lªn tÇng 3)","",1,1,39,1688,3028},
			[9] = {"§¸nh Tæng binh (lÊy ch×a khãa)","",1,1,40,1626,3149},
			[10] = {"Më r­¬ng tÇng 3 (cøu Phông HÊp Nh­)","",1,1,40,1688,3019},
			[11] = {"Trë vÒ gÆp §oan Méc DuÖ","",0,1,49,1800,3184},
		},
		[6] = {
			[1] = {" "},
			[2] = {"GÆp Hoµn Nhan Hång LiÖt","",0,1,49,1721,3129},
			[3] = {"GÆp Khóc ThiÕt T­îng","",0,1,37,1746,3052},
			[4] = {"Mang ng©n tr©m cho Tr­¬ng qu¶ phô","",0,1,37,1707,3198},
			[5] = {"VÒ gÆp Khóc ThiÕt T­îng (lÊy YÓm NhËt KiÕm)","",0,1,37,1746,3052},
			[6] = {"GÆp T«n Tó Tµi (®¸p ¸n b-c-a-b-a) lÊy §o¹n Thñy KiÕm","",0,1,37,1834,2953},
			[7] = {"GÆp con b¹c (mua ChuyÓn Ph¸ch KiÕm víi gi¸ 500 l­îng)","",0,1,37,1608,3118},
			[8] = {"GÆp §«ng Mai","",0,1,37,1837,3053},
			[9] = {"GÆp TiÓu H¶i","",0,1,37,1762,3072},
			[10] = {"Quay l¹i §«ng Mai b¸o tin (lÊy Khø Tµ KiÕm)","",0,1,37,1837,3053},
			[11] = {"§Õn gÆp ¨n mµy (cho tiÒn 3 lÇn sÏ lÊy ®­îc DiÖt Hån KiÕm)","",0,1,37,1685,2998},
			[12] = {"Mang 5 thanh kiÕm vÒ cho Hoµn Nhan Hång LiÖt (sau ®ã tù ch¹y tíi cöa th¸nh ®éng ngay sau)","",0,1,49,1721,3129},
			[13] = {"NhÖn tinh","",1,1,51,1603,3188},
			[13] = {"§éc xµ tinh","",1,1,51,1878,3206},
			[13] = {"RÕt tinh","",1,1,51,1678,3112},
			[13] = {"NhÖn tinh","",1,1,51,1839,3166},
			[13] = {"Bß c¹p chóa (lÊy ch×a khãa th¸nh ®éng)","",1,1,52,1796,3106},
			[13] = {"Më r­¬ng (lÊy quyÓn s¸ch da dª)","",1,1,52,1865,3159},
			[13] = {"GÆp Hoµn Nhan Hång LiÖt","",0,1,49,1721,3129},
		},
		[7] = {
			[1] = {"Yªu cÇu: ng­êi ch¬i ®· xuÊt s­, ®¼ng cÊp trªn 60, ch­a gia nhËp bang ph¸i nµo, cã thÓ ®Õn gÆp tr­ëng m«n cña ph¸i giao 5 v¹n l­îng ®Ó trïng ph¶n s­ m«n. Tõ ®ã vÒ sau cã thÓ tïy ý ra vµo s­ m«n. PhÇn th­ëng: Th©u Thiªn Ho¸n NhËt, Ma DiÖm ThÊt S¸t, Thiªn Ma Gi¶i ThÕ. §­îc phong lµm:Th¸nh Gi¸o Tr­ëng L·o."},
		},
		[8] = {
			[1] = {"Cã b¸n trong kú tr©n c¸c"},
		},
		[9] = {
			[1] = {"Cã b¸n trong Kú tr©n c¸c"},
		},
		[10] = {
			[1] = {"Cã b¸n trong Kú tr©n c¸c"},
		},
	},
	[8] = { --Vo dang OK
		[1] = {
			[1] = {"SÏ ®­îc phong lµ: Nhµn T¸n §¹o Nh©n. Häc ®­îc vâ c«ng: Vâ §ang KiÕm Ph¸p, Vâ §ang QuyÒn Ph¸p. N¬i tiÕp nhËn nhiÖm vô: Tö Tiªu §¹i §iÖn, §¹o NhÊt Ch©n Nh©n."},
			[2] = {"GÆp §¹o NhÊt Ch©n Nh©n","",0,1,84,1598,3183},
			[3] = {"GÆp DiÖp TiÕp Mü (ChØ cÇn nhÊp vµo nãi chuyÖn)","",0,1,81,1703,3041},
			[4] = {"Tr¶ lêi §¹o NhÊt Ch©n Nh©n (C,B,B)","",0,1,84,1598,3183},
		},
		[2] = {
			[1] = {"SÏ ®­îc phong lµ: Thanh Tu §¹o Nh©n. Häc ®­îc vâ c«ng: ThÊt Tinh TrËn. N¬i tiÕp nhËn nhiÖm vô: Phô MÉu §iÖn, §µo Th¹ch M«n."},
			[2] = {"GÆp §µo Th¹ch M«n","",0,1,86,1605,3187},
			[3] = {"§¸nh Sãi §á 1 (LÊy Thiªn T»m Bµo r¸ch)","§Õn khi nhËn ®­îc Thiªn T»m §¹o Bµo r¸ch",1,1,83,1510,3050},
			[4] = {"§¸nh Sãi §á 2 (LÊy Thiªn T»m Bµo r¸ch)","§Õn khi nhËn ®­îc Thiªn T»m §¹o Bµo r¸ch",1,1,83,1642,2899},
			--[5] = {"§¸nh Sãi §á 3","§Õn khi nhËn ®­îc Thiªn T»m §¹o Bµo r¸ch",1,1,83,1750,3182},
			--[6] = {"§¸nh Sãi §á 4","§Õn khi nhËn ®­îc Thiªn T»m §¹o Bµo r¸ch",1,1,83,1680,3043},
			[5] = {"Quay l¹i gÆp §µo Th¹ch M«n","",0,1,86,1605,3187},
			[6] = {"§Õn T¹p Hãa T­¬ng D­¬ng v¸ ¸o","",0,1,78,1627,3259},
			[7] = {"§¸nh D· H¸n 1 (Cøu ®øa bÐ, lÊy thiªn t»m)","§Õn khi cøu ®­îc ®øa bÐ lÊy ®­îc Thiªn T»m",1,1,83,1582,2860},
			[8] = {"§¸nh D· H¸n 2 (Cøu ®øa bÐ, lÊy thiªn t»m)","§Õn khi cøu ®­îc ®øa bÐ lÊy ®­îc Thiªn T»m",1,1,83,1676,2932},
			[9] = {"Trë l¹i T¹p Hãa ®Ó v¸ ¸o","",0,1,78,1627,3259},
			[10] = {"Giao ¸o cho §µn Th¹ch M«n","",0,1,86,1605,3187},
		},
		[3] = {
			[1] = {"SÏ ®­îc phong lµ: TuÇn S¬n §¹i Nh©n. Häc ®­îc vâ c«ng: KiÕm Phi Kinh Thiªn, B¸t CÊp Nhi Phôc. N¬i tiÕp nhËn nhiÖm vô: ThËp Ph­¬ng ®iÖn, Tõ §¹i Nh¹c."},
			[2] = {"GÆp Tõ §¹i Nh¹c","",0,1,85,1598,3187},
			[3] = {"§¹i Háa Hæ 1 (lÊy 5 cá häa mi)","",1,1,90,1796,3286},
			[4] = {"§¹i Háa Hæ 2 (lÊy 5 cá häa mi)","",1,1,90,1617,3321},
			[5] = {"§¹i TuyÕt Lang 1 (lÊy 5 cá häa mi)","",1,1,90,1917,3086},
			[6] = {"§¹i TuyÕt Lang 2 (lÊy 5 cá häa mi)","",1,1,90,1742,3176},
			[7] = {"§¹i Thanh Lang 1 (lÊy 5 cá häa mi)","",1,1,90,1877,3186},
			[8] = {"§¹i Thanh Lang 2 (lÊy 5 cá häa mi)","",1,1,90,2009,3265},
			[9] = {"§¹i Thanh Lang 3 (lÊy 5 cá häa mi)","",1,1,90,1804,2979},
			[10] = {"§ñ 5 cá häa mi vÒ giao cho Tõ §¹i Nh¹c","",0,1,85,1598,3187},
		},
		[4] = {
			[1] = {"SÏ ®­îc phong lµ: NhËp Quan §¹o Nh©n. Häc ®­îc vâ c«ng: ThÕ V©n Tung. N¬i tiÕp nhËn nhiÖm vô: Chu V©n TuyÒn."},
			[2] = {"GÆp Chu V©n TuyÒn","",0,1,81,1754,3081},
			[3] = {"GÆp NhuËn N­¬ng","",1,1,91,1618,2962},
			[4] = {"B¹ch Ngäc Hæ 1","",1,1,91,1592,2931},
			[5] = {"B¹ch Ngäc Hæ 2","",1,1,91,1537,3016},
			[6] = {"B¹ch Ngäc Hæ 3","",1,1,91,1680,2965},
			[7] = {"B¹ch Ngäc Hæ 4","",1,1,91,1648,3088},
			[8] = {"B¹ch Ngäc Hæ 5","",1,1,91,1661,2891},
			[9] = {"VÒ gÆp NhuËn N­¬ng","",1,1,91,1618,2962},
			[10] = {"NhuËn N­¬ng Gia Hæ (lÊy th­ håi ©m)","",1,1,91,1616,2819},
			[11] = {"NhuËn N­¬ng Gia B¸o (lÊy th­ håi ©m)","",1,1,91,1697,2740},
			[12] = {"Giao th­ cho §¹o NhÊt Ch©n Nh©n","",0,1,84,1598,3183},
		},
		[5] = {
			[1] = {"SÏ ®­îc phong lµ: Ch­ëng Kinh §¹o Nh©n. Häc ®­îc vâ c«ng: Täa Väng V« Ng·. N¬i tiÕp nhËn nhiÖm vô: Long Hæ ®iÖn, §¬n T­ Nam."},
			[2] = {"GÆp §¬n T­ Nam","",0,1,87,1602,3186},
			[3] = {"§Çu môc thæ phØ ThiÕt T¸o (lÊy 1 v¹n l­îng)","",1,1,42,1513,3168},
			[4] = {"GÆp §¬n T­ Nam","",0,1,87,1602,3186},
			[5] = {"T×m TrÞnh Gia TÈu Tö","",0,1,78,1648,3277},
			[6] = {"Trë vÒ gÆp §¬n T­ Nam","",0,1,87,1602,3186},
		},
		[6] = {
			[1] = {"SÏ ®­îc phong lµ: HuyÒn Vò ThÇn ThÞ. N¬i tiÕp nhËn nhiÖm vô: Tö Tiªu §¹i §iÖn, §¹o NhÊt Ch©n Nh©n."},
			[2] = {"GÆp §¹o NhÊt Ch©n Nh©n","",0,1,84,1598,3183},
			[3] = {"T×m c¸i r­¬ng thø nhÊt","",1,1,81,1897,2912},
			[4] = {"GÆp «ng chñ d­îc ®iÕm","",0,1,78,1610,3245},
			[5] = {"LÊy §­¬ng Quy","",1,1,90,2002,3454},
			[6] = {"LÊy Hîp Hoan","",1,1,90,1812,3652},
			[7] = {"LÊy HuyÒn S©m","",1,1,90,1745,3607},
			[8] = {"LÊy Phßng Kû","",1,1,90,1915,3554},
			[9] = {"LÊy Chu Sa","",1,1,90,1777,3667},
			[10] = {"Giao 5 d­îc liÖu cho «ng chñ d­îc ®iÕm","",0,1,78,1610,3245},
			[11] = {"VÒ më r­¬ng thø nhÊt (lÊy Ngäc Thanh ch©n kinh)","",1,1,81,1897,2912},
			[12] = {"T×m c¸i r­¬ng thø 2","",1,1,81,1897,2876},
			[13] = {"T×m thî rÌn","",0,1,78,1554,3216},
			[14] = {"LÊy Tõ thiÕt kho¸ng","",1,1,78,1422,2987},
			[15] = {"LÊy L­îng ng©n kho¸ng","",1,1,78,1400,3072},
			[16] = {"LÊy XÝch ®ång kho¸ng","",1,1,78,1466,2988},
			[17] = {"T×m thî rÌn","",0,1,78,1554,3216},
			[18] = {"VÒ më r­¬ng thø 2 (lÊy Th­îng Thanh ch©n kinh)","",1,1,81,1897,2876},
			[19] = {"T×m chiÕc r­¬ng thø 3","",1,1,81,1876,2833},
			[20] = {"T×m Nha m«n vÖ binh","",0,1,78,1590,3209},
			[21] = {"§¸nh b¹i T­¬ng D­¬ng thñ t­íng","",1,1,79,1750,3229},
			[22] = {"VÒ më r­¬ng thø 3 (lÊy Th¸i Thanh ch©n kinh)","",1,1,81,1876,2833},
			[23] = {"VÒ gÆp §¹o NhÊt Ch©n Nh©n","",0,1,84,1598,3183},
		},
		[7] = {
			[1] = {"Yªu cÇu: ng­êi ch¬i ®· xuÊt s­, ®¼ng cÊp trªn 60, ch­a gia nhËp bang ph¸i nµo, cã thÓ ®Õn gÆp tr­ëng m«n cña ph¸i giao 5 v¹n l­îng ®Ó trïng ph¶n s­ m«n. Tõ ®ã vÒ sau cã thÓ tïy ý ra vµo s­ m«n. PhÇn th­ëng: Th¸i Cùc ThÇn C«ng, V« Ng· V« KiÕm, Tam Hoµn Thao NguyÖt. §­îc phong lµm: HuyÒn Vâ Ch©n Qu©n."},
		},
		[8] = {
			[1] = {"S¸ch kü n¨ng cÊp 90 cã b¸n trong Kú Tr©n C¸c"},
		},
		[9] = {
			[1] = {"S¸ch kü n¨ng cÊp 120 cã b¸n trong Kú Tr©n C¸c"},
		},
		[10] = {
			[1] = {"Ch­a hoµn thµnh"},
		},
	},
	[9] = { --Con lon OK
		[1] = {
			[1] = {" "},
			[2] = {"GÆp TiÓu Hµn","",0,1,131,1472,3140},
			[3] = {"§¸nh MÌo Rõng lÊy 5 lo¹i th¶o d­îc","",1,1,140,2437,3742},
			[4] = {"Giao cho TiÓu Hµn","",0,1,131,1472,3140},
		},
		[2] = {
			[1] = {" "},
			[2] = {"GÆp Th¸n Tøc L·o Nh©n nhËn nhiÖm vô","",0,1,131,1526,3225},
			[3] = {"§¸nh Thæ PhØ lÊy X­¬ng ®Çu l¹c ®µ","",1,1,141,1548,3193},
			[4] = {"Giao cho Th¸n Tøc L·o Nh©n","",0,1,131,1526,3225},
		},
		[3] = {
			[1] = {" "},
			[2] = {"GÆp Chu KhuyÕt §¹i S­","",0,1,131,1587,3202},
			[3] = {"§¸nh C¸o §á lÊy 3 D¹ Minh Ch©u","",1,1,145,1629,3222},
			[4] = {"Giao cho Chu KhuyÕt §¹i S­","",0,1,131,1587,3202},
		},
		[4] = {
			[1] = {" "},
			[2] = {"GÆp Thanh Liªn Tö nhËn nhiÖm vô","",0,1,139,1606,3199},
			[3] = {"§¸nh b¹i Hång NguyÖt lÊy th«ng tin vÒ thanh kiÕm","",1,1,135,1675,2853},
			[4] = {"§¸nh Lam V©n lÊy ch×a khãa","",1,1,135,1764,3194},
			[5] = {"Dïng ch×a khãa më r­¬ng","",1,1,135,1529,2804},
			[6] = {"Giao HuyÕt Hån ThÇn KiÕm cho Thanh Liªn Tö","",0,1,139,1606,3199},
		},
		[5] = {
			[1] = {" "},
			[2] = {"GÆp Ngäc Hoµnh Tö nhËn nhiÖm vô","",0,1,137,1596,3193},
			[3] = {"§¸nh §¹i tuyÕt qu¸i 1","",1,1,132,1472,3209},
			[4] = {"§¸nh §¹i tuyÕt qu¸i 2","",1,1,132,1645,3218},
			[5] = {"§¸nh §¹i tuyÕt qu¸i 3","",1,1,132,1620,3168},
			[6] = {"§¸nh §¹i tuyÕt qu¸i 4","",1,1,132,1528,3208},
			[7] = {"§¸nh §¹i tuyÕt qu¸i 5","",1,1,132,1476,3262},
			[8] = {"§¸nh qu¸i nh©n lÊy Nóm Tãc","",1,1,132,1574,3215},
			[9] = {"Giao cho Ngäc Hoµnh Tö hoµn thµnh nhiÖm vô","",0,1,137,1596,3193},
		},
		[6] = {
			[1] = {" "},
			[2] = {"GÆp TruyÒn C¬ Tö nhËn nhiÖm vô","",0,1,138,1596,3196},
			[3] = {"T×m gÆp V« Danh L·o §¹o","",1,1,122,1712,3142},
			[4] = {"§¸nh Truy Hån lÊy Phôc ty táa","",1,1,125,1689,3245},
			[5] = {"TiÕn vµo t©ng 2, chän Tôy Nh©n ®Ó lªn tÇng 2","",1,1,125,1591,3205},
			[6] = {"§¸nh Thõa Phong, lÊy Viªm ®Õ táa","",1,1,126,1614,3015},
			[7] = {"TiÕn vµo tÇng 3, chän Tinh VÖ ®Ó lªn tÇng 3","",1,1,126,1674,3060},
			[8] = {"§¸nh b¹i L­u Tinh, lÊy ThiÕu t¹o táa","",1,1,127,1664,3087},
			[9] = {"TiÕn vµo tÇng 4, chän Xu©n ®Ó lªn tÇng 4","",1,1,127,1697,3232},
			[10] = {"§¸nh b¹i TËt §iÖn, lÊy Chuyªn tóc táa","",1,1,128,1619,3142},
			[11] = {"TiÕn ®Õn tÇng 5, chän §Êt trêi ph©n ®«i ®Ó lªn tÇng 5","",1,1,128,1521,3057},
			[12] = {"§¸nh b¹i N÷ ThÝch Kh¸ch, lÊy Hoµng ®Õ táa","",1,1,129,1745,3347},
			[13] = {"TiÕn ®Õn tÇng 6, chän Hai bøc t­îng sóc vËt b»ng gç ®Ó lªn tÇng 6","",1,1,129,1645,3250},
			[14] = {"Më r­¬ng lÊy Ngò s¾c th¹ch","",1,1,130,1587,3195},
			[15] = {"Giao cho TruyÒn C¬ Tö hoµn thµnh nhiÖm vô","",0,1,138,1596,3196},
		},
		[7] = {
			[1] = {"NhiÖm vô trõng ph¶n s­ m«n: ChuÈn bÞ ®ñ 5 v¹n gÆp ch­ëng m«n lµ cã thÓ hoµn thµnh"},
		},
		[8] = {
			[1] = {"Kü n¨ng cÊp 9 cã b¸n t¹i cöa hµng tinh lùc hay Kú tr©n c¸c"},
		},
		[9] = {
			[1] = {"Kü n¨ng 120 cã b¸n t¹i Kú tr©n c¸c"},
		},
		[10] = {
			[1] = {"Chøc n¨ng ch­a hoµn thµnh"},
		},
	},
}

function help_quest()
	local nFaction = GetLastFactionNumber()
	if nFaction < 0 then
		Msg2Player("Xin h·y gia nhËp m«n ph¸i råi míi sö dông chøc n¨ng nµy!")
		return
	elseif nFaction == 0 then
		TenMP = "ThiÕu L©m"
	elseif nFaction == 1 then
		TenMP = "Thiªn V­¬ng"
	elseif nFaction == 2 then
		TenMP = "§­êng M«n"
	elseif nFaction == 3 then
		TenMP = "Ngò §éc"
	elseif nFaction == 4 then
		TenMP = "Nga My"
	elseif nFaction == 5 then
		TenMP = "Thóy Yªn"
	elseif nFaction == 6 then
		TenMP = "C¸i Bang"
	elseif nFaction == 7 then
		TenMP = "Thiªn NhÉn"
	elseif nFaction == 8 then
		TenMP = "Vâ §ang"
	elseif nFaction == 9 then
		TenMP = "C«n L«n"
	elseif nFaction == 10 then
		TenMP = "Hoa S¬n"
	end
	if TenMP == "Hoa S¬n" then
		return Msg2Player("<color=yellow>HiÖn t¹i ch­a hoµn thµnh nhiÖm vô Hoa S¬n<color>")
	end
	local tab_Content = {
		"NhiÖm vô cÊp 10 "..TenMP.."/#help_quest_step1("..nFaction..",1,2,"..getn(tb_HelpQuest[nFaction][1])..")",
		"NhiÖm vô cÊp 20 "..TenMP.."/#help_quest_step1("..nFaction..",2,2,"..getn(tb_HelpQuest[nFaction][2])..")",
		"NhiÖm vô cÊp 30 "..TenMP.."/#help_quest_step1("..nFaction..",3,2,"..getn(tb_HelpQuest[nFaction][3])..")",
		"NhiÖm vô cÊp 40 "..TenMP.."/#help_quest_step1("..nFaction..",4,2,"..getn(tb_HelpQuest[nFaction][4])..")",
		"NhiÖm vô cÊp 50 "..TenMP.."/#help_quest_step1("..nFaction..",5,2,"..getn(tb_HelpQuest[nFaction][5])..")",
		"NhiÖm vô XuÊt S­ "..TenMP.."/#help_quest_step1("..nFaction..",6,2,"..getn(tb_HelpQuest[nFaction][6])..")",
		"NhiÖm vô Trõng Ph¶n S­ M«n "..TenMP.."/#help_quest_step1("..nFaction..",7,2,"..getn(tb_HelpQuest[nFaction][7])..")",
		"NhiÖm vô cÊp 90 "..TenMP.."/#help_quest_step1("..nFaction..",8,2,"..getn(tb_HelpQuest[nFaction][8])..")",
		"Kü n¨ng 120 "..TenMP.."/#help_quest_step1("..nFaction..",9,2,"..getn(tb_HelpQuest[nFaction][9])..")",
		"Ký danh ®Ö tö "..TenMP.."/#help_quest_step1("..nFaction..",10,2,"..getn(tb_HelpQuest[nFaction][10])..")",
		"Quay l¹i/character",
		"KÕt thóc ®èi tho¹i/Quit"
		}
		Say("Hç trî t©n thñ lµm nhiÖm vô m«n ph¸i. Xin h·y cè g¾ng hoµn thµnh nhiÖm vô m«n ph¸i råi míi gia nhËp bang héi tung hoµnh giang hå. ", getn(tab_Content), tab_Content);
end
function help_quest_step1(nFaction,nIDQ,nX,nY)
	local strDesc = tb_HelpQuest[nFaction][nIDQ][1][1]
	if (not nX) then
		nX1 = 2;
		nY1 = 10;
	else
		nX1 = nX;
		nY1 = nY;
	end
	if (nY1 - nX1 > 9) then
		nY1 = nX1 + 9;
	end
	if nIDQ == 1 then
		TenNV = "NhiÖm vô cÊp 10"
	elseif nIDQ == 2 then
		TenNV = "NhiÖm vô cÊp 20"
	elseif nIDQ == 3 then
		TenNV = "NhiÖm vô cÊp 30"
	elseif nIDQ == 4 then
		TenNV = "NhiÖm vô cÊp 40"
	elseif nIDQ == 5 then
		TenNV = "NhiÖm vô cÊp 50"
	elseif nIDQ == 6 then
		TenNV = "NhiÖm vô XuÊt S­"
	elseif nIDQ == 7 then
		TenNV = "NhiÖm vô Trõng Ph¶n S­ M«n"
	elseif nIDQ == 8 then
		TenNV = "NhiÖm vô cÊp 90"
	elseif nIDQ == 9 then
		TenNV = "Kü n¨ng 120"
	elseif nIDQ == 10 then
		TenNV = "Ký danh ®Ö tö"
	end
	local tbOpt = {}
	local TotalSelect = getn(tb_HelpQuest[nFaction][nIDQ])
	for i=nX1,nY1 do
		local FightState = tb_HelpQuest[nFaction][nIDQ][i][3]
		local TypeMove = tb_HelpQuest[nFaction][nIDQ][i][4] --Ban ®Çu m×nh lµm phÇn to¹ ®o¹ lµ kiÓu nh­ game vÝ dô 271 - 291 nh­ng to¹ ®é nµy nã phï kh«ng chÝnh x¸c nªn vÒ sau ®Ó hÕt sang to¹ ®æ kiÓu 4 sè. TypeMove lu«n lµ 1
		local MapId = tb_HelpQuest[nFaction][nIDQ][i][5]
		local nX =tb_HelpQuest[nFaction][nIDQ][i][6]
		local nY = tb_HelpQuest[nFaction][nIDQ][i][7]
		tinsert(tbOpt, {tb_HelpQuest[nFaction][nIDQ][i][1],help_quest_step2,{FightState,TypeMove,MapId,nX,nY,TenMP,TenNV,tb_HelpQuest[nFaction][nIDQ][i][2],tb_HelpQuest[nFaction][nIDQ][i][1]}})
	end
	if (nX1 ~= 2) then
		tinsert(tbOpt,{"Trang tr­íc",help_quest_step1,{nFaction,nIDQ,2,nX1-1}});
	end
	if (nY1 < TotalSelect) then
		tinsert(tbOpt,{"Trang sau",help_quest_step1,{nFaction,nIDQ,nY1+1,TotalSelect}});
	end
	tinsert(tbOpt, {"Quay l¹i",help_quest})
	tinsert(tbOpt, {"Tho¸t."})
	CreateNewSayEx(strDesc, tbOpt);
end
function help_quest_step2(FightState,TypeMove,MapId,nX,nY,MonPhai,NhiemVu,BuocThucHien,NoiDungNhiemVu)
	if TypeMove == 0 then
		NewWorld(MapId,nX*8,nY*16) --
	else
		NewWorld(MapId,nX,nY) --
	end
	SetFightState(FightState)
	Msg2Player("§ang thùc hiÖn <color=yellow>"..NhiemVu.."<color> m«n ph¸i <color=yellow>"..MonPhai.."<color>. Néi dung nhiÖm vô: <color=green>"..NoiDungNhiemVu.."<color>")
	AddNote("Néi dung nhiÖm vô: <color=green>"..BuocThucHien.."<color>")
end
--------------------------------------------------------------
--			 		Hæ Trî Lµm nv hoµng kim					--
--------------------------------------------------------------
tb_HelpGoldQuest = {
--=========================================================Hoµng Kim ChÝnh TuyÕn START
	[1] = { --Chinh tuyen
		[1] = { --Chinh phai OK
			[1] = { --Cap 20
				[1] = {"§Õn §¹i Lý gÆp Lý M¹c SÇu",0,1,162,1470,3170},
				[2] = {"Ra bÕn tµu ®¸nh b¹i M¹c SÇu",1,1,162,1636,2984},
				[3] = {"VÒ thµnh gÆp M¹c SÇu",0,1,162,1470,3170},
			},
			[2] = { --Cap 30
				[1] = {"T×m C«ng Tö TiÕu",0,1,11,3223,5118},
				[2] = {"§¸nh b¹i Giíi L­u Phong",1,1,141,1544,3323},
				[3] = {"VÒ gÆp M¹c SÇu",0,1,162,1470,3170},
			},
			[3] = { --Cap 40
				[1] = {"T×m gÆp H¹ V« Th­",0,1,80,1705,3119},
				[2] = {"§¸nh b¹i T¶ §ao HiÖp",1,1,173,1557,3049},
				[3] = {"Quay vÒ gÆp M¹c SÇu",0,1,162,1470,3170},
			},
			[4] = { --Cap 50
				[1] = {"T×m gÆp M¹nh Phµm",0,1,176,1626,2990},
				[2] = {"Tiªu diÖt O¸n §éc",1,1,24,2109,3322},
				[3] = {"Quay vÒ gÆp M¹nh Phµm",0,1,176,1626,2990},
			},
			[5] = { --Cap 60
				[1] = {"Tiªu diÖt ThÇn bÝ nam nh©n",1,1,79,1681,3142},
				[2] = {"Quay vÒ gÆp M¹c SÇu",0,1,162,1470,3170},
			},
		},
		[2] = { --Trung lap OK
			[1] = { --Cap 20 OK
				[1] = {"T×m gÆp Phã Nam B¨ng",0,1,37,1699,3161},
				[2] = {"§¸nh Ninh T­íng Qu©n",1,1,179,2033,2755},
				[3] = {"T×m gÆp Phã Nam B¨ng",0,1,37,1699,3161},
			},
			[2] = { --Cap 30 OK
				[1] = {"T×m gÆp Phã Nam B¨ng",0,1,37,1699,3161},
				[2] = {"§¸nh L­ Thiªn T­îng",1,1,136,1602,3197},
				[3] = {"T×m gÆp Phã Nam B¨ng",0,1,37,1699,3161},
			},
			[3] = { --Cap 40 OK
				[1] = {"GÆp LÖ Thu Thuû",0,1,154,343,1346},
				[2] = {"§¸nh Tõ Tù Lùc",1,1,5,1476,3433},
				[3] = {"GÆp LÖ Thu Thuû",0,1,154,343,1346},
			},
			[4] = { --Cap 50 OK
				[1] = {"T×m gÆp Phã Nam B¨ng",0,1,37,1699,3161},
				[2] = {"T×m §éc §iÕu TÈu",0,1,59,1642,3188},
				[3] = {"Tiªu diÖt §éc §iÕu TÈu",1,1,66,1596,3307},
				[4] = {"Quay l¹i gÆp Phã Nam B¨ng",0,1,37,1699,3161},
			},
			[5] = { --Cap 60 -OK
				[1] = {"T×m gÆp Phã Nam B¨ng",0,1,37,1699,3161},
				[2] = {"GÆp ®¹i s­ Kh«ng TÞch",0,1,103,1776,2843},
				[3] = {"§¸nh b¹i Kh«ng TÞch",1,1,103,1744,2662},
				[4] = {"VÒ gÆp Phã Nam B¨ng",0,1,37,1699,3161},
			},
		},
		[3] = { --Ta phai OK
			[1] = { --Cap 20 OK
				[1] = {"GÆp V©n Nhi",0,1,100,1729,3173},
				[2] = {"GÆp Th¸i C«ng C«ng",0,1,176,1625,3203},
				[3] = {"§¸nh b¹i TiÓu Kú Nhi",1,1,90,1798,3284},
				[4] = {"GÆp Th¸i C«ng C«ng",0,1,176,1625,3203},
				[5] = {"GÆp V©n Nhi",0,1,100,1729,3173},
			},
			[2] = { --Cap 30 OK
				[1] = {"GÆp Tiªu S­",0,1,80,1597,3117},
				[2] = {"§¸nh b¹i H¹ HÇu Phôc",1,1,21,2720,3956},
				[3] = {"GÆp V©n Nhi",0,1,100,1729,3173},
				[4] = {"GÆp Phã L«i Th­",0,1,174,199*8,203*16},
				[5] = {"GÆp MÆc Thï H­¬ng Chñ",0,1,186,1600,3196},
				[6] = {"GÆp Phã L«i Th­",0,1,174,199*8,203*16},
			},
			[3] = { --Cap 40 OK
				[1] = {"GÆp §µo Th¹ch M«n",0,1,86,1606,3190},
				[2] = {"§¸nh TiÓu V« Th­êng",1,1,92,1948,3233},
				[3] = {"GÆp §µo Th¹ch M«n",0,1,86,1606,3190},
				[4] = {"GÆp Phã L«i Th­",0,1,174,199*8,203*16},
				[5] = {"GÆp Nh­ Ngäc",0,1,37,1681,3139},
			},
			[4] = { --Cap 50 OK
				[1] = {"GÆp TrÇn Tam B¶o",0,1,37,1756,2995},
				[2] = {"Tiªu diÖt §¹o TÆc Lôc Phi",1,1,195,599,3068},
				[3] = {"GÆp TrÇn Tam B¶o",0,1,37,1756,2995},
				[4] = {"§¸nh t­íng Kim §å Lan ë TÇng 3 ThiÕt Th¸p",1,1,40,1699,3044},
				[5] = {"GÆp §oµn Méc DuÖ",0,1,49,1801,3183},
				[6] = {"GÆp §oµn Méc Thanh",0,1,121,2013,4490},
			},
			[5] = { --Cap 60 -OK
				[1] = {"GÆp §oµn Méc Thanh",0,1,121,2013,4490},
				[2] = {"Tiªu anh hïng kh¸ng Kim, Liªu §Þnh",1,1,94,1565,3141},
				[3] = {"GÆp §oµn Méc Thanh",0,1,121,2013,4490},
			},
		},
	},
--=========================================================Hoµng Kim ChÝnh TuyÕn END
--=========================================================Hoµng Kim Phô TuyÒn START
	[2] = { --Phô tuyÕn
		[1] = { --------------------------------------------Phô tuyÕn Chinh phai OK
			[1] = { --Cap 20-29 OK
				[1] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
				[2] = {"GÆp Si T¨ng",0,1,332,167*8,176*16},
				[3] = {"§¸nh Tµng B¶o Kh¸ch lÊy 5 ®å phæ",1,1,332,156*8,188*16},
				[4] = {"GÆp Si T¨ng",0,1,332,167*8,176*16},
				[5] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
				[6] = {"GÆp TiÔn §Çu",0,1,333,1246,3267},
				[7] = {"GÆp SÇm Hïng",0,1,1,192*8,201*16},
				[8] = {"§¸nh b¹i Phan Nh­ Long",1,1,1,220*8,190*16},
				[9] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
			},
			[2] = { --Cap 30-39 OK
				[1] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
				[2] = {"GÆp H¹ Lan Chi",0,1,11,3085,5191},
				[3] = {"GÆp Ng« L·o Th¸i",0,1,20,3465,6195},
				[4] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
				[5] = {"§¸nh 50 Sãi Xanh",1,1,90,1639,3511},
				[6] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
				[7] = {"GÆp Cung A Ng­u",0,1,78,1551,3191},
				[8] = {"§¸nh ¸c Lang",1,1,90,1789,3140},
				[9] = {"GÆp Cung A Ng­u",0,1,78,1551,3191},
				[10] = {"GÆp Ng« L·o Th¸i",0,1,20,3465,6195},
				[11] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
			},
			[3] = { --Cap 40-49 OK
				[1] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
				[2] = {"GÆp C«ng B×nh Tö ®¸nh l«i ®µi lÇn 1",0,1,11,3165,5194},
				[3] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
				[4] = {"GÆp Hçn Hçn",0,1,80,1846,3046},
				[5] = {"GÆp C«ng B×nh Tö ®¸nh l«i ®µi lÇn 2",0,1,11,3165,5194},
				[6] = {"GÆp Hçn Hçn",0,1,80,1846,3046},
				[7] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
				[8] = {"§¸nh Du S­¬ng T©n",1,1,11,3371,4889},
				[9] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
			},
			[4] = { --Cap 50-59 OK
				[1] = {"GÆp Hçn Hçn",0,1,80,1846,3046},
				[2] = {"Hoµn thµnh tèng kim vÒ gÆp Hçn Hçn",1,1,24,2109,3322},
				[3] = {"§¸nh TÒ Tøc Phong",1,1,176,1680,2575},
				[4] = {"GÆp Ng¹o V©n T«ng",0,1,1,1587,3303},
			},
		},
		[2] = { --------------------------------------------Phô tuyÕn Trung lËp OK
			[1] = { --Cap 20 OK
				[1] = {"GÆp LiÔu Nam V©n",0,1,176,1368,3050},
				[2] = {"§¸nh 50 nhÝm TÇn L¨ng",1,1,7,2277,2824},
				[3] = {"GÆp Giang NhÊt TiÕu",0,1,80,204*8,192*16},
				[4] = {"GÆp L¹c Thanh Thu",0,1,80,1694,3129},
				[5] = {"GÆp b¶o kª sßng b¹c",0,1,80,1744,3151},
				[6] = {"§¸nh Lé Tr­êng Thiªn",1,1,80,1999,2882},
				[7] = {"GÆp b¶o kª sßng b¹c",0,1,80,1744,3151},
				[8] = {"GÆp L¹c Thanh Thu",0,1,80,1694,3129},
				[9] = {"§¸nh nh©n vËt vâ l©m lÊy b¶o kiÕm",1,1,80,1396,3397},
				[10] = {"GÆp L¹c Thanh Thu",0,1,80,1694,3129},
			},
			[2] = { --Cap 30 OK
				[1] = {"GÆp LiÔu Nam V©n",0,1,176,1368,3050},
				[2] = {"GÆp chñ tiªu côc Song ¦ng",0,1,1,1543,3191},
				[3] = {"GÆp A Ng­u",0,1,1,1567,3253},
				[4] = {"GÆp H¹ L·o B¶n (Chñ tiªu côc)",0,1,11,3011,5057},
				[5] = {"§¸nh 50 khØ x¸m",1,1,92,1977,3116},
				[6] = {"GÆp H¹ L·o B¶n (Chñ tiªu côc)",0,1,11,3011,5057},
				[7] = {"§¸nh BÝch Ngäc, Nh­ Yªn, T¨ng Méng",1,1,131,1872,3392},
				[8] = {"GÆp H¹ L·o B¶n (Chñ tiªu côc)",0,1,11,3011,5057},
				[9] = {"GÆp LiÔu Nam V©n",0,1,176,1368,3050},
			},
			[3] = { --Cap 40 OK
				[1] = {"GÆp LiÔu Nam V©n",0,1,176,1368,3050},
				[2] = {"GÆp C«ng B×nh Tö ®¸nh l«i ®µi lÇn 1",0,1,11,3165,5194},
				[3] = {"Th¾ng l«i ®µi vÒ gÆp LiÔu Nam V©n",0,1,176,1368,3050},
				[4] = {"GÆp C«ng B×nh Tö ®¸nh l«i ®µi lÇn 2",0,1,11,3165,5194},
				[5] = {"GÆp LiÔu Nam V©n",0,1,176,1368,3050},
				[6] = {"§¸nh Du S­¬ng T©n",1,1,11,3371,4889},
				[7] = {"GÆp LiÔu Nam V©n",0,1,176,1368,3050},
			},
			[4] = { --Cap 50 OK
				[1] = {"GÆp LiÔu Nam V©n",0,1,176,1368,3050},
				[2] = {"Hoµn thµnh tèng kim vÒ gÆp LiÔu Nam V©n",0,1,176,1368,3050},
				[3] = {"§¸nh b¹i Long Truy Vò",1,1,162,1723,2987},
				[4] = {"GÆp LiÔu Nam V©n",0,1,176,1368,3050},
			},
		},
		[3] = { --------------------------------------------Phô tuyÕn tµ ph¸i OK
			[1] = { --Cap 20 OK
				[1] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
				[2] = {"§¸nh 50 H¾c DiÖp HÇu",1,1,25,3952,5284},
				[3] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
				[4] = {"GÆp Ch©u Tr­êng Cöu",0,1,11,3139,5086},
				[5] = {"GÆp ThÈm Phong",0,1,80,1684,3078},
				[6] = {"§¸nh ThÈm Phong",1,1,80,1788,3383},
				[7] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
			},
			[2] = { --Cap 30 OK
				[1] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
				[2] = {"§¸nh 50 con sãi vµng",1,1,193,1560,3188},
				[3] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
				[4] = {"GÆp L­u UÈn C«",0,1,78,1611,3185},
				[5] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
				[6] = {"GÆp Tuý H¸n (Töu Quû)",0,1,176,1691,3033},
				[7] = {"§¸nh Thi Nghi Sinh",1,1,176,1701,3388},
				[8] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
			},
			[3] = { --Cap 40 OK
				[1] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
				[2] = {"GÆp L­u UÈn C«",0,1,78,1611,3185},
				[3] = {"GÆp C«ng B×nh Tö ®¸nh l«i ®µi lÇn 1",0,1,11,3165,5194},
				[4] = {"GÆp L­u UÈn C«",0,1,78,1611,3185},
				[5] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
				[6] = {"GÆp C«ng B×nh Tö ®¸nh l«i ®µi lÇn 2",0,1,11,3165,5194},
				[7] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
				[8] = {"§¸nh NguyÔn Minh ViÔn",1,1,78,1788,3189},
				[9] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
			},
			[4] = { --Cap 50 OK
				[1] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
				[2] = {"Hoµn thµnh tèng kim vÒ gÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
				[3] = {"§¸nh Sö ThÞnh Do·n",1,1,78,1372,3500},
				[4] = {"GÆp Th¸c B¹t Hoµi Xuyªn",0,1,37,1677,3040},
			},
		},
	},
}
--=========================================================Hoµng Kim Phô TuyÒn END
function helpgoldquest()
	if GetLevel() < 20 then
		Msg2Player("<color=yellow>H·y ®¹t ®Õn cÊp 20 h·y sö dông chøc n¨ng nµy")
		return
	end
	local tb = {
	"ChÝnh tuyÕn/#gquest(1)",
	"Phô tuyÕn/#gquest(2)",
	"Quay l¹i./hotrolamnvhoangkim",
	"Tho¸t./Quit",
	}
	Say("",getn(tb),tb)
end
function gquest(ID)
	local MissType = ID --Lo¹i nv chÝnh hay phô tuyªn. ChÝnh lµ 1 phô lµ 2
	local tb = {
	"ChÝnh ph¸i - BÝ mËt TÇm Long Héi/#gquest_step1("..MissType..",1)",
	"Trung lËp - C©u chuyÖn L©m Uyªn Nhai/#gquest_step1("..MissType..",2)",
	"Tµ ph¸i - Long khÝ chi ho¹/#gquest_step1("..MissType..",3)",
	"Quay l¹i/character",
	"KÕt thóc ®èi tho¹i/Quit"
	}
	Say("",getn(tb),tb)
end
function gquest_step1(ID1,ID2)
	local MissType = ID1 --Lo¹i NV chÝnh hay phô
	local PheType = ID2 --NhiÖm vô chÝnh - trung - tµ
	if MissType == 1 then --chÝnh tuyÕn
		local tab_Content = {
		"ChÝnh tuyÕn cÊp 20/#gquest_step2("..MissType..","..PheType..",1)",
		"ChÝnh tuyÕn cÊp 30/#gquest_step2("..MissType..","..PheType..",2)",
		"ChÝnh tuyÕn cÊp 40/#gquest_step2("..MissType..","..PheType..",3)",
		"ChÝnh tuyÕn cÊp 50/#gquest_step2("..MissType..","..PheType..",4)",
		"ChÝnh tuyÕn cÊp 60/#gquest_step2("..MissType..","..PheType..",5)",
		"Quay l¹i/character",
		"KÕt thóc ®èi tho¹i/Quit"
		}
		Say("Hç trî lµm nhiÖm vô hoµng kim ChÝnh TuyÕn. ", getn(tab_Content), tab_Content);
	elseif MissType == 2 then --phô tuyÕn
		local tab_Content = {
		"Phô tuyÕn cÊp 20 - 29/#gquest_step2("..MissType..","..PheType..",1)",
		"Phô tuyÕn cÊp 30 - 39/#gquest_step2("..MissType..","..PheType..",2)",
		"Phô tuyÕn cÊp 40 - 49/#gquest_step2("..MissType..","..PheType..",3)",
		"Phô tuyÕn cÊp 50 - 59/#gquest_step2("..MissType..","..PheType..",4)",
		"Quay l¹i/character",
		"KÕt thóc ®èi tho¹i/Quit"
		}
		Say("Hç trî lµm nhiÖm vô hoµng kim ChÝnh TuyÕn. ", getn(tab_Content), tab_Content);
	end
end
function gquest_step2(ID1,ID2,ID3)
	local MissType = ID1 --Lo¹i NV chÝnh hay phô
	local PheType = ID2 --NhiÖm vô chÝnh - trung - tµ
	local CapDo = ID3
	local strDesc = tb_HelpGoldQuest[MissType][PheType][CapDo][1][1]
	local tbOpt = {}
	local TotalSelect = getn(tb_HelpGoldQuest[MissType][PheType][CapDo]) --Tæng céng cã bao nhiªu lùa chän.
	for i=1,TotalSelect do
		local FightState = tb_HelpGoldQuest[MissType][PheType][CapDo][i][2]
		local MapId = tb_HelpGoldQuest[MissType][PheType][CapDo][i][4]
		local nX =tb_HelpGoldQuest[MissType][PheType][CapDo][i][5]
		local nY = tb_HelpGoldQuest[MissType][PheType][CapDo][i][6]
		tinsert(tbOpt, {tb_HelpGoldQuest[MissType][PheType][CapDo][i][1],gquest_step3,{FightState,MapId,nX,nY}})
	end
	tinsert(tbOpt, {"Quay l¹i",gquest_step1})
	tinsert(tbOpt, {"Tho¸t."})
	CreateNewSayEx(strDesc, tbOpt);
end
function gquest_step3(ID1,ID2,ID3,ID4)
	local FightState = ID1
	local MapId = ID2
	local nX = ID3
	local nY = ID4
	NewWorld(MapId,nX,nY)
	SetFightState(FightState)
end
--------------------------------------------------------------
--			 			Boss Hoµng Kim						--
--------------------------------------------------------------
function bosshk1()
		local strFaction = GetFaction()
		local nW,nX,nY = GetWorldPos();
		local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY)};
			tinsert(tbSay, "Gäi Boss Hoµng Kim/goibosshk");
			tinsert(tbSay, "T×m Boss Hoµng Kim/timbosshk");
			tinsert(tbSay, "KÕt thóc ®èi tho¹i./no")
		CreateTaskSay(tbSay)
	return 1;
end
---------------Gäi Boss HK------------------------
function goibosshk()
BossHK23(f_bossx,f_bossy)
end

TBBOSS  =
{ --tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
	[1]={	szName = "HuyÒn Gi¸c §¹i S­",		nBossId = 740,	nRate = 322,	nSeries = 0,	nLevel = 95},
	[2]={	szName = "§­êng BÊt NhiÔm",			nBossId = 741,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[3]={	szName = "B¹ch Doanh Doanh",		nBossId = 742,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[4]={	szName = "Thanh TuyÖt S­ Th¸i",		nBossId = 743,	nRate = 341,	nSeries = 2,	nLevel = 95},
	[5]={	szName = "Yªn HiÓu Tr¸i",			nBossId = 744,	nRate = 336,	nSeries = 2,	nLevel = 95},
	[6]={	szName = "Hµ Nh©n Ng·",				nBossId = 745,	nRate = 321,	nSeries = 3,	nLevel = 95},
	[7]={	szName = "Tõ §¹i Nh¹c",				nBossId = 746,	nRate = 341,	nSeries = 4,	nLevel = 95},
	[8]={	szName = "TuyÒn C¬ Tö",				nBossId = 747,	nRate = 341,	nSeries = 4,	nLevel = 95},
	[9]={	szName = "Hµn Ngu Dèt",				nBossId = 748,	nRate = 342,	nSeries = 3,	nLevel = 95},
	[10]={	szName = "§o¹n Méc DuÖ",			nBossId = 565,	nRate = 227,	nSeries = 3,	nLevel = 95},
	[11]={	szName = "Cæ B¸ch",					nBossId = 566,	nRate = 200,	nSeries = 0,	nLevel = 95},
	[12]={	szName = "§­êng Phi YÕn",			nBossId = 1366,	nRate = 200,	nSeries = 1,	nLevel = 95},
	[13]={	szName = "Hµ Linh Phiªu",			nBossId = 568,	nRate = 200,	nSeries = 2,	nLevel = 95},
	[14]={	szName = "Lam Y Y",					nBossId = 582,	nRate = 200,	nSeries = 1,	nLevel = 95},
	[15]={	szName = "M¹nh Th­¬ng L­¬ng",		nBossId = 583,	nRate = 200,	nSeries = 3,	nLevel = 95},
	[16]={	szName = "Gia LuËt TÞ Ly",			nBossId = 563,	nRate = 200,	nSeries = 3,	nLevel = 95},
	[17]={	szName = "§¹o Thanh Ch©n Nh©n",		nBossId = 562,	nRate = 200,	nSeries = 4,	nLevel = 95},
	[18]={	szName = "V­¬ng T¸",				nBossId = 739,	nRate = 200,	nSeries = 0,	nLevel = 95},
	[19]={	szName = "HuyÒn Nan §¹i S­",		nBossId = 1365,	nRate = 200,	nSeries = 0,	nLevel = 95},
	[20]={	szName = "Chung Linh Tó",			nBossId = 567,	nRate = 200,	nSeries = 2,	nLevel = 95},
	[21]={	szName = "Thanh Liªn Tö",			nBossId = 1368,	nRate = 200,	nSeries = 4,	nLevel = 95},

}

function BossHK23(f_bossx,f_bossy)

	if (not f_bossx) then
		f_bossx1 = 1;
		f_bossy1 = 12;
	else
		f_bossx1 = f_bossx;
		f_bossy1 = f_bossy;
	end

	if (f_bossy1 - f_bossx1 > 11) then
		f_bossy1 = f_bossx1 + 11;
	end

	local n_count = getn(TBBOSS);
	local tb = {}

	tb = {GetName().." b¹n muèn th¶ boss nµo?"}

	for i = f_bossx1, f_bossy1 do
		tinsert(tb,format("%s/#PickBoss(%d)",TBBOSS[i].szName,i));
	end

	if (f_bossx1 ~= 1) then
		tinsert(tb, "Trang tr­íc/#BossHK( 1,"..(f_bossx1-1)..")");
	end

	if (f_bossy1 < n_count) then
		tinsert(tb, "Trang sau/#BossHK( "..(f_bossy1+1)..","..n_count..")");
	end
	tinsert(tb,"§Ó ta suy nghÜ ®·/cancel");
	CreateTaskSay(tb)

end

function PickBoss(nIndex)
	if GetFightState() == 0 then
		Talk(1,"","Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
		return
	end
	local item = TBBOSS[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\missions\\boss\\bossdeath.lua")
	SetNpcParam(index,1,item.nBossId); --l­u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s(%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
--------------T×m Boss HK --------------------------------
function timbosshk()
    findgoldboss(1,12)
end

tbMapGoldBoss = {
{"Cæ B¸ch","Phï Dung ®éng",202,"S¬n B¶o ®éng",76,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"HuyÒn Gi¸c §¹i S­","Nh¹n Th¹ch ®éng",10,"Thanh khª ®éng",198,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§­êng Phi YÕn", "Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Lam Y Y","Vò L¨ng ®éng",199,"Phi Thiªn ®éng",204,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµ Linh Phiªu", "Tr­êng B¹ch s¬n B¾c",322,"V« Danh ®éng",203,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Yªn HiÓu Tr¸i", "Sa M¹c s¬n  ®éng 1",225,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"M¹nh Th­¬ng L­¬ng","Sa m¹c ®Þa biÓu",224,"Sa M¹c s¬n  ®éng 2",226,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Gia LuËt TÞ Ly", "L­ìng Thñy ®éng",181,"D­¬ng Trung ®éng",205,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§¹o Thanh Ch©n Nh©n","Tr­êng B¹ch s¬n Nam",321,"M¹c Cao QuËt",340,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"TuyÒn C¬ Tö", "T©y S¬n ®¶o",342,"Phi Thiªn ®éng",204,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"V­¬ng T¸","Vò L¨ng ®éng",199,"Phï Dung ®éng",202,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"HuyÒn Nan §¹i S­","Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§­êng BÊt NhiÔm", "Tr­êng B¹ch s¬n Nam",321,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"B¹ch Doanh Doanh", "Thanh khª ®éng",198,"Sa m¹c ®Þa biÓu",224,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh TuyÖt S­ Th¸i", "T©y S¬n ®¶o",342,"D­¬ng Trung ®éng",205,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Chung Linh Tó", "Phi Thiªn ®éng",204,"V« Danh ®éng",203,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµ Nh©n Ng·", "Nh¹n Th¹ch ®éng",10,"L­ìng Thñy ®éng",181,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§oan Méc DuÖ", "Phong L¨ng ®é",336,"S¬n B¶o ®éng",76,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Tõ §¹i Nh¹c", "M¹c B¾c Th¶o Nguyªn",341,"Vò L¨ng ®éng",199,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh Liªn Tö","Tr­êng B¹ch s¬n B¾c",322,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh TuyÖt S­ Th¸i","Sa M¹c s¬n  ®éng 1",225,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµn Ngu Dèt","Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
}

function findgoldboss(f_bossx,f_bossy)
    if (not f_bossx) then
        f_bossx1 = 1;
        f_bossy1 = 22;
    else
        f_bossx1 = f_bossx;
        f_bossy1 = f_bossy;
    end

    if (f_bossy1 - f_bossx1 > 11) then
        f_bossy1 = f_bossx1 + 11;
    end

    local n_count = getn(tbMapGoldBoss);
    local tab_Content = {}
    for i = f_bossx1, f_bossy1 do
        tinsert(tab_Content, {tbMapGoldBoss[i][1], findgoldboss_Step2, {i}});
    end
    tinsert(tab_Content, {"Tho¸t./OnCancel"});
    CreateNewSayEx("T×m kiÕm Boss §¹i Hoµng Kim", tab_Content);
end
function findgoldboss_Step2(nId)
    local tb = {};
    for i=2,getn(tbMapGoldBoss[nId]),2 do
        local npcidxtab = GetMapNpcWithName(tbMapGoldBoss[nId][i+1], tbMapGoldBoss[nId][1]);
        if npcidxtab == nil then
                nNPCCount = 0;
        else
            nNPCCount = getn(npcidxtab);
        end;
        for j = 1, nNPCCount do
            x, y, subworld = GetNpcPos(npcidxtab[j]);
            m,n,k = floor(x/32),floor(y/32),SubWorldIdx2ID(subworld);
            tinsert(tb,{tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..m.."-"..n.."]",findgoldboss_Step3,{m.."-"..n.."-"..k}});
        end;
    end;
    strTittle = "T×m thÊy cao thñ vâ l©m "..tbMapGoldBoss[nId][1].." t¹i c¸c vÞ trÝ sau ®©y:";
    tinsert(tb,{"Quay l¹i.",findgoldboss});
    tinsert(tb,{"Tho¸t./OnCancel"});
    CreateNewSayEx(strTittle, tb);
end
function findgoldboss_Step3(nStr)
    local szICode = lib:Split(nStr, "-");
    local Map = szICode[3]
    local xPos = tonumber(floor(szICode[1]))
    local yPos = tonumber(floor(szICode[2]))
    NewWorld(Map,xPos,yPos)
end

function OnCancel()
end
--------------------------------------------------------------
--			 		Céng §iÓm Nhanh							--
--------------------------------------------------------------
function add_prop()
	local tbOpt =
	{
		{"T¨ng søc m¹nh.", add_prop_str},
		{"T¨ng th©n ph¸p.", add_prop_dex},
		{"T¨ng sinh khÝ.", add_prop_vit},
		{"T¨ng néi c«ng.", add_prop_eng},
		{"Tho¸t."}
	}
	CreateNewSayEx("<npc>Xin mêi chän tiÒm n¨ng cÇn t¨ng!", tbOpt)
end

function add_prop_str()
	AskClientForNumber("enter_str_num", 0, GetProp(), "Mêi nhËp chØ sè søc m¹nh: ");
end
function add_prop_dex()
	AskClientForNumber("enter_dex_num", 0, GetProp(), "Mêi nhËp chØ sè th©n ph¸p: ");
end
function add_prop_vit()
	AskClientForNumber("enter_vit_num", 0, GetProp(), "Mêi nhËp chØ sè sinh khÝ:");
end
function add_prop_eng()
	AskClientForNumber("enter_eng_num", 0, GetProp(), "Mêi nhËp chØ sè néi c«ng: ");
end
function enter_str_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddStrg(n_key);
end
function enter_dex_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddDex(n_key);
end
function enter_vit_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddVit(n_key);
end
function enter_eng_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddEng(n_key);
end
--------------------------------------------------------------
--							Point							--
--------------------------------------------------------------
function CacLoaiDiem()
	local tbSay  = {"<dec>Ng­¬i muèn nhËn lo¹i ®iÓm nµo?"}
		tinsert(tbSay, "T¨ng ®iÓm kinh nghiÖm/kinhnghiem")
		tinsert(tbSay, "N©ng cÊp ®é/dangcap200")
		tinsert(tbSay, "Thªm tiÒn v¹n/tien")
		tinsert(tbSay, "T×m N¨ng/pointtiemnang")
		tinsert(tbSay, "Kû N¨ng/pointkynang")
		tinsert(tbSay, "Thªm tiÒn ®ång/tiendong")
		tinsert(tbSay, "Thªm kim nguyªn b¶o/knb")
		tinsert(tbSay, "§iÓm Cèng HiÕn Bang héi/conghien")
		tinsert(tbSay, "Trang 2/CacLoaiDiem2")
		tinsert(tbSay, "KÕt thóc ®èi tho¹i./no")
	CreateTaskSay(tbSay)
end

function CacLoaiDiem2()
	local tbSay  = {"<dec>Ng­¬i muèn nhËn lo¹i ®iÓm nµo?"}
		tinsert(tbSay, "Thªm danh väng/danhvong")
		tinsert(tbSay, "Thªm phóc duyªn/phucduyen")
		tinsert(tbSay, "Thªm tµi l·nh ®¹o/tailanhdao")
		tinsert(tbSay, "Trang 1/CacLoaiDiem")
		tinsert(tbSay, "KÕt thóc ®èi tho¹i./no")
	CreateTaskSay(tbSay)
end
------------CÊp-------------------
function dangcap200()
AskClientForNumber("level",0,200,"NhËp CÊp §é:")
end

function level(num)
local nCurLevel = GetLevel()
local nAddLevel = num - nCurLevel
ST_LevelUp(nAddLevel)
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..num.."<color> cÊp ®é.")
end
---EXP-----
function kinhnghiem()
AskClientForNumber("kinhnghiem1",0,9999999999999999,"NhËp EXP")
end
function kinhnghiem1(nNum)
AddOwnExp(nNum)
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> kinh nghiÖm.")
end
---Tien Van---
function tien()
AskClientForNumber("tienvan",0,10000000,"NhËp Sè L­îng:")
end
function tienvan(slkv)
local money= slkv*10000
local giatrikv=money/10000
Earn(money)
Msg2Player(format("B¹n nhËn ®­îc <color=yellow>%s v¹n<color>.",giatrikv))
end
---Tien Dong---
function tiendong()
AskClientForNumber("tiendong1",0,1000,"NhËp Sè L­îng:")
end;
function tiendong1(sltiendong)
for i = 1, sltiendong do
AddStackItem(1,4,417,1,1,0,0,0)
end
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..sltiendong.." <color>tiÒn ®ång.")
end
----KNB------
function knb()
AskClientForNumber("layknb",0,100000,"NhËp Sè L­îng:")
end
function layknb(slknb)
for i=1, slknb do
AddEventItem(343)
end
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..slknb.." <color>KNB.")
end
----------------§iÓm Kü N¨ng----------------------------------------
function pointkynang()
AskClientForNumber("pointkynang1",0,1000,"NhËp Sè L­îng:")
end;
function pointkynang1(nNum)
AddMagicPoint(nNum)		---NhËn ®iÓm kü n¨ng
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm Kü N¨ng.")
end
------------------§iÓm TiÒm N¨ng--------------------------------------
function pointtiemnang()
AskClientForNumber("pointtiemnang1",0,1000000,"NhËp Sè L­îng:")
end;
function pointtiemnang1(nNum)
AddProp(nNum)		---NhËn ®iÓm tiÒm n¨ng
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm TiÒm N¨ng.")
end
------------Danh Väng----------------------------
function danhvong()
AskClientForNumber("danhvongINPUT",0,100000,"NhËp Sè L­îng:")
end
function danhvongINPUT(nNum)
AddRepute(nNum);
Msg2Player("B¹n nhËn ®­îc "..nNum.." ®iÓm Danh Väng.")
end
------------Phóc Duyªn----------------------------
function phucduyen()
AskClientForNumber("phucduyen2",0,100000,"NhËp Sè L­îng:")
end
function phucduyen2(nNum)
FuYuan_Start();
FuYuan_Add(nNum);
Msg2Player("B¹n nhËn ®­îc "..nNum.." ®iÓm Phóc Duyªn.")
end
------------Tµi L·nh §¹o----------------------------
function tailanhdao()
	for i = 1, 250 do
		AddLeadExp(1000000000)
	end
	Msg2Player("B¹n nhËn ®­îc 100 cÊp tµi l·nh ®¹o");
end
------------§iÓm Cèng HiÕn----------------------------
function conghien()
	AddContribution(1000000);
	Msg2Player("B¹n nhËn ®­îc 1.000.000 ®iÓm cèng hiÕn")
end

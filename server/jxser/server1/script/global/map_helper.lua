-- map_helper.lua
-- By: Dan_Deng(2004-06-28)
-- Ö÷Î¬»¤±í£¬¸÷ÎåÐÐ¡¢µÈ¼¶Á·¼¶ÃÔ¹¬
Include("\\script\\activitysys\\npcdailog.lua")

lv_str={	"<#>Kh«ng ®Õn cÊp 10 ","<#>H¬n 10 cÊp ","<#>H¬n 20 cÊp ","<#>H¬n 30 cÊp ","<#>H¬n 40 cÊp ","<#>H¬n 50 cÊp ","<#>H¬n 60 cÊp ","<#>H¬n 70 cÊp ","<#>H¬n 80 cÊp ","<#>H¬n 90 cÊp "}
map0 = {	"<#>C¸c T©n thñ th«n ",
			"<#>GÇn bªn Bæn m«n, c¸c thµnh thÞ næi danh ",
			"<#>KiÕm C¸c Trung Nguyªn, KiÕm C¸c T©y Nam, KiÕm C¸c T©y B¾c, La Tiªu s¬n, Vò L¨ng s¬n, TÇn L¨ng ",
			"<#>Thôc C­¬ng s¬n, Miªu LÜnh, YÕn tö ®éng, vµ D­îc V­¬ng ®éng tÇng 1, Kho¸i Ho¹t L©m ",
			"<#>Kinh Hoµng ®éng, Phôc Ng­u s¬n T©y, §iÓm Th­¬ng ®éng tÇng 3, ThiÕu L©m mËt thÊt ",
			"<#>H­ëng Thñy ®éng, Thiªn T©m ®éng, vµ §éng §×nh Hå s¬n ®éng, B¨ng HuyÖt Mª Cung ",
			"<#>Thanh Loa ®¶o, 108 La H¸n TrËn, vµ Hoµnh s¬n ph¸i, T­¬ng D­¬ng vÖ m«n mËt ®¹o ",
			"<#>§¹i Tï ®éng, Thanh Loa ®¶o s¬n ®éng, vµ Linh Cèc ®éng, L·o Hæ ®éng, L©m Du Quan ",
			"<#>Sa m¹c §Þa BiÓu, Phi Thiªn ®éng, Phï Dung ®éng, L­ìng Thñy ®éng, B¨ng Hµ ®éng, Thanh Khª ®éng, Tr­êng B¹ch s¬n C­íc ",
			"<#>Sa m¹c s¬n ®éng tÇng 1, 2 vµ TiÕn Cóc ®éng, Kho¶ Lang ®éng, Tr­êng B¹ch s¬n Nam Léc, Tr­êng B¹ch s¬n B¾c Léc "}
map1 = {	"<#>C¸c T©n thñ th«n ",
			"<#>GÇn bªn Bæn m«n, c¸c thµnh thÞ næi danh ",
			"<#>KiÕm C¸c Trung Nguyªn, KiÕm C¸c T©y Nam, KiÕm C¸c T©y B¾c, La Tiªu s¬n, Vò L¨ng s¬n, TÇn L¨ng ",
			"<#>Vò Di s¬n, TÇn L¨ng tÇng 1, vµ B¹ch V©n ®éng, thæ phØ ®éng ",
			"<#>Thanh Thµnh s¬n, §iÓm Th­¬ng s¬n, vµ Phong Nh·n ®éng, §iÓm Th­¬ng ®éng tÇng 1, ThÇn Tiªn ®éng ",
			"<#>H­ëng Thñy ®éng, NghiÖt Long ®éng, B¶o Ngäc Hoa ®éng, vµ Thiªn TÇm Th¸p tÇng 1,2 ",
			"<#>D­¬ng Gi¸c ®éng, Tróc T¬ ®éng tÇng 1, vµ Hoµnh s¬n ph¸i, Thiªn TÇm Th¸p tÇng 3 ",
			"<#>Long Nh·n ®éng, TÇn L¨ng tÇng 2, vµ Tróc T¬ ®éng tÇng 2, Tr­êng Giang §Çu, L©m Du Quan ",
			"<#>Sa m¹c §Þa BiÓu, Vò L¨ng ®éng, D­¬ng Trung ®éng, Cæ D­¬ng ®éng, Nh¹n Th¹ch ®éng, D­îc V­¬ng ®éng tÇng 3, TÇn L¨ng tÇng 3, Tr­êng B¹ch s¬n C­íc ",
			"<#>Sa m¹c s¬n ®éng tÇng 1,2,3, vµ D­îc V­¬ng ®éng tÇng 4, TiÕn Cóc ®éng, Tr­êng B¹ch s¬n Nam Léc, Tr­êng B¹ch s¬n B¾c Léc "}
map2 = {	"<#>C¸c T©n thñ th«n ",
			"<#>GÇn bªn Bæn m«n, c¸c thµnh thÞ næi danh ",
			"<#>KiÕm C¸c Trung Nguyªn, KiÕm C¸c T©y Nam, KiÕm C¸c T©y B¾c, La Tiªu s¬n, Vò L¨ng s¬n, TÇn L¨ng ",
			"<#>B¹ch V©n ®éng, Thôc C­¬ng s¬n, thæ phØ ®éng, vµ Phôc Ng­u s¬n §«ng, Kim Quang ®éng ",
			"<#>Phong Nh·n ®éng, §iÓm Th­¬ng ®éng tÇng 1, ThÇn Tiªn ®éng, vµ Phôc Ng­u s¬n T©y, Kinh Hoµng ®éng ",
			"<#>H­ëng Thñy ®éng, Thiªn TÇm Th¸p tÇng 1,2, vµ TÝn T­íng tù ®Þa ®¹o, ¸c B¸ ®Þa ®¹o ",
			"<#>Thiªn TÇm Th¸p tÇng 3, 108 La H¸n TrËn, vµ CÊm ®Þa mª cung, Hoµnh s¬n ph¸i ",
			"<#>Tr­êng Giang Nguyªn §Çu, S¬n B¶o ®éng, vµ §µo Hoa Nguyªn, D­îc V­¬ng ®éng tÇng 2, L©m Du Quan ",
			"<#>Sa m¹c §Þa BiÓu, Phi Thiªn ®éng, Phï Dung ®éng, D­¬ng Trung ®éng, Cæ D­¬ng ®éng, D­îc V­¬ng ®éng tÇng 3, Tr­êng B¹ch s¬n C­íc ",
			"<#>Sa m¹c s¬n ®éng tÇng 1, 2, 3, vµ Kho¶ Lang ®éng, TiÕn Cóc ®éng, Tr­êng B¹ch s¬n Nam Léc, Tr­êng B¹ch s¬n B¾c Léc "}
map3 = {	"<#>C¸c T©n thñ th«n ",
			"<#>GÇn bªn Bæn m«n, c¸c thµnh thÞ næi danh ",
			"<#>KiÕm C¸c Trung Nguyªn, KiÕm C¸c T©y Nam, KiÕm C¸c T©y B¾c, La Tiªu s¬n, Vò L¨ng s¬n, TÇn L¨ng ",
			"<#>Phôc Ng­u s¬n §«ng, Kim Quang ®éng, vµ TÇn L¨ng tÇng 1, Vò Di s¬n ",
			"<#>Táa V©n ®éng, Long Cung ®éng, vµ §iÓm Th­¬ng ®éng tÇng 2, Thanh Thµnh s¬n, §iÓm Th­¬ng s¬n ",
			"<#>H­ëng Thñy ®éng, BiÖn Kinh ThiÕt Th¸p tÇng 1, 2, 3, vµ T­êng V©n ®éng tÇng 1, Ngù Hoa Viªn s¬n ®éng ",
			"<#>T­êng V©n ®éng tÇng 2, 3, 4, vµ Thiªn NhÉn Th¸nh ®éng, D­¬ng Gi¸c ®éng, Tróc T¬ ®éng tÇng 1 ",
			"<#>D­îc V­¬ng ®éng tÇng 2, L·o Hæ ®éng, T­êng V©n ®éng 5 tÇng, Linh Cèc ®éng, L©m Du Quan ",
			"<#>Sa m¹c §Þa BiÓu, Vò L¨ng ®éng, V« danh ®éng, Nh¹n Th¹ch ®éng, TÇn L¨ng tÇng 3, Tr­êng B¹ch s¬n C­íc ",
			"<#>Sa m¹c s¬n ®éng tÇng 1, 2, 3, vµ D­îc V­¬ng ®éng tÇng 4, C¸n Viªn ®éng, Tr­êng B¹ch s¬n Nam Léc, Tr­êng B¹ch s¬n B¾c Léc "}
map4 = {	"<#>C¸c T©n thñ th«n ",
			"<#>GÇn bªn Bæn m«n, c¸c thµnh thÞ næi danh ",
			"<#>KiÕm C¸c Trung Nguyªn, KiÕm C¸c T©y Nam, KiÕm C¸c T©y B¾c, La Tiªu s¬n, Vò L¨ng s¬n, TÇn L¨ng ",
			"<#>Miªu LÜnh, D­îc V­¬ng ®éng tÇng 1, Kho¸i Ho¹t L©m, vµ Phôc Ng­u s¬n §«ng, Kim Quang ®éng, TuyÕt B¸o ®éng tÇng 1, 2 ",
			"<#>KiÕn TÝnh Phong s¬n ®éng, Kª Qu¸n ®éng, Hoµng Hµ Nguyªn §Çu, vµ Táa V©n ®éng, §iÓm Th­¬ng ®éng tÇng 2 ",
			"<#>H­ëng Thñy ®éng, B¨ng HuyÖt Mª Cung, L­u Tiªn ®éng tÇng 1, vµ ThiÕt Th¸p tÇng 1,2,3 ",
			"<#>Hoµnh s¬n ph¸i, T­¬ng D­¬ng VÖ m«n mËt ®¹o, vµ L­u Tiªn ®éng tÇng 2,3,4 ",
			"<#>§µo Hoa Nguyªn, L­u Tiªn ®éng tÇng 5, 6 vµ TÇn L¨ng tÇng 2, Long Nh·n ®éng, L©m Du Quan ",
			"<#>Sa m¹c §Þa BiÓu, L­ìng Thñy ®éng, V« danh ®éng, B¨ng Hµ ®éng, Thanh Khª ®éng, Tr­êng B¹ch s¬n C­íc ",
			"<#>Sa m¹c s¬n ®éng tÇng 1, 2, 3, vµ D­îc V­¬ng ®éng tÇng 4, C¸n Viªn ®éng, Tr­êng B¹ch s¬n Nam Léc, Tr­êng B¹ch s¬n B¾c Léc "}

function map_help()
	ser = GetSeries() + 1
	lvl = floor(GetLevel()/10 + 1)
	if (lvl > 10) then lvl = 10 end
	if (ser == 1) then
		Say(npc_name.."<#>: §èi víi hÖ <color=red>Kim  "..lv_str[lvl].."<#><color>§èi víi ng­¬i mµ nãi , n¬i luyÖn c«ng tèt nhÊt gåm cã"..map0[lvl].."<#>. ",0)
	elseif (ser == 2) then
		Say(npc_name.."<#>: §èi víi hÖ <color=red>Méc  "..lv_str[lvl].."<#><color>§èi víi ng­¬i mµ nãi , n¬i luyÖn c«ng tèt nhÊt gåm cã"..map1[lvl].."<#>. ",0)
	elseif (ser == 3) then
		Say(npc_name.."<#>: §èi víi hÖ <color=red>Thñy  "..lv_str[lvl].."<#><color>§èi víi ng­¬i mµ nãi , n¬i luyÖn c«ng tèt nhÊt gåm cã"..map2[lvl].."<#>. ",0)
	elseif (ser == 4) then
		Say(npc_name.."<#>: §èi víi hÖ <color=red>Háa  "..lv_str[lvl].."<#><color>§èi víi ng­¬i mµ nãi , n¬i luyÖn c«ng tèt nhÊt gåm cã"..map3[lvl].."<#>. ",0)
	else
		Say(npc_name.."<#>: §èi víi hÖ <color=red>Thæ  "..lv_str[lvl].."<#><color>§èi víi ng­¬i mµ nãi , n¬i luyÖn c«ng tèt nhÊt gåm cã"..map4[lvl].."<#>. ",0)
	end
end

function skill_help()
	fact_num = GetLastFactionNumber() + 1
	if (fact_num == 1) then				-- ÉÙÁÖ
		Talk(5,"","Nh÷ng ng­êi theo <color=red>ThiÕu L©m ph¸i<color>, vâ nghÖ ph©n theo 3 h­íng:","H­íng thø nhÊt gäi lµ: 'QuyÒn ThiÕu L©m', lÊy Hµng Long BÊt Vò, ThiÕu L©m QuyÒn Ph¸p, La H¸n TrËn, Long Tr¶o Hæ Tr¶o, Nh­ Lai Thiªn DiÖp, §¹t Ma §é Gianglµm chñ.","H­íng thø hai gäi lµ: 'C«n ThiÕu L©m', lÊy Kim Cang Phôc Ma, ThiÕu L©m C«n ph¸p, La H¸n TrËn, Hoµnh T¶o Lôc Hîp, Nh­ Lai Thiªn DiÖp, Hoµnh T¶o Thiªn Qu©n lµm chñ.","H­íng thø ba gäi lµ: '§ao ThiÕu L©m', lÊy Kim Cang Phôc Ma, ThiÕu L©m §ao ph¸p, La H¸n TrËn, Ma Ha V« L­îng, Nh­ Lai Thiªn DiÖp, V« T­íng Tr¶m lµm chñ.","Ngoµi ra cßn cã BÊt §éng Minh V­¬ng, S­ Tö Hèng, DÞch C©n kinh c¸c lo¹i vâ c«ng nµy gióp Ých cho ng­¬i rÊt nhiÒu ph­¬ng diÖn.")
	elseif (fact_num == 2) then		-- ÌìÍõ
		Talk(5,"","Nh÷ng ng­êi theo <color=red>Thiªn V­¬ng bang<color>, vâ nghÖ ph©n theo 3 h­íng:","H­íng thø nhÊt gäi lµ: '§ao Thiªn V­¬ng', lÊy Kinh L«i Tr¶m, Thiªn V­¬ng  §ao ph¸p, B¸t Phong Tr¶m, V« T©m Tr¶m, Thiªn V­¬ng ChiÕn ý, Ph¸ Thiªn Tr¶m lµm chñ.","H­íng thø hai gäi lµ: 'Th­¬ng Thiªn V­¬ng', lÊy Håi Phong L¹c Nh¹n, Thiªn V­¬ng Th­¬ng ph¸p, D­¬ng Quan Tam §iÖp, HuyÕt ChiÕn B¸t Ph­¬ng, Thiªn V­¬ng ChiÕn ý, Truy Tinh Trôc NguyÖt lµm chñ.","H­íng thø ba gäi lµ: 'Chïy Thiªn V­¬ng', lÊy Tr¶m Long quyÕt, Thiªn V­¬ng Chïy Ph¸p, Hµng V©n QuyÕt, Thõa Long QuyÕt, Thiªn V­¬ng ChiÕn ý, Truy Phong QuyÕt lµm chñ.","Ngoµi ra cßn cã TÜnh T©m QuyÕt, §o¹n Hån ThÝch, Kim Chung Tr¸o c¸c lo¹i vâ c«ng nµy gióp Ých cho ng­¬i rÊt nhiÒu ph­¬ng diÖn.")
	elseif (fact_num == 3) then		-- ÌÆÃÅ
		Talk(5,"","Nh÷ng ng­êi theo <color=red> ®­êng M«n <color> vâ nghÖ ph©n theo 4 h­íng:","H­íng thø nhÊt gäi lµ: 'Phi §ao§­êng', lÊy TÝch LÞch §¬n, §­êng M«n ¸m khÝ, Truy T©m TiÔn, TiÓu Lý Phi §ao, T©m Nh·n, NhiÕp Hån NguyÖt ¶nh lµm chñ.","H­íng thø hai gäi lµ: 'Tô TiÔn §­êng', lÊy TÝch LÞch §¬n, §­êng M«n ¸m khÝ, M¹n Thiªn Hoa Vò, Thiªn La §Þa Vâng, T©m Nh·n, B¹o Vò Lª Hoa lµm chñ.","H­íng thø ba gäi lµ: 'Phi Tiªu§­êng', lÊy TÝch LÞch §¬n, §­êng M«n ¸m khÝ, §o¹t Hån Tiªu, T¸n Hoa Tiªu, T©m Nh·n, Cöu Cung Phi Tinh lµm chñ.","H­íng thø t­ gäi lµ: 'H·m TÜnh §­êng', lÊy §Þa DiÖm Háa, §éc ThÝch Cèt, Xuyªn T©m ThÝch, Hµn B¨ng ThÝch, L«i KÝch ThuËt, Lo¹n Hoµn KÝch lµm chñ.")
	elseif (fact_num == 4) then		-- Îå¶¾
		Talk(5,"","Nh÷ng ng­êi theo <color=red>Ngò §éc gi¸o<color>, vâ nghÖ ph©n theo 3 h­íng:","H­íng thø nhÊt gäi lµ: 'Ch­ëng §éc', lÊy §éc Sa Ch­ëng, Ngò §éc Ch­ëng Ph¸p, U Minh Kh« L©u, Thiªn C­¬ng §Þa S¸t, Ngò §éc Kú Kinh, ¢m Phong Thùc Cèt lµm chñ.","H­íng thø hai gäi lµ: '§ao ®éc', lÊy HuyÕt §ao §éc S¸t, Ngò §éc §ao ph¸p, B¸ch §éc Xuyªn T©m, Chu C¸p Thanh Minh, Ngò §éc Kú Kinh, HuyÒn ¢m Tr¶m lµm chñ.","H­íng thø ba gäi lµ: 'Chó thuËt ®éc', lÊy Cöu Thiªn Cuång L«i, XÝch DiÖm Thùc Thiªn, B¨ng Lam HuyÒn Tinh, Xuyªn Y Ph¸ Gi¸p, Xuyªn T©m §éc ThÝch, §o¹n C©n Hñ Cèt lµm chñ.","Ngoµi ra cßn cã T¹p Nan D­îc Kinh, V« H×nh §éc, V¹n §éc Thùc T©m c¸c lo¹i vâ c«ng nµy gióp Ých cho ng­¬i rÊt nhiÒu ph­¬ng diÖn.")
	elseif (fact_num == 5) then		-- ¶ëáÒ
		Talk(4,"","Nh÷ng ng­êi theo <color=red>Nga Mi ph¸i<color>, vâ nghÖ ph©n theo 3 h­íng:","H­íng thø nhÊt gäi lµ: 'KiÕm T«ng Nga Mi', lÊy NhÊt DiÖp Tri Thu, Nga Mi KiÕm ph¸p, Th«i Song Väng NguyÖt, BÊt DiÖt BÊt TuyÖt, PhËt Ph¸p V« Biªn, Tam Nga TÒ TuyÕt lµm chñ.","H­íng thø hai gäi lµ: 'KhÝ T«ng Nga Mi', lÊy Phiªu TuyÕt Xuyªn V©n, Nga Mi Ch­ëng ph¸p, Tø T­îng §ång Quy, PhËt Quang Phæ ChiÕu, PhËt Ph¸p V« Biªn, Phong S­¬ng To¸i ¶nh lµm chñ.","H­íng thø ba hai gäi lµ: 'Toµn Phô Nga Mi', lÊy Tõ Hµng Phæ §é, Méng §iÖp, L­u Thñy, PhËt T©m Tõ H÷u, Thanh ¢m Ph¹n X­íng, Phæ §é Chóng Sinh lµm chñ.")
	elseif (fact_num == 6) then		-- ´äÑÌ
		Talk(4,"","Nh÷ng ng­êi theo <color=red>Thóy Yªn m«n <color>, vâ nghÖ ph©n theo 2 h­íng:","H­íng thø nhÊt gäi lµ: '§¬n ®aoThóy Yªn', lÊy Phong Hoa TuyÕt NguyÖt, Thóy Yªn §ao ph¸p, Vò §¶ Lª Hoa, Môc D· L­u Tinh, B¨ng Cèt TuyÕt T©m, B¨ng Tung V« ¶nh lµm chñ.","H­íng thø hai gäi lµ: 'Song ®aoThóy Yªn', lÊy Phong QuyÓn Tµn TuyÕt, Thóy Yªn Song ®ao, Phï V©n T¸n TuyÕt, BÝch H¶i TriÒu Sinh, B¨ng Cèt TuyÕt T©m, B¨ng T©m Tiªn Tö  lµm chñ.","Ngoµi ra cßn cã B¨ng T©m Tr¸i ¶nh, Hé ThÓ Hµn B¨ng, TuyÕt ¶nh c¸c lo¹i vâ c«ng nµy gióp Ých cho ng­¬i rÊt nhiÒu ph­¬ng diÖn")
	elseif (fact_num == 7) then		-- Ø¤°ï
		Talk(4,"","Nh÷ng ng­êi theo <color=red>C¸i Bang <color>, vâ nghÖ ph©n theo 2 h­íng:","H­íng thø nhÊt gäi lµ: 'Ch­ëng C¸i', lÊy KiÕn Nh©n ThÇn Thñ, C¸i Bang Ch­ëng Ph¸p, Gi¸ng Long Ch­ëng, Kh¸ng Long H÷u Hèi, Tóy §iÖp Cuång Vò, Phi Long T¹i Thiªn lµm chñ.","H­íng thø hai gäi lµ: 'C«n C¸i', lÊy Diªn M«n Th¸c B¸t, C¸i Bang Bæng ph¸p, §¶ CÈu Bæng, Bæng §¶ ¸c CÈu, Tóy §iÖp Cuång Vò, Thiªn H¹ V« CÈu lµm chñ.","Ngoµi ra cßn cã Hãa HiÓm Vi Di, Ho¹t BÊt L­u Thñ, Tiªu Diªu C«ng  c¸c lo¹i vâ c«ng nµy gióp Ých cho ng­¬i rÊt nhiÒu ph­¬ng diÖn")
	elseif (fact_num == 8) then		-- ÌìÈÌ
		Talk(4,"","Nh÷ng ng­êi theo <color=red>Thiªn NhÉn gi¸o<color>, vâ nghÖ ph©n theo 3 h­íng:","H­íng thø nhÊt gäi lµ: 'ChiÕn NhÉn', lÊy Tµn D­¬ng Nh­ HuyÕt, Thiªn NhÉn M©u ph¸p, LiÖt Háa T×nh Thiªn, Th©u Thiªn Ho¸n NhËt, Thiªn Ma Gi¶i ThÓ,V©n Long KÝch lµm chñ.","H­íng thø hai gäi lµ: 'Ma NhÉn', lÊy §¬n ChØ LiÖt DiÖm, Thiªn NhÉn §ao ph¸p, Th«i S¬n §iÒn H¶i, Ma DiÖm ThÊt S¸t, Thiªn Ma Gi¶i ThÓ, Thiªn Ngo¹i L­u Tinh lµm chñ.","H­íng thø ba gäi lµ: 'Chó thuËt nhÉn', lÊy Háa Liªn PhÇn Hoa, ¶o ¶nh Phi Hå, Phi Hång V« TÝch, Bi T« Thanh Phong, LÞch Ma §o¹t Hån, NhiÕp Hån Lo¹n T©m lµm chñ.")
	elseif (fact_num == 9) then		-- Îäµ±
		Talk(4,"","Nh÷ng ng­êi theo <color=red>Vâ §ang ph¸i<color>, vâ nghÖ ph©n theo 2 h­íng:","H­íng thø nhÊt gäi lµ: 'KhÝ T«ng Vâ §ang', lÊy Né L«i ChØ, Vâ §ang QuyÒn Ph¸p, B¸c CÊp Nhi Phôc, V« Ng· V« KiÕm, Th¸i Cùc ThÇn C«ng, Thiªn §Þa V« Cùc lµm chñ.","H­íng thø hai gäi lµ: 'KiÕm T«ng Vâ §ang', lÊy Th­¬ng H¶i Minh NguyÖt, Vâ §ang KiÕm ph¸p, KiÕm Phi Kinh Thiªn, Tam Hoµn Thao NguyÖt, Th¸i Cùc ThÇn C«ng, Nh©n KiÕm Hîp NhÊt  lµm chñ.","Ngoµi ra cßn cã ThÊt Tinh TrËn, ThÕ V©n Tung, Täa Väng V« Ng· c¸c lo¹i vâ c«ng nµy gióp Ých cho ng­¬i rÊt nhiÒu ph­¬ng diÖn")
	elseif (fact_num == 10) then		-- À¥ÂØ
		Talk(5,"","Nh÷ng ng­êi theo <color=red>C«n L«n ph¸i<color>, vâ nghÖ ph©n theo 3 h­íng:","H­íng thø nhÊt gäi lµ: '§ao C«n L«n', lÊy H« Phong Ph¸p, C«n L«n §ao ph¸p, NhÊt KhÝ Tam Thanh, Cuång Phong SËu §iÖn, S­¬ng Ng¹o C«n L«n, Ng¹o TuyÕt Tiªu Phong lµm chñ.","H­íng thø hai gäi lµ: 'KiÕm C«n L«n', lÊy Cuång L«i ChÊn §Þa, C«n L«n KiÕm ph¸p, Thiªn TÕ TÊn L«i, Ngò L«i chÝnh Ph¸p, S­¬ng Ng¹o C«n L«n, L«i §éng Cöu Thiªn lµm chñ.","H­íng thø ba gäi lµ: 'Chó thuËt C«n L«n', lÊy Thóc Ph­îc Chó, Ki B¸n phï, B¾c Minh §¸o H¶i, Khi Hµn Ng¹o TuyÕt, Mª Tung ¶o ¶nh, Tóy Tiªn T¸ Cèt lµm chñ.","Ngoµi ra cßn cã Thanh Phong phï, Thiªn Thanh §Þa Träc, KhÝ T©m Phï c¸c lo¹i vâ c«ng nµy gióp Ých cho ng­¬i rÊt nhiÒu ph­¬ng diÖn")
	else									-- °×Ãû
		Say(npc_name.."<#>: ng­¬i thËm chÝ ch­a hÒ tham gia m«n ph¸i nµo, nãi g× ®Õn chuyÖn luyÖn hay kh«ng luyÖn ph¸p ",0)
	end
end

GV_TSK_CD_OPEN = 35
tbDEFENCE_SIGNMAP = { 518, 519 }
tbSIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}
tbDEFENCE_RETURN = {
						[1] = { 1520,3228, "Ph­îng T­êng Phñ ", 2 },	--·ïÏè
						[11] = { 3018,5089, "Thµnh §« Phñ ", 1 },	--³É¶¼
						[37] = { 1632,3185, "BiÖn Kinh Phñ ", 2 },	--ãê¾©
						[78] = { 1439,3214, "T­¬ng D­¬ng Phñ ", 1 },	--ÏåÑô
						[80] = { 1593,3197, "D­¬ng Ch©u Phñ ", 1 },	--ÑïÖÝ
						[162] = { 1470,3269, "§¹i Lý", 1 },	--´óÀí
						[176] = { 1392,3313, "L©m An Phñ ", 1 },	--ÁÙ°²
					}
CD_LEVEL_LIMIT = 80		--×îµÍ²Î¼ÓÊØ³ÇµÈ¼¶

function main(sel)
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
    Msg2Player(szNpcName)
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	--µ¯³ö¶Ô»°¿ò
	
	tbDailog.szTitleMsg = npc_name.."<#>Tuy kh«ng ph¶i lµ ng­êi trong giang hå, nh­ng hµng ngµy ta thÊy c¸c ng­¬i qua l¹i rÊt nhiÒu lÇn. Kh«ng ph¶i kho¸c l¸c v× hoµn c¶nh c¸c ng­¬i ta hiÓu rÊt râ. "
	
	local mapid = SubWorldIdx2ID( SubWorld )
	local camp = tbDEFENCE_RETURN[mapid][4]
						
	tbDailog:AddOptEntry("Tham gia Phong V©n LuËn KiÕm", CallRescrptFunc )
	tbDailog:AddOptEntry("T×m hiÓu khu vùc luyÖn c«ng", map_help )
	tbDailog:AddOptEntry("T×m hiÓu vâ nghÖ bæn m«n", skill_help )
	tbDailog:AddOptEntry("T¸n gÉu", default_talk )
	tbDailog:AddOptEntry("Rêi khái")
	
	if ( GetGlbValue( GV_TSK_CD_OPEN ) == camp ) then
		tbDailog:AddOptEntry("Tham gia chiÕn dÞch thñ thµnh", want2cd_signmap)
	end
	
	
	tbDailog:Show()
end

function want2cd_signmap()
	if ( GetLevel() < CD_LEVEL_LIMIT ) then
		Say(npc_name..": ¸? Ng­¬i còng muèn tham gia chiÕn dÞch thñ thµnh µh? §¼ng cÊp ch­a ®ñ ®©u"..CD_LEVEL_LIMIT.."CÊp, tµi nghÖ nh­ ng­¬i ®©y gióp kh«ng ®­îc g× ®©u, cã thÓ mÊt m¹ng nh­ ch¬i n÷a, th«i ë l¹i thµnh nµy ®i!", 0)
		return
	end
	Say(npc_name..": Ng­¬i muèn ®i gi÷ thµnh µh? Muèn l¾m µh? ói! Ng­¬i vÜ ®¹i thËt ®ã! Nh­ng nghe ®©u t×nh huèng cÊp b¸ch l¾m th× ph¶i! Trong thµnh chØ cßn thñ ®­îc 2 tiÕng n÷a th«i, nÕu trong 2 tiÕng kh«ng kÝch lui ®­îc qu©n ®Þch th× thÊt thñ råi! Cßn muèn tham gia chØ cã t­íng qu©n míi quyÕt ®Þnh ®­îc, ta cã thÓ dÉn ng­¬i qua ®ã.", 2, "Ta biÕt råi! Mau dÉn ta qua ®ã ®i!/sure2cd_signmap", "§Ó ta chuÈn bÞ ®·!/no")
end

function sure2cd_signmap()
	LeaveTeam();
	local mapid = SubWorldIdx2ID( SubWorld )
	local camp = tbDEFENCE_RETURN[mapid][4]
	if ( camp == nil ) then
		Say(npc_name..": PhÝa tr­íc h×nh nh­ kh«ng th«ng!", 0)
		return
	end
	if (camp == 1) then
		Msg2Player("Vµo khu vùc thñ thµnh phe Tèng")
	else
		Msg2Player("Vµo khu vùc thñ thµnh phe Kim")
	end
	SetTask(TASKID_FIRE_ADDR, SubWorldIdx2ID(SubWorld))
	SetFightState(0)
	NewWorld(bt_getsignpos(camp))	--campÔÚÊØ³ÇÎÀ±ø´¦¶¨Òå
end

function bt_getsignpos(camp)
	if ( camp ~= 1 and camp ~= 2 ) then
		camp = 1;
	end;
	local a = random(getn(tbSIGNMAP_POS))
	
	return tbDEFENCE_SIGNMAP[camp], tbSIGNMAP_POS[a][1], tbSIGNMAP_POS[a][2]
end

function cd_about_compose()
	Say(npc_name..": Haha! Nh×n trang bÞ cña ng­¬i nh­ vËy mµ còng ®ßi ®i c«ng thñ thµnh! Th«i nµo! §­a ®©y ta v¸ l¹i hé cho!", 0)
end

function CallRescrptFunc()
	if ( GetLevel() < 40 ) then
		Talk( 1, "", npc_name..": Phong V©n LuËn KiÕm lµ n¬i rÊt nguy hiÓm, ch­a ®¹t cÊp 40 kh«ng thÓ tham gia chiÕn tr­êng." );
	else
		Say ( npc_name..": Nh©n sè ®«ng sÏ chiÕm ­u thÕ, tuy nhiªn ®iÓm sè nhËn ®­îc sÏ Ýt h¬n, ng­¬i muèn ®Õn n¬i b¸o danh bªn nµo?", 3, "Vµo ®iÓm b¸o danh phe Vµng (T)/#DoRescriptFunc(1)", "Vµo ®iÓm b¸o danh phe TÝm (K)/#DoRescriptFunc(2)","§Ó ta suy nghÜ l¹i./no" );
	end;
end;

function DoRescriptFunc(nSel)
	local tbsongjin_pos = {1608,3254};	--ËÎ·½×ø±êµã
	local szstr = "Tèng";
	if (nSel == 2) then
		tbsongjin_pos = {1566,3277};
		szstr = "Kim";
	end;
	if ( GetLevel() >= 40 and GetLevel() < 60 ) then
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
		Msg2Player( "§· vµo ®iÓm b¸o danh" );
	elseif ( GetLevel() >= 60 and GetLevel() < 90 ) then
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
		Msg2Player( "§· vµo ®iÓm b¸o danh" );
	else
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
		Msg2Player( "§· vµo ®iÓm b¸o danh" );
	end
end;

function no()
end
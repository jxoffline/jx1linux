Include("\\script\\battles\\battlehead.lua")
BALANCE_MAMCOUNT = 5
strbattleinfo=
{
	"Tèng Kim cã nh÷ng h×nh thøc tham chiÕn sau, ng­¬i muèn t×m hiÓu……",
	"Ng­¬i muèn hái g×?",
	"C¸c ®¹o cô liªn quan/info_sjthing",
	"§iÓm tİch lòy /info_adduppoint2",--°æµ÷ÓÃinfo_adduppoint2
	"Lµm sao ®Ó theo dâi tin tøc chiÕn tr­êng/info_reportface",
	"Nh÷ng ®iÓm cÇn chó ı./info_note",
	"Ta ®· biÕt hÕt råi!/cancel",
	"C¸ch xem tin tøc chiÕn sù: trong lóc tham chiÕn, cã thÓ dïng phİm ~ (phİm trªn phİm Tab) ®Ó bËt t¾t b¸o c¸o tãm t¾t, th«ng qua ®ã cã thÓ biÕt ®­îc thµnh tİch cña chİnh m×nh, vµ th«ng tin chiÕn tİch cña 10 ng­êi ch¬i cao nhÊt.",--¼´Ê±Õ½±¨½çÃæ
--	"Íæ¼ÒËÎ½ğĞÅÏ¢½çÃæËµÃ÷£ºµã»÷F12¼ü£¬Íæ¼Ò¿ÉÒÔ¿´µ½×Ô¼ºÔÚËÎ½ğ´óÕ½ÖĞµÄÏêÏ¸Í³¼ÆĞÅÏ¢¡£µ±Ç°Õ½ÒÛĞÅÏ¢¡ª¡ªÍæ¼ÒÔÚµ±Ç°Õ½ÒÛÖÜÆÚÄÚµÄ¾ßÌå±íÏÖ£»ÀúÊ·ĞÅÏ¢¡ª¡ªÍæ¼ÒËù²Î¼ÓµÄËùÓĞÕ½ÒÛµÄÀÛ¼ÆĞÅÏ¢¡£<enter>Crtl+Êó±êÓÒ¼üµã»÷ÆäËûÍæ¼Ò£¬ÔÙÑ¡ÔñËÎ½ğĞÅÏ¢£¬¿ÉÒÔ²é¿´ÆäËûÍæ¼ÒµÄËÎ½ğ´óÕ½ĞÅÏ¢¡£"--Íæ¼ÒËÎ½ğĞÅÏ¢½çÃæ
}


function help_sjbattle()--Á½ÖÖ¶áÆì¹æÔò
	Say(strbattleinfo[1],5,"Qui t¾c ®o¹t kú (cè ®Şnh) /info_fixation1","Qui t¾c ®o¹t kú (ngÉu nhiªn) /info_random1","Qui t¾c b¶o vÖ Nguyªn So¸i/info_marshal","Qui t¾c Tèng Kim §¹i ChiÕn/help_more","Ta hiÓu råi, c¶m ¬n!/cancel")
end


function help_more()--ËÎ½ğ´óÕ½ÆäËûÏà¹ØĞÅÏ¢
	Say(strbattleinfo[2],5,strbattleinfo[3],strbattleinfo[4],strbattleinfo[5],strbattleinfo[6],strbattleinfo[7])
end

function info_book()--ËÎ½ğÚ¯Êé
	Say("Tèng Kim ChiÕu Th­: Sö dông sÏ ®­îc ®­a th¼ng ®Õn ®Şa ®iÓm b¸o danh. Cã thÓ mua t¹i tiÖm t¹p hãa trong c¸c thµnh, gi¸ <color=yellow>5000<color>l­îng",2,"T×m hiÓu th«ng tin kh¸c/help_more","Ta hiÓu råi!/cancel")
end
function info_flag()
	Say("Cê hiÖu: Sau khi di chuyÓn So¸i kú ®Õn ®İch, nhÊp vµo Cê hiÖu ®Ó c¾m cê. Lóc ®ang di chuyÓn cã thÓ nhÊp vµo Cê hiÖu ®Ó x¸c ®Şnh l¹i täa ®é. Mçi Cê hiÖu chØ dïng ®­îc 1 lÇn. Cã thÓ mua ë Qu©n Nhu Quan, gi¸ <color=yellow>5000<color>l­îng.",2,"T×m hiÓu c¸c th«ng tin kh¸c/help_more","Ta hiÓu råi!/cancel")
end

function info_sjthing()
	Say("§¹o cô Tèng Kim ®¹i chiÕn:",3,"Cê hiÖu /info_flag","Tèng Kim ChiÕu Th­ /info_book","Ta hiÓu råi!/cancel")
end

stradduppointhelp=
{
--	"»ı·ÖËµÃ÷£ºÍæ¼Ò»ñµÃµÄ»ı·Ö²»½öÈ¡¾öÓÚ×Ô¼ºÔÚÕ½³¡ÖĞµÄ¹¦¼¨£¬»¹È¡¾öÓÚÕ½ÓÑµÄ±íÏÖºÍË«·½µÄÈËÊı¡£Ã¿¸öÈË»ñµÃµÄ»ı·Ö¶¼»á·Ö³É¸ø×Ô¼ºµÄÕ½ÓÑÒ»²¿·Ö¡£",
	"Ng­êi ch¬i giÕt ®­îc c¸c lo¹i NPC kh¸c nhau (ph©n theo cÊp bËc) , hoÆc PK th¾ng qu©n ®Şch (lµ ng­êi ch¬i) , PK th¾ng liªn tiÕp, ®o¹t b¸u vËt, hoµn thµnh nhiÖm vô ®o¹t kú, phe giµnh ®­îc chiÕn th¾ng cuèi cïng sÏ ®­îc céng thªm ®iÓm tİch lòy. <enter>Khi ch­a khai chiÕn, cã thÓ dïng ®iÓm tİch lòy ®Ó mua c¸c ®¹o cô chuyªn dông. Sau khi khai chiÕn, kh«ng thÓ tiÕn hµnh giao dŞch. ",
	"Qu©n sè lµ mét ­u thÕ trong chiÕn tr­êng, nh­ng th¾ng b¹i l¹i c¨n cø vµo ®iÓm tİch lòy.",
	"Liªn tr¶m: Khi PK th¾ng qu©n ®Şch 3 lÇn liªn tiÕp (®èi ph­¬ng thÊp h¬n m×nh kh«ng qu¸ 3 cÊp) sÏ ®­îc tİnh thªm ®iÓm tİch lòy.",
	"Khi vµo tham chiÕn, dùa theo tæng ®iÓm tİch lòy, trªn ®Çu ng­êi ch¬i sÏ xuÊt hiÖn t­íc hiÖu. ThÊp nhÊt lµ Binh sÜ; 1000 ®iÓm = HiÖu óy; 3000 ®iÓm = Thèng LÜnh; 6000 ®iÓm = Phã t­íng; 10 000 ®iÓm = §¹i T­íng.",
	"Sau khi kÕt thóc, phe th¾ng mçi ng­êi t¨ng 3 ®iÓm danh väng vµ 1000 ®iÓm tİch lòy + 1 phÇn quµ ngÉu nhiªn; phe thua mçi ng­êi 300 ®iÓm. NÕu hßa nhau, mçi bªn ®­îc th­ëng 500 ®iÓm/ng­êi. §iÓm th­ëng cßn c¨n cø vµo lùc l­îng cña 2 bªn.Bªn nµo İt ng­êi ®iÓm th­ëng sÏ cao h¬n.",
	
}

function info_adduppoint2()--»ı·Ö»ñµÃ
	Say(stradduppointhelp[1],3,"Trang kÕ /info_adduppoint2_1","T×m hiÓu th«ng tin kh¸c/help_more","Ta hiÓu råi!/cancel")
end

function info_adduppoint2_1()
	Say(stradduppointhelp[2],3,"Trang kÕ /info_adduppoint2_2","T×m hiÓu th«ng tin kh¸c/help_more","Ta hiÓu råi!/cancel")
end

function info_adduppoint2_2()
	Say(stradduppointhelp[3],3,"Trang kÕ /info_adduppoint2_3","T×m hiÓu th«ng tin kh¸c/help_more","Ta hiÓu råi!/cancel")
end

function info_adduppoint2_3()
	Say(stradduppointhelp[4],3,"Trang kÕ /info_adduppoint2_4","T×m hiÓu th«ng tin kh¸c/help_more","Ta hiÓu råi!/cancel")
end

function info_adduppoint2_4()
	Say(stradduppointhelp[5],2,"T×m hiÓu th«ng tin kh¸c/help_more","Ta hiÓu råi!/cancel")
end



function info_reportface()--¼´Ê±Õ½±¨½çÃæ
	Say(strbattleinfo[8],2,"T×m hiÓu th«ng tin kh¸c/help_more","Ta hiÓu råi!/cancel")
end


strinfo_note=
{
	"Chó ı: sau khi b¸o danh sÏ ®­îc ®­a vµo hËu doanh. Tõ ®ã cã thÓ ®Õn hËu doanh. Nh­ng tr­íc khi khai chiÕn kh«ng ®­îc rêi khái ®¹i doanh. Sau khi khai chiÕn cã thÓ tïy ı x«ng ra chiÕn tuyÕn, còng cã thÓ tïy ı quay l¹i hËu doanh. Nh­ng kh«ng thÓ x©m nhËp vµo hËu donah cña ®èi ph­¬ng.",--ÔÚºóÓªµÄÍæ¼Ò²»»á¼ÇÈë»ı·ÖÍ³¼Æ¡£",
	"Khi ng­êi ch¬i ®ang ë trong tr¹ng th¸i gi÷ So¸i Kú, sÏ kh«ng thÓ ®i ng­îc l¹i hËu doanh mua d­îc hoÆc më r­¬ng"--<enter>Òª×¢ÒâÔÚËÎ½ğ´óÕ½½áÊøÇ°5·ÖÖÓ£¬»á¹Ø±ÕËÎ½ğ´óÕ½Õ½³¡Èë¿ÚºÍÕ½³¡ÖĞµÄºóÓª³öÈë¿Ú¡£´¦ÓÚºóÓªµÄÍæ¼Ò¿ÉÒÔÏÂÏßÀë¿ªÕ½³¡£¬µ«ÊÇÀë¿ªÕ½³¡µÄÍæ¼Ò²»»á¼ÇÈë»ı·ÖÍ³¼Æ¡£",
}
function info_note()
	Say(strinfo_note[1],1,"Trang kÕ /info_note1")	
end

function info_note1()
	Say(strinfo_note[2],2,"T×m hiÓu th«ng tin kh¸c/help_more","Ta hiÓu råi!/cancel")
end

strfixationhelp=
{
	"Ph­¬ng thøc ®o¹t cê cè ®Şnh: Sau khi khai chiÕn, song ph­¬ng sÏ ngÉu nhiªn xuÊt hiÖn 1 So¸i Kú (h×nh d¹ng binh sÜ cÇm cê) , trªn viÕt 1 ch÷ Tèng hoÆc Kim. NhÊp vµo So¸i Kú ng­êi ch¬i sÏ biÕn thµnh gièng nh­ NPC, ®ång thêi hÖ thèng sÏ th«ng b¸o täa ®é cÇn ®Õn (Cã thÓ xem täa ®é trªn b¶n ®å nhá!) ",
	"Còng cã thÓ nhÊp vµo <color=red>Cê hiÖu<color> ®Ó xem täa ®é. Sau khi ®· ®Õn ®İch, nhÊp vµo <color=red>Cê hiÖu<color> ®Ó c¾m So¸i Kú.. NÕu trªn ®­êng ®i bŞ träng th­¬ng, cê sÏ ®­îc c¾m t¹i n¬i ®ã, ng­êi kh¸c cã thÓ tiÕp tôc chuyÓn cê vÒ ®İch.",
	"Sau khi So¸i Kú ®· chuyÓn ®Õn ®İch, trong doanh tr¹i phe m×nh sÏ xuÊt hiÖn 1 So¸i Kú míi. Phe chuyÓn nhiÒu cê nhÊt sÏ giµnh th¾ng lîi chung cuéc"
}
function info_fixation1()--¹Ì¶¨¶áÆì¹æÔò1
	Say(strfixationhelp[1],1,"Trang kÕ /info_fixation2")
end

function info_fixation2()--¹Ì¶¨¶áÆì¹æÔò2
	Say(strfixationhelp[2],1,"Trang kÕ /info_fixation3")
end

function info_fixation3()
	Say(strfixationhelp[3],2,"T×m hiÓu th«ng tin kh¸c/help_sjbattle","Ta hiÓu råi!/cancel")
end


strrandomhelp=
{
	"Ph­¬ng thøc ®o¹t cê ngÉu nhiªn: Sau khi khai chiÕn, trong ®¹i doanh vµ tiÒn tuyÕn sÏ ngÉu nhiªn xuÊt hiÖn So¸i Kú, (h×nh d¹ng binh sÜ cÇm cê) , trªn viÕt 1 ch÷ hoÆc Kim. NhÊp vµo So¸i Kú ng­êi ch¬i sÏ biÕn thµnh gièng nh­ NPC, ®ång thêi hÖ thèng sÏ th«ng b¸o täa ®é cÇn ®Õn (Cã thÓ xem täa ®é trªn b¶n ®å nhá!) . Còng cã thÓ nhÊp ph¶i vµo <color=red>Cê hiÖu<color> ®Ó xem täa ®é.",
	"Sau khi ®· ®Õn ®İch,  nhÊp vµo <color=red>Cê hiÖu<color> ®Ó c¾m So¸i Kú. NÕu trªn ®­êng ®i bŞ träng th­¬ng, cê sÏ ®­îc c¾m t¹i n¬i ®ã, ng­êi kh¸c cã thÓ tiÕp tôc chuyÓn cê vÒ ®İch.",
}
function info_random1()--Ëæ»ú¶áÆì¹æÔò1
	Say(strrandomhelp[1],1,"Trang kÕ /info_random2")
end

function info_random2()
	Say(strrandomhelp[2],2,"T×m hiÓu th«ng tin kh¸c/help_sjbattle","Ta hiÓu råi!/cancel")
end

strmarshalhelp="Ph­¬ng thøc b¶o vÖ Nguyªn So¸i: Nöa giê sau khi khai chiÕn,  t¹i Doanh tr¹i phe İt ®iÓm tİch lòy nhÊt sÏ xuÊt hiÖn Nguyªn So¸i,  10 phót sau Nguyªn so¸i phe kia còng sÏ xuÊt hiÖn. NÕu ®iÓm tİch lòy b»ng nhau th× 2 Nguyªn So¸i sÏ cïng xuÊt hiÖn. Môc tiªu lóc nµy lµ tiªu diÖt Nguyªn So¸i phe ®Şch. KÕt thóc chiÕn trËn,  nÕu 2 Nguyªn so¸i vÉn cßn th× sÏ c¨n cø vµo ®iÓm tİch lòy cña 2 bªn ®Õn ph©n th¾ng b¹i."

function info_marshal()
	Say(strmarshalhelp, 2, "T×m hiÓu th«ng tin kh¸c/help_sjbattle","Ta hiÓu råi!/cancel")
end

TIMELIST = "10:50,12:50,14:50,16:50,18:50,20:50,22:50"
strbt_info=
{
	"VŞ trİ chiÕn tr­êng/bt_infoaddress",
	"Thêi gian khai chiÕn/bt_infotime",
	"§iÒu kiÖn b¸o danh/bt_infoneed",
	"Quy t¸c b¸o danh/bt_infobaomingrule",
	"C¸c vËt phÈm cÇn thiÕt/bt_infoflag",
	"C¸c ®¹o cô liªn quan/bt_infothing",
	"C¸c chøc n¨ng míi khi b¸o danh?/bt_infonew",
	"§iÓm b¸o danh phe Tèng n»m ë h­íng B¾c T­¬ng D­¬ng, cña phe Kim lµ ë h­íng Nam Chu Tiªn trÊn",
	format("ChiÕn tr­êng Tèng Kim chİnh thøc b¸o danh lóc %s. Thêi gian b¸o danh lµ %d phót, hÖ thèng sÏ liªn tôc th«ng b¸o. <enter>Thêi gian chiÕn ®Êu lµ %d phót, cø mçi %d phót hÖ thèng sÏ c«ng b¸o t×nh h×nh. NÕu hÕt thêi gian b¸o danh sè ng­êi tham gia vÉn ch­a ®ñ, ng­êi ch¬i vÉn cã thÓ tiÕp tôc b¸o danh.",TIMELIST, BAOMING_TIME, FIGHTING_TIME, ANNOUNCE_TIME),
--	"ËÎ½ğÕ½³¡½«ÓÚÃ¿Ìì11£º00¡¢13£º00¡¢15£º00¡¢17£º00¡¢19£º00¡¢21£º00¡¢23£º00×¼Ê±¿ª·Å±¨Ãû£¨ÏµÍ³¹ã²¥¹ö¶¯Í¨Öª£©£¬±¨ÃûÊ±¼äÎª30·ÖÖÓ¡£<enter>±¨Ãû½áÊøºóÕıÊ½¿ªÕ½£¬Õ½¶·Ê±¼äÎª60·ÖÖÓ£¬Ã¿20Ãë¹«²¼Ò»´ÎÕ½¿ö¡£±¨Ãû½áÊøºóÈô²ÎÕ½ÈËÊıÎ´´ïµ½ÉÏÏŞ£¬Ôò¿É¼ÌĞø±¨Ãû½øÈëÕ½³¡¡£",
	"Ng­êi ch¬i ph¶i ®¹t ®Õn hoÆc cao h¬n cÊp <color=yellow>40<color> míi cã thÓ b¸o danh, phİ b¸o danh <color=yellow>100000<color> l­îng. Tèng kim ®¹i chiÕn ph©n ra lµm ba cÊp bËc: s¬ cÊp (cÊp 40~79), trung cÊp (cÊp 80~119), cao cÊp (cÊp 120 trë lªn).",
	"Sè l­îng tèi ®a lµ: <color=yellow>400<color>ng­êi. HÕt thêi gian b¸o danh nÕu vÉn ch­a ®ñ nh©n sè vÉn cã thÓ b¸o danh, nh­ng nÕu mét phe nhiÒu h¬n phe kia <color=yellow>"..BALANCE_MAMCOUNT.."ng­êi<color>, th× sÏ kh«ng thÓ tham gia vµo phe ®ã, cÇn ph¶i İt h¬n phe kia<color=yellow>"..BALANCE_MAMCOUNT.."ng­êi<color> míi ®­îc nhËn thªm.",
	"Qui t¾c b¸o danh: Thêi gian cña 1 chiÕn dŞch lµ 1 tuÇn. Mçi lÇn më 1 chiÕn dŞch míi, sè ®iÓm tİch lòy cña tuÇn tr­íc sÏ trë vÒ 0. Trän 1 chiÕn dŞch chØ ®­îc tham gia cho 1 phe, muèn thay ®æi, ph¶i ®îi ®Õn tuÇn sau.",--±¨ÃûÊ±Íæ¼ÒĞèÒªÈ¨ºâË«·½ÈËÊıÒòËØ£¬ÏµÍ³»á×Ô¶¯¸ù¾İË«·½ÈËÊıµÄ¶àÉÙµ÷½Ú»ı·Ö¡£ÈËÊıÕ¼ÓÅ·½µÄ»ı·Ö½«ÓĞË¥¼õ£¬ÈËÊıÁÓÊÆ·½µÄ»ı·Ö½«ÓĞ¼Ó³É¡£",
	"Nh÷ng chøc n¨ng míi: tr­íc khi chİnh thøc khai chiÕn, cã thÓ dïng ®iÓm tİch lòy ®Õn Qu©n Nhu quan ®Ó mua c¸c ®¹o cô chuyªn dông. Sau khi khai chiÕn sÏ kh«ng thÓ mua",
}
function bt_onbattleinfo()
	Say(strbattleinfo[2],9,"Qui t¾c tham chiÕn/bt_infohelprule",strbt_info[1],strbt_info[2],strbt_info[3],strbt_info[4],strbt_info[5],strbt_info[6],strbt_info[7],"Ta hiÓu råi! C¶m ¬n!/cancel")
end


function bt_infoaddress()--ËÎ½ğ´óÕ½³¡Î»ÖÃ
	Say(strbt_info[8],2,"T×m hiÓu th«ng tin kh¸c/bt_onbattleinfo","Ta hiÓu råi!/cancel")
end

function bt_infotime()--ËÎ½ğÊ±¼ä
	Say(strbt_info[9],2,"T×m hiÓu th«ng tin kh¸c/bt_onbattleinfo","Ta hiÓu råi/cancel")
end

function bt_infoneed()--±¨ÃûĞèÇó
	Say(strbt_info[10],3,"Trang kÕ /bt_infoneed1","T×m hiÓu th«ng tin kh¸c/bt_onbattleinfo","Ta hiÓu råi/cancel")
end

function bt_infoneed1()--±¨ÃûĞèÇó
	Say(strbt_info[11],2,"T×m hiÓu th«ng tin kh¸c/bt_onbattleinfo","Ta hiÓu råi/cancel")
end

function bt_infobaomingrule()
	Say(strbt_info[12],2,"T×m hiÓu th«ng tin kh¸c/bt_onbattleinfo","Ta hiÓu råi/cancel")
end


function bt_infonew()--±¨ÃûµãĞÂÔö¹¦ÄÜ
	Say(strbt_info[13],2,"T×m hiÓu th«ng tin kh¸c/bt_onbattleinfo","Ta hiÓu råi/cancel")
end

function bt_infothing()--ËÎ½ğ´óÕ½µÀ¾ß
	Say("§¹o cô Tèng Kim ®¹i chiÕn:",3,"Cê hiÖu /bt_infoflag","Tèng Kim ChiÕu Th­ /bt_infobook","Ta hiÓu råi!/cancel")
end

function bt_infobook()--ËÎ½ğÚ¯Êé
	Say("Tèng Kim ChiÕu Th­: Sö dông sÏ ®­îc ®­a th¼ng ®Õn ®Şa ®iÓm b¸o danh. Cã thÓ mua t¹i tiÖm t¹p hãa trong c¸c thµnh, gi¸ <color=yellow>5000<color>l­îng",2,"T×m hiÓu th«ng tin kh¸c/bt_onbattleinfo","Ta hiÓu råi!/cancel")
end

function bt_infoflag()--Æì±ê
	Say("Cê hiÖu: Sau khi di chuyÓn So¸i kú ®Õn ®İch, nhÊp vµo Cê hiÖu ®Ó c¾m cê. Lóc ®ang di chuyÓn cã thÓ nhÊp vµo Cê hiÖu ®Ó x¸c ®Şnh l¹i täa ®é. Mçi Cê hiÖu chØ dïng ®­îc 1 lÇn. Cã thÓ mua ë Qu©n Nhu Quan, gi¸ <color=yellow>5000<color>l­îng.",2,"T×m hiÓu th«ng tin kh¸c/bt_onbattleinfo","Ta hiÓu råi!/cancel")
end

function bt_infohelprule()--Á½ÖÖ¶áÆì¹æÔò
	Say("Ng­¬i muèn t×m hiÓu quy t¾c nµo?",5,"Qui t¾c ®o¹t kú (cè ®Şnh) /info_fixation1","Qui t¾c ®o¹t kú (ngÉu nhiªn) /info_random1","Qui t¾c b¶o vÖ Nguyªn So¸i/info_marshal","Qui t¾c Tèng Kim §¹i ChiÕn/bt_onbattleinfo","Ta hiÓu råi, c¶m ¬n!/cancel")
end

function cancel()
end

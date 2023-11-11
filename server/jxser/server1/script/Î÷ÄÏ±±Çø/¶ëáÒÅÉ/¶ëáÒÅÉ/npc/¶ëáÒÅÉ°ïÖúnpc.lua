--¶ëáÒÅÉ°ïÖúNPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "TuÖ Ni"

function main(sel)

UTask_em = GetTask(1)

if (UTask_em < 10*256) then						--Î´½Ó¶ëáÒÅÉÈëÃÅÈÎÎñ£¬Î´Èë¶ëáÒÅÉ
	if (GetFaction() ~= "") then				--Èç¹ûÍæ¼ÒÒÑ¾­ÊôÓÚÁíÒ»ÃÅÅÉ
		Say("Thİ chñ cã g× chØ gi¸o ch¨ng?", 3, "T×m hiÓu quı ph¸i/org", "T×m hiÓu c¸c vŞ n÷ hiÖp/member", "T×m hiÓu bè côc n¬i nµy/config")
		return
	else
		Say("Thİ chñ muèn gia nhËp m«n ph¸i hay cã g× cÇn gióp ®ì?", 4, "T×m hiÓu quı ph¸i/org", "T×m hiÓu c¸c vŞ n÷ hiÖp/member", "T×m hiÓu bè côc n¬i nµy/config", "Lµm sao ®Ó nhËp m«n?/task1")
		return	
	end
end;
	
if (UTask_em == 70*256) then					--¶ëáÒÅÉÒÑ¾­³öÊ¦		
	Say("Th× ra lµ tû muéi ®ång m«n! Kh«ng biÕt cã g× chØ gi¸o!", 6, "T×m hiÓu l¹i Nga My Ph¸i/org", "T×m hiÓu l¹i ®ång m«n tr­íc kia/member", "T×m hiÓu l¹i bè côc n¬i nµy/config", "Cßn nhiÖm vô nµo ®Ó lµm n÷a/task3","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help")
	return
end;	

Say("S­ muéi cã g× muèn hái?",7,"§èi tho¹i víi Long Ngò /Uworld1000_word","T×m hiÓu bæn ph¸i/org", "T×m hiÓu ®ång m«n/member", "T×m hiÓu bè côc n¬i nµy/config", "T×m hiÓu nhiÖm vô /task3","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("Muèn t×m hiÓu ph­¬ng diÖn nµo?", 4, "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;


function member()
Say("Muèn t×m hiÓu ai?", 13, "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;


function config()
Say("Muèn t×m hiÓu ph­¬ng diÖn nµo?", 4, "C¸c vïng l©n cËn/c1", "Tr­íc nói/c2", "KiÕn tróc chİnh/c3", "Sau nói/c4")
end;


function task1()
Say("Bæn ph¸i chØ thu nhËn ®Ö tö n÷. Muèn nhËp m«n häc nghÖ, cÇn th«ng qua nhiÖm vô nhËp m«n.", 1, "T×m hiÓu cô thÓ nhiÖm vô nhËp m«n/v1")
end;


function task2()
Say("<#>: Ng­¬i ®· xuÊt s­, kh«ng cÇn lµm nhiÖm vô cña bæn ph¸i, hiÖn ®·"..UTask_em.."<#>.", 0)
end;


function task3()

UTask_em = GetTask(1)

if (UTask_em < 10*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô nhËp m«n/v1")
end;

if (UTask_em == 10*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, giê ®· nhËp m«n, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô g­¬ng ®ång/v2")
end;

if (UTask_em > 10*256) and (UTask_em < 20*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô g­¬ng ®ång/v2")
end;

if (UTask_em == 20*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô thu phôc m·nh hæ /v3")
end;

if (UTask_em > 20*256) and (UTask_em < 30*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô thu phôc m·nh hæ /v3")
end;

if (UTask_em == 30*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô Háa Hå /v4")
end;

if (UTask_em > 30*256) and (UTask_em < 40*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô Háa Hå /v4")
end;

if (UTask_em == 40*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô Khóc phæ /v5")
end;

if (UTask_em > 40*256) and (UTask_em < 50*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô Khóc phæ /v5")
end;

if (UTask_em == 50*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô Tİn T­íng Tù /v6")
end;

if (UTask_em > 50*256) and (UTask_em < 60*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô Tİn T­íng Tù /v6")
end;

if (UTask_em == 60*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô xuÊt s­ /v7")
end;

if (UTask_em > 60*256) and (UTask_em < 70*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô xuÊt s­ /v7")
end;

if (UTask_em >= 70*256) and (UTask_em < 80*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ,tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn"..UTask_em.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô xuÊt s­ /v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say(" Nga Mi lµ m«n ph¸i do n÷ nhi s¸ng lËp.'Nga Mi' võa lµ tªn gäi cña vŞ s­ tæ s¸ng lËp m«n ph¸i võa lµ th¸nh ®Şa nói Nga Mi ", 4, "BiÕt råi/ok", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;

function o2()
Say("Nga Mi s¬n thuéc vïng T©y Nam, thÕ nói quanh co uèn l­în, trïng trïng ®iÖp ®iÖp", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;

function o3()
Say("cïng víi  ThiÕu L©m vµ Vâ §ang hîp thµnh 3 danh m«n ch¸nh ph¸i lín ë Trung Nguyªn. C¸c m«n ph¸i trong thiªn h¹ do n÷ nhi s¸ng lËp th× bæn m«n ®øng ®Çu", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Æc s¾c m«n ph¸i/o4")
end;

function o4()
Say("Nga Mi ph¸i quy luËt nghiªm kh¾c. C¸c ®Ö tö ®Òu ph¶i gi÷ m×nh trong s¹ch. Kh«ng nh÷ng vâ nghÖ cao c­êng mµ cÇm k× thi häa còng tinh th«ng", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3")
end;

--------------------------------

function m1()
Say("VŞ trİ: <color=blue>Chİnh ®iÖn<color>  Täa ®é: <color=blue>199,200<color>  phô tr¸ch <color=blue>nhiÖm vô<color><enter>TrÇm mÆc İt nãi nh­ng rÊt khoan dung ®é l­îng. QuyÕt t©m ph¸t d­¬ng quang ®¹i Nga Mi ph¸i.V× nhiÖm vô s½n sµngthÓ hy sinh c¶ b¶n th©n", 13, "BiÕt råi/ok", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;

function m2()
Say("VŞ trİ: <color=blue>Thanh ¢m ®×nh<color>  Täa ®é: <color=blue>239,332<color>  phô tr¸ch <color=blue>nhiÖm vô<color><enter>tinh th«ng trµ ®¹o nh­ng tİnh c¸ch kiªu c¨ng. BiÕt bao trang nam tö ®· ®æ lÖ v× c« ta", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;

function m3()
Say("VŞ trİ: <color=blue>Nghªnh Kh¸ch Th¹ch<color>  Täa ®é: <color=blue>227,322<color>  phô tr¸ch <color=blue>nhiÖm vô<color><enter>tinh th«ng ©m luËt, th«ng minh lanh lîi, sèng néi t©m", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;

function m4()
Say("VŞ trİ: <color=blue>B¸n S¬n Ph¸<color>  Täa ®é: <color=blue>229,320<color>  phô tr¸ch <color=blue>nhiÖm vô<color><enter> bªn ngoµi ®a sÇu ®a c¶m nh­ng bªn trong cøng r¾n ®«i khicè chÊp. Mét khi ®· quyÕt ®Şnh chuyÖn g× th× khã ai ng¨n c¶n ®­îc", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;

function m5()
Say("VŞ trİ: <color=blue>Toµn Thiªn Ph¸<color>  Täa ®é: <color=blue>221,321<color>  phô tr¸ch <color=blue>nhiÖm vô<color><enter> lµ ng­êi ho¹t b¸t vui vÎ, nh©n hËu ®¸ng yªu!", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;

function m6()
Say("VŞ trİ: <color=blue>HËu ®­êng<color>  Täa ®é: <color=blue>242,305<color>  phô tr¸ch <color=blue>nhiÖm vô<color><enter> th©n thiÖn dÔ gÇn, yªu th­¬ng sóc vËt, ®«i lóc rÊt nhu nh­îc", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;

function m7()
Say("VŞ trİ: <color=blue>T¶ Biªn ®iÖn<color>  Täa ®é: <color=blue>201,199<color>  phô tr¸ch <color=blue>nhiÖm vô<color><enter>tİnh t×nh phãng kho¸ng, hµnh xö thËn träng, rÊt yªu quı  TÇn û Phong", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;

function m8()
Say("VŞ trİ: <color=blue>Toµn Thiªn Ph¸<color>  Täa ®é: <color=blue>231,313<color>  phô tr¸ch <color=blue>nhiÖm vô<color><enter> lµ ng­êi sèng néi t©m, trÇm tÜnh İt nãi!", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;

function m9()
Say("VŞ trİ: <color=blue>TiÒn ®iÖn<color>  Täa ®é: <color=blue>200,198<color>  phô tr¸ch <color=blue>nhiÖm vô<color><enter> lµ ng­êi nhu nh­îc, lu«n l­ìng lù gi÷a hång trÇn vµ câi phËt. NhiÒu lóc tù lµm khæ m×nh vµ khæ c¶ ng­êi kh¸c!", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;

function m10()
Say("VŞ trİ: <color=blue>Gi¶ng Kinh ®­êng <color>  Täa ®é: <color=blue>197,200<color>  phô tr¸ch <color=blue>nhiÖm vô<color><enter> lµ ng­êi quyÕt ®o¸n, yªu ghĞt râ rµng", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;

function m11()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng<color>  Täa ®é: <color=blue>247,305<color>  phô tr¸ch <color=blue>Giao dŞch binh khİ<color>", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu T©m/m12", "Ni C« DiÖu KhiÕt/m13")
end;

function m12()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng<color>  Täa ®é: <color=blue>246,307<color>  phô tr¸ch <color=blue>Giao dŞch trang bŞ<color>", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu KhiÕt/m13")
end;

function m13()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng<color>  Täa ®é: <color=blue>244,306<color>  phô tr¸ch <color=blue>Giao dŞch d­îc phÈm<color>", 13, "BiÕt råi/ok", "Ch­ëng m«n Thanh HiÓu S­ Th¸i/m1", "ChiÕt Mai Tiªn Tö DiÖp B¨ng Ng©n/m2", "PhÊt V©n Tiªn Tö TÇn û Phong/m3", "Hoµnh Ba Tiªn Tö Hµ Linh Phiªu/m4", "Di Quang Tiªn Tö T¹ V©n La/m5", "¸nh TuyÕt Tiªn Tö Môc V©n Tõ /m6", "B¸i NguyÖt Tiªn Tö T« Tõ Hinh/m7", "Ni C« DiÖu TrÇn/m8", "Ni C« DiÖu Èn/m9", "Ni C« DiÖu Nh­ /m10", "Ni C« DiÖu Linh/m11", "Ni C« DiÖu T©m/m12")
end;

--------------------------------

function c1()
Say("D­íi ch©n nói cã 2 h­íng ®i. §«ng  ®i Thµnh §«, Nam ®i Tr­êng Giang Nguyªn ®Çu.", 4, "BiÕt råi/ok", "Tr­íc nói/c2", "KiÕn tróc chİnh/c3", "Sau nói/c4")
end;

function c2()
Say("Trªn nói gåm cã: Thanh ¢m ®×nh (239,331) , Toµn Thiªn Ph¸ (221,321) , Nghªnh Kh¸ch Th¹ch (227,322) , B¸n S¬n Ph¸ (229,320) ", 4, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "KiÕn tróc chİnh/c3", "Sau nói/c4")
end;

function c3()
Say("tr­íc nói cã TiÒn ®iÖn (237,311) , Gi¶ng Kinh ®­êng (240,308) , Chİnh ®iÖn (248,304) , T¶ Biªn ®iÖn (246,304) ", 4, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "Tr­íc nói/c2", "Sau nói/c4")
end;

function c4()
Say("Sau nói cã M·nh Hæ ®éng (281,297) vµ Ng¹c Ng­ hå (303,308) .", 4, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "Tr­íc nói/c2", "KiÕn tróc chİnh/c3")
end;

--------------------------------

function v1()							
Talk(6, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, cã thÓ gia nhËp Nga Mi ph¸i, trë thµnh <color=blue>Bè Y Ni<color>, häc ®­îc vâ c«ng <color=blue>Phiªu TuyÕt Xuyªn V©n<color>.<enter>TiÕp nhËn nhiÖm vô, cÇn ph¶i ®¹t ®iÒu kiÖn sau: Ngò hµnh thuéc tİnh: hÖ Thñy, ®¼ng cÊp ®¹t ®Õn 10, kh«ng lµm nhiÖm vô nhËp m«n cña bÊt kú m«n ph¸i nµo","B­íc 1: §Õn <color=blue>Thanh ¢m ®×nh<color> gÆp <color=blue>DiÖp B¨ng H©n<color>, tiÕp nhËn nhiÖm vô, qua 'Trµ quan'", "B­íc 2: §Õn <color=blue>Nghªnh Kh¸ch Th¹ch<color> gÆp <color=blue>TÇn û Phong <color>, qua 'CÇm quan'", "B­íc 3: §Õn <color=blue>B¸n S¬n Ph¸<color> gÆp <color=blue>Hµ Linh Phiªu<color>, qua 'V¨n quan'", "B­íc 4: §Õn <color=blue>Toµn Thiªn Ph¸<color> gÆp <color=blue>T¹ V©n L©u <color>,x«ng Toµn Thiªn Ph¸, ®¸nh b¹i <color=blue>Vò Y Ni<color>, lÊy ®­îc <color=red>B¹ch Ngäc Nh­ ı<color>.", "B­íc 5: VÒ <color=blue>Chİnh ®iÖn<color> giao <color=red>B¹ch Ngäc Nh­ ı<color> cho <color=blue>Ch­ëng m«n Thanh HiÓu S­ Th¸i<color>, hoµn thµnh nhiÖm vô.")
end;


function v2()
Talk(9, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Vò Y Ni<color>, häc ®­îc vâ c«ng <color=blue>Nga Mi KiÕm ph¸p,Nga Mi Ch­ëng ph¸p,Thu Phong DiÖp<color>.<enter>TiÕp nhËn nhiÖm vô nµy cÇn ph¶i lµ ®Ö tö trªn cÊp 10","B­íc 1: §Õn <color=blue>TiÒn ®iÖn<color> gÆp <color=blue>Ni C« DiÖu Èn<color>, tiÕp nhËn nhiÖm vô,  ®i lÊy <color=red>nöa m¶nh g­¬ng tr¸i<color>.", "B­íc 2: §Õn <color=blue>D­íi nói<color> t×m <color=blue>DiÖu Èn t­íng c«ng (240,328)<color>, lÊy ®­îc <color=red>nöa m¶nh g­¬ng ph¶i<color>.", "B­íc 3: §Õn <color=blue>Thµnh §«<color> t×m <color=blue>thî rÌn <color>, tiÕp nhËn nhiÖm vô ®i t×m <color=red>L­îng Ng©n Kho¸ng<color>.", "B­íc 4: Ra <color=blue>cæng phİa t©y Thµnh §«<color> ®Ó t×m <color=red>L­îng Ng©n Kho¸ng<color>.", "B­íc 5: giao L­îng Ng©n Kho¸ng cho <color=blue>thî rÌn <color>, nhËn ®­îc <color=red>tÊm g­¬ng hoµn chØnh<color>.", "B­íc 6: Trë vÒ <color=blue>TiÒn ®iÖn<color>,®èi tho¹i víi <color=blue>DiÖu Èn<color>, sau ®ã mang <color=red>g­¬ng ®ång<color> cho <color=blue>DiÖu Èn t­íng c«ng<color>. NÕu g­¬ng ®ång bŞ mÊt, ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu.", "B­íc 7: L¹i xuèng <color=blue>ch©n nói<color>, giao <color=red>g­¬ng ®ång<color> cho <color=blue>DiÖu Èn t­íng c«ng<color>.", "B­íc 8: Trë vÒ <color=blue>TiÒn ®iÖn<color>, gÆp <color=blue>Ni C« DiÖu Èn<color>, hoµn thµnh nhiÖm vô.")
end;


function v3()
Talk(4, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>CÈm Y Ni<color>, häc ®­îc vâ c«ng <color=blue>Tø T­îng §ång Quy,Väng NguyÖt,Phong Vò Phiªu H­¬ng<color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 20 vµ ®· hoµn thµnh nhiÖm vô g­¬ng ®ång.","B­íc 1: §Õn <color=blue>Gi¶ng Kinh ®­êng <color> gÆp <color=blue>Ni C« DiÖu Nh­<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>M·nh Hæ ®éng<color> thu phôc m·nh hæ ", "B­íc 2: §Õn <color=blue>M·nh Hæ ®éng<color>,liªn tôc ®¸nh b¹i <color=blue>B¹ch hæ tinh (221,202)<color> 3 lÇn", "B­íc 3: Trë vÒ <color=blue>Gi¶ng Kinh ®­êng <color>, b¸o tin cho <color=blue>Ni C« DiÖu Nh­<color>, hoµn thµnh nhiÖm vô.")
end;


function v4()
Talk(5, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>B¹ch Liªn Tiªn tö<color>, häc ®­îc vâ c«ng <color=blue>NhÊt DiÖp Tri Thu, L­u Thñy, B¨ng T©m QuyÕt<color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 30 vµ ®· hoµn thµnh nhiÖm vô thu phôc m·nh hæ ","B­íc 1: §Õn <color=blue>hËu §­êng <color> gÆp <color=blue>Môc V©n Tõ<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>Ng¹c Ng­ hå<color> t×m <color=red>Háa hå<color>.", "B­íc 2: Tr­íc khi ®i t×m Háa hå, cÇn ®Õn <color=blue>Thµnh §«<color> mua <color=red> ®ïi gµ<color>.", "B­íc 3: §Õn <color=blue>Ng¹c Ng­ hå<color> ®¸nh b¹i <color=blue>Th»n l»n chóa<color>, t×m ®­îc <color=red>Háa hå<color>.", "B­íc 4: Trë vÒ <color=blue>hËu §­êng<color>, giao <color=red>Háa hå<color> cho <color=blue>Môc V©n Tõ<color>, hoµn thµnh nhiÖm vô. NÕu Háa hå bŞ mÊt, ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu.")
end;


function v5()
Talk(8, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Thanh Liªn Tiªn tö<color>, häc ®­îc vâ c«ng <color=blue>BÊt DiÖt BÊt TuyÖt, Méng §iÖp<color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 40 vµ ®· hoµn thµnh nhiÖm vô Háa hå ","B­íc 1: §Õn <color=blue>T¶ Biªn ®iÖn<color> gÆp <color=blue>T« Tõ Hinh<color>, tiÕp nhËn nhiÖm vô, ®i t×m <color=red>khóc phæ 'B¸ch §iÓu TriÒu Phông'<color>.", "B­íc 2: §Õn <color=blue>ThÇn Tiªn ®éng<color> t×m <color=blue>Cao nh©n (234,204)<color>, tr­íc tiªn ®¸nh b¹i <color=blue>Linh thó<color>, sau ®ã nhËn nhiÖm vô ®i t×m <color=red>'Phï Dung CÈm Kª ®å'<color>.", "B­íc 3: Trë vÒ <color=blue>Thµnh §« t×m Th¸i B×nh Tiªu Côc<color>, gÆp <color=blue>chñ Tiªu côc (377,316)<color>, tiÕp nhËn nhiÖm vô, ®i t×m <color=red>Linh X¹ H­¬ng Nang, ¦ng T×nh Hé Th©n phï<color> vµ <color=red>Bİch Tû Giíi ChØ<color>.", "B­íc 4: ®i t×m <color=blue>TiÕt TiÓu Muéi (383,315)<color> ®Ó lÊy <color=red>Linh X¹ H­¬ng Nang<color>?®Õn  Tİn T­íng tù t×m <color=blue>Tõ V©n Ph¸p s­ (402,319)<color> ®Ó lÊy <color=red>¦ng T×nh Hé Th©n phï<color>?t×m <color=blue>T©n Viªn ngo¹i (400,309)<color> ®Ó lÊy <color=red>Bİch Tû Giíi ChØ<color>.", "B­íc 5: Trë vÒ gÆp <color=blue>Chñ Tiªu Côc<color>, giao <color=blue>3 thø «ng ta cÇn<color>, lÊy ®­îc <color=red>'Phï Dung CÈm Kª ®å'<color>.", "B­íc 6: Trë l¹i <color=blue>ThÇn Tiªn ®éng<color>, giao 'Phï Dung CÈm Kª ®å' cho <color=blue>Cao nh©n<color> ®æi lÊy <color=red>'B¸ch §iÓu TriÒu Phông'<color>.", "B­íc 7: Trë vÒ <color=blue>T¶ Biªn ®iÖn<color>, giao <color=red>'B¸ch §iÓu TriÒu Phông'<color> cho <color=blue>T« Tõ Hinh<color>, hoµn thµnh nhiÖm vô. NÕu 'B¸ch §iÓu TriÒu Phông' bŞ mÊt, ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu.")
end;


function v6()
Talk(5, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>T¸n Hoa Thiªn N÷<color>, häc ®­îc vâ c«ng <color=blue>PhËt Quang Phæ ChiÕu, Tõ Hµng Phæ §é<color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 50 vµ ®· hoµn thµnh nhiÖm vô Khóc phæ ","B­íc 1: §Õn <color=blue>Chİnh ®iÖn<color> gÆp <color=blue>Ch­ëng m«n Thanh HiÓu S­ Th¸i<color>, tiÕp nhËn nhiÖm vô, giao <color=red>'Kim TuyÕn Tó T­îng Kim Cang Kinh'<color> ®Õn <color=blue>Tİn T­íng tù<color>.", "B­íc 2: §Õn <color=blue>Tİn T­íng tù<color>, gÆp <color=blue>Tõ V©n Ph¸p s­<color>,biÕt ®­îc ph­¬ng tr­îng Tõ H¶i ®¹i s­ ®· ®Õn <color=blue> ®Şa ®¹o hËu viÖn<color>.", "B­íc 3: §i vµo <color=blue> ®Şa ®¹o hËu viÖn<color>, ®¸nh b¹i <color=blue>Ph¶n t¨ng ®Çu môc<color>, cøu ®­îc Tõ H¶i ®¹i s­, giao <color=red>'Kim TuyÕn Tó T­îng Kim Cang Kinh'<color>.NÕu 'Kim TuyÕn Tó T­îng Kim Cang Kinh' bŞ mÊt, ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu.", "B­íc 4: Trë vÒ <color=blue>Chİnh ®iÖn<color>, gÆp <color=blue>Ch­ëng m«n<color> phôc mÖnh, hoµn thµnh nhiÖm vô.")
end;


function v7()
Talk(4, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Th¸nh N÷<color>, thuËn lîi xuÊt s­.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 50 vµ ®· hoµn thµnh nhiÖm vô Tİn T­íng tù ","B­íc 1: §Õn <color=blue>Chİnh ®iÖn<color> gÆp <color=blue>Ch­ëng m«n Thanh HiÓu S­ Th¸i<color>, tiÕp nhËn nhiÖm vô, ®o¹t l¹i tİn vËt <color=red>Yªn Ngäc ChØ hoµn<color>.", "B­íc 2: §Õn <color=blue>Tr­êng Giang nguyªn ®Çu<color> ®¸nh b¹i ph¶n ®å <color=blue>Thanh Hßa<color>, lÊy ®­îc <color=red>Yªn Ngäc ChØ hoµn<color>.", "B­íc 3: Trë vÒ <color=blue>Chİnh ®iÖn<color>, giao <color=red>Yªn Ngäc ChØ hoµn<color> cho <color=blue>Ch­ëng m«n<color>, hoµn thµnh nhiÖm vô. NÕu Yªn Ngäc ChØ hoµn bŞ mÊt, ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu.")
end;

function v8()
Talk(3,"","Th«ng qua nhiÖm vô trïng ph¶n s­ m«n, ng­¬i ®­îc phong lµ<color=blue> Kim §Ønh Th¸nh N÷<color>, häc ®­îc tuyÖt häc trÊn ph¸i<color=blue> BÊt DiÖt BÊt TuyÖt, PhËt Quang Phæ ChiÕu, Thanh ¢m Ph¹n X­íng<color>.","B­íc 1: Sau khi ®¼ng cÊp cña b¹n v­ît qua cÊp 60 t¹i<color=blue> Ch¸nh ®iÖn <color>gÆp <color=blue>Ch­ëng m«n Thanh HiÓu S­ Th¸i<color>, thØnh cÇu trïng ph¶n Nga My Ph¸i.","B­íc 2: Th«ng qua giao nép <color=red>50000 l­îng<color>, trïng ph¶n Nga My Ph¸i.")
end;

--------------------------------

function ok()
end;

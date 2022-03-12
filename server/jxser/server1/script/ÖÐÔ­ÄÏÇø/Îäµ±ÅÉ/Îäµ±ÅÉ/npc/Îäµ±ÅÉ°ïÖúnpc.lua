--Îäµ±ÅÉ°ïÖúNPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "Ch­ëng Th­ "

function main(sel)

UTask_wd = GetTask(5)

if (UTask_wd == 30*256+50) and (HaveMagic(165) ~= -1) and (GetCamp() == 4) then		-- Ñ§»áÁË¡°ÎŞÎÒÎŞ½£¡±²¢Õı³£³öÊ¦µ«±äÁ¿ÖµÎª30¼¶ÈÎÎñ³¬Ê±µÄ£¬½øĞĞÈİ´í¡£
	SetTask(5,70*256)
	Say("T×nh h×nh nhiÖm vô cña ng­¬i cã mét chót sai lÇm, ta ®· gióp ng­¬i söa ch÷a!",1,"C¸m ¬n!/no")
	return
end

if (UTask_wd < 10*256) then						--Î´½ÓÎäµ±ÅÉÈëÃÅÈÎÎñ£¬Î´ÈëÎäµ±ÅÉ
	if (GetFaction() ~= "") then				--Èç¹ûÍæ¼ÒÒÑ¾­ÊôÓÚÁíÒ»ÃÅÅÉ
		Say("BÇn ®¹o cã thÓ gióp ®­îc g×?", 3, "T×m hiÓu quı ph¸i/org", "T×m hiÓu c¸c vŞ  ®¹i hiÖp/member", "T×m hiÓu bè côc n¬i nµy/config")
		return
	else
		Say("BÇn ®¹o cã thÓ gióp ®­îc g×?", 4, "T×m hiÓu quı ph¸i/org", "T×m hiÓu c¸c vŞ  ®¹i hiÖp/member", "T×m hiÓu bè côc n¬i nµy/config", "Lµm sao ®Ó nhËp m«n?/task1")
		return
	end
end;
	
if (UTask_wd == 70*256) then					--Îäµ±ÅÉÒÑ¾­³öÊ¦		
	Say("Th× ra lµ ®ång m«n tr­íc ®©y, BÇn ®¹o cã thÓ gióp ®­îc g×?", 6, "TiÕp tôc t×m hiÓu  ph¸i Vâ §ang /org", "T×m hiÓu l¹i ®ång m«n tr­íc kia/member", "T×m hiÓu l¹i bè côc n¬i nµy/config", "Cßn nhiÖm vô nµo ®Ó lµm n÷a/task3","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help")
	return
end;

Say("BÇn ®¹o cã thÓ gióp ®­îc g×?", 7,"§èi tho¹i víi Long Ngò /Uworld1000_word", "T×m hiÓu bæn ph¸i/org", "T×m hiÓu ®ång m«n/member", "T×m hiÓu bè côc n¬i nµy/config", "T×m hiÓu nhiÖm vô /task3","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("Muèn t×m hiÓu ph­¬ng diÖn nµo?", 4, "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;


function member()
Say("Muèn t×m hiÓu ai?", 10, "Ch­ëng m«n §¹o NhÊt Ch©n Nh©n/m1", "DiÖp TiÕp Mü /m2", "Tõ §¹i Nh¹c/m3", "Chu V©n TuyÒn/m4", "§¬n T­ Nam/m5", "Diªu Th¹ch M«n/m6", "TiÓu ®¹o sÜ Thanh Phong/m7", "Hoa Hoµnh/m8", "Ngäc Thô /m9", "TiÓu ®¹o sÜ Minh NguyÖt/m10")
end;


function config()
Say("Muèn t×m hiÓu ph­¬ng diÖn nµo?", 4, "C¸c vïng l©n cËn/c1",  "Tr­íc nói/c2", "KiÕn tróc chİnh/c3", "Sau nói/c4")
end;


function task1()
Say("Bæn m«n chØ nhËn ®Ö tö hÖ Thæ, nam n÷ ®Òu ®­îc. Muèn nhËp m«n häc nghÖ, cÇn hoµn thµnh nhiÖm vô nhËp m«n.", 1, "T×m hiÓu cô thÓ nhiÖm vô nhËp m«n/v1")
end;


function task2()
Say("<#> Ng­¬i ®· xuÊt s­, kh«ng cÇn lµm nhiÖm vô cña bang ph¸i n÷a. HiÖn ®· "..UTask_wd.."<#>.", 0)
end;


function task3()

UTask_wd = GetTask(5)

if (UTask_wd < 10*256) then
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô nhËp m«n/v1")
end;

if (UTask_wd == 10*256) then
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, giê ®· nhËp m«n, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô §¹o §øc Kinh/v2")
end;

if (UTask_wd > 10*256) and (UTask_wd < 20*256) then	
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô §¹o §øc Kinh/v2")
end;

if (UTask_wd == 20*256) then	
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô §¹o Bµo/v3")
end;

if (UTask_wd > 20*256) and (UTask_wd < 30*256) then	
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô §¹o Bµo/v3")
end;

if (UTask_wd == 30*256) then
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô Häa mi th¶o/v4")
end;

if (UTask_wd > 30*256) and (UTask_wd < 40*256) then	
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô Häa mi th¶o/v4")
end;

if (UTask_wd == 40*256) then
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô NhuËn N­¬ng/v5")
end;

if (UTask_wd > 40*256) and (UTask_wd < 50*256) then	
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô NhuËn N­¬ng/v5")
end;

if (UTask_wd == 50*256) then	
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô hµnh thiÖn/v6")
end;

if (UTask_wd > 50*256) and (UTask_wd < 60*256) then	
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô hµnh thiÖn/v6")
end;

if (UTask_wd == 60*256) then	
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô xuÊt s­ /v7")
end;

if (UTask_wd > 60*256) and (UTask_wd < 70*256) then	
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô xuÊt s­ /v7")
end;

if (UTask_wd >= 70*256) and (UTask_wd < 80*256) then	
Say("<#> Ch­ëng Th­: Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_wd.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "Trïng ph¶n s­ m«n/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("Bæn ph¸i tin quyÒn ®¹o gi¸o 'HuyÒn thiªn chÊn vâ ®¹i ®Õ'. LŞch sö bæn ph¸i cã tõ rÊt l©u, ®­îc ng­êi ®êi gäi lµ néi gia chİ t«ng", 4, "BiÕt råi/ok", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;

function o2()
Say("Vâ §ang s¬n cã tªn lµ nói Th¸i Hßa, n»m ë néi c¶nh Hå B¾c, thÕ nói trïng ®iÖp hïng vÜ, tr¶i dµi ngµn dÆm. Vâ §ang s¬n cao s©u, hiÓm trë, ng­êi lªn ®ã sÏ cã c¶m gi¸c xuÊt thÕ mÆc niÖm.", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;

function o3()
Say("Bæn ph¸i lµ th¸nh ®Şa ®¹o gi¸o vâ l©m, cïng ThiÕu L©m tù phËt gi¸o tÒ danh, thiªn h¹ vâ häc, trong giang hå cã c©u 'B¾c t«n ThiÕu L©mn Nam sïng Vâ §ang'.", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Æc s¾c m«n ph¸i/o4")
end;

function o4()
Say("§Ö tö bæn ph¸i lµm ®iÒu hiÖp nghÜa vang danh thiªn h¹, ®èi xö gi÷a c¸c ®ång m«n th× ®Çy t×nh nghÜa. Vâ nghÖ bæn ph¸i chó träng ®Õn tu luyÖn vâ c«ng, lÊy tŞnh chÕ ®éng, lÊy nhu kh¾c c­¬ng, lÊy v« h×nh th¾ng h÷u h×nh", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3")
end;

--------------------------------

function m1()
Say("VŞ trİ: <color=blue>Tö Tiªu ®¹i ®iÖn<color>   Täa ®é: <color=blue>200,198<color>   phô tr¸ch <color=blue>nhiÖm vô<color><enter> ®¾c ®¹o cao nh©n, cã tr¸i tim ®«n hËu, yªu quı nh÷ng ng­êi trong giang hå träng nghÜa khİ.Lu«n trµn ®Çy sù l¹c quan", 10, "BiÕt råi/ok", "DiÖp TiÕp Mü /m2", "Tõ §¹i Nh¹c/m3", "Chu V©n TuyÒn/m4", "§¬n T­ Nam/m5", "Diªu Th¹ch M«n/m6", "TiÓu ®¹o sÜ Thanh Phong/m7", "Hoa Hoµnh/m8", "Ngäc Thô /m9", "TiÓu ®¹o sÜ Minh NguyÖt/m10")
end;

function m2()
Say("VŞ trİ: <color=blue>hå Thanh Thñy<color>   Täa ®é: <color=blue>213,190<color>   phô tr¸ch <color=blue>nhiÖm vô<color><enter> Vâ §ang ®¹i hiÖp! Lu«n khiªm tèn, cã chİ cÇu tiÕn", 10, "BiÕt råi/ok", "Ch­ëng m«n §¹o NhÊt Ch©n Nh©n/m1", "Tõ §¹i Nh¹c/m3", "Chu V©n TuyÒn/m4", "§¬n T­ Nam/m5", "Diªu Th¹ch M«n/m6", "TiÓu ®¹o sÜ Thanh Phong/m7", "Hoa Hoµnh/m8", "Ngäc Thô /m9", "TiÓu ®¹o sÜ Minh NguyÖt/m10")
end;

function m3()
Say("VŞ trİ: <color=blue>ThËp Ph­¬ng §iÖn<color>   Täa ®é: <color=blue>200,199<color>   phô tr¸ch <color=blue>nhiÖm vô<color><enter>Vâ §ang ®¹i hiÖp! RÊt hiÕu ®éng! Si mª vâ häc!", 10, "BiÕt råi/ok", "Ch­ëng m«n §¹o NhÊt Ch©n Nh©n/m1", "DiÖp TiÕp Mü /m2", "Chu V©n TuyÒn/m4", "§¬n T­ Nam/m5", "Diªu Th¹ch M«n/m6", "TiÓu ®¹o sÜ Thanh Phong/m7", "Hoa Hoµnh/m8", "Ngäc Thô /m9", "TiÓu ®¹o sÜ Minh NguyÖt/m10")
end;

function m4()
Say("VŞ trİ: <color=blue>phİa §«ng hå Thanh Thñy<color>   Täa ®é: <color=blue>219,192<color>   phô tr¸ch <color=blue>nhiÖm vô<color><enter>Vâ §ang ®¹i hiÖp! Tİnh t×nh cÈn thËn,xem xĞt vÊn ®Ò chu toµn,bÊt cø chuyÖn nhá nµo còng kh«ng qua m¾t «ng", 10, "BiÕt råi/ok", "Ch­ëng m«n §¹o NhÊt Ch©n Nh©n/m1", "DiÖp TiÕp Mü /m2", "Tõ §¹i Nh¹c/m3", "§¬n T­ Nam/m5", "Diªu Th¹ch M«n/m6", "TiÓu ®¹o sÜ Thanh Phong/m7", "Hoa Hoµnh/m8", "Ngäc Thô /m9", "TiÓu ®¹o sÜ Minh NguyÖt/m10")
end;

function m5()
Say("VŞ trİ: <color=blue>Long Hæ ®iÖn<color>   Täa ®é: <color=blue>200,199<color>   phô tr¸ch <color=blue>nhiÖm vô<color><enter>Vâ §ang ®¹i hiÖp! Tuæi trÎ anh hïng, chİ t×nh chİ nghÜa, v¨n vâ song toµn.", 10, "BiÕt råi/ok", "Ch­ëng m«n §¹o NhÊt Ch©n Nh©n/m1", "DiÖp TiÕp Mü /m2", "Tõ §¹i Nh¹c/m3", "Chu V©n TuyÒn/m4", "Diªu Th¹ch M«n/m6", "TiÓu ®¹o sÜ Thanh Phong/m7", "Hoa Hoµnh/m8", "Ngäc Thô /m9", "TiÓu ®¹o sÜ Minh NguyÖt/m10")
end;

function m6()
Say("VŞ trİ: <color=blue>Phô MÉu ®iÖn<color>   Täa ®é: <color=blue>200,199<color>   phô tr¸ch <color=blue>nhiÖm vô<color><enter>Vâ §ang ®¹i hiÖp! T×nh t×nh thuÇn l­¬ng, ®«i lóc nh­ trÎ con", 10, "BiÕt råi/ok", "Ch­ëng m«n §¹o NhÊt Ch©n Nh©n/m1", "DiÖp TiÕp Mü /m2", "Tõ §¹i Nh¹c/m3", "Chu V©n TuyÒn/m4", "§¬n T­ Nam/m5", "TiÓu ®¹o sÜ Thanh Phong/m7", "Hoa Hoµnh/m8", "Ngäc Thô /m9", "TiÓu ®¹o sÜ Minh NguyÖt/m10")
end;

function m7()
Say("VŞ trİ: <color=blue>giÕng Ma Ch©m<color>   Täa ®é: <color=blue>196,212<color>   phô tr¸ch <color=blue>nhiÖm vô<color><enter>Vâ §ang thŞ ®ång, thuÇn l­¬ng kh¶ ¸i.", 10, "BiÕt råi/ok", "Ch­ëng m«n §¹o NhÊt Ch©n Nh©n/m1", "DiÖp TiÕp Mü /m2", "Tõ §¹i Nh¹c/m3", "Chu V©n TuyÒn/m4", "§¬n T­ Nam/m5", "Diªu Th¹ch M«n/m6", "Hoa Hoµnh/m8", "Ngäc Thô /m9", "TiÓu ®¹o sÜ Minh NguyÖt/m10")
end;

function m8()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng<color>   Täa ®é: <color=blue>210,195<color>   phô tr¸ch <color=blue>Giao dŞch binh khİ<color>", 10, "BiÕt råi/ok", "Ch­ëng m«n §¹o NhÊt Ch©n Nh©n/m1", "DiÖp TiÕp Mü /m2", "Tõ §¹i Nh¹c/m3", "Chu V©n TuyÒn/m4", "§¬n T­ Nam/m5", "Diªu Th¹ch M«n/m6", "TiÓu ®¹o sÜ Thanh Phong/m7", "Ngäc Thô /m9", "TiÓu ®¹o sÜ Minh NguyÖt/m10")
end;

function m9()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng<color>   Täa ®é: <color=blue>207,194<color>   phô tr¸ch <color=blue>Giao dŞch trang bŞ<color>", 10, "BiÕt råi/ok", "Ch­ëng m«n §¹o NhÊt Ch©n Nh©n/m1", "DiÖp TiÕp Mü /m2", "Tõ §¹i Nh¹c/m3", "Chu V©n TuyÒn/m4", "§¬n T­ Nam/m5", "Diªu Th¹ch M«n/m6", "TiÓu ®¹o sÜ Thanh Phong/m7", "Hoa Hoµnh/m8", "TiÓu ®¹o sÜ Minh NguyÖt/m10")
end;

function m10()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng<color>   Täa ®é: <color=blue>209,197<color>   phô tr¸ch <color=blue>Giao dŞch d­îc phÈm<color>", 10, "BiÕt råi/ok", "Ch­ëng m«n §¹o NhÊt Ch©n Nh©n/m1", "DiÖp TiÕp Mü /m2", "Tõ §¹i Nh¹c/m3", "Chu V©n TuyÒn/m4", "§¬n T­ Nam/m5", "Diªu Th¹ch M«n/m6", "TiÓu ®¹o sÜ Thanh Phong/m7", "Hoa Hoµnh/m8", "Ngäc Thô /m9")
end;

--------------------------------

function c1()
Say("Phİa §«ng cã thÓ ®i ®Õn T­¬ng D­¬ng.", 4, "BiÕt råi/ok", "Tr­íc nói/c2", "KiÕn tróc chİnh/c3", "Sau nói/c4")
end;

function c2()
Say("Phİa §«ng ®­êng lªn nói cã Ma Ch©m giÕng (196,212) vµ hå Vò Tİch (198,211) .", 4, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "KiÕn tróc chİnh/c3", "Sau nói/c4")
end;

function c3()
Say("Cã ThËp Ph­¬ng ®iÖn (203,198) , Phô MÉu ®iÖn (203,194) , Long Hæ ®iÖn (213,196) , Tö Tiªu ®¹i ®iÖn (212,193) ", 4, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "Tr­íc nói/c2", "Sau nói/c4")
end;

function c4()
Say("HËu s¬n cã Háa Lang ®éng (240,187) vµ Th¸i Tö Nham (232,183) .", 4, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "Tr­íc nói/c2", "KiÕn tróc chİnh/c3")
end;

--------------------------------

function v1()							
Talk(3, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i cã thÓ gia nhËp Vâ §ang ph¸i, trë thµnh <color=blue>§¹o ®ång<color>, häc ®­îc vâ c«ng <color=blue>Né L«i ChØ, Th­¬ng H¶i Minh nguyÖt<color>.<enter>TiÕp nhËn nhiÖm vô ph¶i ®ñ c¸c ®iÒu kiÖn sau: Thuéc tİnh ngò hµnh hÖ Thæ, ®¼ng cÊp trªn 10","B­íc 1: §Õn <color=blue>Ma Ch©m giÕng<color> gÆp <color=blue>tiÓu ®¹o sÜ Thanh Phong <color>, tiÕp nhËn nhiÖm vô, xuèng <color=blue>§¸y giÕng<color> t×m <color=red>thïng gç<color>.", "B­íc 2: Xuèng <color=blue>§¸y giÕng<color>, ®¸nh b¹i <color=blue>§¹i Th¶o M·ng, C¸ sÊu to<color> hoÆc <color=blue>Cãc to<color>, lÊy ®­îc <color=red>Thïng gç<color>.", "B­íc 3: §­a <color=red>thïng gç<color> cho <color=blue>tiÓu ®¹o sÜ Thanh Phong <color>, hoµn thµnh nhiÖm vô.")
end;


function v2()
Talk(4, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Nhµn T¶n ®¹o nh©n<color>, häc ®­îc vâ c«ng <color=blue>Vâ §ang KiÕm ph¸p,Vâ §ang QuyÒn Ph¸p<color>.<enter>TiÕp nhËn nhiÖm vô nµy ph¶i lµ ®Ö tö trªn cÊp 10","B­íc 1: §Õn <color=blue>Tö Tiªu ®¹i ®iÖn<color> gÆp <color=blue>§¹o NhÊt Ch©n Nh©n<color>, tiÕp nhËn nhiÖm vô, ®Õn chç <color=blue>DiÖp TiÕp Mü<color> häc <color=blue>'§¹o §øc Kinh'<color>.", "B­íc 2: T¹i Tö Tiªu ®¹i ®iÖn <color=blue>phİa T©y hå Thanh Thñy<color> gÆp <color=blue>DiÖp TiÕp Mü<color> häc <color=blue>'§¹o §øc Kinh'<color>.", "B­íc 3: Trë vÒ <color=blue>Tö Tiªu ®¹i ®iÖn<color>, tr¶ lêi ®óng c©u hái cña <color=blue>§¹o NhÊt Ch©n Nh©n<color>, hoµn thµnh nhiÖm vô.")
end;


function v3()
Talk(8, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Thanh Tu ®¹o nh©n<color>, häc ®­îc vâ c«ng <color=blue>ThÊt Tinh trËn<color>.<enter> TiÕp nhiÖm vô nµy ®¼ng cÊp ph¶i trªn 20 vµ ®· hoµn thµnh nhiÖm vô ®¹o §øc Kinh.","B­íc 1: §Õn <color=blue>Phô MÉu ®iÖn<color> gÆp <color=blue> §µo Th¹ch M«n<color>, tiÕp nhËn nhiÖm vô, vµo <color=blue>Háa Lang ®éng<color> t×m <color=red>Thiªn Tµm §¹o Bµo<color>.", "B­íc 2: §Õn <color=blue>Háa Lang ®éng<color>, ®¸nh b¹i <color=blue>Sãi ®á<color>, lÊy ®­îc <color=red>Thiªn Tµm §¹o Bµo<color>bŞ r¸ch.", "B­íc 3: Trë vÒ <color=blue>Phô MÉu ®iÖn<color>t×m <color=blue> §µo Th¹ch M«n<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>T­¬ng D­¬ng<color> t×m <color=blue>chñ tiÖm t¹p hãa<color> nghÜ c¸ch.", "B­íc 4: §Õn <color=blue>T­¬ng D­¬ng<color> t×m <color=blue>chñ tiÖm t¹p hãa (203,203)<color>, biÕt ®­îc con cña bµ ta bŞ <color=blue>Sãi hoang<color> trong <color=blue>Háa Lang ®éng<color> tha mÊt.", "B­íc 5: Vµo<color=blue>Háa Lang ®éng<color>, ®¸nh b¹i <color=blue>Sãi hoang<color>, cøu ®øa bĞ, lÊy ®­îc ®Çu <color=red>Thiªn Tµm<color>.", "B­íc 6: Trë vÒ <color=blue>T­¬ng D­¬ng tiÖm t¹p hãa<color>, lÊy ®­îc <color=red>Thiªn Tµm §¹o Bµo<color> ®· söa xong.", "B­íc 7: VÒ <color=blue>Phô MÉu ®iÖn<color>, giao <color=red>Thiªn Tµm §¹o Bµo<color> ®· söa xong cho <color=blue> §µo Th¹ch M«n<color>, hoµn thµnh nhiÖm vô. NÕu Thiªn Tµm §¹o Bµo bŞ mÊt, ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu.")
end;


function v4()
Talk(4, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>TuÇn S¬n ®¹o nh©n<color>, häc ®­îc vâ c«ng <color=blue>KiÕm Phi Kinh Thiªn, B¸c CÊp Nhi Phôc<color>.<enter>TiÕp nhËn nhiÖm vô nµy ®¼ng cÊp ph¶i trªn 30 vµ ®· hoµn thµnh nhiÖm vô Thiªn Tµm §¹o Bµo.","B­íc 1: §Õn <color=blue>ThËp Ph­¬ng ®iÖn<color> gÆp <color=blue>Tõ §¹i Nh¹c<color>, tiÕp nhËn nhiÖm vô, trong vßng <color=blue>72 giê<color> ®Õn <color=blue>Phôc Ng­u s¬n §«ng<color> lÊy <color=red>5 c©y Häa Mi th¶o<color>.", "B­íc 2: §Õn <color=blue>Phôc Ng­u s¬n §«ng <color>, ®¸nh b¹i <color=blue>§¹i Háa hå, §¹i TuyÕt lang<color> hoÆc <color=blue>§¹i Thanh Lang<color>, lÊy ®­îc <color=red>Häa Mi th¶o<color>.", "B­íc 3: VÒ <color=blue>ThËp Ph­¬ng ®iÖn<color>, giao <color=red>5 c©y Häa Mi th¶o<color> cho <color=blue>Tõ §¹i Nh¹c<color>, nÕu thêi h¹n quy ®Şnh ch­a ®Õn, nhiÖm vô hoµn thµnh. NÕu qu¸ thêi gian, ph¶i lµm l¹i nhiÖm vô ")
end;


function v5()
Talk(5, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>NhËp Quan ®¹o Nh©n<color>, häc ®­îc vâ c«ng <color=blue>ThÕ V©n Tung<color>.<enter>NhËn nhiÖm vô nµy ph¶i lµ ®Ö tö tõ cÊp 40 vµ ®· hoµn thµnh nhiÖm vô Häa Mi th¶o","B­íc 1: §Õn <color=blue>phİa §«ng hå Thanh Thñy<color> gÆp <color=blue>Chu V©n TuyÒn<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>Kª Qu¸n ®éng<color> giao <color=red>th­ cña Ch­ëng m«n<color> cho <color=blue>NhuËn N­¬ng<color>.", "B­íc 2: §Õn <color=blue>Kª Qu¸n ®éng<color> gÆp <color=blue>NhuËn N­¬ng (202,184)<color>, ®¸nh b¹i 5 con <color=blue>B¹ch Ngäc Hæ<color>, sau ®ã tiÕp nhËn nhiÖm vô, vµo s¬n ®éng t×m th­ cña <color=red>NhuËn N­¬ng<color>.", "B­íc 3: §¸nh b¹i <color=blue>NhuËn N­¬ng Gia Hæ<color> hoÆc <color=blue>NhuËn N­¬ng Gia B¸o<color>, lÊy ®­îc th­ tr¶ lêi cña <color=red>NhuËn N­¬ng<color>.", "B­íc 4: VÒ <color=blue>Tö Tiªu ®¹i ®iÖn<color>, giao th­ cña <color=red>NhuËn N­¬ng<color> cho <color=blue>§¹o NhÊt Ch©n Nh©n<color>, hoµn thµnh nhiÖm vô. NÕu lµm mÊt th­ th­ cña NhuËn N­¬ng, ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu.")
end;


function v6()
Talk(6, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Ch­ëng Kinh ®¹o nh©n<color>, häc ®­îc vâ c«ng<color=blue>Täa Väng V« Ng·<color>. <enter>nhËn nhiÖm vô nµy ®¼ng cÊp ph¶i trªn 50,®ång thêi ph¶i hoµn thµnh nhiÖm vô NhuËn N­¬ng.","B­íc 1: §Õn <color=blue>Long Hæ ®iÖn<color> gÆp <color=blue>§¬n T­ Nam<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>Thiªn T©m ®éng<color> v× d©n trõ h¹i.", "B­íc 2: §Õn <color=blue>Thiªn T©m ®éng<color>, ®¸nh b¹i thæ phØ ®Çu môc <color=blue>ThiÕt C¸c<color>, lÊy ®­îc <color=blue>10000 l­îng<color>.", "B­íc 3: VÒ <color=blue>Long Hæ ®iÖn<color>, tiÕp nhËn nhiÖm vô, ®em toµn bé ng©n l­îng tÆng cho <color=blue>chŞ d©u §Æng gia<color> ë <color=blue>T­¬ng D­¬ng<color>. ", "B­íc 4: §Õn <color=blue>T­¬ng D­¬ng<color> gÆp <color=blue>chŞ d©u §Æng gia (205,204)<color>, tÆng 10000 l­îng", "B­íc 5: VÒ <color=blue>Long Hæ ®iÖn<color>, gÆp <color=blue>§¬n T­ Nam<color> phôc mÖnh, hoµn thµnh nhiÖm vô.")
end;


function v7()
Talk(10, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>HuyÒn Vâ ThÇn ThŞ<color>, thuËn lîi xuÊt s­.<enter>TiÕp nhËn nhiÖm vô nµy ®¼ng cÊp ph¶i trªn cÊp 50 vµ ®· hoµn thµnh nhiÖm vô NhËt Hµnh NhÊt ThiÖn.","B­íc 1: §Õn <color=blue>Tö Tiªu ®¹i ®iÖn<color> gÆp <color=blue>§¹o NhÊt Ch©n Nh©n<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>Th¸i Tö Nham<color> t×m <color=blue>3 B¶o r­¬ng<color>, lÊy b¶o vËt trong r­¬ng.", "B­íc 2: §Õn <color=blue>Th¸i Tö Nham<color> t×m 3 B¶o r­¬ng: nhÊn chuét vµo <color=blue>B¶o r­¬ng 1 (237,181)<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>T­¬ng D­¬ng<color> gÆp <color=blue>Chñ d­îc ®iÕm<color> t×m c¸ch ng¨n chÆn sù lan trµn cña bÖnh dŞch", "NhÊn vµo <color=blue>B¶o r­¬ng 2 (237,179)<color>, tiÕp nhËn nhiÖm vô, §Õn <color=blue>T­¬ng D­¬ng<color> t×m <color=blue>Thî rÌn<color> nghÜ c¸ch gi¶i quyÕt vÊn ®Ò chèng quan binh nhµ Kim.", "NhÊn vµo <color=blue>B¶o r­¬ng 3 (233,177)<color>, tiÕp nhËn nhiÖm vô, diÖt trõ <color=blue>T­¬ng D­¬ng Thñ t­íng<color>.", "B­íc 3: §Õn <color=blue>T­¬ng D­¬ng<color> t×m <color=blue>Chñ d­îc ®iÕm (201,202)<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>Phôc Ng­u s¬n §«ng<color> t×m 5 lo¹i d­îc liÖu: <color=red>Hîp hoan, HuyÒn S©m, §­¬ng quy, Phßng Kû, Chu Sa<color>. ", "§Õn <color=blue>T­¬ng D­¬ng<color> gÆp <color=blue>thî rÌn (193,201)<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>T©y Nam T­¬ng D­¬ng<color> t×m 3 lo¹i kho¸ng th¹ch: <color=red>Xİch §ång kho¸ng, Tõ ThiÕt kho¸ng, L­îng Ng©n kho¸ng<color>.", "§Õn <color=blue>T­¬ng D­¬ng<color> ®èi tho¹i víi <color=blue>VÖ binh Nha m«n<color> biÕt ®­îc <color=blue>T­¬ng D­¬ng Thñ T­íng<color> trèn ë <color=blue>MËt ®¹o Nha m«n<color>, vµo mËt ®¹o, ®¸nh b¹i Thñ t­íng, hoµn thµnh nhiÖm vô.", "B­íc 4: VÒ <color=blue>Th¸i Tö Nham<color>, nhÊn vµo <color=blue>3 c¸i B¶o r­¬ng <color>, lÊy ®­îc <color=red>'Ngäc Thanh Ch©n Kinh', 'Th­îng Thanh Ch©n Kinh', 'Th¸i Thanh Ch©n Kinh'<color>.", "B­íc 5: Trë vÒ <color=blue>Tö Tiªu ®¹i ®iÖn<color>, giao 3 quyÓn ch©n kinh cho <color=blue>§¹o NhÊt Ch©n Nh©n<color>, hoµn thµnh nhiÖm vô.")
end;

function v8()
Talk(3,"","Sau khi trïng ph¶n s­ m«n, ng­¬i ®­îc phong lµ <color=blue>HuyÒn Vâ Ch©n Qu©n<color>, häc ®­îc tuyÖt häc trÊn ph¸i<color=blue>Th¸i Cùc ThÇn C«ng, V« Ng· V« KiÕm, Tam Hoµn Thao NguyÖt<color>.","B­íc 1: Sau khi ®¼ng cÊp ®¹t ®Õn 60, ®Õn <color=blue>Tö Tiªu §¹i ®iÖn<color> gÆp <color=blue>§¹o NhÊt Ch©n Nh©n<color>, xin trïng ph¶n Vâ §ang Ph¸i.","B­íc 2: Giao nép <color=red>50000 ng©n l­îng<color>, trïng ph¶n Vâ §ang Ph¸i.")
end;

--------------------------------

function ok()
end;

--ÌìÍõ°ï°ïÖúNPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "V¨n th­ "

function main(sel)

UTask_tw = GetTask(3)

if (UTask_tw < 10*256) then						--Î´½ÓÌìÍõ°ïÈëÃÅÈÎÎñ£¬Î´ÈëÌìÍõ°ï
	if (GetFaction() ~= "") then				--Èç¹ûÍæ¼ÒÒÑ¾­ÊôÓÚÁíÒ»ÃÅÅÉ
		Say("Cã g× muèn t×m hiÓu cø hái ta!", 3, "T×m hiÓu quı bang/org", "T×m hiÓu c¸c vŞ h¶o h¸n/member", "T×m hiÓu bè côc n¬i nµy/config")
		return
	else
		Say("Cã g× muèn t×m hiÓu cø hái ta!", 4, "T×m hiÓu quı bang/org", "T×m hiÓu c¸c vŞ h¶o h¸n/member", "T×m hiÓu bè côc n¬i nµy/config", "Lµm sao ®Ó nhËp m«n?/task1")
		return	
	end
end;
	
if (UTask_tw == 70*256) then					--ÌìÍõ°ïÒÑ¾­³öÊ¦		
	Say("Th× ra lµ huynh ®Ö ®ång m«n! Kh«ng biÕt d¹o nµy thÕ nµo!?", 6, "TiÕp tôc t×m hiÓu Thiªn V­¬ng Bang /org", "TiÕp tôc t×m hiÓu c¸c huynh ®Ö tr­íc ®©y!/member", "T×m hiÓu l¹i bè côc n¬i nµy/config", "Cßn nhiÖm vô nµo ®Ó lµm n÷a/task3","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help")
	return
end;	

Say("Cã g× muèn t×m hiÓu cø hái ta!", 7,"§èi tho¹i víi Long Ngò /Uworld1000_word","T×m hiÓu bæn bang/org", "T×m hiÓu ®ång m«n/member", "T×m hiÓu bè côc n¬i nµy/config", "T×m hiÓu nhiÖm vô /task3","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("Muèn t×m hiÓu ph­¬ng diÖn nµo?", 4, "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;


function member()
Say("Muèn t×m hiÓu ai?", 14, "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;


function config()
Say("Muèn t×m hiÓu ph­¬ng diÖn nµo?", 6, "C¸c vïng l©n cËn/c1",  "Trung t©m ®¶o/c2", "Phİa ®«ng ®¶o/c3", "Phİa nam ®¶o/c4", "Phİa t©y ®¶o/c5", "Phİa b¾c ®¶o/c6")
end;


function task1()
Say("Bæn m«n chØ thu nhËn ®Ö tö hÖ Kim. Muèn nhËp m«n häc nghÖ,chØ cÇn th«ng qua hoµn thµnh nhiÖm vô nhËp m«n", 1, "T×m hiÓu cô thÓ nhiÖm vô nhËp m«n/v1")
end;


function task2()
Say("<#> Ng­¬i ®· xuÊt s­,kh«ng cÇn lµm nhiÖm vô cña bang ph¸i n÷a. HiÖn ®· "..UTask_tw.."<#>.", 0)
end;


function task3()

UTask_tw = GetTask(3)

if (UTask_tw < 10*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i ®ang thùc hiÖn nhiÖm vô nhËp m«n. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô nhËp m«n/v1")
end;

if (UTask_tw == 10*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. Ng­¬i hiÖn ®· nhËp m«n,tiÕp theo cã thÓ nhËn NhiÖm vô Kª HuyÕt Th¹ch. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô Kª HuyÕt Th¹ch/v2")
end;

if (UTask_tw > 10*256) and (UTask_tw < 20*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn ng­¬i ®ang tiÕn hµnh lµ NhiÖm vô Kª HuyÕt Th¹ch. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô Kª HuyÕt Th¹ch/v2")
end;

if (UTask_tw == 20*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. TiÕp theo cã thÓ nhËn NhiÖm vô B¹ch Thñy ®éng. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô B¹ch Thñy ®éng/v3")
end;

if (UTask_tw > 20*256) and (UTask_tw < 30*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn ng­¬i ®ang tiÕn hµnh lµ NhiÖm vô B¹ch Thñy ®éng. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô B¹ch Thñy ®éng/v3")
end;

if (UTask_tw == 30*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. TiÕp theo cã thÓ nhËn NhiÖm vô Thiªn V­¬ng lÖnh. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô Thiªn V­¬ng lÖnh/v4")
end;

if (UTask_tw > 30*256) and (UTask_tw < 40*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn ng­¬i ®ang tiÕn hµnh lµ NhiÖm vô Thiªn V­¬ng lÖnh. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô Thiªn V­¬ng lÖnh/v4")
end;

if (UTask_tw == 40*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. TiÕp theo cã thÓ nhËn NhiÖm vô thuèc gi¶i ®éc. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô thuèc gi¶i ®éc/v5")
end;

if (UTask_tw > 40*256) and (UTask_tw < 50*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn ng­¬i ®ang tiÕn hµnh lµ NhiÖm vô thuèc gi¶i ®éc. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô thuèc gi¶i ®éc/v5")
end;

if (UTask_tw == 50*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. TiÕp theo cã thÓ nhËn NhiÖm vô Thñy qu¸i. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô Thñy qu¸i/v6")
end;

if (UTask_tw > 50*256) and (UTask_tw < 60*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn ng­¬i ®ang tiÕn hµnh lµ NhiÖm vô Thñy qu¸i. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô Thñy qu¸i/v6")
end;

if (UTask_tw == 60*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. TiÕp theo cã thÓ nhËn NhiÖm vô xuÊt s­. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô xuÊt s­ /v7")
end;

if (UTask_tw > 60*256) and (UTask_tw < 70*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn ng­¬i ®ang tiÕn hµnh lµ NhiÖm vô xuÊt s­. HiÖn ®· "..UTask_tw.."<#>.", 1, "NhiÖm vô xuÊt s­ /v7")
end;

if (UTask_tw >= 70*256) and (UTask_tw < 80*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh NhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­. HiÖn ng­¬i ®ang tiÕn hµnh lµ NhiÖm vô Trïng ph¶n s­ m«n. HiÖn ®· "..UTask_tw.."<#>.", 1, "Trïng ph¶n s­ m«n/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("Ngµy tr­íc Së V­¬ng Chung T­¬ng khëi binh t¹i §éng §×nh hå, kh¸ng Kim chèng Tèng! VÒ sau Së V­¬ng bŞ s¸t h¹i,nghÜa qu©n t«n D­¬ng Yªu lµm thñ lÜnh,x­ng lµ §¹i Th¸nh Thiªn V­¬ng! NghÜa qu©n ph¸t triÓn thÇn tèc. VÒ sau bŞ Nh¹c Phi tiªu diÖt. Sau nµy con g¸i D­¬ng yªu lµ D­¬ng Anh trë l¹i n¬i ®©y, chiªu tËp nghÜa qu©n, nèi tiÕp nghiÖp lín!", 4, "BiÕt råi/ok", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;

function o2()
Say("Thiªn V­¬ng ®¶o lµ mét c« ®¶o thuéc khu vùc §éng §×nh hå, lµ c¨n cø ®Şa vµ còng lµ Tæng ®µn cña nghÜa qu©n", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;

function o3()
Say("Bæn bang bèn bÒ s«ng hå. Cã bi tr¸ng, cã hµo hïng,bang chóng an c­ l¹c nghiÖp! Kh¸ng Kim chèng Tèng! Thiªn h¹ vang danh!", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Æc s¾c m«n ph¸i/o4")
end;

function o4()
Say("§Ö tö bæn bang rÊt ®oµn kÕt! Hµo khİ xung thiªn! Xem träng nghÜa khİ! Ai ai còng lµ H¶o h¸n!", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3")
end;

--------------------------------

function m1()
Say("VŞ trİ: <color=blue>TÈm cung<color>   Täa ®é: <color=blue>201,199<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter>Tİnh t×nh c­¬ng ng¹nh, chİ c«ng v« t­,vâ nghÖ cao c­êng, gan d¹ h¬n ng­êi, kh«ng kĞm g× tu mi nam tö!", 14, "BiÕt råi/ok", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m2()
Say("VŞ trİ: <color=blue>§¹i ®iÖn<color>   Täa ®é: <color=blue>200,199<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter> Mét ng­êi cùc träng nghÜa khİ, rÊt trung thµnh víi bang chñ D­¬ng Anh, ®­îc ®ång m«n nÓ phôc!", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m3()
Say("VŞ trİ: <color=blue>phİa ®«ng HiÖu lÖnh ®µi<color>   Täa ®é: <color=blue>209,196<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter> lµm viÖc lu«n cÈn thËn, ®­îc ®ång m«n tin yªu.", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m4()
Say("VŞ trİ: <color=blue>TiÒn ®iÖn<color>   Täa ®é: <color=blue>200,199<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter>Nh©n x­ng: 'NghÜa C«ng minh'. Lµ ng­êi rÊt träng nghÜa khİ, quang minh lçi l¹c. RÊt trung thµnh víi bang chñ ", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m5()
Say("VŞ trİ: <color=blue>t©y Biªn ®iÖn<color>   Täa ®é: <color=blue>202,193<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter>Nh©n x­ng 'B¸t DiÖn ThÇn'. Tİnh t×nh nãng n¶y, cùc kú h¸o th¾ng!", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m6()
Say("VŞ trİ: <color=blue>®«ng Biªn ®iÖn<color>   Täa ®é: <color=blue>218,198<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter>Nh©n x­ng: 'Cöu KhiÕu Linh Hå', anh hïng tuÊn kiÖt, th«ng minh h¬n ng­êi!", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m7()
Say("VŞ trİ: <color=blue>Lèi vµo Thñy tr¹i<color>   Täa ®é: <color=blue>191,210<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter>lµ ng­êi nãng n¶y nh­ng rÊt trung nghÜa", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m8()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng HiÖu lÖnh ®µi<color>   Täa ®é: <color=blue>207,193<color>   Phô tr¸ch: <color=blue>Giao dŞch binh khİ<color>", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m9()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng HiÖu lÖnh ®µi<color>   Täa ®é: <color=blue>205,194<color>   Phô tr¸ch: <color=blue>Giao dŞch trang bŞ<color>", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m10()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng HiÖu lÖnh ®µi<color>   Täa ®é: <color=blue>212,195<color>   Phô tr¸ch: <color=blue>Giao dŞch D­îc phÈm<color>", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m11()
Say("VŞ trİ: <color=blue>bÕn tµu phİa ®«ng<color>   Täa ®é: <color=blue>218,210<color>   Phô tr¸ch: <color=blue>giao th«ng<color>", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m12()
Say("VŞ trİ: <color=blue>bÕn tµu phİa nam<color>   Täa ®é: <color=blue>176,216<color>   Phô tr¸ch: <color=blue>giao th«ng<color>", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa t©y/m13", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m13()
Say("VŞ trİ: <color=blue>bÕn tµu phİa t©y<color>   Täa ®é: <color=blue>183,189<color>   Phô tr¸ch: <color=blue>giao th«ng<color>", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa b¾c/m14")
end;

function m14()
Say("VŞ trİ: <color=blue>bÕn tµu phİa b¾c<color>   Täa ®é: <color=blue>241,181<color>   Phô tr¸ch: <color=blue>giao th«ng<color>", 14, "BiÕt råi/ok", "Bang chñ D­¬ng Anh/m1", "Thiªn Hé ph¸p Lé V©n ViÔn/m2", "§Şa Hé ph¸p H¹ Thµnh/m3", "TiÒn sø V­¬ng T¸ /m4", "T¶ sø Cæ B¸ch/m5", "H÷u sø D­¬ng Hå /m6", "T«n §¹o LÜnh/m7", "M«n ®Ö b¸n binh khİ /m8", "M«n ®Ö b¸n trang bŞ /m9", "M«n ®Ö b¸n D­îc phÈm/m10", "ThuyÒn phu bÕn phİa ®«ng/m11", "ThuyÒn phu bÕn phİa nam/m12", "ThuyÒn phu bÕn phİa t©y/m13")
end;

--------------------------------

function c1()
Say("Kh«ng cã ®­êng nèi ®Êt liÒn. Ngåi thuyÒn cã thÓ ®Õn Ba L¨ng huyÖn", 6, "BiÕt råi/ok", "Trung t©m ®¶o/c2", "Phİa ®«ng ®¶o/c3", "Phİa nam ®¶o/c4", "Phİa t©y ®¶o/c5", "Phİa b¾c ®¶o/c6")
end;

function c2()
Say("Tæng ®µn thø tù cã: TiÒn ®iÖn (201,198) ; HiÖu lÖnh ®µi (210,194) ; §¹i ®iÖn (214,192) ; TÈm cung (223,196) ", 6, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "Phİa ®«ng ®¶o/c3", "Phİa nam ®¶o/c4", "Phİa t©y ®¶o/c5", "Phİa b¾c ®¶o/c6")
end;

function c3()
Say("Cã bÕn tµu vµ ®¸y §éng §×nh hå (216,205) .", 6, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "Trung t©m ®¶o/c2", "Phİa nam ®¶o/c4", "Phİa t©y ®¶o/c5", "Phİa b¾c ®¶o/c6")
end;

function c4()
Say("Cã bÕn tµu vµ Thñy tr¹i", 6, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "Trung t©m ®¶o/c2", "Phİa ®«ng ®¶o/c3", "Phİa t©y ®¶o/c5", "Phİa b¾c ®¶o/c6")
end;

function c5()
Say("Cã bÕn tµu.", 6, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "Trung t©m ®¶o/c2", "Phİa ®«ng ®¶o/c3", "Phİa nam ®¶o/c4", "Phİa b¾c ®¶o/c6")
end;

function c6()
Say("Cã bÕn tµu vµ Thiªn V­¬ng ®¶o s¬n ®éng (226,186)?.", 6, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "Trung t©m ®¶o/c2", "Phİa ®«ng ®¶o/c3", "Phİa nam ®¶o/c4", "Phİa t©y ®¶o/c5")
end;

--------------------------------

function v1()							
Talk(6, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i cã thÓ gia nhËp Thiªn V­¬ng Bang, trë thµnh <color=blue>ThŞ VÖ<color>, häc ®­îc vâ c«ng <color=blue>Kinh L«i Tr¶m, Håi Phong L¹c Nh¹n, Tr¶m Long QuyÕt<color>.<enter>TiÕp nhËn nhiÖm vô, cÇn ph¶i ®¹t ®iÒu kiÖn sau: Ngò hµnh thuéc tİnh: hÖ Kim, ®¾ng cÊp ®¹t ®Õn 10, kh«ng lµm nhiÖm vô nhËp m«n cña bÊt kú m«n ph¸i nµo","B­íc 1: §Õn <color=blue>lèi vµo Thñy tr¹i phİ Nam<color> gÆp <color=blue>T«n §¹o LÜnh<color>. TiÕp nhËn nhiÖm vô, di9 <color=blue>Ba L¨ng huyÖn<color> mua r­îu <color=red>Bång Lai Xu©n<color>.", "B­íc 2: §Õn <color=blue>Töu qu¸n ë Ba L¨ng huyÖn<color> tiÕp nhËn nhiÖm vô ®i t×m 3 lo¹i d­îc liÖu ®Ó cÊt r­îu, gåm: <color=red>Linh Chi, HuyÒn S©m, Hµ Thñ ¤<color>.", "B­íc 3: §Õn <color=blue>phİa ®«ng Vò L¨ng s¬n<color> t×m <color=red>Linh Chi, HuyÒn S©m. Hµ Thñ ¤<color>.", "B­íc 4: Mang d­îc liÖu trë l¹i <color=blue>Töu qu¸n<color> biÕt ®­îc cÇn ph¶i ®îi <color=blue>1 giê<color>. 1 giê sau quay l¹i ®Ó lÊy r­îu <color=red>Bång Lai Xu©n<color>.", "B­íc 5: Trë vÒ <color=blue>Thiªn V­¬ng ®¶o<color>, giao <color=red>Bång Lai Xu©n<color> cho <color=blue>T«n §¹o LÜnh<color>, nhiÖm vô hoµn thµnh. NÕu 'Bång Lai Xu©n' bŞ mÊt, ph¶i thùc hiÖn l¹i tõ ®Çu")
end;


function v2()
Talk(4, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>ThŞ VÖ tr­ëng<color>, häc ®­îc vâ c«ng <color=blue>Thiªn V­¬ng Chïy ph¸p#Thiªn V­¬ng Th­¬ng ph¸p#Thiªn V­¬ng §ao ph¸p<color>.<enter>TiÕp nhËn nhiÖm vô nµy cÇn ph¶i lµ ®Ö tö trªn cÊp 10","B­íc 1: §Õn <color=blue>TiÒn ®iÖn<color> gÆp <color=blue>V­¬ng T¸<color>. TiÕp nhËn nhiÖm vô, ®Õn <color=blue>Thiªn V­¬ng ®¶o S¬n ®éng<color> t×m <color=red>3 viªn Kª HuyÕt Th¹ch<color>.", "B­íc 2: §Õn <color=blue>Thiªn V­¬ng ®¶o S¬n ®éng<color> ®¸nh 3 con <color=blue>Kim Miªu V­¬ng, X¸ LŞ tinh, §¹i Ho¸n Hïng<color> sÏ cã thÓ lÊy ®­îc <color=red>Kª HuyÕt Th¹ch<color>.", "B­íc 3: Trë vÒ <color=blue>TiÒn ®iÖn<color> giao <color=red>3 viªn Kª HuyÕt Th¹ch<color> cho <color=blue>V­¬ng T¸<color>, nhiÖm vô hoµn thµnh. ")
end;


function v3()
Talk(4, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Thñ Tr¹i H·n T­íng<color>, häc ®­îc vâ c«ng <color=blue>TÜnh T©m QuyÕt<color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 20 vµ ®· hoµn thµnh nhiÖm vô Kª HuyÕt Th¹ch.","B­íc 1: §Õn <color=blue>®«ng Biªn ®iÖn<color> gÆp <color=blue>D­¬ng Hå<color>. TiÕp nhËn nhiÖm vô, ®Õn <color=blue>B¹ch Thñy ®éng<color> ®¸nh thæ phØ ", "B­íc 2: §Õn <color=blue>B¹ch Thñy ®éng<color>, lÇn l­ît ®¸nh b¹i <color=blue>3 tªn Thæ PhØ ®Çu môc<color>, nhËn ®­îc <color=red>1 l¸ cê GÊm<color>.", "B­íc 3: Trë vÒ <color=blue>Thiªn V­¬ng ®¶o<color> giao <color=red>cê GÊm<color> cho <color=blue>D­¬ng Hå<color>, nhiÖm vô hoµn thµnh. NÕu cê GÊm mÊt ®i, cÇn ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu!")
end;


function v4()
Talk(4, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Ch­ëng §µ §Çu lÜnh<color>, häc ®­îc vâ c«ng <color=blue>B¸t Phong Tr¶m, D­¬ng Quan Tam §iÖp, Hµng V©n QuyÕt<color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 30 vµ ®· hoµn thµnh NhiÖm vô B¹ch Thñy ®éng.","B­íc 1: §Õn <color=blue>t©y Biªn ®iÖn<color> gÆp <color=blue>Cæ B¸ch<color>. TiÕp nhËn nhiÖm vô, ®Õn <color=blue>YÕn Tö ®éng<color> t×m <color=red>Thiªn V­¬ng lÖnh<color>.", "B­íc 2: §Õn <color=blue>YÕn Tö ®éng<color> ®¸nh b¹i tªn ®Çu lÜnh <color=blue>B¸o Tö §Çu<color> sÏ lÊy ®­îc <color=red>Thiªn V­¬ng lÖnh<color>.", "B­íc 3: Trë vÒ <color=blue>Thiªn V­¬ng ®¶o<color> giao <color=red>Thiªn V­¬ng lÖnh<color> cho <color=blue>Cæ B¸ch<color>, nhiÖm vô hoµn thµnh. NÕu Thiªn V­¬ng lÖnh mÊt ®i, cÇn ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu!")
end;


function v5()
Talk(7, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Thñy §¹o Thèng LÜnh<color>, häc ®­îc vâ c«ng <color=blue>§o¹n Hån Thİch<color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 40 vµ ®· hoµn thµnh NhiÖm vô Thiªn V­¬ng lÖnh.","B­íc 1: §Õn <color=blue>§¹i ®iÖn<color> gÆp <color=blue>Lé V©n ViÔn<color>. TiÕp nhËn nhiÖm vô, ®Õn <color=blue>Ba L¨ng huyÖn<color> t×m <color=blue>Ng« ThÇn y<color> xin thuèc gi¶i näc r¾n", "B­íc 2: §i <color=blue>Ba L¨ng huyÖn<color> t×m <color=blue>Ng« ThÇn y (199,200)<color>. TiÕp nhËn nhiÖm vô, ®i t×m 2 lo¹i D­îc liÖu: <color=red>Da th»n l»n<color> vµ <color=red>ch©n Lôc Thñ Quy<color>.", "B­íc 3: §i <color=blue>Phôc L­u ®éng<color>, ®¸nh b¹i <color=blue>Th»n lµn ®á<color> cã thÓ lÊy ®­îc <color=red>Da Th»n l»n<color>.", "VÒ l¹i <color=blue>Thñy tr¹i<color> t×m <color=blue> Ng­ «ng (179,210)<color>, biÕt ®­îc cÇn ph¶i cã trïng ®á míi lÊy ®­îc chan rïa xanh. H·y di t×m <color=blue>Thñy Sinh<color>,®øa bĞ yªu cÇu dïng trøng gµ ®æi lÊy trïng ®á. L¹i t×m <color=blue>Hµ TÈu (190,213)<color>, tiÕp nhËn nhiÖm vô ®Õn <color=blue>Ba L¨ng huyÖn<color> mua <color=red> h¹t sen <color>.","Mang h¹t sen vÒ cho Hµ TÈu, nhËn ®­îc <color=red>3 qu¶ trøng gµ<color>, mang trøng gµ giao cho <color=blue>Thñy Sinh (184,212)<color>, nhËn ®­îc <color=red>5 con trïng ®á<color>,mang trïn vÒ cho <color=blue>Ng­ «ng (179,210)<color>,nhËn ®­îc <color=red>Lôc Thñ Quy<color>.", "B­íc 4: Trë vÒ <color=blue>§¹i ®iÖn<color>, giao 2 D­îc liÖu cho <color=blue>Lé V©n ViÔn<color>, nhiÖm vô hoµn thµnh. ")
end;


function v6()
Talk(4, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Hé ®¶o T­íng qu©n<color>, häc ®­îc vâ c«ng <color=blue>Kim Chung Tr¸o<color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 50 vµ ®· hoµn thµnh NhiÖm vô thuèc gi¶i ®éc.","B­íc 1: §Õn <color=blue>phİa ®«ng HiÖu lÖnh ®µi<color> gÆp <color=blue>H¹ Thµnh<color>. TiÕp nhËn nhiÖm vô, xuèng ®¸y §éng §×nh hå ®iÒu tra Thñy qu¸i", "B­íc 2: §i xuèng <color=blue>®¸y §éng §×nh hå<color>, xuèng <color=blue>tÇng 2<color> t×m thÊy <color=blue>Thñy qu¸i<color>,®¸nh b¹i Thñy qu¸i sÏ lÊy ®­îc <color=red>Ngò S¾c th¹ch<color>.", "B­íc 3: Trë vÒ <color=blue>Thiªn V­¬ng Bang <color> giao <color=red>Ngò S¾c th¹ch<color> cho <color=blue>H¹ Thµnh<color>, nhiÖm vô hoµn thµnh. NÕu Ngò S¾c Th¹ch mÊt ®i, cÇn ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu!")
end;


function v7()
Talk(5, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>TrÊn Bang Nguyªn so¸i<color>, thuËn lîi xuÊt s­.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 50 vµ ®· hoµn thµnh NhiÖm vô Thñy qu¸i.","B­íc 1: §Õn <color=blue>TÈm cung<color> gÆp <color=blue>Bang chñ D­¬ng Anh<color>. TiÕp nhËn nhiÖm vô, ®Õn <color=blue>Thanh Loa ®¶o <color> lÊy l¹i <color=red>Thiªn V­¬ng Di Th­<color>.", "B­íc 2: Ngåi thuyÒn ®Õn <color=blue>Thanh Loa ®¶o <color>, ®¸nh b¹i <color=blue>Cãc tinh, c¸ sÊu tinh<color> hoÆc <color=blue>Th»n l»n tinh<color> sÏ lÊy ®­îc 1 chiÕc <color=red>Ch×a khãa<color>. §Õn ph¸i b¾c hå më <color=blue>B¶o r­¬ng (205,186)<color>,ph¸t hiÖn Thiªn V­¬ng Di Th­ ®· bŞ bän ng­êi Kim lÊy ®i!", "B­íc 3: §i vµo <color=blue>Thanh Loa ®¶o S¬n ®éng<color>, ®¸nh b¹i tªn thñ lÜnh <color=blue>§å Nh©n<color>, lÊy l¹i <color=red>Thiªn V­¬ng Di Th­<color>.", "B­íc 4: Trë vÒ <color=blue>TÈm cung<color> giao <color=red>Thiªn V­¬ng Di Th­<color> cho <color=blue>Bang chñ D­¬ng Anh<color>, nhiÖm vô hoµn thµnh. NÕu Thiªn V­¬ng Di Th­ mÊt ®i,cÇn ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu!")
end;

function v8()
Talk(3,"","Th«ng qua Trïng ph¶n s­ m«n, ng­¬i ®­îc phong lµ <color=blue>K×nh Thiªn Nguyªn So¸i<color>, häc ®­îc tuyÖt häc trÊn ph¸i <color=blue>Thiªn V­¬ng ChiÕn ı, vâ c«ng: V« T©m Tr¶m, HuyÕt ChiÕn B¸t Ph­¬ng, Thõa Long QuyÕt<color>.","B­íc 1: Sau khi ®¹t ®Õn cÊp 60, ®Õn <color=blue>TÈm cung<color> gÆp <color=blue>Bang chñ D­¬ng Anh<color>, xin ®­îc trïng ph¶n Thiªn V­¬ng Bang.","B­íc 2: TÆng cho m«n ph¸i <color=red>50000 ng©n l­îng<color> trïng ph¶n Thiªn V­¬ng Bang.")
end;

--------------------------------

function ok()
end;

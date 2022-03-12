--ÌÆÃÅ°ïÖúNPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")
npc_name = "Qu¶n Gia"

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ®Õn t×m «ng cã viÖc kh¸c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end

function old_main()
UTask_tm = GetTask(2)

if (UTask_tm < 10*256) then						--Î´½ÓÌÆÃÅÈëÃÅÈÎÎñ£¬Î´ÈëÌÆÃÅ
	if (GetFaction() ~= "") then				--Èç¹ûÍæ¼ÒÒÑ¾­ÊôÓÚÁíÒ»ÃÅÅÉ
		Say("Ta ®· ë §­êng m«n m­êi mÊy n¨m nay, kh«ng chuyÖn g× kh«ng biÕt! Ng­¬i muèn hái g×?", 3, "T×m hiÓu quı ph¸i/org", "T×m hiÓu c¸c vŞ cao thñ §­êng M«n/member", "T×m hiÓu bè côc n¬i nµy/config")
		return
	else
		Say("Ta ®· ë §­êng m«n m­êi mÊy n¨m nay, kh«ng chuyÖn g× kh«ng biÕt! Ng­¬i muèn hái g×?", 4, "T×m hiÓu quı ph¸i/org", "T×m hiÓu c¸c vŞ cao thñ §­êng M«n/member", "T×m hiÓu bè côc n¬i nµy/config", "Lµm sao ®Ó nhËp m«n?/task1")
		return	
	end
end;
	
if (UTask_tm == 70*256) then					--ÌÆÃÅÒÑ¾­³öÊ¦		
	Say("Th× ra lµ ®ång m«n tr­íc ®©y, cã chuyÖn g× thÕ?", 6, "T×m hiÓu l¹i §­êng M«n/org", "T×m hiÓu l¹i ®ång m«n tr­íc kia/member", "T×m hiÓu l¹i bè côc n¬i nµy/config", "Cßn nhiÖm vô nµo ®Ó lµm n÷a/task3","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help")
	return
end;	

Say("Ta ®· ë §­êng m«n m­êi mÊy n¨m nay, kh«ng chuyÖn g× kh«ng biÕt! Ng­¬i muèn hái g×?", 7, "§èi tho¹i víi Long Ngò /Uworld1000_word","T×m hiÓu bæn m«n/org", "T×m hiÓu ®ång m«n/member", "T×m hiÓu bè côc n¬i nµy/config", "T×m hiÓu nhiÖm vô /task3","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("Muèn t×m hiÓu ph­¬ng diÖn nµo?", 4, "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;


function member()
Say("Muèn t×m hiÓu ai?", 10, "Ch­ëng m«n §­êng Cõu/m1", "Truy Hån TÈu §­êng Nhµn/m2", "Tiªu Nhiªm TÈu §­êng V©n/m3", "TuyÖt Xu©n TÈu §­êng D· /m4", "B¹ch Bµo TÈu §­êng H¹c/m5", "§­êng NhÊt TrÇn/m6", "§­êng BÊt NhiÔm/m7", "§­êng KhuyÕt /m8", "§­êng Khinh/m9", "§­êng §éc/m10")
end;


function config()
Say("Muèn t×m hiÓu ph­¬ng diÖn nµo?", 3, "C¸c vïng l©n cËn/c1",  "§­êng Gia B¶o/c2", "Xung quanh §­êng Gia B¶o/c3")
end;


function task1()
Say("Bæn m«n chØ thu nhËn §Ö tö hÖ Méc, kh«ng ph©n nam n÷. Muèn nhËp m«n häc nghÖ, cÇn th«ng qua nhiÖm vô nhËp m«n.", 1, "T×m hiÓu cô thÓ nhiÖm vô nhËp m«n/v1")
end;


function task2()
Say("<#> Ng­¬i ®· xuÊt s­, kh«ng cÇn lµm nhiÖm vô bæn m«n n÷a,  kı hiÖu nhiÖm vô lµ "..UTask_tm.."<#>.", 0)
end;


function task3()

UTask_tm = GetTask(2)

if (UTask_tm < 10*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô nhËp m«n/v1")
end;

if (UTask_tm == 10*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, giê ®· nhËp m«n, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô Ma Vò Ch©m/v2")
end;

if (UTask_tm > 10*256) and (UTask_tm < 20*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô Ma Vò Ch©m/v2")
end;

if (UTask_tm == 20*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô §­êng U/v3")
end;

if (UTask_tm > 20*256) and (UTask_tm < 30*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô §­êng U/v3")
end;

if (UTask_tm == 30*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô Háa Khİ Phæ /v4")
end;

if (UTask_tm > 30*256) and (UTask_tm < 40*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô Háa Khİ Phæ /v4")
end;

if (UTask_tm == 40*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô C¶nh Tö Kú /v5")
end;

if (UTask_tm > 40*256) and (UTask_tm < 50*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô C¶nh Tö Kú /v5")
end;

if (UTask_tm == 50*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô ¸m Khİ Phæ /v6")
end;

if (UTask_tm > 50*256) and (UTask_tm < 60*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô ¸m Khİ Phæ /v6")
end;

if (UTask_tm == 60*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô xuÊt s­ /v7")
end;

if (UTask_tm > 60*256) and (UTask_tm < 70*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô xuÊt s­ /v7")
end;

if (UTask_tm >= 70*256) and (UTask_tm < 80*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­. HiÖn ®·"..UTask_tm.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "Trïng ph¶n s­ m«n/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("Trong con m¾t cña ng­êi ngoµi, bæn m«n lµ 1 gia téc thÇn bİ, ¸m khİ vµ ho¶ khİ uy chÊn thiªn h¹, danh chÊn giang hå ®· h¬n tr¨m n¨m nay", 4, " BiÕt råi!/ok", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;

function o2()
Say("Bæn m«n ë Nam Tróc H¶i, bªn ngoµi tuy u nhµn thanh tŞnh, nh­ng bªn trong c¹m bÉy trïng trïng. Kh«ng cã ng­êi h­íng dÉn, ng­êi ngoµi khã mµ vµo ®­îc!", 4, " BiÕt råi!/ok", "Khëi nguyªn m«n ph¸i/o1", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;

function o3()
Say("Bæn m«n vµ Thóy Yªn M«n ®­îc xem lµ 'Vâ L©m NhŞ m«n'. ¸m khİ, háa khİ, y d­îc, c¹m bÉy ®Òu ®¹t ®Õn tèi cao. Giang hå chØ cÇn nh¾c ®Õn tªn bæn m«n lµ mÆt ®· biÕn s¾c", 4, " BiÕt råi!/ok", "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Æc s¾c m«n ph¸i/o4")
end;

function o4()
Say("®Ö tö bæn m«n hµnh sù bİ hiÓm. Kh«ng mµng thŞ phi. KÎ tån t¹i míi lµ anh hïng!", 4, " BiÕt råi!/ok", "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3")
end;

--------------------------------

function m1()
Say("VŞ trİ: <color=blue>phßng kh¸ch<color>  Täa ®é: <color=blue>202,199<color>  phô tr¸ch: <color=blue>nhiÖm vô<color><enter> Kiªu c¨ng ng¹o m¹n nh­ng rÊt quyÕt ®o¸n!", 10, " BiÕt råi!/ok", "Truy Hån TÈu §­êng Nhµn/m2", "Tiªu Nhiªm TÈu §­êng V©n/m3", "TuyÖt Xu©n TÈu §­êng D· /m4", "B¹ch Bµo TÈu §­êng H¹c/m5", "§­êng NhÊt TrÇn/m6", "§­êng BÊt NhiÔm/m7", "§­êng KhuyÕt /m8", "§­êng Khinh/m9", "§­êng §éc/m10")
end;

function m2()
Say("VŞ trİ: <color=blue>phßng ¸m khİ<color>  Täa ®é: <color=blue>199,200<color>  phô tr¸ch: <color=blue>nhiÖm vô<color><enter> Tµi nghÖ chÕ t¹o ra ¸m khİ thiªn h¹ v« ®Şch. Tİnh c¸ch th©m trÇm, vui buån kh«ng thÓ hiÖn ra ngoµi", 10, " BiÕt råi!/ok", "Ch­ëng m«n §­êng Cõu/m1", "Tiªu Nhiªm TÈu §­êng V©n/m3", "TuyÖt Xu©n TÈu §­êng D· /m4", "B¹ch Bµo TÈu §­êng H¹c/m5", "§­êng NhÊt TrÇn/m6", "§­êng BÊt NhiÔm/m7", "§­êng KhuyÕt /m8", "§­êng Khinh/m9", "§­êng §éc/m10")
end;

function m3()
Say("VŞ trİ: <color=blue>phßng Háa khİ<color>  Täa ®é: <color=blue>200,200<color>  phô tr¸ch: <color=blue>nhiÖm vô<color><enter> BËc thÇy vÒ chÕ t¹o háa khİ, khiÕn ng­êi trong vâ l©m nh¾c ®Õn tªn ®· biÕn s¾c. Tİnh t×nh nãng nhu löa, nh­ng rÊt trung thµnh, sau khi ®øa con chÕt ®i t©m t¸nh thay ®æi ", 10, " BiÕt råi!/ok", "Ch­ëng m«n §­êng Cõu/m1", "Truy Hån TÈu §­êng Nhµn/m2", "TuyÖt Xu©n TÈu §­êng D· /m4", "B¹ch Bµo TÈu §­êng H¹c/m5", "§­êng NhÊt TrÇn/m6", "§­êng BÊt NhiÔm/m7", "§­êng KhuyÕt /m8", "§­êng Khinh/m9", "§­êng §éc/m10")
end;

function m4()
Say("VŞ trİ: <color=blue>phßng Y d­îc<color>  Täa ®é: <color=blue>200,200<color>  phô tr¸ch: <color=blue>nhiÖm vô<color><enter>tinh th«ng y thuËt vµ ®éc d­îc, t¸nh t×nh qu¸i l¹, cè chÊp", 10, " BiÕt råi!/ok", "Ch­ëng m«n §­êng Cõu/m1", "Truy Hån TÈu §­êng Nhµn/m2", "Tiªu Nhiªm TÈu §­êng V©n/m3", "B¹ch Bµo TÈu §­êng H¹c/m5", "§­êng NhÊt TrÇn/m6", "§­êng BÊt NhiÔm/m7", "§­êng KhuyÕt /m8", "§­êng Khinh/m9", "§­êng §éc/m10")
end;

function m5()
Say("VŞ trİ: <color=blue>phßng Vâ c«ng<color>  Täa ®é: <color=blue>200,200<color>  phô tr¸ch: <color=blue>nhiÖm vô<color><enter> Tİnh t×nh nhu nh· vµ «n hoµ,tuy lµ 1 trong 4 ng­êi vŞ trİ cao trong §­êng M«n, nh­ng lu«n ®iÒm ®¹m khiªn tèn.", 10, " BiÕt råi!/ok", "Ch­ëng m«n §­êng Cõu/m1", "Truy Hån TÈu §­êng Nhµn/m2", "Tiªu Nhiªm TÈu §­êng V©n/m3", "TuyÖt Xu©n TÈu §­êng D· /m4", "§­êng NhÊt TrÇn/m6", "§­êng BÊt NhiÔm/m7", "§­êng KhuyÕt /m8", "§­êng Khinh/m9", "§­êng §éc/m10")
end;

function m6()
Say("VŞ trİ: <color=blue>phßng NghŞ sù<color>  Täa ®é: <color=blue>199,200<color>  phô tr¸ch: <color=blue>nhiÖm vô<color><enter> con tr­ëng cña §­êng Cõu, th«ng minh lanh lîi, v¨n vâ song toµn.", 10, " BiÕt råi!/ok", "Ch­ëng m«n §­êng Cõu/m1", "Truy Hån TÈu §­êng Nhµn/m2", "Tiªu Nhiªm TÈu §­êng V©n/m3", "TuyÖt Xu©n TÈu §­êng D· /m4", "B¹ch Bµo TÈu §­êng H¹c/m5", "§­êng BÊt NhiÔm/m7", "§­êng KhuyÕt /m8", "§­êng Khinh/m9", "§­êng §éc/m10")
end;

function m7()
Say("VŞ trİ: <color=blue>TÕ tæ ®­êng<color>  Täa ®é: <color=blue>199,199<color>  phô tr¸ch: <color=blue>nhiÖm vô<color><enter> con thø cña §­êng Cõu, tİnh t×nh hµo phãng, b¸c ¸i hiÒn l­¬ng", 10, " BiÕt råi!/ok", "Ch­ëng m«n §­êng Cõu/m1", "Truy Hån TÈu §­êng Nhµn/m2", "Tiªu Nhiªm TÈu §­êng V©n/m3", "TuyÖt Xu©n TÈu §­êng D· /m4", "B¹ch Bµo TÈu §­êng H¹c/m5", "§­êng NhÊt TrÇn/m6", "§­êng KhuyÕt /m8", "§­êng Khinh/m9", "§­êng §éc/m10")
end;

function m8()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng<color>  Täa ®é: <color=blue>508,323<color>  phô tr¸ch: <color=blue>Giao dŞch binh khİ<color>", 10, " BiÕt råi!/ok", "Ch­ëng m«n §­êng Cõu/m1", "Truy Hån TÈu §­êng Nhµn/m2", "Tiªu Nhiªm TÈu §­êng V©n/m3", "TuyÖt Xu©n TÈu §­êng D· /m4", "B¹ch Bµo TÈu §­êng H¹c/m5", "§­êng NhÊt TrÇn/m6", "§­êng BÊt NhiÔm/m7", "§­êng Khinh/m9", "§­êng §éc/m10")
end;

function m9()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng<color>  Täa ®é: <color=blue>506,322<color>  phô tr¸ch: <color=blue>Giao dŞch trang bŞ<color>", 10, " BiÕt råi!/ok", "Ch­ëng m«n §­êng Cõu/m1", "Truy Hån TÈu §­êng Nhµn/m2", "Tiªu Nhiªm TÈu §­êng V©n/m3", "TuyÖt Xu©n TÈu §­êng D· /m4", "B¹ch Bµo TÈu §­êng H¹c/m5", "§­êng NhÊt TrÇn/m6", "§­êng BÊt NhiÔm/m7", "§­êng KhuyÕt /m8", "§­êng §éc/m10")
end;

function m10()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng<color>  Täa ®é: <color=blue>504,322<color>  phô tr¸ch: <color=blue>Giao dŞch d­îc phÈm<color>", 10, " BiÕt råi!/ok", "Ch­ëng m«n §­êng Cõu/m1", "Truy Hån TÈu §­êng Nhµn/m2", "Tiªu Nhiªm TÈu §­êng V©n/m3", "TuyÖt Xu©n TÈu §­êng D· /m4", "B¹ch Bµo TÈu §­êng H¹c/m5", "§­êng NhÊt TrÇn/m6", "§­êng BÊt NhiÔm/m7", "§­êng KhuyÕt /m8", "§­êng Khinh/m9")
end;

--------------------------------

function c1()
Say("Phİa nam tiÕp víi Thµnh §«.", 3, " BiÕt råi!/ok", "§­êng Gia B¶o/c2", "Xung quanh §­êng Gia B¶o/c3")
end;

function c2()
Say("Trung t©m gåm: phßng kh¸ch (508,322) , Phßng Chİnh (511,319) , TÕ tæ ®­êng (514,318) .<enter> phİa §«ng cã: phßng Háa khİ (512,324) , phßng Y d­îc (515,322) .<enter>phİa T©y cã Phßng NghŞ sù (507,319) , phßng ¸m khİ (504,317) , phßng Vâ c«ng (509,317) ", 3, " BiÕt råi!/ok", "C¸c vïng l©n cËn/c1", "Xung quanh §­êng Gia B¶o/c3")
end;

function c3()
Say("Phİa nam th«ng qua Tróc H¶i Tam Quan.<enter> phİa §«ng ®Õn Tróc T¬ ®éng (522,326) .<enter>phİa T©y ®Õn PhØ Thóy hå (495,314) .<enter>phİa B¾c ®Õn V« T©m cèc (527,292) .", 3, " BiÕt råi!/ok", "C¸c vïng l©n cËn/c1", "§­êng Gia B¶o/c2")
end;

--------------------------------

function v1()							
Talk(6, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i cã thÓ gia nhËp §­êng M«n, trë thµnh <color=blue>T¹p DŞch<color>, häc ®­îc vâ c«ng <color=blue>Tİch LŞch ®¬n<color>.<enter>TiÕp nhËn nhiÖm vô, cÇn ph¶i ®¹t ®iÒu kiÖn sau: Ngò hµnh thuéc tİnh: hÖ Méc, ®¼ng cÊp ®¹t ®Õn 10, kh«ng lµm nhiÖm vô nhËp m«n cña bÊt kú m«n ph¸i nµo","B­íc 1: §Õn <color=blue>lèi vµo Tróc H¶i Tam Quan<color> gÆp 1 <color=blue>§­êng M«n Tr¸ng §inh (453,358)<color>, tiÕp nhËn nhiÖm vô, qua Tróc H¶i Tam Quan.", "B­íc 2: §Õn cöa thø nhÊt ®¸nh b¹i <color=blue>§¹i M· hÇu<color>, lÊy ®­îc <color=red>gËy tróc mµu xanh<color>.", "B­íc 3: §Õn cöa thø hai tr¶ lêi c©u hái cña <color=blue>§­êng M«n Tr¸ng §inh (468,350)<color> vÒ Cöu Cung ®å, lÊy ®­îc <color=red>gËy tróc mµu tr¾ng<color>. CÇn ph¶i ®¸nh b¹i <color=blue>§¹i M· hÇu, §¹i D· hÇu<color>míi lÊy ®­îc ®¸p ¸n!", "B­íc 4: §Õn cöa thø ba tr¶ lêi c©u hái cña<color=blue>§­êng M«n Tr¸ng §inh (473,343)<color> vÒ B¸t qu¸i, lÊy ®­îc <color=red>gËy tróc mµu tİm<color>.CÇn ph¶i ®¸nh b¹i <color=blue>§¹i M· hÇu, §¹i D· hÇu, §¹i H¾c DiÖp HÇu<color> míi lÊy ®­îc ®¸p ¸n!", "B­íc 5: §Õn <color=blue>lèi ra Tróc H¶i Tam Quan<color>, giao 3 c©y gËy tróc cho <color=blue>§­êng M«n Tr¸ng §inh (479,339)<color>, hoµn thµnh nhiÖm vô.")
end;


function v2()
Talk(7, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Tr¸ng §inh <color>, häc ®­îc vâ c«ng <color=blue>§­êng M«n ¸m khİ, §­êng M«n §ao ph¸p<color>.<enter>TiÕp nhËn nhiÖm vô nµy cÇn ph¶i lµ ®Ö tö trªn cÊp 10","B­íc 1: §Õn <color=blue>phßng Vâ c«ng<color> gÆp <color=blue>§­êng H¹c <color>, tiÕp nhËn nhiÖm vô, ®i <color=blue>Thµnh §« <color> t×m <color=red>Ma Vò ch©m<color>.", "B­íc 2: §Õn <color=blue>Thµnh §« <color>, gÆp <color=blue>Mai N­¬ng (389,315)<color> biÕt ®­îc cÇn ph¶i ®i t×m <color=blue>T«n UyÓn<color>.", "B­íc 3: §Õn phİa ®«ng nam Thµnh §« §«ng Nam t×m <color=blue>T«n UyÓn (394,323)<color>, tiÕp nhËn nhiÖm vô, dïng <color=red>NhÉn M· N·o<color> ®æi Ma Vò ch©m.", "B­íc 4: ®Õn <color=blue>tiÖm T¹p hãa<color> mua <color=red>NhÉn M· N·o<color>.", "B­íc 5: Trë l¹i gÆp T«n UyÓn, giao NhÉn M· N·o, lÊy ®­îc <color=red>Ma Vò ch©m<color>.", "B­íc 6: Trë vÒ <color=blue>phßng Vâ c«ng<color>, giao <color=red>Ma Vò ch©m<color> cho <color=blue>§­êng H¹c <color>, hoµn thµnh nhiÖm vô.")
end;


function v3()
Talk(8, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Hé ViÖn<color>, häc ®­îc vâ c«ng <color=blue>§o¹t Hån Tiªu, T©m Nh·n <color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 20 vµ ®· hoµn thµnh nhiÖm vô Ma Vò ch©m","B­íc 1: §Õn <color=blue>phßng NghŞ sù<color> gÆp <color=blue>§­êng NhÊt TrÇn<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>V« T©m cèc<color> khuyªn nhñ <color=blue>§­êng U<color>.", "B­íc 2: §Õn <color=blue>phİa b¾c V« T©m cèc<color>, nhÊp vµo <color=blue>cöa gç (528,291)<color>, tiÕp nhËn nhiÖm vô, ®Õn V« T©m cèc t×m <color=blue>4 ch÷ khÈu quyÕt<color>.", "B­íc 3: §Õn V« T©m cèc ®¸nh b¹i 4 con <color=blue>X¸ LŞ tinh<color> vµ <color=blue>Ho¸n hïng tinh<color>, lÊy ®­îc <color=red>4 chiÕc kh¨n t¬<color>trªn ®ã cã 4 c©u khÈu quyÕt", "B­íc 4: Quay l¹i ®èi tho¹i víi §­êng U, tiÕp nhËn nhiÖm vô, ®Õn phİa t©y <color=blue>PhØ Thóy hå<color> t×m <color=red>Kim H¹ng khuyªn<color>.", "B­íc 5: §Õn <color=blue>PhØ Thóy hå<color>, ®¸nh b¹i <color=blue>Xİch DiÖm Ng¹c<color>, lÊy ®­îc <color=red>Kim H¹ng khuyªn<color>", "B­íc 6: Trë l¹i <color=blue>V« T©m cèc<color>, §­êng U sÏ b¶o ng­¬i mang <color=red>Kim H¹ng khuyªn<color> cho <color=blue>Ch­ëng m«n §­êng Cõu<color>.", "B­íc 7: Quay vÒ <color=blue>phßng kh¸ch<color>, giao <color=red>Kim H¹ng khuyªn<color> cho <color=blue>§­êng Cõu <color>, hoµn thµnh nhiÖm vô. NÕu Kim H¹ng khuyªn bŞ mÊt, ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu.")
end;


function v4()
Talk(6, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Giíi TiÒn Hé vÖ<color>, häc ®­îc vâ c«ng <color=blue>Truy T©m TiÔn<color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 30 vµ ®· hoµn thµnh nhiÖm vô §­êng U","B­íc 1: §Õn <color=blue>TÕ tæ ®­êng<color> gÆp <color=blue>§­êng BÊt NhiÔm<color>, tiÕp nhËn nhiÖm vô, ®i lÊy<color=red>Háa Khİ phæ<color>.", "B­íc 2: §Õn <color=blue>B¹ch V©n ®éng<color>, ®¸nh b¹i thæ phØ <color=blue>§¹i ®Çu môc Cuång Sa<color>, tiÕp nhËn nhiÖm vô, vµo trong ®éng t×m <color=red>Ch×a khãa b¶o r­¬ng<color>.", "B­íc 3: Vµo ®éng ®¸nh b¹i 4 tªn <color=blue>tiÓu ®Çu môc §éc NhÜ, ThiÕt Tı, Quû ¶nh, LÖ QuyÒn<color> sÏ lÊy ®­îc <color=red>Ch×a khãa<color>.", "B­íc 4: Më <color=blue>B¶o r­¬ng (230,199)<color>, lÊy ®­îc <color=red>Háa Khİ phæ<color>.", "B­íc 5: Trë vÒ <color=blue>phßng Háa khİ<color>, giao <color=red>Háa Khİ phæ<color> cho <color=blue>§­êng V©n <color>, hoµn thµnh nhiÖm vô.")
end;


function v5()
Talk(7, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>NhËp C¸c ®Ö tö<color>, häc ®­îc vâ c«ng <color=blue>M¹n Thiªn Hoa Vò, Thèi §éc ThuËt<color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 40 vµ ®· hoµn thµnh nhiÖm vô Háa Khİ phæ ","B­íc 1: §Õn <color=blue>phßng Y d­îc<color> gÆp <color=blue>§­êng D·<color>, tiÕp nhËn nhiÖm vô, hãa gi¶i ©n o¸n gi÷a §­êng D· vµ C¶nh Tö Kú ", "B­íc 2: §Õn phİa t©y <color=blue>Thanh Thµnh s¬n<color> t×m <color=blue>C¶nh Tö Kú (230,245)<color>. Tr­íc tiªn ®¸nh b¹i 5 con d· thó: <color=blue>Sãi x¸m<color>, <color=blue>M·nh hæ<color>, <color=blue>Kim TiÒn b¸o<color>, <color=blue>Heo rõng<color> vµ <color=blue>GÊu n©u<color>, sau ®ã tiÕp nhËn nhiÖm vô, gióp con g¸i C¶nh Tö Kú trŞ bÖnh", "B­íc 3: Trë l¹i <color=blue>phßng Y d­îc<color>, hái <color=blue>§­êng D·<color> vÒ <color=blue>bµi thuèc<color>.", "B­íc 4: §Õn ®«ng b¾c <color=blue>Thanh Thµnh s¬n<color>, lªn <color=blue>Thanh D­¬ng phong<color>, ®¸nh b¹i <color=blue>H¾c ¦ng, Hung Thøu, Linh §iªu<color>, lÊy ®­îc 5 D­îc liÖu: <color=red>Da cãc, gan r¾n ®éc, h¹t Anh tóc, ®u«i rÕt ®éc, ®Çu Thiªn tµm<color>.", "B­íc 5: Giao d­îc liÖu C¶nh Tö Kú, hãa gi¶i ®­îc ©n o¸n", "B­íc 6: Trë vÒ phßng Y d­îc gÆp §­êng D·, hoµn thµnh nhiÖm vô.")
end;


function v6()
Talk(7, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Tø L·o m«n nh©n<color>, häc ®­îc vâ c«ng <color=blue>Thiªn La §Şa Vâng<color>.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 50 vµ ®· hoµn thµnh nhiÖm vô C¶nh Tö Kú ","B­íc 1: §Õn <color=blue>phßng ¸m khİ<color> gÆp <color=blue>§­êng Nhµn<color>, tiÕp nhËn nhiÖm vô, ®i t×m <color=red>'¸m khİ phæ'<color>.", "B­íc 2: §Õn <color=blue>phßng NghŞ sù<color>,gÆp <color=blue>§­êng NhÊt TrÇn<color>, biÕt ®­îc <color=blue>Tam s­ huynh §­êng Hßa<color> vµ <color=blue>Ngò s­ huynh §­êng Nguyªn <color> ®· ®i ngang phßng ¸m khİ, hµnh ®éng cña 2 ng­êi rÊt kh¶ nghi", "B­íc 3: §Õn <color=blue>Giang T©n th«n <color> t×m <color=blue>§­êng Nguyªn <color>, biÕt ®­îc <color=blue>§­êng Hßa<color> ®ang ë <color=blue>H­ëng Thñy ®éng<color>.", "B­íc 4: §Õn <color=blue>H­ëng Thñy ®éng<color>, ®¸nh b¹i <color=blue>§­êng Hßa<color>, biÕt ®­îc <color=red>'¸m khİ phæ'<color> ®ang ®­îc giÊu trong ®éng", "B­íc 5: TiÕp tôc ®¸nh b¹i <color=blue>ThiÕt Chïy Ma V­¬ng<color> hoÆc <color=blue>ThiÕt QuyÒn Diªm La<color>, sÏ lÊy ®­îc <color=red>'¸m khİ phæ'<color>.", "B­íc 6: Trë vÒ <color=blue>phßng ¸m khİ<color>, giao <color=red>'¸m khİ phæ'<color> cho <color=blue>§­êng Nhµn<color>, hoµn thµnh nhiÖm vô. NÕu ¸m khİ phæ bŞ mÊt, ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu.")
end;


function v7()
Talk(6, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Thiªn Thñ ThÇn VÖ<color>, thuËn lîi xuÊt s­.<enter>TiÕp nhËn nhiÖm vô cÇn ph¶i lµ ®Ö tö cÊp 50 vµ ®· hoµn thµnh nhiÖm vô ¸m khİ phæ ","B­íc 1: §Õn <color=blue>phßng kh¸ch<color> gÆp <color=blue>Ch­ëng m«n §­êng Cõu<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>Tróc T¬ ®éng<color> ®o¹t l¹i <color=red>ThÊt Tinh TuyÖt MÖnh kiÕm<color>.", "B­íc 2: §Õn <color=blue>tÇng 1 Tróc T¬ ®éng<color> ®¸nh b¹i <color=blue>M·ng H¸n ®Çu lÜnh<color>, sÏ lÊy ®­îc <color=red>Ch×a khãa lªn tÇng 2<color>.", "B­íc 3: §Õn <color=blue>tÇng 2 Tróc T¬ ®éng<color> ®¸nh b¹i <color=blue>M·ng H¸n ®Çu lÜnh<color> hoÆc <color=blue>§iÓm T×nh hæ<color>, sÏ lÊy ®­îc <color=red>Ch×a khãa lªn tÇng 3<color>.", "B­íc 4: §Õn <color=blue>tÇng 3 Tróc T¬ ®éng<color>, cã 2 chiÕc <color=blue>B¶o r­¬ng <color>, trong ®ã cã 1 chiÕc chøa <color=red>ThÊt Tinh TuyÖt MÖnh kiÕm<color>.", "B­íc 5: Trë l¹i <color=blue>phßng kh¸ch<color>, giao <color=red>ThÊt Tinh TuyÖt MÖnh kiÕm<color> cho <color=blue>Ch­ëng m«n §­êng Cõu<color>, hoµn thµnh nhiÖm vô. NÕu ThÊt Tinh TuyÖt mÖnh kiÕm bŞ mÊt, ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu.")
end;

function v8()
Talk(3,"","Sau khi trïng ph¶n s­ m«n, ng­¬i ®­îc phong lµ <color=blue>Lôc C¸c Tr­ëng L·o<color>, häc ®­îc tuyÖt häc trÊn ph¸i <color=blue>TiÓu Lı Phi §ao, Thiªn La §Şa Vâng, T¸n Hoa Tiªu<color>.","B­íc 1: Sau khi ®¼ng cÊp ®¹t h¬n 60,  ®Õn <color=blue> Phßng kh¸ch <color> gÆp <color=blue>Ch­ëng m«n §­êng Cõu<color>, xin ®­îc trïng ph¶n §­êng M«n.","B­íc 2: Th«ng qua giao nép <color=red>50000 l­îng<color>, trïng ph¶n §­êng M«n.")
end;

--------------------------------

function ok()
end;

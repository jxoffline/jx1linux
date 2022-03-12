--ÌìÈÌ½Ì°ïÖúNPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "Qu©n s­ "
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(210) == 1 then
		allbrother_0801_FindNpcTaskDialog(210)
		return 0;
	end
UTask_tr = GetTask(4)

if (UTask_tr < 10*256) then						--Î´½ÓÌìÈÌ½ÌÈëÃÅÈÎÎñ£¬Î´ÈëÌìÈÌ½Ì
	if (GetFaction() ~= "") then				--Èç¹ûÍæ¼ÒÒÑ¾­ÊôÓÚÁíÒ»ÃÅÅÉ
		Say("ChØ cÇn kh«ng liªn quan ®Õn c¬ mËt cña bæn gi¸o, cã chuyÖn g× cø hái!", 3, "T×m hiÓu quı gi¸o/org", "T×m hiÓu c¸c vŞ cao thñ /member", "T×m hiÓu bè côc n¬i nµy/config")
		return
	else
		Say("ChØ cÇn kh«ng liªn quan ®Õn c¬ mËt cña bæn gi¸o, cã chuyÖn g× cø hái!", 4, "T×m hiÓu quı gi¸o/org", "T×m hiÓu c¸c vŞ cao thñ /member", "T×m hiÓu bè côc n¬i nµy/config", "Lµm sao ®Ó nhËp m«n?/task1")
		return	
	end
end;
	
if (UTask_tr == 70*256) then					--ÌìÈÌ½ÌÒÑ¾­³öÊ¦		
	Say("Kh«ng ph¶i ng­¬i ®· xuÊt s­ råi sao, cßn chuyÖn g× kh«ng biÕt n÷a?", 6, "TiÕp tôc t×m hiÓu Thiªn NhÉn Gi¸o/org", "T×m hiÓu l¹i ®ång m«n tr­íc kia/member", "T×m hiÓu l¹i bè côc n¬i nµy/config", "Cßn nhiÖm vô nµo ®Ó lµm n÷a/task3","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help")
	return
end;	

Say("Cã chuyÖn g× cø hái.", 7,"§èi tho¹i víi Long Ngò /Uworld1000_word", "T×m hiÓu bæn gi¸o/org", "T×m hiÓu ®ång m«n/member", "T×m hiÓu bè côc n¬i nµy/config", "T×m hiÓu nhiÖm vô /task3","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("Muèn biÕt chuyÖn g× n÷a?", 4, "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;


function member()
Say("Muèn biÕt vÒ ai?", 10, "Gi¸o chñ Hoµn Nhan Hïng LiÖt/m1", "T¶ Hé ph¸p §oan Méc DuÖ /m2", "H÷u Hé ph¸p Gia Lôc Tş Ly/m3", "Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y/m4", "Háa §­êng §­êng chñ Ngét Ng¹o/m5", "NhËt NguyÖt §µn chñ ¤ Hîp T¸t/m6", "Thiªn NhÉn Tö SÜ /m7", "Th¸p Lı H·n/m8", "Vò §Şch/m9", "Kú Hùu/m10")
end;


function config()
Say("Muèn biÕt chuyÖn g× n÷a?", 3, "C¸c vïng l©n cËn/c1",  "Bè côc bªn ngoµi/c2", "Bè côc bªn trong/c3")
end;


function task1()
Say("Bæn m«n chØ nhËn ®Ö tö thuéc hÖ Háa, kh«ng ph©n biÖt nam n÷. Muèn nhËp m«n häc nghÖ, cÇn ph¶i hoµn thµnh nhiÖm vô nhËp m«n.", 1, "T×m hiÓu cô thÓ nhiÖm vô nhËp m«n/v1")
end;


function task2()
Say("<#> Ng­¬i ®· xuÊt s­, kh«ng cÇn lµm nhiÖm vô cña bæn gi¸o n÷a! HiÖn ®· "..UTask_tr.."<#>.", 0)
end;


function task3()

UTask_tr = GetTask(4)

if (UTask_tr > 5*256) and (UTask_tr < 10*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô nhËp m«n/v1")
end;

if (UTask_tr == 10*256) then
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, giê ®· nhËp m«n, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô ThÊt S¸t ®éng/v2")
end;

if (UTask_tr > 10*256) and (UTask_tr < 20*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô ThÊt S¸t ®éng/v2")
end;

if (UTask_tr == 20*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô ®øa bĞ th«ng minh/v3")
end;

if (UTask_tr > 20*256) and (UTask_tr < 30*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô ®øa bĞ th«ng minh/v3")
end;

if (UTask_tr == 30*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "nhiÖm vô B¶o Th¹ch/v4")
end;

if (UTask_tr > 30*256) and (UTask_tr < 40*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "nhiÖm vô B¶o Th¹ch/v4")
end;

if (UTask_tr == 40*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "nhiÖm vô hµnh thİch/v5")
end;

if (UTask_tr > 40*256) and (UTask_tr < 50*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "nhiÖm vô hµnh thİch/v5")
end;

if (UTask_tr == 50*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "nhiÖm vô cøu ng­êi/v6")
end;

if (UTask_tr > 50*256) and (UTask_tr < 60*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "nhiÖm vô cøu ng­êi/v6")
end;

if (UTask_tr == 60*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, tiÕp theo cã thÓ tiÕn hµnh:", 1, "NhiÖm vô xuÊt s­ /v7")
end;

if (UTask_tr > 60*256) and (UTask_tr < 70*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "NhiÖm vô xuÊt s­ /v7")
end;

if (UTask_tr >= 70*256) and (UTask_tr < 80*256) then	
Say("<#> Muèn nhËp m«n häc nghÖ, tr­íc tiªn ph¶i th«ng qua hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.HiÖn ®· "..UTask_tr.."<#>, nhiÖm vô ®ang tiÕn hµnh lµ:", 1, "Trïng ph¶n s­ m«n/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("Bæn gi¸o lËp nªn ë §¹i Kim lµ ®Ó ®èi chäi víi Vâ l©m Trung Nguyªn, ®­îc tin t­ëng trë thµnh Quèc Gi¸o, Gi¸o chñ Hoµn Nhan Hïng LiÖt còng lµ quèc s­ cña §¹i Kim.", 4, "BiÕt råi/ok", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;

function o2()
Say("§©y lµ tæng ®µn cña bæn gi¸o, n»m ë vŞ trİ bİ mËt d­íi thung lòng phİa ®«ng BiÖn Kinh.", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "§Şa vŞ giang hå /o3", "§Æc s¾c m«n ph¸i/o4")
end;

function o3()
Say("Bæn gi¸o cã bèi c¶nh chİnh trŞ rÊt phøc t¹p. Môc ®İch lµ gióp nhµ Kim Nam h¹ diÖt Tèng, nhÊt thèng thiªn h¹!", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Æc s¾c m«n ph¸i/o4")
end;

function o4()
Say("Kh¸c biÖt lín nhÊt cña bæn gi¸o víi c¸c m«n ph¸i kh¸c lµ: bæn gi¸o thµnh lËp v× môc ®İch chİnh trŞ. C¸c nh©n vËt gia nhËp bæn gi¸o kh«ng ph¶i ®Ó häc nghÖ, mµ v× môc ®İch chİnh trŞ, nh÷ng ng­êi nµy th­êng gi÷ ®Şa vŞ cao trong bæn gi¸o. Bæn gi¸o hµnh sù nghiªm mËt, gi¸o quy rÊt nghiªm, ®èi víi nh÷ng kÎ ph¶n béi sÏ trõng trŞ kh«ng tha.", 4, "BiÕt råi/ok", "Khëi nguyªn m«n ph¸i/o1", "VŞ trİ ®Şa lı /o2", "§Şa vŞ giang hå /o3")
end;

--------------------------------

function m1()
Say("VŞ trİ: <color=blue>Thiªn NhÉn gi¸o tÇng 3<color>   Täa ®é: <color=blue>215,195<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter> Kim quèc Quèc s­, nhÊt ®¹i kiªu hïng, ®a m­u tóc trİ nh­ng kiªu c¨ng ng¹o m¹n.", 10, "BiÕt råi/ok", "T¶ Hé ph¸p §oan Méc DuÖ /m2", "H÷u Hé ph¸p Gia Lôc Tş Ly/m3", "Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y/m4", "Háa §­êng §­êng chñ Ngét Ng¹o/m5", "NhËt NguyÖt §µn chñ ¤ Hîp T¸t/m6", "Thiªn NhÉn Tö SÜ /m7", "Th¸p Lı H·n/m8", "Vò §Şch/m9", "Kú Hùu/m10")
end;

function m2()
Say("VŞ trİ: <color=blue>Thiªn NhÉn gi¸o tÇng 3<color>   Täa ®é: <color=blue>225,199<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter>, v¨n vâ song toµn, phong l­u nho nh·, nöa chİnh nöa tµ ", 10, "BiÕt råi/ok", "Gi¸o chñ Hoµn Nhan Hïng LiÖt/m1", "H÷u Hé ph¸p Gia Lôc Tş Ly/m3", "Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y/m4", "Háa §­êng §­êng chñ Ngét Ng¹o/m5", "NhËt NguyÖt §µn chñ ¤ Hîp T¸t/m6", "Thiªn NhÉn Tö SÜ /m7", "Th¸p Lı H·n/m8", "Vò §Şch/m9", "Kú Hùu/m10")
end;

function m3()
Say("VŞ trİ: <color=blue>Thiªn NhÉn gi¸o tÇng 3<color>   Täa ®é: <color=blue>207,189<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter>, lµ ng­êi gian tr¸ gi¶o ho¹t, bÊt chÊp mäi thñ ®o¹n ®Ó ®¹t ®­îc môc tiªu", 10, "BiÕt råi/ok", "Gi¸o chñ Hoµn Nhan Hïng LiÖt/m1", "T¶ Hé ph¸p §oan Méc DuÖ /m2", "Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y/m4", "Háa §­êng §­êng chñ Ngét Ng¹o/m5", "NhËt NguyÖt §µn chñ ¤ Hîp T¸t/m6", "Thiªn NhÉn Tö SÜ /m7", "Th¸p Lı H·n/m8", "Vò §Şch/m9", "Kú Hùu/m10")
end;

function m4()
Say("VŞ trİ: <color=blue>Thiªn NhÉn gi¸o tÇng 3<color>   Täa ®é: <color=blue>213,201<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter>, thÊt c«ng chóa cña Kim quèc, van vâ song toµn, th«ng minh lanh lîi. Gia nhËp Thiªn NhÉn Gi¸o víi môc ®İch gi¸m s¸t Hoµn Nhan Hïng LiÖt!", 10, "BiÕt råi/ok", "Gi¸o chñ Hoµn Nhan Hïng LiÖt/m1", "T¶ Hé ph¸p §oan Méc DuÖ /m2", "H÷u Hé ph¸p Gia Lôc Tş Ly/m3", "Háa §­êng §­êng chñ Ngét Ng¹o/m5", "NhËt NguyÖt §µn chñ ¤ Hîp T¸t/m6", "Thiªn NhÉn Tö SÜ /m7", "Th¸p Lı H·n/m8", "Vò §Şch/m9", "Kú Hùu/m10")
end;

function m5()
Say("VŞ trİ: <color=blue>Thiªn NhÉn gi¸o tÇng 3<color>   Täa ®é: <color=blue>205,197<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter>, tİnh t×nh nãng n¶y, h¸o th¾ng. Mét khi ®· h¹ thñ th× kh«ng vŞ t×nh bÊt cø ai!", 10, "BiÕt råi/ok", "Gi¸o chñ Hoµn Nhan Hïng LiÖt/m1", "T¶ Hé ph¸p §oan Méc DuÖ /m2", "H÷u Hé ph¸p Gia Lôc Tş Ly/m3", "Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y/m4", "NhËt NguyÖt §µn chñ ¤ Hîp T¸t/m6", "Thiªn NhÉn Tö SÜ /m7", "Th¸p Lı H·n/m8", "Vò §Şch/m9", "Kú Hùu/m10")
end;

function m6()
Say("VŞ trİ: <color=blue>Qu·ng tr­êng<color>   Täa ®é: <color=blue>200,198<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter>, vâ nghÖ cao c­êng nh­ng h¬i ®Ônh ®·ng, nhiÒu lóc khiÕn ®ång m«n ph¶i dë khãc dë c­êi", 10, "BiÕt råi/ok", "Gi¸o chñ Hoµn Nhan Hïng LiÖt/m1", "T¶ Hé ph¸p §oan Méc DuÖ /m2", "H÷u Hé ph¸p Gia Lôc Tş Ly/m3", "Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y/m4", "Háa §­êng §­êng chñ Ngét Ng¹o/m5", "Thiªn NhÉn Tö SÜ /m7", "Th¸p Lı H·n/m8", "Vò §Şch/m9", "Kú Hùu/m10")
end;

function m7()
Say("VŞ trİ: <color=blue>Lèi vµo mËt thÊt<color>   Täa ®é: <color=blue>207,195<color>   Phô tr¸ch: <color=blue>nhiÖm vô<color><enter>, chØ lµ mét ®Ö tö th«ng th­êng, ch­a cã biÓu hiÖn g× xuÊt s¾c", 10, "BiÕt råi/ok", "Gi¸o chñ Hoµn Nhan Hïng LiÖt/m1", "T¶ Hé ph¸p §oan Méc DuÖ /m2", "H÷u Hé ph¸p Gia Lôc Tş Ly/m3", "Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y/m4", "Háa §­êng §­êng chñ Ngét Ng¹o/m5", "NhËt NguyÖt §µn chñ ¤ Hîp T¸t/m6", "Th¸p Lı H·n/m8", "Vò §Şch/m9", "Kú Hùu/m10")
end;

function m8()
Say("VŞ trİ: <color=blue>Thiªn NhÉn gi¸o tÇng 3<color>   Täa ®é: <color=blue>207,199<color>   Phô tr¸ch: <color=blue>Giao dŞch binh khİ<color>", 10, "BiÕt råi/ok", "Gi¸o chñ Hoµn Nhan Hïng LiÖt/m1", "T¶ Hé ph¸p §oan Méc DuÖ /m2", "H÷u Hé ph¸p Gia Lôc Tş Ly/m3", "Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y/m4", "Háa §­êng §­êng chñ Ngét Ng¹o/m5", "NhËt NguyÖt §µn chñ ¤ Hîp T¸t/m6", "Thiªn NhÉn Tö SÜ /m7", "Vò §Şch/m9", "Kú Hùu/m10")
end;

function m9()
Say("VŞ trİ: <color=blue>Thiªn NhÉn gi¸o tÇng 3<color>   Täa ®é: <color=blue>208,198<color>   Phô tr¸ch: <color=blue>Giao dŞch trang bŞ<color>", 10, "BiÕt råi/ok", "Gi¸o chñ Hoµn Nhan Hïng LiÖt/m1", "T¶ Hé ph¸p §oan Méc DuÖ /m2", "H÷u Hé ph¸p Gia Lôc Tş Ly/m3", "Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y/m4", "Háa §­êng §­êng chñ Ngét Ng¹o/m5", "NhËt NguyÖt §µn chñ ¤ Hîp T¸t/m6", "Thiªn NhÉn Tö SÜ /m7", "Th¸p Lı H·n/m8", "Kú Hùu/m10")
end;

function m10()
Say("VŞ trİ: <color=blue>Thiªn NhÉn gi¸o tÇng 3<color>   Täa ®é: <color=blue>210,198<color>   Phô tr¸ch: <color=blue>Giao dŞch D­îc phÈm<color>", 10, "BiÕt råi/ok", "Gi¸o chñ Hoµn Nhan Hïng LiÖt/m1", "T¶ Hé ph¸p §oan Méc DuÖ /m2", "H÷u Hé ph¸p Gia Lôc Tş Ly/m3", "Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y/m4", "Háa §­êng §­êng chñ Ngét Ng¹o/m5", "NhËt NguyÖt §µn chñ ¤ Hîp T¸t/m6", "Thiªn NhÉn Tö SÜ /m7", "Th¸p Lı H·n/m8", "Vò §Şch/m9")
end;

--------------------------------

function c1()
Say("Bªn ngoµi ®i theo h­íng nam sÏ ®Õn BiÖn Kinh", 3, "BiÕt råi/ok", "Bè côc bªn ngoµi/c2", "Bè côc bªn trong/c3")
end;

function c2()
Say("Qu¶ng tr­êng cã lèi ra vµo mËt thÊt", 3, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1", "Bè côc bªn trong/c3")
end;

function c3()
Say("MËt thÊt gåm 3 tÇng. TÇng 1 kh«ng cã s¬n ®éng; tÇng 2 cã ThÊt S¸t ®éng (190,190) ; tÇng 3 cã Th¸nh ®éng (218,192) . Tæng ®µn n»m ë tÇng 3.", 3, "BiÕt råi/ok", "C¸c vïng l©n cËn/c1",  "Bè côc bªn ngoµi/c2")
end;

--------------------------------

function v1()							
Talk(4, "", "Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i cã thÓ gia nhËp Thiªn NhÉn Gi¸o, trë thµnh <color=blue>S¸t thñ<color>, häc ®­îc vâ c«ng <color=blue>Tµn D­¬ng Nh­ HuyÕt<color>.<enter>TiÕp nhËn nhiÖm vô, cÇn ph¶i ®¹t ®iÒu kiÖn sau: Ngò hµnh thuéc tİnh: hÖ Háa, ®¾ng cÊp ®¹t ®Õn 10, kh«ng lµm nhiÖm vô nhËp m«n cña bÊt kú m«n ph¸i nµo","B­íc 1: §Õn <color=blue>Lèi vµo mËt thÊt<color> gÆp <color=blue>Thiªn NhÉn Tö SÜ<color>. TiÕp nhËn nhiÖm vô, ®Õn <color=blue>Hoa S¬n<color> t×m <color=red>Vò V­¬ng KiÕm<color>.", "B­íc 2: §Õn <color=blue>Hoa S¬n<color> ®¸nh b¹i <color=blue> §¹i Ho¸n Hïng, §¹i D· Tr­<color> hoÆc <color=blue>§¹i Thİch VŞ<color> sÏ lÊy ®­îc <color=red>Vò V­¬ng KiÕm<color>.", "B­íc 3: Trë vÒ Thiªn NhÉn Gi¸o, giao <color=red>Vò V­¬ng KiÕm<color> cho <color=blue>Thiªn NhÉn Tö SÜ<color>, nhiÖm vô hoµn thµnh. NÕu Vò V­¬ng KiÕm mÊt ®i,cÇn ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu!")
end;


function v2()
Talk(4, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>V« ¶nh S¸t thñ<color>, häc ®­îc vâ c«ng <color=blue>Thiªn NhÉn §ao ph¸p, Thiªn NhÉn M©u ph¸p, Háa Liªn PhÇn Hoa<color>.<enter>TiÕp nhËn nhiÖm vô nµy cÇn ph¶i lµ ®Ö tö trªn cÊp 10","B­íc 1: §Õn <color=blue>Thiªn NhÉn gi¸o tÇng 3<color> gÆp <color=blue>Háa §­êng §­êng chñ Ngét Ng¹o<color>. TiÕp nhËn nhiÖm vô, vµo <color=blue>ThÊt S¸t ®éng<color> lÊy <color=red>3 m¶nh lÖnh bµi<color>.", "B­íc 2: Lªn tÇng 2, vµo <color=blue>ThÊt S¸t ®éng<color>, ®¸nh b¹i <color=blue>7 tªn Tö tï<color> sÏ lÊy ®­îc <color=red>3 m¶nh lÖnh bµi<color>.", "B­íc 3: Trë l¹i <color=blue>tÇng 3<color> giao <color=red>lÖnh bµi<color> cho <color=blue>Háa §­êng §­êng chñ Ngét Ng¹o<color>, nhiÖm vô hoµn thµnh. ")
end;


function v3()
Talk(5, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Tö SÜ <color>, häc ®­îc vâ c«ng <color=blue>¶o ¶nh Phi Hå<color>.<enter>TiÕp nhËn nhiÖm vô nµy cÇn ph¶i lµ ®Ö tö trªn cÊp 20 vµ ®· hoµn thµnh nhiÖm vô ThÊt S¸t lÖnh.","B­íc 1: §Õn <color=blue>Qu·ng tr­êng<color> gÆp <color=blue>NhËt NguyÖt §µn chñ ¤ Hîp T¸t<color>, nhËn nhiÖm vô ®i tr¶ lêi c©u hái, ®i t×m <color=blue>®øa bĞ trai<color> lÊy l¹i <color=red>NhËt NguyÖt Song Lu©n<color>", "B­íc 2: §Õn khu rõng phİa §«ng t×m <color=blue>®øa bĞ trai (213,203)<color>, tr¶ lêi chİnh x¸c c©u ®è, l¹i nhËn nhiÖm vô ®i t×m <color=red>tiÓu Hoµng cÈu<color> vµ <color=red>tiÓu Kh«i l­<color>", "B­íc 3: §Õn khu rõng phİa T©y t×m thÊy <color=red>tiÓu Hoµng cÈu (210,191)<color> vµ <color=red>tiÓu Kh«i l­ (196,195)<color>, giao cho <color=blue>®øa bĞ trai<color> ®æi lÊy <color=red>NhËt NguyÖt Song Lu©n<color>.", "B­íc 4: trë vÒ giao <color=red>NhËt NguyÖt Song Lu©n<color> cho <color=blue>¤ Hîp T¸t<color>, nhiÖm vô hoµn thµnh. NÕu NhËt NguyÖt Song Lu©n mÊt ®i,cÇn ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu!")
end;


function v4()
Talk(5, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>U Minh Tö SÜ<color>, häc ®­îc vâ c«ng <color=blue>LiÖt Háa T×nh Thiªn, Th«i S¬n §iÒn H¶Ø, Phi Hång V« Tİch<color>.<enter>TiÕp nhËn nhiÖm vô nµy cÇn ph¶i lµ ®Ö tö trªn cÊp 30 vµ ®· hoµn thµnh nhiÖm vô ®øa bĞ th«ng minh.","B­íc 1: §Õn <color=blue>Thiªn NhÉn gi¸o tÇng 3<color> gÆp <color=blue>Háa §­êng §­êng chñ Hoµn Nhan TuyÕt Y<color>. TiÕp nhËn nhiÖm vô, ®Õn <color=blue>TÇn L¨ng<color>t×m 4 lo¹i b¶o th¹ch: <color=red>C¸p HuyÕt Hång, B¨ng Tinh Lam, Tæ MÉu Lôc, V©n Méng Tö<color>.", "B­íc 2: §Õn <color=blue>TÇn L¨ng<color>, ®¸nh b¹i <color=blue>§¹o b¶o tÆc<color>, sÏ lÊy ®­îc 3 viªn: <color=red>C¸p HuyÕt Hång; B¨ng Tinh Lam; Tæ MÉu Lôc<color>.", "B­íc 3: Ra phİa ngoµi TÇn L¨ng t×m mét <color=blue>N«ng phu (296,158)<color>, sÏ mua ®­îc <color=red>V©n Méng Tö<color>.", "B­íc 4: Trë vÒ <color=blue>Thiªn NhÉn gi¸o tÇng 3<color>, giao 4 lo¹i B¶o th¹ch cho <color=blue> Hoµn Nhan TuyÕt Y<color>, nhiÖm vô hoµn thµnh. ")
end;


function v5()
Talk(4, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Ch­ëng Kú Sø<color>, häc ®­îc vâ c«ng <color=blue>Bi T« Thanh Phong<color>.<enter>TiÕp nhËn nhiÖm vô nµy cÇn ph¶i lµ ®Ö tö trªn cÊp 40 vµ ®· hoµn thµnh nhiÖm vô B¶o Th¹ch.","B­íc 1: §Õn <color=blue>tÇng 3<color> gÆp <color=blue>H÷u Hé ph¸p Gia LuËt Tş Ly<color>. TiÕp nhËn nhiÖm vô, ®Õn <color=blue> (KiÕm C¸c Thôc ®¹o) Táa V©n ®éng<color> thİch s¸t gian tÕ <color=blue>LiÖu Kú<color>.", "B­íc 2: §Õn <color=blue>Táa V©n ®éng<color> ®¸nh b¹i <color=blue>LiÖu Kú<color> lÊy ®­îc mét bøc <color=red>Thiªn NhÉn mËt th­<color>.", "B­íc 3: Trë vÒ <color=blue>tÇng 3<color> giao <color=red>Thiªn NhÉn MËt th­<color> cho <color=blue>Gia LuËt Tş Ly<color>, nhiÖm vô hoµn thµnh. NÕu Thiªn NhÉn MËt th­ mÊt ®i, cÇn ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu!")
end;


function v6()
Talk(6, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>Hé Gi¸o sø<color>, häc ®­îc vâ c«ng <color=blue>LŞch Ma §o¹t Hån<color>.<enter>TiÕp nhËn nhiÖm vô nµy cÇn ph¶i lµ ®Ö tö trªn cÊp 50 vµ ®· hoµn thµnh nhiÖm vô hµnh thİch.","B­íc 1: §Õn <color=blue>tÇng 3<color> gÆp <color=blue>T¶ Hé ph¸p §oan Méc DuÖ<color>. TiÕp nhËn nhiÖm vô, ®Õn <color=blue>BiÖn Kinh ThiÕt Th¸p<color> cøu Phông HÊp Nh­.", "B­íc 2: §Õn <color=blue>tÇng 1 ThiÕt Th¸p<color>, ®¸nh b¹i <color=blue>§ao binh ®éi tr­ëng, Th­¬ng binh ®é tr­ëng<color> hoÆc <color=blue>Cung binh ®éi tr­ëng<color> sÏ lÊy ®­îc <color=red>Ch×a khãa<color>, më <color=blue>B¶o r­¬ng ë tÇng 1<color>, më ®­îc <color=blue>c¬ quan thø nhÊt<color>.", "B­íc 3: Lªn <color=blue>tÇng 2 ThiÕt Th¸p<color>, ®¸nh b¹i <color=blue>§ao binh thèng lÜnh<color> hoÆc <color=blue>Cung binh thèng lÜnh<color> sÏ lÊy ®­îc <color=red>Ch×a khãa<color>,nhÊp vµo <color=blue>B¶o r­¬ng ë tÇng 2<color>, më ®­îc <color=blue>C¬ quan thø 2<color>.", "B­íc 4: Lªn <color=blue>tÇng 3 ThiÕt Th¸p<color>, ®¸nh b¹i <color=blue>Tæng binh<color> lÊy ®­îc <color=red>Ch×a khãa<color>, nhÊp vµo <color=blue>B¶o r­¬ng ë tÇng 3<color>, më <color=blue>C¬ quan thø 3<color> cøu ®­îc Phông HÊp Nh­.", "B­íc 5: Trë vÒ <color=blue>Thiªn NhÉn gi¸o<color>, gÆp <color=blue> §oan Méc DuÖ<color> phôc mÖnh, nhiÖm vô hoµn thµnh. ")
end;


function v7()
Talk(10, "", "Sau khi hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ <color=blue>T¸t M·n Ph¸p V­¬ng<color>, thuËn lîi xuÊt s­.<enter>TiÕp nhËn nhiÖm vô nµy cÇn ph¶i lµ ®Ö tö trªn cÊp 50 vµ ®· hoµn thµnh nhiÖm vô cøu ng­êi.","B­íc 1: §Õn <color=blue>tÇng 3<color> gÆp <color=blue>Gi¸o chñ Hoµn Nhan Hïng LiÖt<color>. TiÕp nhËn nhiÖm vô,  ®i t×m <color=red>5 thanh §o¹n KiÕm<color>,vµ ®Õn <color=blue>Thiªn NhÉn Th¸nh ®éng<color>lÊy vÒ <color=red>s¸ch da dª<color>.", "B­íc thø 2:§Õn <color=blue>BiÖn Kinh<color> t×m <color=red>5 thanh §o¹n KiÕm<color>:<enter>thanh thø 1:®Õn chç thî rÌn gÆp <color=blue>Khóc ThiÕt T­îng?218,190?<color>,tiÕp nhËn nhiÖm vô,mang <color=red>Ng©n Tr©m<color> cho Tr­¬ng qu¶ phô. §Õn phİa ®«ng t×m <color=blue>Tr­¬ng qu¶ phô?213,199?<color>, giao Ng©n Tr©m,nhËn ®­îc <color=red>H­¬ng Nang<color>.Giao H­¬ng Nang vÒ cho Khóc ThiÕt T­îng,nhËn ®­îc <color=red>§o¹n kiÕm 'YÓm NhËt'<color>.", "Thanh thø 2: §Õn <color=blue>cæng B¾c<color> t×m <color=blue>T«n Tó tµi (229,184)<color>,tr¶ lêi ®óng c©u ®è sÏ nhËn ®­îc thanh <color=red>§o¹n kiÕm '§o¹n Thñy'<color>.", "Thanh thø 3: §Õn <color=blue>Sßng b¹c<color> t×m <color=blue>Con b¹c (201,194)<color>,mua ®­îc <color=red>§o¹n kiÕm 'ChuyÓn Hån'<color>.", "Thanh thø 4: §Õn <color=blue>phİa ®«ng b¾c<color> t×m <color=blue>§«ng Mai (230,190)<color>, tiÕp nhËn nhiÖm vô gióp c« ta t×m TiÓu h¶i. §Õn <color=blue>qu¶ng tr­êng<color> t×m thÊy <color=blue>TiÓu H¶i (220,192)<color>, khuyªn nã vÒ nhµ. Trë l¹i gÆp §«ng Mai, nhËn ®­îc <color=red>§o¹n kiÕm 'Khø Tµ'<color>.", "Thanh thø 5: §Õn <color=blue>T­íng Quèc tù<color> t×m <color=blue>¡n mµy (210,187)<color>, liªn tôc bè thİ 3 lÇn sÏ nhËn ®­îc <color=red>§o¹n kiÕm 'DiÖt Hån' <color>.", "B­íc 3: Trë l¹i Thiªn NhÉn gi¸o, vµo <color=blue>tÇng 1 Th¸nh ®éng<color>, ®¸nh b¹i 4 con <color=blue>§éc Xµ tinh, NhÖn tinh, bß c¹p tinh, bß c¹p chóa<color>,lÇn l­ît nhËn ®­îc <color=blue>hÈu quyÕt 'Thiªn §Şa HuyÒn Hoµng'; 'ThÇn X¸ LiÖt Tr­¬ng'; 'Giang Hå X· T¾c'; 'Duy nng· gi¸o v­¬ng'<color>, tiÕp tôc ®i lªn tÇng 2", "B­íc 4: lªn tÇng 2<color=blue>Th¸nh ®éng<color>, ®¸nh b¹i <color=blue>Bß c¹p chóa<color> sÏ lÊy ®­îc <color=red>Ch×a khãa<color>, nhÊp vµo <color=blue>B¶o r­¬ng (233,197)<color> sÏ lÊy ®­îc <color=red>s¸ch da dª<color>.", "B­íc 5: Giao<color=red>s¸ch da dª<color> vÒ cho <color=blue>Hoµn Nhan Hïng LiÖt<color>, nhiÖm vô hoµn thµnh. NÕu s¸ch da dª mÊt ®i, ph¶i thùc hiÖn nhiÖm vô l¹i tõ ®Çu!")
end;

function v8()
Talk(3,"","Th«ng qua Trïng ph¶n s­ m«n, ng­¬i ®­îc phong lµ <color=blue>Th¸nh Gi¸o Tr­ëng l·o<color>, häc ®­îc tuyÖt häc trÊn ph¸i <color=blue>Thiªn Ma Gi¶i ThÓ; vâ c«ng Th©u Thiªn Ho¸n NhËt; Ma DiÖm ThÊt S¸t<color>.","B­íc 1: Sau khi ®¹t ®Õn cÊp 60, ®Õn <color=blue>Thiªn NhÉn Gi¸o tÇng 3<color> gÆp <color=blue>Gi¸o chñ<color>, xin ®­îc trïng ph¶n Thiªn NhÉn Gi¸o.","B­íc 2: TÆng cho m«n ph¸i <color=red>50000 ng©n l­îng<color> trïng ph¶n Thiªn NhÉn Gi¸o.")
end;

--------------------------------

function ok()
end;

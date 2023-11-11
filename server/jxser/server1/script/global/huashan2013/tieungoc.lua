--  Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetLevel() >=10 and (GetTask(69) < 10)) then
Say("Tiªu Ngäc: Tõ khi bæn ph¸i truyÒn tin thu nhËn ®Ö tö ra kh¾p giang hå, mçi ngµy l­îng ng­êi ®Õn ®Çu s­ ®«ng nh­ trÈy héi, ng­¬i còng nghe tin nµy ph¶i kh«ng?",2,"Muèn/L10_get_yes","Ta chØ qua ®­êng/L10_get_no") 
elseif (GetTask(69) > 10) and (GetTask(69) < 12)then
Talk(1,"","Tiªu Ngäc: Thu thËp ®ñ Hång Méc th× ®Õn t×m ta.")
elseif (GetTask(69) == 12) and (HaveCommonItem(6,1,3957)>0) then
Talk(3,"kidanhdetu","Ng­êi ch¬i: Ta ®· ®em Hång Méc vÒ nh­ ®· høa.","Tiªu Ngäc: Uhm...Hång Méc th­îng h¹ng qu¶ lµ tèt thËt, ng­¬i ®· gióp bæn m«n mét viÖc lín, nh­ng muèn gia nhËp bæn ph¸i cÇn ph¶i kiÓm tra t­ chÊt. ThÕ nµy, ®îi ta b¸o l¹i víi s­ phô, nhËn ng­êi lµm ®Ö tö ghi danh tr­íc nhĞ!")
else 
Talk(1,"","Tiªu Ngäc: T¹i h¹ chØ lµ mét ng­êi nhµn rçi ë Hoa S¬n, c¸c h¹ t×m cã g× kh«ng?")	
end
end

function kidanhdetu()  
	DelCommonItem(6,1,3957)  
	AddNote("Hoµn thµnh nhiÖm vô chÆt c©y lµm kiÕm, ng­¬i ®· trë thµnh ®Ö tö ghi danh cña ph¸i Hoa S¬n. NhËn ®­îc 1 ®iÓm danh väng.") 
	Msg2Player("Hoµn thµnh nhiÖm vô chÆt c©y lµm kiÕm, ng­¬i ®· trë thµnh ®Ö tö ghi danh cña ph¸i Hoa S¬n. NhËn ®­îc 1 ®iÓm danh väng.") 
	SetTask(69,13)
	AddRepute(1)
	if GetLastFactionNumber()==10 then
		AddGoldItem(0, 4658)
		AddGoldItem(0, 4668)
		Msg2Player("Ng­¬i nhËn ®­îc <color=yellow>trang bŞ hoµng kim Hoa S¬n cÊp V©n Léc.")
	end
end; 



function L10_get_yes()  
Talk(2,"","Tiªu Ngäc: Muèn gia nhËp vµo bæn ph¸i, kh«ng thÓ chØ nãi su«ng lµ ®­îc, nh©n dŞp cã líp ®Ö tö míi quy n¹p, cÇn cÊp vò khİ cho chóng, v× hiÖn t¹i chóng vÉn ch­a tu th©n, kiÕm ph¸p cña bæn ph¸i næi tiÕng lµ nhanh vµ chİnh x¸c, kh«ng g©y ngé th­¬ng, c¸c vŞ s","Tiªu Ngäc: Nghe nãi lo¹i c©y nµy cã linh vËt thñ hé, ng­¬i ®i lÇn nµy ph¶i cÈn thËn ®Êy.") 
AddNote("NhËn nhiÖm vô chÆt c©y lµm kiÕm. §Õn §iÓm Th­¬ng S¬n thu thËp Hång Méc.") 
Msg2Player("NhËn nhiÖm vô chÆt c©y lµm kiÕm. §Õn §iÓm Th­¬ng S¬n thu thËp Hång Méc.") 
SetTask(69,10)
end; 

function L10_get_no() 
end; 




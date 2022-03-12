
function main() 
	dialog_main()	
end


function dialog_main()
	local szTitle = "LÇn nµy ph¸i <color=blue>Hoa S¬n<color> ta t¸i suÊt,  giang hå l¹i thªm nhiÒu biÕn ®éng"
	local tbOpt =
	{
		"VÒ ph¸i Hoa S¬n/vep",
		"Gia nhËp ph¸i Hoa S¬n/noi",
		"Tho¸t/no",
	}
	
	Say(szTitle, getn(tbOpt), tbOpt)
end




function noi()
	if (GetCamp() == 0) and (GetSeries() == 2) and (GetLevel() >= 10) and  (GetTask(169) ~= 10)	  then		
		Say("Ph¸i <color=cyan>Hoa S¬n<color> ta ®· kh«ng tham gia giang hå h¬n 10 n¨m nay, lÇn nµy t¸i xuÊt ¾t sÏ khiÕn bän giang hå tµ ph¸i ph¶i khiÕp sî!",2, "Gia nhËp Hoa S¬n/go", "§Ó ta suy nghÜ kü l¹i xem/no")
	elseif (GetCamp() == 0) and (GetSeries() ~= 2) and (GetLevel() >= 10) and  (GetTask(169) ~= 10) then
		Say("Ng­¬i kh«ng ph¶i ng­êi hÖ <color=blue>thñy<color> nh­ng ta ph¸ lÖ lÇn nµy, cã muèn gia nhËp ph¸i <color=cyan>Hoa S¬n<color> kh«ng?",2, "Gia nhËp Hoa S¬n/go2", "§Ó ta suy nghÜ kü l¹i xem/no")
	else
		Talk(1,"","ChØ cã ng­êi ch­a vµo ph¸i míi cã thÓ gia nhËp <color=blue>Hoa S¬n<color>.")	
	end
end


function go() 
Talk(1,"","Chóc mõng c¸c h¹ ®· gia nhËp <color=blue>Hoa S¬n<color>")
NewWorld(987,1389,3086)
AddMagic(1347)
AddMagic(1372)
SetTask(169,10)
SetRank(82)	
SetFaction("huashan")  
SetLastFactionNumber(10)
SetCurCamp(3)
SetCamp(3)
Msg2Player("Chİnh thøc gia nhËp Hoa S¬n ph¸i, häc ®­îc kiÕm ph¸p c¬ b¶n")
AddGoldItem(0, 4639)
AddGoldItem(0, 4649)
Msg2Player("NhËn ®­îc <color=yellow>trang bŞ hoµng kim cÊp Thanh C©u.")
end 

function go2() 
Talk(1,"","Chóc mõng c¸c h¹ ®· gia nhËp <color=blue>Hoa S¬n<color>")
NewWorld(987,1389,3086)
SetSeries(2)
SetFaction("huashan")  
SetLastFactionNumber(10)
AddMagic(1347)
AddMagic(1372)
SetTask(169,10)
SetRank(82)
SetCurCamp(3)
SetCamp(3)	
Msg2Player("Chİnh thøc gia nhËp Hoa S¬n ph¸i, häc ®­îc kiÕm ph¸p c¬ b¶n")
AddGoldItem(0, 4639)
AddGoldItem(0, 4649)
Msg2Player("NhËn ®­îc <color=yellow>trang bŞ hoµng kim cÊp Thanh C©u.")
end 

function vep() 
Msg2Player("Ngêi yªn, chóng ta ®i Hoa S¬n ph¸i")
NewWorld(987,1389,3086)
end 

function no() 
end 


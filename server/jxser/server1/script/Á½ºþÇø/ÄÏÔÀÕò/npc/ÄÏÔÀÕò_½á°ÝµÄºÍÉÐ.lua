-- ½á°İµÄºÍÉĞ
-- By: Dan_Deng(2003-08-22)

function main(sel)
	if (GetTeamSize() > 1) and (IsCaptain() == 1) then			-- Ö»ÓĞ¶Ó³¤²ÅÄÜÆô¶¯½á°İ
		Talk(1,"Wswear_select", 11374)
	else
		Talk(1,"", 11375)
	end
end;

function Wswear_select()
	if (GetSex() == 0) then
		P_sex = "ThiÕu hiÖp"
	else
		P_sex = "N÷ hiÖp"
	end
	Say("TŞnh §èc ThiÒn S­: Nãi hay l¾m! ChØ cÇn"..P_sex.."®ãng 3000 l­îng ®Ó söa t­îng PhËt, mäi chuyÖn ®Òu dÔ nãi.",2,"Quyªn 3000 l­îng. /Wswear_yes","Kh«ng cÇn!/Wswear_no")
end;

function Wswear_yes()
	if (GetCash() >= 3000) then
		if(SwearBrother(GetTeam()) == 1)then
			Pay(3000)
			Msg2Team("Chóc mõng hai vŞ ®· kÕt nghÜa Kim Lan. ")
		else
			Msg2Team("Trong nhãm cã tån t¹i quan hÖ phu thª, viÖc kÕt b¸i thÊt b¹i. ")
		end
	else
		Talk(1,"", 11376)
	end
end;

function Wswear_no()
end;

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main(sel)
	if (GetTask(69) == 13) or GetLastFactionNumber() == 12 then
		Say("CÇm §ång: Hµnh tÈu giang hå, trang bŞ tèt kh«ng thÓ thiÕu.", 2,"Giao dŞch/yes", "Kh«ng giao dŞch/no");
	else 
		Talk(1,"","CÇm §ång: Ch­ëng m«n cã lÖnh, trang bŞ bæn ph¸i chØ b¸n cho ®ång m«n.")	
	end
end;


function yes()
	Sale(2);  			
end;


function no()
end;

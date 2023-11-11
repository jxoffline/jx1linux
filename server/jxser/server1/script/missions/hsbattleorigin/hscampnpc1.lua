Include("\\script\\missions\\hsbattleorigin\\hshead.lua");
Include("\\script\\missions\\csbattlelib\\cscampnpc1.lua");

function CheckCondition()
	if ( GetLevel() >= 60 ) then
		if (Pay(MS_SIGN_MONEY) == 1) then
			return 1;
		end;
 	end;
 	Say("B¹n ch­a ®ñ ®¼ng cÊp hoÆc kh«ng mang ®ñ tiÒn, kh«ng thÓ lªn Hoa S¬n tuyÖt ®Ønh", 0);
 	return 0;
end;
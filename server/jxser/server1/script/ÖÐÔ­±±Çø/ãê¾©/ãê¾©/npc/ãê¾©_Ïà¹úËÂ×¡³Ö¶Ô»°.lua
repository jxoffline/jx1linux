--ÖÐÔ­±±Çø ãê¾©¸® Ïà¹úËÂ×¡³Ö¶Ô»°
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	
	if allbrother_0801_CheckIsDialog(190) == 1 then
		allbrother_0801_FindNpcTaskDialog(190)
		return 0;
	end
Say("Ng­êi ®êi lý ra ph¶i tø ®¹i giai kh«ng, kh«ng mµng chuyÖn n­íc, nh­ng nh×n giang s¬n suy tµn, sinh linh ®å th¸n, ng­êi ®êi sao mµ khæ thÕ?", 0);
end;



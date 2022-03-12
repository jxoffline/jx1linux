Include("\\script\\activitysys\\config\\24\\head.lua")
Include("\\script\\activitysys\\config\\24\\config.lua")

pActivity.tbRankTitle = 
{
	[1] = "L¨ng V©n",
	[2] = "TuyÖt ThÕ",
	[3] = "Ph¸ Qu©n",
	[4] = "Ng¹o tuyÕt",
	[5] = "Kinh L«i",
	[6] = "Ngù Phong",
	[7] = "PhÖ Quang",
	[8] = "KhÊp ThÇn",
	[9] = "K×nh Thiªn",
	[10] = "V« Cùc",
}
function pActivity:IsOpen()
	return nil;
end

function pActivity:CheckFortuneRank(nRank)
	local nCurRank = GetPlayerFortuneRank();
	if (type(nRank) ~= "number" or type(nCurRank) ~= "number" or
		nRank <= 0 or nRank > 10 or nCurRank <= 0 or nCurRank > 10 or
		nCurRank < nRank) then
	
		if (type(self.tbRankTitle[nRank]) == "string") then
			Talk(1,"",format("Ng­¬i cÇn ph¶i ®¹t ®Õn <color=red>%s<color> míi cã thÓ mua ®ùoc vËt phÈm nµy", self.tbRankTitle[nRank]));
		else
			Talk(1,"","Ng­¬i vÉn kh«ng thÓ mua vËt phÈm nµy");
		end
		return nil;
	end
	
	return 1;
end
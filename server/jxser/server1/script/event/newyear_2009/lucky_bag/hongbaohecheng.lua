Include("\\script\\lib\\compose_jinnang.lua")

Include("\\script\\lib\\string.lua")

local hongbao_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "<color=red>ChØ dïng mÊy nguyªn liÖu nµy th× kh«ng thÓ ®æi ®­îc ThÞnh V­îng Hång Bao ®­îc, ng­¬i h·y ®i t×m nguyªn liÖu ®ñ ®i ®·.<color>",
		nFreeItemCellLimit = 0.01,
		tbMaterial = 
		{
			{szName="Phóc", tbProp={6, 1, 1912, 1, 0, 0}, nCount = 3},
			{szName="Léc", tbProp={6, 1, 1913, 1, 0, 0}, nCount = 3},
			{szName="Thä", tbProp={6, 1, 1914, 1, 0, 0}, nCount = 3},
			{nJxb = 8e4}
		},
		tbProduct = 
		{
			szName="ThÞnh V­îng Hång Bao", tbProp={6, 1, 1892, 1, 0, 0}, nExpiredTime = 20090223,
		},
	},
	[2] =
	{
		szFailMsg = "<color=red>ChØ dïng mÊy nguyªn liÖu nµy th× kh«ng thÓ ®æi ®­îc Ph¸t Tµi Hång Bao, Ng­¬i h·y ®i t×m ®ñ nguyªn liÖu tr­íc ®i ®·!<color>",
		nFreeItemCellLimit = 0.01,
		tbMaterial = 
		{
			{szName="Phóc", tbProp={6, 1, 1912, 1, 0, 0}, nCount = 2},
			{szName="Léc", tbProp={6, 1, 1913, 1, 0, 0}, nCount = 2},
			{szName="Thä", tbProp={6, 1, 1914, 1, 0, 0}, nCount = 2},
			{szName="Lôc B¶o Ch©u", tbProp={6, 1, 1891, 1, 0, 0}, nCount = 1},
		},
		tbProduct = 
		{
			szName="Ph¸t Tµi Hång Bao", tbProp={6, 1, 1893, 1, 0, 0}, nExpiredTime = 20090223,
		}
	},
}

function newyear0901_hongbao_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	
	if (newyear0901_hongbao_IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.")
	end
	
	tbFormulaList = tbFormulaList or %hongbao_tbFormulaList
	newyear0901_hongbao_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
	local tbSay = newyear0901_hongbao_Compose:MakeOptByProductName("Ta muèn ®æi", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."Ho¹t ®éng bao l× x× may m¾n diÔn ra tõ ngµy 16-01-2009 ®Õn 15-02-2009. Trong thêi gian ho¹t ®éng, ®¹i hiÖp thu thËp Lam B¶o R­¬ng ®Ó nhËn ®­îc ch÷ Phóc vµ Thä; thu thËp Hång B¶o R­¬ng ®Ó nhËn ch÷ Léc. §¹i hiÖp cã thÓ dïng c¸c ch÷ ®ã ®Ó ®èi lÊy ThÞnh V­îng Hång Bao vµ Ph¸t Tµi Hång Bao ®Ó nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm vµ c¸c vËt phÈm cã gi¸ trÞ. §Æc biÖt khi sö dông Ph¸t Tµi Hång Bao sÏ thu ®­îc bé Ngò Qu¶ vµ cã thÓ ®æi nhiÒu phÇn th­ëng gi¸ trÞ kh¸c.");
	tinsert(tbSay , getn(tbSay)+1, "KÕt thóc ®èi tho¹i/OnCancel");
	CreateTaskSay(tbSay);
end

function newyear0901_hongbao_IsActDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20090116 or nDate > 20090215) then
		return 0;
	else
		return 1;
	end
end


--Ö»ÔÚ¶Ô»°Ê±²úÉúÒ»´Î
function newyear0901_hongbao_MakeComposeClas(tbFormulaList)
	if  type(newyear0901_hongbao_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("newyear0901_hongbao_Compose", tbFormulaList)
	end
end

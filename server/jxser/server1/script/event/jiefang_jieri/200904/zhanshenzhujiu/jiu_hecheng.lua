Include("\\script\\lib\\baseclass.lua");
Include("\\script\\lib\\compose_jinnang.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

if not tbJiefang0904_jiu then
	tbJiefang0904_jiu = tbBaseClass:new()
end

tbFormulaList = 
{
	[1] =
	{
		nFreeItemCellLimit = 1,
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhÐ!",
		tbMaterial = 
		{
			{szName="Bao g¹o", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="N­íc tinh khiÕt", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="Men r­îu", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{nJxb=30000},
		},
		tbProduct = 
		{
			szName="BÇu r­îu",	tbProp={6, 1, 2013, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
	[2] =
	{
		nFreeItemCellLimit = 1,
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhÐ!",
		tbMaterial = 
		{
			{szName="Bao g¹o", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="N­íc tinh khiÕt", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="Men r­îu", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{szName="Nho t­¬i", 	tbProp={6, 1, 2007, 1, 0, 0}, nCOunt = 1},
		},
		tbProduct = 
		{
			szName="R­îu nho",	tbProp={6, 1, 2014, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
}

function tbJiefang0904_jiu:OnDailogMain(nItemIndex, szDescLink)
	if self:IsActDate() ~= 1 then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.")
	end
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	self:MakeComposeClas(%tbFormulaList)
	local tbSay = self.tbComposeList:MakeOptByProductName("§æi", nItemIndex, szDescLink)
	local szTitle	= "<dec>"..szDescLink.."LÔ quan: Ho¹t ®éng “R­îu mõng th¾ng lîi” diÔn ra tõ ngµy 28-04-2009 ®Õn 24:00 31-05-2009. Trong thêi gian ho¹t ®éng, ®¹i hiÖp cã thÓ thu thËp “Tói mõng chiÕn th¾ng” ®Ó nhËn ®­îc “Bao g¹o”,”N­íc tinh khiÕt”,”Men r­îu”,vµ mua “Nho t­¬i” trong Kú Tr©n C¸c nÕu cÇn . §¹i hiÖp cã thÓ dïng c¸c nguyªn liÖu nµy ®Ó ®èi lÊy BÇu r­îu vµ R­îu nho ®Ó nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm vµ c¸c vËt phÈm cã gi¸ trÞ. Nh­ng h·y nhí kü:®õng uèng r­îu qu¸ nhiÒu sÏ cã h¹i cho søc kháe.";
	
	
	tinsert(tbSay , 1, szTitle);
	tinsert(tbSay , getn(tbSay)+1, "KÕt thóc ®èi tho¹i/OnCancel");
	CreateTaskSay(tbSay)
--	if tbItemJingnianshijian then
--		 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
--	end
	
end

function tbJiefang0904_jiu:MakeComposeClas(tbFormulaList)
	if  type(self.tbComposeList) ~= "table" then
		self.tbComposeList = tbComposeListForJinNang:new("tbJiefang0904_jiu_Compose", tbFormulaList)
	end
end


function tbJiefang0904_jiu:IsActDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
	return (jf0904_act_dateS <= nCurDate and nCurDate < jf0904_act_dateE);
end

function OnCancel()
end
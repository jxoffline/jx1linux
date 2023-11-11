Include("\\script\\dailogsys\\dailogsay.lua")

Include("\\script\\changefeature\\equip_tryon.lua")
tbFeatureNpc = {}


function tbFeatureNpc:SelectType()
	local szTitle = "Xin h·y chän vŞ trİ"
	
	
	local tbOpt = {}
	
	for key , value in tbEquipTryOn.tbTemplate do
		tinsert(tbOpt, {key, value.DailogMenu, {value, 1}})
	end
	
	tinsert(tbOpt, {"Trë l¹i", self.Dialog, {self}})
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i"})
	
	CreateNewSayEx(szTitle, tbOpt)
end
	
function tbFeatureNpc:Dialog()
	
	local szTitle = "Xin chµo ®¹i hiÖp, l·o phu cã thÓ gióp g× ®­îc?"
	local tbOpt = 
	{
		{"Xem tr­íc ngo¹i h×nh trang bŞ", self.SelectType, {self}},
		{"Thay ®æi ngo¹i h×nh trang bŞ ­ng ı nhÊt cho trang bŞ", self.InjectToItem, {self}},
		{"Xãa hiÖu øng hiÖn t¹i", RestoreOwnFeature},
		{"Lµm thÕ nµo ®Ó thay ®æi ngo¹i h×nh trang bŞ",  self.Explain, {self}},
		{"Nh©n tiÖn ghĞ qua th«i"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbFeatureNpc:Explain()
	local szTitle = "Bæn tiÖm cã thÓ t¹o ra 'ngo¹i h×nh trang bŞ' theo nh­ ı muèn, thu thËp ®ñ nguyªn liÖu cÇn thiÕt nh­ tinh luyÖn th¹ch vµ trang bŞ cÇn thay ®æi ®em ®Õn cho l·o phu th× ta sÏ gióp ng­¬i thay ®æi ngo¹i h×nh trang bŞ nh­ ı muèn. Nªn nhí ta chØ gióp ng­¬i thay ®æi ngo¹i h×nh trang bŞ mµ kh«ng thay ®æi ®é m¹nh yÕu cña trang bŞ ®©u nhĞ."
	local tbOpt = 
	{
		{"Trë l¹i", self.Dialog, {self}},
		{"KÕt thóc ®èi tho¹i"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbFeatureNpc:InjectToItem()
	local szTitle = "Xin h·y chän vŞ trİ"
	
	
	local tbOpt = {}
	
	for key , value in tbEquipTryOn.tbTemplate do
		tinsert(tbOpt, {key, value.AskFeatureNo, {value}})
	end
	
	tinsert(tbOpt, {"Trë l¹i", self.Dialog, {self}})
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i"})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function main()
	return tbFeatureNpc:Dialog()
end
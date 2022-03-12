Include("\\script\\event\\equip_publish\\baihu\\item2equip.lua")
Include("\\script\\lib\\awardtemplet.lua")

function GetMaterial()
	tbAwardTemplet:Give(CommonMaterial, 1, {"test"})
	tbAwardTemplet:Give(AdditiveMaterial, 1, {"test"})
	
end
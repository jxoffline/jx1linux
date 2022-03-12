Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\global\\global_tiejiang.lua")

function main()
	local szTitle = "<#><npc> CÇn giao dÞch kh«ng?"
	local tbOpt = {}
	tinsert(tbOpt, {"Giao dÞch", yes}) 
	tinsert(tbOpt, {"Cöa hµng tinh luyÖn th¹ch", energy_sale}) 
	tinsert(tbOpt, {"Nh©n tiÖn ghÐ qua th«i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end

function yes()
	Sale(35)
end

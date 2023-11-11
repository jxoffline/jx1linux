Include("\\script\\missions\\dungeon\\dungeons\\shiliantang\\shiliantang.lua")
Include("\\script\\missions\\dungeon\\npcdialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local _CallTower = function()
	tbDungeonManager:DoTempletFun("Th› Luy÷n ß≠Íng", "CallTower")
end

local _CallBackTower = function()
	tbDungeonManager:DoTempletFun("Th› Luy÷n ß≠Íng", "CallBackTower")
end

function main()
	local szTitle = "<color=yellow>Tri÷u tÀp phÔ<color> nµy tπi Æﬁa Æi”m chÿ Æﬁnh c„ th” tri÷u tÀp<color=red>cung ti‘n thÒ<color>, cÚng c„ th” tri÷u tÀp <color=red> cung ti‘n thÒ<color> tπi vﬁ tr› kh∏c."
	
	if tbDungeonManager:DoTempletFun("Th› Luy÷n ß≠Íng", "CheckOwnerInDungeon") then
		local tbOpt = 
		{
			{"Tπi Æ©y tri÷u tÀp cung ti‘n thÒ", %_CallTower},
			{"Tri÷u tÀp cung ti‘n thÒ vµo Æﬁa Æi”m nµy", %_CallBackTower},
			{"HÒy b· "}
		}
		CreateNewSayEx(szTitle, tbOpt)
	end

	return 1
end
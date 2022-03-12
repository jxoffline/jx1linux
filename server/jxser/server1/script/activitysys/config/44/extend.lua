Include("\\script\\activitysys\\config\\44\\head.lua")
Include("\\script\\activitysys\\config\\44\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("PET")
Include("\\script\\event\\tianlu_tree\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")

pActivity.nPak = curpack()

function pActivity:Finish(nEventIndex)
	if PET_IsCreate() then
		if IsEventFinished(nEventIndex) == 0 then
			FinishEvent(nEventIndex)
			PET_AddUpgradePoint(1)
		end
	end
end

function pActivity:TianLuTree()
	if PlayerFunLib:GetTaskDaily(%TSK_DAYLY_PLANT_NUM) == 5 then
		self:Finish(TIAN_LU_TREE)
	end
	tbAwardTemplet:Give(%tbRate_TianLuTree[random(1,4)], 1, {"TrongCayThienLoc", "NhanNguyenLieuTangTruong"})
end

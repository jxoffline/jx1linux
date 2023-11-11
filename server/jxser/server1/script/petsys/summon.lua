Include("\\script\\petsys\\head.lua")
Include("\\script\\misc\\eventsys\\type\\map.lua")

function PetSys:Summon()
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	if PET_IsSummon() == 1 then 
		Talk(1, "", %ALREADY_SUMMON)
		return
	end
	--local _, _, subWorldIndex = GetPos()
	local nMapId = GetWorldPos()
--	print(SubWorld, subWorldIndex)
--	if SubWorld ~= subWorldIndex then
--		print("What happend? chuan yue le?")
--		return
--	end
	--local nMapId = SubWorldIdx2ID(subWorldIndex)
	if self:CheckMap(nMapId) ~= 1 then
		Talk(1, "", %FORBID_SUMMON)
		return
	end
	PET_Summon()
end

function PetSys:UnSummon()
	--print("UnSummon")
	if PET_IsSummon() == 1 then
		PET_UnSummon()
	end
end

function PetSys:CheckMap(nMapId)
	for i=1, getn(self.MapList) do
		if nMapId == self.MapList[i] then
			return 1
		end
	end
end

function PetSys:initMapLimit()
	for i=1, getn(self.MapList) do
		EventSys:GetType("LeaveMap"):Reg(self.MapList[i], PetSys.UnSummon, PetSys)
	end
end

PetSys:initMapLimit()

Include("\\script\\petsys\\head.lua")

function PetSys:ProtocolProcess(nOperationId)
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	if not self.tbProtocolFunction then
		return
	end
	local szFunction = self.tbProtocolFunction[nOperationId]
	if not szFunction then
		return
	end
	if type(self[szFunction]) == "function" then
		self[szFunction](self)
	end
end

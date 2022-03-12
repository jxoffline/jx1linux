Include("\\script\\petsys\\lang.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\petsys\\head.lua")


local tbLevelUpNeedItem = {tbProp = {6,1,3454,1,0,0}, nCount = 1}

local tbLevelUpAttr = 
{
	[INDEX_STR] = {1,2,3,4,5},
	[INDEX_DEX] = {1,2,3,4,5},
	[INDEX_VIT] = {1,2,3,4,5},
	[INDEX_ENG] = {1,2,3,4,5},
	[INDEX_HP] = {10,20,30,40,50},
	[INDEX_MP] = {10,20,30,40,50},
}

local attrInitValue = 
{
	[INDEX_STR] = {5,6,7,8,9,10},
	[INDEX_DEX] = {5,6,7,8,9,10},
	[INDEX_VIT] = {5,6,7,8,9,10},
	[INDEX_ENG] = {5,6,7,8,9,10},
	[INDEX_HP] = {200,210,220,230,240,250},
	[INDEX_MP] = {200,210,220,230,240,250},
}

function PetSys:LevelUpDlg()
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	if PET_GetLevel() + 1 > %MAX_LEVEL then
		Talk(1, "", %LEVEL_LIMIT)
		return
	end
	
	local tbNextLeveldata = self.tbLevelUp[PET_GetLevel() + 1]
	if not tbNextLeveldata then 
		return 
	end
	
	--Èç¹ûÉý¼¶µãÊý²»Âú×ã
	if PET_GetUpgradePoint() < tbNextLeveldata[1] or PET_GetGrownPoint() < tbNextLeveldata[2] or PET_GetTamePoint() < tbNextLeveldata[3] then
		Talk(1, "", format(%NOT_ENOUGH_POINT,tbNextLeveldata[1], tbNextLeveldata[2], tbNextLeveldata[3]))
		return
	end
	
	--Ôö³¤Ò©²»¹»
	if not PlayerFunLib:CheckItemInBag(%tbLevelUpNeedItem ,tbNextLeveldata[4], format(%NOT_ENOUGH_LEVEL_UP_ITEM, tbNextLeveldata[4])) then
		return
	end
	
	--¶þ´ÎÈ·ÈÏÌáÊ¾Éý¼¶³É¹¦ÂÊ 
	local szTitle = format(%LEVEL_UP_RATE_TITLE, tbNextLeveldata[4], tbNextLeveldata[5])
	local tbOpt = {}
	tinsert(tbOpt, {%CONFIRM, self.ConfirmLevelUp, {self, tbNextLeveldata[4], tbNextLeveldata[5]}})
	tinsert(tbOpt, {%CANCEL})
	CreateNewSayEx(szTitle, tbOpt)
end

function PetSys:ConfirmLevelUp(nRequireItemCount, nRate)
	if not PlayerFunLib:CheckItemInBag(%tbLevelUpNeedItem ,nRequireItemCount, format(%NOT_ENOUGH_LEVEL_UP_ITEM, nRequireItemCount)) then
		return
	end
	PlayerFunLib:ConsumeEquiproomItem(%tbLevelUpNeedItem, nRequireItemCount)
	if self:GetRandom(nRate) == 1 then
		self:LevelUp()
	else
		Msg2Player(%LEVEL_UP_FAIL)
		%tbLog:PlayerActionLog("PetSys", "LevelUpFail", PET_GetLevel())
	end
end

function PetSys:GetRandom(nRate)
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	rstep=rstep+floor(nRate*rtotal/100);
	if(rcur <= rstep) then
		return 1
	else
		return 0
	end
end

function PetSys:LevelUp()
	PET_SetLevel(PET_GetLevel() + 1)
	self:AddAttrib()
	self:AddSkill()
	Msg2Player(format(%LEVEL_UP_SUCCESS,PET_GetLevel()))
	%tbLog:PlayerActionLog("PetSys", "LevelUpSuccess", PET_GetLevel())
end

function PetSys:AddAttrib()
	local nPetLevel = PET_GetLevel()
	
	if nPetLevel == 1 then
		PET_ClearAttrib()
	end
	
	local tbRandomTable = %tbLevelUpAttr
	if nPetLevel == 2 then
		tbRandomTable = %attrInitValue
	end

	for i=1, ATTRIB_COUNT do 
		local nRandCount = getn(tbRandomTable[i])
		local nValueIndex = random(1, nRandCount)
		local nValue = tbRandomTable[i][nValueIndex]
		PET_AddAttrib(i, nValue)
	end
end

function PetSys:AddSkill()
	local nPetLevel = PET_GetLevel()
	--local nSkill = random(1,4)
	--PET_SetSkill(1, nSkill)
	
	--§æi kh«ng cho ngÉu nhiªn 1/4 skill - Modified By NgaVN - 20130606
	PET_SetSkill(1, GetTask(3061))
end
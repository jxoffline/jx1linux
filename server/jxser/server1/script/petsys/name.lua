Include("\\script\\petsys\\head.lua")
Include("\\script\\petsys\\lang.lua")
Include("\\script\\lib\\log.lua")

function PetSys:ChangeName()
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	
	if PET_IsCreate() ~= 1 then
		return 
	end
	if GetCashCoin() < %CHANGE_NAME_COIN then
		Talk(1, "", format(%NOT_ENOUGH_COIN, %CHANGE_NAME_COIN))
		return
	end

	g_AskClientStringEx("", 3, 8, %CHANGE_NAME_TITLE, {self.ConfirmChangeName, {self}})
end

function PetSys:ConfirmChangeName(szNewName)
	if ST_CheckTextFilter(szNewName) ~= 1 then
		Talk(1, "", %SENSITIVE_NAME)
		return		
	end

	if GetCashCoin() < %CHANGE_NAME_COIN then
		Talk(1, "", format(%NOT_ENOUGH_COIN, %CHANGE_NAME_COIN))
		return
	end

	if PayCoin(%CHANGE_NAME_COIN) == 1 then
		%PET_SetName(szNewName)
		
		--Í¬ÐÐºÃÓÑ½çÃæ´¦ÏàÓ¦¸Ä¶¯
	
		Msg2Player(%CHANGE_NAME_SUCCESS)
		%tbLog:PlayerActionLog("PetSys", "RenamePetSys", %PET_GetLevel())
	end
end
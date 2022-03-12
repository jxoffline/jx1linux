Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\petsys\\lang.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\petsys\\common.lua")
IncludeLib("PET")

PetSys = {}
PetSys.tbFeature = {}
PetSys.tbLevelUp = {}


PetSys.MapList = {1, 11, 37, 176, 162, 78, 80, 174, 121, 153, 101, 99, 100, 20, 53, 54, 175, 55} --Æß´ó³ÇÊÐ

PetSys.tbProtocolFunction = 
{
	[PET_OPERATION_DELETE] = "DeletePet",
	[PET_OPERATION_SUMMON] = "Summon",
	[PET_OPERATION_UNSUMMON] = "UnSummon",
	[PET_OPERATION_LEVEL_UP] = "LevelUpDlg",
	[PET_OPERATION_CHANGE_NAME] = "ChangeName",
	[PET_OPERATION_CHANGE_FEATURE] = "ChangeFeatureDlg",
	[PET_OPERATION_TAME] = "TransferExp",
}

PetSys.tbPetSkill = {
	[1] ={szSkillName="T¨ng Träng KÝch", nRate = 30},
	[2] ={szSkillName="T¨ng Kü N¨ng C«ng KÝch",nRate = 10},
	[3] = {szSkillName="T¨ng Kh¸ng TÊt C¶",nRate = 30},
	[4] = {szSkillName="Hãa Gi¶i S¸t Th­¬ng", nRate = 30},
}

--Function nhËn ngÉu nhiªn 1 trong 4 loai pet
function PetSys:GivRandomPet(tbItem)
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	if tbItem == nil then
		return 0
	end
	local rtotal = 10000000
	local rcur=random(1,rtotal)
	local rstep=0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100)
		if(rcur <= rstep) then
			return i
		end
	end
end

--Functin khi login se tù ®éng kiÓm tra  vµ reset task
function PetSys:Login_Restart()	
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	local nToday = tonumber(GetLocalDate("%Y%m%d")) or 0
	local nRecordDate = GetTask(3008)
	if nToday == nRecordDate then
		return
	end
	SetTask(3008, nToday)
	SetTask(3007, 0)
end


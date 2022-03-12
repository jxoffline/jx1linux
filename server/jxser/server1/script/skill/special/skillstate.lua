--加状态通用脚本，根据等级，数值平滑上升
if not STRING_HEAD then
	Include("\\script\\lib\\string.lua")
end

function skillLevelData(magicName,skillLevel)
	local paras = {}
	if(magicName == "attackspeed_v") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "castspeed_v") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "fastwalkrun_p") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "physicsres_p") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "poisonres_p") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "coldres_p") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "fireres_p") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "lightingres_p") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "fasthitrecover_v") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "stuntimereduce_p") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "poisontimereduce_p") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "freezetimereduce_p") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "fatallystrikeres_p") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "addphysicsdamage_p") then
		paras = {skillLevel*20,180*18,6}
		return join(paras)
	end
	if(magicName == "addphysicsmagic_v") then
		paras = {skillLevel*10,180*18,0}
		return join(paras)
	end
	if(magicName == "addpoisondamage_v") then
		paras = {10,10*skillLevel,10}
		return join(paras)
	end
	if(magicName == "addpoisonmagic_v") then
		paras = {10,10*skillLevel,10}
		return join(paras)
	end
	if(magicName == "addcolddamage_v") then
		paras = {skillLevel*10,180*18,0}
		return join(paras)
	end
	if(magicName == "addcoldmagic_v") then
		paras = {skillLevel*10,180*18,0}
		return join(paras)
	end
	if(magicName == "addfiredamage_v") then
		paras = {skillLevel*10,180*18,0}
		return join(paras)
	end
	if(magicName == "addfiremagic_v") then
		paras = {skillLevel*10,180*18,0}
		return join(paras)
	end
	if(magicName == "addlightingdamage_v") then
		paras = {skillLevel*10,180*18,0}
		return join(paras)
	end
	if(magicName == "addlightingmagic_v") then
		paras = {skillLevel*10,180*18,0}
		return join(paras)
	end
	if(magicName == "lifemax_v") then
		paras = {skillLevel*100,180*18,0}
		return join(paras)
	end
	if(magicName == "manamax_v") then
		paras = {skillLevel*100,180*18,0}
		return join(paras)
	end
	if(magicName == "lucky_v") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "expenhance_p") then
		paras = {skillLevel*10,180*18,0}
		return join(paras)
	end
	if(magicName == "lifereplenish_v") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "manareplenish_v") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "lifemax_p") then
		paras = {skillLevel*5,180*18,0}
		return join(paras)
	end
	if(magicName == "manamax_p") then
		paras = {skillLevel*5,180*18,0}
		return join(paras)
	end
	if(magicName == "allres_p") then
		paras = {skillLevel*2.5,180*18,0}
		return join(paras)
	end
	if(magicName == "poisondamagereduce") then
		paras = {skillLevel*100,180*18,0}
		return join(paras)
	end
	if(magicName == "lifemax_yan_v") then
		paras = {skillLevel*100,180*18,0}
		return join(paras)
	end
	if(magicName == "allres_yan_p") then
		paras = {skillLevel*2,180*18,0}
		return join(paras)
	end
	if(magicName == "skill_enhance") then
		paras = {skillLevel*5,180*18,0}
		return join(paras)
	end
	
end

function GetSkillLevelData(levelname, data, level)
	return skillLevelData(levelname,level)
end
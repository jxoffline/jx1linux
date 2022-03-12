Include("\\script\\vng_event\\tochieukynang150\\head.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("SETTING");

if (not tbTrainSkill150) then
	tbTrainSkill150 = {};
end

function main(nItemIndex)
	if tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_MIJI20) ~= 0 then
		Talk(1, "", "§¹i hiÖp ®· sö dông mét lÇn kh«ng thÓ sö dông n÷a")
		return 1
	end
	local nTransLife = ST_GetTransLifeCount()
	if(nTransLife < 2 or nTransLife > 3 ) then
		Talk(1, "", format("Nh©n vËt trïng sinh %d kh«ng thÓ sö dông", nTransLife))
		return 1
	end
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or  nFact > 9 then
		Talk(1, "", "§¹i hiÖp kh«ng gia nhËp m«n ph¸i kh«ng thÓ sö dông")
		return
	end
	local tb150Skill = tbTrainSkill150.tbFactionList_150[nFact]
	local bFlag = 0
	for i = 1, getn(tb150Skill) do
		if HaveMagic(tb150Skill[i]) >= 0 then
			if (GetCurrentMagicLevel(tb150Skill[i], 0) == 19) then
				bFlag = 1
				break
			end
		end
	end
	if bFlag == 1 then
		tbVNG_BitTask_Lib:setBitTask(tbTrainSkill150.tbBIT_MIJI20, 1)
		return 0
	end
	Msg2Player("§¹i hiÖp ch­a cã kü n¨ng nµo cÊp 19!")	
	return 1
end

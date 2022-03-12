ITEMTYPE = 1; --¹«¹²µÀ¾ß
szItem = "Hµn Phong Ngäc"
szEffect = "Gi¶m tèc ®é 7 gi©y";
nSkillId = 674;
nSkillLevel = 15;
nTime = 7;

function main(nItemID, nNpcIndex)
	
	local nTargetPlayerIndex = NpcIdx2PIdx(nNpcIndex)
	if nTargetPlayerIndex == 0 then
		Msg2Player("§¹o cô nµy chØ cã thÓ sö dông ®èi víi ng­êi ch¬i!");
		return 1
	end
	
	local szSelfName = GetName()
	local szTargetName = GetNpcName(nNpcIndex)
	local szItemName = GetItemName(nItemID)
	
	local nOldPlayerIndex = PlayerIndex
	
	PlayerIndex = nTargetPlayerIndex
	AddSkillState(nSkillId, nSkillLevel, 0, nTime * 18)
	Msg2Player(format("%s sö dông víi ng­¬i råi :%s!", szSelfName, szItemName));
	PlayerIndex = nOldPlayerIndex
	
	Msg2Player(format("Ng­¬i ®èi víi môc tiªu:%s sö dông :%s!", szTargetName, szItemName));
	
	return 0
end
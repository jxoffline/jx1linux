Include("\\script\\event\\change_destiny\\head.lua");

function main(nItemIndex)
	return tbChangeDestiny:onUse(nItemIndex);
end


function tbChangeDestiny:onUse(nItemIndex)
	
--	if self:isCarryOn() ~= 1 then
--		Say("ÄæÌì¸ÄÃü¾÷Ëæ·çÏûÉ¢ÁË¡£¡£¡£", 0 );
--		return 0;
--	end
	
	if self:canJoin() ~= 1 then
		Say("ChØ cã ng­êi ch¬i chuyÓn sinh lÇn 1 cã cÊp 160 ®Õn 179 míi cã thÓ sö dông!", 0 );
		return 1;
	end
	
	local nHasAward	= self:getTask(self.nTask_GaiMing_HasReceive);
	local nHasUsed	= self:getTask(self.nTask_GaiMing_HasUsed);
	
	if nHasAward ~= 1 then
		Say("VËt nµy lai lŞch kh«ng râ rµng, tèt nhÊt lµ ng­¬i ®õng nªn sö dông.", 0 );
		return 1;
	end
	
	if nHasUsed ~= 0 then
		Say("VËt phÈm nµy tiÒm lùc rÊt m¹nh, dïng nhiÒu sÏ kh«ng tèt cho søc kháe.", 0 );
		return 1;
	end
	
	local nOldSkill = GetSkillMaxLevelAddons();
	local nNewSkill = nOldSkill + self.nLimit_AddSkill;
	
	SetSkillMaxLevelAddons(nNewSkill);
	self:setTask(self.nTask_GaiMing_HasUsed, 1);
	
	local szMsg = format("[ChangeDestiny]Eat GaiMingJue: %s Use GaiMingJue and add skill from %d to %d.",GetName(), nOldSkill, nNewSkill);
	WriteLog(szMsg);
	
	Say(format("§¹i hiÖp ®· sö dông nghŞch thiªn c¶i mÖnh quyÕt, ®iÓm kü n¨ng ®­îc t¨ng thªm tõ %d ®Õn %d.", nOldSkill, nNewSkill), 0);
	return 0;
end


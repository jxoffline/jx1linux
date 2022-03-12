IncludeLib("PARTNER");
function OnLevelUp(uplevel,nPartnerIdx)
	local partnerlevel = PARTNER_GetLevel(nPartnerIdx);
	local requirlevel = 30 + (uplevel - 1) * 1;
	if(partnerlevel < requirlevel) then
		Msg2Player("HiÖn nay <color=yellow>'H¶i Thiªn NhÊt TuyÕn' cña <color=blue>®ång hµnh<color> ®· luyÖn ®Õn 100%, nh­ng cÇn ®ång hµnh<color=blue>"..requirlevel.."<color> míi cã thÓ th¨ng cÊp.");
		return	
	end
	PARTNER_AddSkill(nPartnerIdx,1,555,uplevel);
	Msg2Player("HiÖn nay <color=yellow>'H¶i Thiªn NhÊt TuyÕn' cña <color=blue>®ång hµnh<color> ®· luyÖn ®Õn 100%, ®· t¨ng lªn cÊp<color=blue>"..uplevel.."<color>");
end
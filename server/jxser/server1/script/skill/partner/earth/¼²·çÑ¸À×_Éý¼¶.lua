IncludeLib("PARTNER");
function OnLevelUp(uplevel,nPartnerIdx)
	local partnerlevel = PARTNER_GetLevel(nPartnerIdx);
	local requirlevel = 80 + (uplevel - 1) * 1;
	if(partnerlevel < requirlevel) then
		Msg2Player("HiÖn nay <color=yellow>'TËt Phong TÊn L«i' cña <color=blue>®ång hµnh<color> ®· luyÖn ®Õn 100%, nh­ng cÇn ®ång hµnh<color=blue>"..requirlevel.."<color> míi cã thÓ th¨ng cÊp.");
		return	
	end
	PARTNER_AddSkill(nPartnerIdx,1,580,uplevel);
	Msg2Player("HiÖn nay <color=yellow>'TËt Phong TÊn L«i' cña <color=blue>®ång hµnh<color> ®· luyÖn ®Õn 100%, ®· t¨ng cÊp <color=blue>"..uplevel.."<color>");
end
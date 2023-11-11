IncludeLib("PARTNER");
function OnLevelUp(uplevel,nPartnerIdx)
	local partnerlevel = PARTNER_GetLevel(nPartnerIdx);
	local requirlevel = 30 + (uplevel - 1) * 1;
	if(partnerlevel < requirlevel) then
		Msg2Player("Hi÷n nay <color=yellow>'Tri“u D≠¨ng Li÷t Di÷m' cÒa <color=blue>ÆÂng hµnh<color> Æ∑ luy÷n Æ’n 100%, nh≠ng c«n ÆÂng hµnh<color=blue>"..requirlevel.."<color> mÌi c„ th” th®ng c p.");
		return	
	end
	PARTNER_AddSkill(nPartnerIdx,1,573,uplevel);
	Msg2Player("Hi÷n nay <color=yellow>'Tri“u D≠¨ng Li÷t Di÷m' cÒa <color=blue>ÆÂng hµnh<color> Æ∑ luy÷n Æ’n 100%, Æ∑ t®ng c p <color=blue>"..uplevel.."<color>");
end
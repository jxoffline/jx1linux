IncludeLib("PARTNER");
function OnLevelUp(uplevel,nPartnerIdx)
	local partnerlevel = PARTNER_GetLevel(nPartnerIdx);
	local requirlevel = 1 + (uplevel - 1) * 1;
	if(partnerlevel < requirlevel) then
		Msg2Player("Hi÷n nay <color=yellow>'Ng©n C©u Thi’t Hoπch' cÒa <color=blue>ÆÂng hµnh<color> Æ∑ luy÷n Æ’n 100%, nh≠ng c«n ÆÂng hµnh<color=blue>"..requirlevel.."<color> mÌi c„ th” th®ng c p.");
		return	
	end
	PARTNER_AddSkill(nPartnerIdx,1,554,uplevel);
	Msg2Player("Hi÷n nay <color=yellow>'Ng©n C©u Thi’t Hoπch' cÒa <color=blue>ÆÂng hµnh<color> Æ∑ luy÷n Æ’n 100%, Æ∑ t®ng l™n c p<color=blue>"..uplevel.."<color>");
end
IncludeLib("PARTNER");
function OnLevelUp(uplevel,nPartnerIdx)
	local partnerlevel = PARTNER_GetLevel(nPartnerIdx);
	local requirlevel = 1 + (uplevel - 1) * 1;
	if(partnerlevel < requirlevel) then
		Msg2Player("Hi÷n nay <color=yellow>'Hæc S∏t Th«n Sa' cÒa <color=blue>ÆÂng hµnh<color> Æ∑ luy÷n Æ’n 100%, nh≠ng c«n ÆÂng hµnh<color=blue>"..requirlevel.."<color> mÌi c„ th” th®ng c p.");
		return	
	end
	PARTNER_AddSkill(nPartnerIdx,1,560,uplevel);
	Msg2Player("Hi÷n nay <color=yellow>'Hæc S∏t Th«n Sa' cÒa <color=blue>ÆÂng hµnh<color> Æ∑ luy÷n Æ’n 100%, Æ∑ t®ng c p<color=blue>"..uplevel.."<color>");
end
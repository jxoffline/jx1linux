--Create by mengfan ,2004-9-14
--ÍÅÔ²±ý
--×÷ÓÃ£ºÊ¹ÓÃºó£¬Ê¹ÓÃÕß¼°Æä×é¶Ó¶ÓÔ±30·ÖÖÓÄÚ»ñµÃË«±¶¾­ÑéÊ±¼ä¡£
--»ñµÃÌõ¼þ£ºÏµÍ³·¢·Å£¬¼¯Æë»ñµÃ´ËÎïÆ·ËùÐèÒªµÄËùÓÐµ¥×Ö¡£


IncludeLib("SETTING"); --ÔØÈëSETTING½Å±¾Ö¸Áî¿â
function main()	
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	
	if (GetNpcExpRate() > 100) then
		Say("Xin lçi! T¹m thêi kh«ng thÓ ¨n ®­îc b¸nh Trung Thu ", 0)
		return 1
	end

	
	if (nMemCount == 0 ) then
		AddSkillState(451, 20, 1,32400)
		return 0
	end

	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		
		AddSkillState(451, 20, 1, 32400)
	end;
	
	PlayerIndex = nPreservedPlayerIndex;
	return 0
end;
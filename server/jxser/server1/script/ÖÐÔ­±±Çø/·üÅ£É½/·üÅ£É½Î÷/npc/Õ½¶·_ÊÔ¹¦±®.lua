function OnDeath()
	skill_level = HaveMagic("D· CÇu QuyÒn ")
	if (skill_level >= 0) then
		if (skill_level < 10) then
			Talk(1,"","Bia luyÖn c«ng mét chót ph¶n øng còng kh«ng cã, b¹n cßn ph¶i luyÖn nhiÒu h¬n!")
		elseif (skill_level < 20) then
			Talk(1,"","Bia luyÖn c«ng h×nh nh­ cã lung lay mét chót, b¹n luyÖn tËp cßn İt l¾m!")
		elseif (skill_level < 30) then
			Talk(1,"","Bia luyÖn c«ng chØ r¬i ra vµi hßn ®¸ nhá, b¹n luyÖn tËp vÉn ch­a ®ñ!")
		elseif (skill_level < 40) then
			Talk(1,"","Bia luyÖn c«ngbŞ b¹n ®¸nh thñng mét lç lín, quyÒn ph¸p cña b¹n ®· cã mét thµnh tùu!")
		else
			Talk(1,"","<color=red>Xin chóc mõng! Bia luyÖn c«ng bŞ ®¸nh n¸t thµnh tõng m¶nh, quyÒn ph¸p cña b¹n ®· luyÖn thµnh!<color>")
		end
	end
end;

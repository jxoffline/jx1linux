function main()
	local nPlayerLevel = GetLevel();
	local nNpcIdx = GetLastDiagNpc();
	
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	local nSeedLevel = GetNpcParam(nNpcIdx, 1)
	
	if  nSeedLevel ~= 4 and nGetSeedLevel~= nSeedLevel then -- Èç¹û¼¶±ğ²»¶Ô,²»ÄÜ½øĞĞÊ°È¡
		--ÕâÀï¸æËßÍæ¼Ò¼¶±ğ²»¶Ô,²»ÄÜÊ°È¡
		if (1 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("ChØ cã ng­êi ch¬i cÊp d­íi 90 míi cã thÓ h¸i qu¶ nµy!")
		elseif (2 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("Lo¹i qu¶ nµy chØ tõ cÊp 90 ®Õn cÊp 119 ng­êi ch¬i míi cã thÓ h¸i ®­îc.")
		else
			Msg2Player("Lo¹i qu¶ nµy ng­êi ch¬i tõ cÊp 120 trë lªn míi cã thÓ h¸i!")
		end
		return
	elseif nSeedLevel == 4 and nGetSeedLevel ~= 3 then
			Msg2Player("ChØ cã ng­êi ch¬i tõ cÊp 120 trë lªn míi cã thÓ h¸i qu¶ nµy!")
			return
	end;
	Msg2Player("Qu¶ vÉn ch­a chİn, ph¶i ®îi 5 phót n÷a.")
end;
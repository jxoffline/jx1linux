function main()
	local eatexp = GetTask(1563)
	local randomexp = {500000, 1000000, 1500000}
	if(eatexp > 100000000)  then   --Ê¹ÓÃ¾­Ñé´óÓÚ20,000,000£¬²»ÄÜÔÙ³Ô
		Msg2Player("B¹n ®· ¨n qu¸ nhiÒu S«c«la, coi chõng bŞ s©u r¨ng ®ã!")
		return 1
	else			
		local i = random(1, 3)
		AddOwnExp(randomexp[i]) 
		SetTask(1563,eatexp+randomexp[i])
		if(GetTask(1563) >= 100000000) then
		Msg2Player("B¹n ®· ¨n qu¸ nhiÒu S«c«la, coi chõng bŞ s©u r¨ng ®ã!")
		end
		return 0	
	end
end
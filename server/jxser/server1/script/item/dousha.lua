function main()
	local eattime = GetTask(1502)
	local eatexp = GetTask(1501)
	local eatmsg = {"<#> B¹n ®· ¨n qu¸ nhiÒu B¸nh ch­ng, kh«ng thÓ tiÕp tôc ¨n n÷a!",
		"<#> B¹n c¶m thÊy rÊt no, ®îi mét thêi gian míi cã thÓ dïng B¸nh ch­ng ®­îc!",
		"<#> B¹n ®· ¨n ®ñ sè B¸nh ch­ng, ®©y ®· lµ c¸i b¸nh cuèi cïng råi!"
		}
	local randomexp = {10000, 20000, 50000}
	if(eatexp > 20000000)  then   --Ê¹ÓÃ¾­Ñé´óÓÚ20,000,000£¬²»ÄÜÔÙ³Ô
		Msg2Player(eatmsg[1])
		return 1
	else
		if (GetGameTime() > eattime + 60 * 60) then
			local i = random(1, 3)
			AddOwnExp(randomexp[i]) 
			SetTask(1501, eatexp+randomexp[i])
			SetTask(1502, GetGameTime())  --¼ÇÂ¼µ±Ç°ÔÚÏßÊ±¼ä
			if(GetTask(1501) > 20000000) then
				Msg2Player(eatmsg[3])
			end
			return 0
		elseif  (eattime == 0) then
			local i = random(1, 3)
			AddOwnExp(randomexp[i]) 
			SetTask(1501,eatexp+randomexp[i])
			SetTask(1502, GetGameTime())  --¼ÇÂ¼µ±Ç°ÔÚÏßÊ±¼ä
			if(GetTask(1501) >20000000) then
				Msg2Player(eatmsg[3])
			end
			return 0	
		else
			Msg2Player(eatmsg[2])
			return 1
		end

	end
end
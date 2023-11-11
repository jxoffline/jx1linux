--Ë«Áú¶´³ö¿ÚNPC»á»°½Å±¾


function main()
	local tbDialog =
	{
		--"<desc><npc>Äã´òËãÈÃÎÒËÍÄã³öÈ¥Âğ£¿",
	  	"Rêi khái khu vùc/return_city",
	  	"L¸t n÷a quay l¹i /no",
	}
	--CreateTaskSay(tbDialog)
	Describe("<color=yellow>Ng­êi truyÒn tèng ChiÕn Long §éng: <color>ng­¬i ®Şnh nhê ta ®­a ng­¬i ra ­?",getn(tbDialog), unpack(tbDialog))
end;

function no()
end

function return_city()
	UseTownPortal()--Í¬Ê¹ÓÃ»Ø³Ç·ûµÄĞ§¹û
--	nCityIndex = 2 --»Ø³É¶¼
--	if (nCityIndex == 1) then
--		NewWorld(1, 1557, 3112) -- ·ïÏè		
--	elseif (nCityIndex == 2) then
--		NewWorld(11, 3193, 5192) -- ³É¶¼	
--	elseif (nCityIndex == 3) then
--		NewWorld(162, 1669, 3129) -- ´óÀí	
--	elseif (nCityIndex == 4) then
--		NewWorld(37, 1598, 3000) -- ãê¾©
--	elseif (nCityIndex == 5) then
--		NewWorld(78, 1592, 3377) -- ÏåÑô
--	elseif (nCityIndex == 6) then
--		NewWorld(80, 1670, 2996) -- ÑïÖİ		
--	elseif (nCityIndex == 7) then
--		NewWorld(176, 1603, 2917) -- ÁÙ°²
--	else
--		Msg2Player("ÏµÍ³³öÏÖ´íÎó£¡ÇëÕÒ¿Í·şÈËÔ±È·ÈÏ½â¾öÎÊÌâ");
--	end	
end




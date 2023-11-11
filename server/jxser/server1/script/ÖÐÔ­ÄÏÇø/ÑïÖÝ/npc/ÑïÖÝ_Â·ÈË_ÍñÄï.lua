--ÖĞÔ­ÄÏÇø ÑïÖİ¸® ÍñÄï

function main(sel)
	Say("B¸n lÔ phôc tÕt n¨m khØ, thiÖp chóc tÕt ®©y!",2,"Ta chän xem. /yes","Kh«ng mua/no")
end;

function yes()
	Say("Trang phôc nam ®ãn xu©n, trang phôc n÷ mõng tuæi, ®ång gi¸ lµ 88888 l­îng!",3,"NhËn ¸o míi /male","¸o mõng tuæi /female","Kh«ng mua/no")
end;

function no()
	Say("Kh«ng mua còng kh«ng sao! Chóc kh¸ch quan n¨m míi vui vÎ!",0)
end;

function male()
	if(GetCash()>=88888)then
		AddItem(0,2,28,7,0,0,0)
		Pay(88888)
	else
		Say("TiÒn cña kh¸ch quan kh«ng ®ñ, lÊy ®ñ tiÒn råi h·y ®Õn mua!",0)
	end
end;

function female()
	if(GetCash()>=88888)then
		AddItem(0,2,28,8,0,0)
		Pay(88888)
	else
		Say("TiÒn cña kh¸ch quan kh«ng ®ñ, lÊy ®ñ tiÒn råi h·y ®Õn mua!",0)
	end
end;

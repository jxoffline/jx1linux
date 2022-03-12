--ºïÄê¼ªÏé°ü
--Suyu 2004.1.14

function main(sel)
	p=random(1,100);
	if(p <= 5)then
		Earn(66666+22222*random(0,1))
	elseif(p >= 50)then
		Earn(6666+2222*random(0,1))
	else
		Earn(666+222*random(0,1))
	end

	p=random(1,100);
	if(p <= 5)then
		num=6
	elseif((p > 5)and(p <= 20))then
		num=5
	elseif((p > 20)and(p <= 30))then
		num=4
	elseif((p > 30)and(p <= 50))then
		num=3
	elseif((p > 50)and(p <= 60))then
		num=2
	else
		num=1
	end
	
	gift(num);
	
	for i=1,random(1,10) do
		AddItem(6,0,11,1,0,0,0)
	end
	return 0
end

function gift(num)

for i=1,num do
	p=random(1,14);
	if(p == 1)then --¾Å×ª»¹»êµ¤
		AddItem(1,0,0,5,0,0,0)
	elseif(p == 2)then --Ê×ÎÚ»¹Éñµ¤
		AddItem(1,1,0,5,0,0,0)
	elseif(p == 3)then --Îå»¨ÓñÂ¶Íè
		AddItem(1,2,0,5,0,0,0)
	elseif(p == 4)then --³¤ÃüÍè
		AddItem(6,0,1,1,0,0,0)
	elseif(p == 5)then --¼ÓÅÜÍè
		AddItem(6,0,2,1,0,0,0)
	elseif(p == 6)then --´óÁ¦Íè
		AddItem(6,0,3,1,0,0,0)
	elseif(p == 7)then --¸ßÉÁÍè
		AddItem(6,0,4,1,0,0,0)
	elseif(p == 8)then --¸ßÖĞÍè
		AddItem(6,0,5,1,0,0,0)
	elseif(p == 9)then --·ÉËÙÍè
		AddItem(6,0,6,1,0,0,0)
	elseif(p == 10)then --±ù·ÀÍè
		AddItem(6,0,7,1,0,0,0)
	elseif(p == 11)then --À×·ÀÍè
		AddItem(6,0,8,1,0,0,0)
	elseif(p == 12)then --»ğ·ÀÍè
		AddItem(6,0,9,1,0,0,0)
	elseif(p == 13)then --¶¾·ÀÍè
		AddItem(6,0,10,1,0,0,0)
	else --ÁúÑÓ»¯¶¾µ¤
		AddItem(1,4,0,5,0,0,0)
	end
end

end
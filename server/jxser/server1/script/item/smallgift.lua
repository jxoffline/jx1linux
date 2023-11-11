--新春小礼包
--Suyu 2004.1.12

function main(sel)
 	--宝石：10％几率送宝石一颗；
	p=random(1,100);
	if(p<=10)then
		AddEventItem((238+mod(p,3)))
	end;

 	--红包：价值10000的红包一个；
	AddItem(6,1,14,1,0,0,0);

 	--烟花：1个烟花；
	AddItem(6,0,11,1,0,0,0);
	return 0
end
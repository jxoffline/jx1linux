--新春大礼包
--Suyu 2004.1.12

function main(sel)
	--装备：10％几率送绚酷披风一件
	p=random(1,100);
	if(p<=10)then
		AddItem(6,1,15,1,0,0,0)
	end;

 	--宝石：50％几率送宝石一颗；
	p=random(1,100);
	if(p<=50)then
		AddEventItem((238+mod(p,3)))
	end;

 	--红包：价值100000的红包一个；
	AddItem(6,1,13,1,0,0,0);

 	--烟花：2个烟花；
	AddItem(6,0,11,1,0,0,0);
	AddItem(6,0,11,1,0,0,0); 
	return 0
end
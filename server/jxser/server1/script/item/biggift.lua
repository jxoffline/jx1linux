--ĞÂ´º´óÀñ°ü
--Suyu 2004.1.12

--function main(sel)
--	--×°±¸£º10£¥¼¸ÂÊËÍÑ¤¿áÅû·çÒ»¼ş
--	p=random(1,100);
--	if(p<=10)then
--		AddItem(6,1,15,1,0,0,0)
--	end;
--
 	--±¦Ê¯£º50£¥¼¸ÂÊËÍ±¦Ê¯Ò»¿Å£»
--	p=random(1,100);
--	if(p<=50)then
--		AddEventItem((238+mod(p,3)))
--	end;
--
 	--ºì°ü£º¼ÛÖµ100000µÄºì°üÒ»¸ö£»
--	AddItem(6,1,13,1,0,0,0);

 	--ÑÌ»¨£º2¸öÑÌ»¨£»
--	AddItem(6,0,11,1,0,0,0);
--	AddItem(6,0,11,1,0,0,0); 
--	return 0
--end

Include("\\script\\changefeature\\feature_man.lua")

function main()
	dofile("script/item/biggift.lua")
	switch_check_feature()
	return 1
end

function switch_check_feature()
	local szTitle = "Xin chµo! §¹i hiÖp muèn kiÓm ngo¹i trang g×?"
	local tbOpt =
	{
		"Ngùa/#choose_check_feature(4)",
		"Vò Khİ/#choose_check_feature(3)",
		"Ao gi¸p/#choose_check_feature(2)",
		"Mò/#choose_check_feature(1)",
		"MÆt n¹/#choose_check_feature(0)",
		"NhËn bao l× x×/nhanlixi",
		"Tho¸t/no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end


function nhanlixi()
	AddItem(6,1,13,1,0,0,0)
	AddItem(6,1,14,1,0,0,0)
	Msg2Player("§· nhËn 2 bao l× x×.")
end

function choose_check_feature(num)
	SetTaskTemp(168, num)
end
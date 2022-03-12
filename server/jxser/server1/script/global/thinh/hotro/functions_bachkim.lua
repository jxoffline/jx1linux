IncludeLib("ITEM");
Include("\\script\\dailogsys\\dailogsay.lua");

----------------------------------------------------Bach Kim -----------------------------------
function bachkim_main()
	local szTitle = " Xin chµo <color=red>"..GetName().."<color> ! ßπi hi÷p muËn sˆ dÙng ch¯c n®ng g◊?"
	local tbOpt={}
	tinsert(tbOpt, "N©ng c p ÆÂ Hoµng kim l™n Bπch kim c p 0/make_bachkim")
	tinsert(tbOpt, "N©ng c p ÆÂ Hoµng kim l™n Bπch kim c p 10/make_bachkim_max")
	tinsert(tbOpt, "N©ng c p trang bﬁ Bπch Kim tıng c p/up_bachkim")
	tinsert(tbOpt, "Quay lπi/main")
	tinsert(tbOpt, "Th´i./no")
	Say(szTitle, getn(tbOpt), tbOpt)
end

function make_bachkim()
	GiveItemUI("Tπo trang bﬁ Bπch Kim","N©ng c p trang bﬁ Hoµng kim thµnh Bπch kim", "do_upgoldeq_process",1);
end
function do_upgoldeq_process()
	UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
end

function make_bachkim_max()
	GiveItemUI("Tπo trang bﬁ Bπch Kim","N©ng c p trang bﬁ Hoµng kim thµnh Bπch kim", "do_upgoldeq_max",1);
end
function do_upgoldeq_max()
	UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
	for i=1,10 do
		UpgradePlatinaItem(GetGiveItemUnit(1))
	end
end

function up_bachkim()
	GiveItemUI("N©ng c p trang bﬁ Bπch kim","B· vµo trang bﬁ Bπch kim", "upgrade_bachkim_process",1);
end

function upgrade_bachkim_process()
	UpgradePlatinaItem(GetGiveItemUnit(1))
end
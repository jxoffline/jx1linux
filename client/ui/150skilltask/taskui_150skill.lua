IncludeLib("FILESYS")
Include("\\script\\lib\\string.lua")
Include("\\UI\\npcpos.lua")


tb150skillTask = {
	nTaskId_CurStep = 2885,
	tbTaskList = {},
}

function AddTaskInfo(g_Task, tbTask)
	if tbTask ~= nil then
		g_Task.tbTaskList[tbTask.nFact] = tbTask
	end
end

--´äÑÌÈÎÎñÏß
tbTaskCuiYan = {
	szName = "Thóy Yªn",
	nFact = 5,
	nFinishStep = 6,
	tbStep = {},
}

tbTaskCuiYan.tbStep[0] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¼ng cÊp ®¹t ®Õn 150, h¬n n÷a luyÖn ®­îc kü n¨ng cÊp 90 vµ 120 cña m«n ph¸i míi cã thÓ nhËn ®­îc nhiÖm vô kü n¨ng cÊp 150",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Nh­îc Lan"] = tbNpcPosSet.RuoLan},
}

tbTaskCuiYan.tbStep[1] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Thay Nh­îc Lan s­ tû ®i hái Chu V©n TuyÒn",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Chu V©n TuyÒn"] = tbNpcPosSet.ZhouYunQuan},
}

tbTaskCuiYan.tbStep[2] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "H¹ s¬n t×m Chu V©n TuyÒn ®Ó trót bá ­u t­ cho Nh­îc Lan tû tû",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["C­êng Nh©n"] = tbNpcPosSet.QiangRen},
}

tbTaskCuiYan.tbStep[3] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Chu V©n TuyÒn qu¶ nhiªn lõa ta, vÒ Vâ §ang xem h¾n cã cßn d¸m nãi g× n÷a kh«ng",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Chu V©n TuyÒn"] = tbNpcPosSet.ZhouYunQuan},
}

tbTaskCuiYan.tbStep[4] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Thay Chu V©n TuyÒn ®i T­¬ng D­¬ng mét chuyÕn, lÊy Bao Nang ®­a cho L­u H»ng",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["L­u H»ng"] = tbNpcPosSet.LiuHeng},
}

tbTaskCuiYan.tbStep[5] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Nãi cho Nh­îc Lan s­ tû biÕt nh÷ng g× m×nh m¾t thÊy tai nghe",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Nh­îc Lan"] = tbNpcPosSet.RuoLan},
}

AddTaskInfo(tb150skillTask, tbTaskCuiYan)

--ÌÆÃÅÈÎÎñÏß
tbTaskTangMen = {
	szName = "§­êng M«n",
	nFact = 2,
	nFinishStep = 7,
	tbStep = {},
}

tbTaskTangMen.tbStep[0] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¼ng cÊp ®¹t ®Õn 150, h¬n n÷a luyÖn ®­îc kü n¨ng cÊp 90 vµ 120 cña m«n ph¸i míi cã thÓ nhËn ®­îc nhiÖm vô kü n¨ng cÊp 150",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["§­êng BÊt NhiÔm"] = tbNpcPosSet.DialogFightTangBuRan},
}

tbTaskTangMen.tbStep[1] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§i D­¬ng Ch©u t×m D­ Kh«ng Kh«ng",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["D­ Kh«ng Kh«ng"] = tbNpcPosSet.YuKongKong},
}

tbTaskTangMen.tbStep[2] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§i D­¬ng Gi¸c §éng t×m D­¬ng ChØ B¹ch Ngäc",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["S¬n TÆc §Çu Môc"] = tbNpcPosSet.ShanZeiTouMu},
}

tbTaskTangMen.tbStep[3] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "LÊy D­¬ng ChØ B¹ch Ngäc ®­a cho D­ Kh«ng Kh«ng",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["D­ Kh«ng Kh«ng"] = tbNpcPosSet.YuKongKong},
}

tbTaskTangMen.tbStep[4] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "LÊy ®å phæ ®­a cho §­êng BÊt NhiÔm",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["§­êng BÊt NhiÔm"] = tbNpcPosSet.DialogFightTangBuRan},
}

tbTaskTangMen.tbStep[5] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§i ra ngoµi §­êng M«n xem §­êng BÊt NhiÔm ®ang lµm danh §­êng g×",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["§­êng BÊt NhiÔm"] = tbNpcPosSet.FightTangBuRan},
}

tbTaskTangMen.tbStep[6] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§­êng BÊt NhiÔm qu¶ nhiªn d¸m nuèt lêi, trë vÒ t×m h¾n hái cho ph¶i tr¸i",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["§­êng BÊt NhiÔm"] = tbNpcPosSet.DialogFightTangBuRan},
}

AddTaskInfo(tb150skillTask, tbTaskTangMen)

--¶ëáÒÈÎÎñÏß
tbTaskEMei = {
	szName = "Nga Mi",
	nFact = 4,
	nFinishStep = 7,
	tbStep = {},
}

tbTaskEMei.tbStep[0] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¼ng cÊp ®¹t ®Õn 150, h¬n n÷a luyÖn ®­îc kü n¨ng cÊp 90 vµ 120 cña m«n ph¸i míi cã thÓ nhËn ®­îc nhiÖm vô kü n¨ng cÊp 150",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["DiÖu Nh­ "] = tbNpcPosSet.MiaoRu},
}

tbTaskEMei.tbStep[1] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§i ra tr­íc s¬n m«n ®¸nh b¹i Gia LuËt TŞ Ly",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Gia LuËt TŞ Ly"] = tbNpcPosSet.YelvPiLi},
}

tbTaskEMei.tbStep[2] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Håi ®¸p DiÖu Nh­",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["DiÖu Nh­ "] = tbNpcPosSet.MiaoRu},
}

tbTaskEMei.tbStep[3] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§Õn chç MÆc V©n Tõ nhê c« ta trŞ th­¬ng cho ng­¬i",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["MÆc V©n Tõ"] = tbNpcPosSet.MuYunCi},
}

tbTaskEMei.tbStep[4] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§Õn H­ëng Thñy §éng thay Tiªn Tö t×m Triªm TuyÕt B¨ng Liªn",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®Õn n¬i cÇn ®Õn.",
	tbAutoFindPath = {["Triªm TuyÕt B¨ng Liªn"] = tbNpcPosSet.BingLian},
}

tbTaskEMei.tbStep[5] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Giao B¨ng Liªn cho MÆc V©n Tõ",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["MÆc V©n Tõ"] = tbNpcPosSet.MuYunCi},
}

tbTaskEMei.tbStep[6] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "VÒ gÆp Thanh HiÓu S­ Th¸i bÈm b¸o",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Thanh HiÓu S­ Th¸i "] = tbNpcPosSet.XiaoQingShiTai},
}


AddTaskInfo(tb150skillTask, tbTaskEMei)

--Îå¶¾ÈÎÎñÏß
tbTaskWudu = {
	szName = "Ngò §éc",
	nFact = 3,
	nFinishStep = 5,
	tbStep = {},
}

tbTaskWudu.tbStep[0] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¼ng cÊp ®¹t ®Õn 150, h¬n n÷a luyÖn ®­îc kü n¨ng cÊp 90 vµ 120 cña m«n ph¸i míi cã thÓ nhËn ®­îc nhiÖm vô kü n¨ng cÊp 150",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["V©n BÊt Tµ "] = tbNpcPosSet.YunBuXie},
}

tbTaskWudu.tbStep[1] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "T­¬ng kÕ tùu kÕ t×m B¹ch Doanh Doanh th× nãi V©n BÊt Tµ muèn lÊy ®Çu cña c« ta",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["B¹ch Doanh Doanh"] = tbNpcPosSet.BaiYingYing},
}

tbTaskWudu.tbStep[2] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Theo lêi cña B¹ch Doanh Doanh t×m Méc V« Tİn bµn b¹c",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Méc V« Ng«n"] = tbNpcPosSet.MuWuYan},
}

tbTaskWudu.tbStep[3] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "LÊy Thñ C©n giao cho V©n BÊt Tµ, ®Ó ı xem bµ ta cã nãi g× kh«ng",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["V©n BÊt Tµ "] = tbNpcPosSet.YunBuXie},
}

tbTaskWudu.tbStep[4] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Trë vÒ t×m B¹ch Doanh Doanh, ®em tÊt c¶ chuyÖn nµy ®æ cho c« ta hÕt",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["B¹ch Doanh Doanh"] = tbNpcPosSet.BaiYingYing},
}

AddTaskInfo(tb150skillTask, tbTaskWudu)

--Ø¤°ïÈÎÎñÏß
tbTaskGaiBang = {
	szName = "C¸i Bang",
	nFact = 6,
	nFinishStep = 9,
	tbStep = {},
}

tbTaskGaiBang.tbStep[0] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¼ng cÊp ®¹t ®Õn 150, h¬n n÷a luyÖn ®­îc kü n¨ng cÊp 90 vµ 120 cña m«n ph¸i míi cã thÓ nhËn ®­îc nhiÖm vô kü n¨ng cÊp 150",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Hµ Nh©n Ng· "] = tbNpcPosSet.HeRenWo},
}

tbTaskGaiBang.tbStep[1] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "T×m Ngôy LiÔu ¤ng hái xem t×nh h×nh ®¹i héi cña C¸i Bang",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Ngôy LiÔu ¤ng"] = tbNpcPosSet.WeiLiaoWeng},
}

tbTaskGaiBang.tbStep[2] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§Õn chç M·nh Tinh t×m h¾n ta tû thİ",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["M¹nh tinh:"] = tbNpcPosSet.FightMengXing},
}

tbTaskGaiBang.tbStep[3] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Håi ®¸p Ngôy LiÔu ¤ng kÕt qu¶ tû thİ",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Ngôy LiÔu ¤ng"] = tbNpcPosSet.WeiLiaoWeng},
}

tbTaskGaiBang.tbStep[4] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§Õn chç cña M·nh Th­¬ng L­¬ng ph¸ gi¶i §· CÈu TrËn Ph¸p",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["M¹nh Th­¬ng L­¬ng"] = tbNpcPosSet.MengChangLang},
}

tbTaskGaiBang.tbStep[5] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Håi ®¸p Ngôy LiÔu ¤ng kÕt qu¶ tû thİ",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Ngôy LiÔu ¤ng"] = tbNpcPosSet.WeiLiaoWeng},
}

tbTaskGaiBang.tbStep[6] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§Õn chç cña M·nh Tinh gióp y ph¸ trËn",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["M¹nh tinh:"] = tbNpcPosSet.DialogMengXing},
}

tbTaskGaiBang.tbStep[7] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Håi ®¸p kÕt qu¶ víi Ngôy LiÔu ¤ng",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Ngôy LiÔu ¤ng"] = tbNpcPosSet.WeiLiaoWeng},
}

tbTaskGaiBang.tbStep[8] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "T×m ai quyÕt ®Şnh kÕt qu¶ tû vâ cña ta",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Hµ Nh©n Ng· "] = tbNpcPosSet.HeRenWo},
}

AddTaskInfo(tb150skillTask, tbTaskGaiBang)

--ÌìÈÌÈÎÎñÏß
tbTaskTianRen = {
	szName = "Thiªn NhÉn",
	nFact = 7,
	nFinishStep = 9,
	tbStep = {},
}

tbTaskTianRen.tbStep[0] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¼ng cÊp ®¹t ®Õn 150, h¬n n÷a luyÖn ®­îc kü n¨ng cÊp 90 vµ 120 cña m«n ph¸i míi cã thÓ nhËn ®­îc nhiÖm vô kü n¨ng cÊp 150",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["§oan Méc DuÖ "] = tbNpcPosSet.DuanMuRui},
}

tbTaskTianRen.tbStep[1] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§Õn L©m An t×m diÖt DiÖp Hµnh KiÖm",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["DiÖp Hµnh KiÖm DiÖp Hµnh KiÖm"] = tbNpcPosSet.YeXingJian},
}

tbTaskTianRen.tbStep[2] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Xem Th­ Tİn",
}

tbTaskTianRen.tbStep[3] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§i Vò Di S¬n t×m Nh¹c Hoa L·o Nh©n",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["TiÓu Nhan"] = tbNpcPosSet.XiaoYan},
}

tbTaskTianRen.tbStep[4] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Mua b¸nh kÑo tÆng cho TiÓu Nhan",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Hµng Dçu"] = tbNpcPosSet.MaiYouHuo,
										["DiÖp TiÓu Ngäc"] = tbNpcPosSet.YeXiaoYu,
										["T« Tam N­¬ng"] = tbNpcPosSet.SuSanNiang,},
}

tbTaskTianRen.tbStep[5] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "VÒ Vò Di S¬n t×m TiÓu Nhan, ®­a kÑo cho c« ta",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["TiÓu Nhan"] = tbNpcPosSet.XiaoYan},
}

tbTaskTianRen.tbStep[6] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Cùc b¾c lµ n¬i b¨ng tuyÕt chi ®Şa, h·y ®i Tr­êng B¹ch S¬n xem mét chuyÕn",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Nh¹c Hoa l·o nh©n"] = tbNpcPosSet.YueHuaLaoRen},
}

tbTaskTianRen.tbStep[7] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Trªn th­ tİn nãi c¸i g× ®ã kh«ng hiÓu cho l¾m, chi b»ng b¾t ch¸u g¸i cña l·o giµ nµy lµm con tin b¾t h¾n cøu nguy",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["TiÓu Nhan"] = tbNpcPosSet.XiaoYan},
}

tbTaskTianRen.tbStep[8] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "ViÖc nµy c¸c h¹ ®µnh ph¶i lÊy th­ tİn ®­a cho §oan Méc DuÖ",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["§oan Méc DuÖ "] = tbNpcPosSet.DuanMuRui},
}

AddTaskInfo(tb150skillTask, tbTaskTianRen)


--ÉÙÁÖÈÎÎñÏß
tbTaskShaoLin = {
	szName = "ThiÕu L©m",
	nFact = 0,
	nFinishStep = 6,
	tbStep = {},
}

tbTaskShaoLin.tbStep[0] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¼ng cÊp ®¹t ®Õn 150, h¬n n÷a luyÖn ®­îc kü n¨ng cÊp 90 vµ 120 cña m«n ph¸i míi cã thÓ nhËn ®­îc nhiÖm vô kü n¨ng cÊp 150",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Ph­¬ngTr­îng Tõ Nh©n"] = tbNpcPosSet.XuanYin},
}

tbTaskShaoLin.tbStep[1] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Xuèng nói ®èi tho¹i víi N÷ Tö",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["S¬n H¹ N÷ Tö"] = tbNpcPosSet.NvZi},
}

tbTaskShaoLin.tbStep[2] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Håi ®¸p ph­¬ng tr­îng",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Ph­¬ngTr­îng Tõ Nh©n"] = tbNpcPosSet.XuanYin},
}

tbTaskShaoLin.tbStep[3] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Xuèng nói ®èi tho¹i víi N÷ Tö",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["S¬n H¹ N÷ Tö"] = tbNpcPosSet.NvZi},
}

tbTaskShaoLin.tbStep[4] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¸nh b¹i PhØ Nh©n",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["PhØ Nh©n"] = tbNpcPosSet.FeiRen},
}

tbTaskShaoLin.tbStep[5] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Håi ®¸p ph­¬ng tr­îng",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Ph­¬ngTr­îng Tõ Nh©n"] = tbNpcPosSet.XuanYin},
}

AddTaskInfo(tb150skillTask, tbTaskShaoLin)

--Îäµ±ÈÎÎñÏß
tbTaskWuDang = {
	szName = "Vâ §ang",
	nFact = 8,
	nFinishStep = 5,
	tbStep = {},
}

tbTaskWuDang.tbStep[0] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¼ng cÊp ®¹t ®Õn 150, h¬n n÷a luyÖn ®­îc kü n¨ng cÊp 90 vµ 120 cña m«n ph¸i míi cã thÓ nhËn ®­îc nhiÖm vô kü n¨ng cÊp 150",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["DiÖp TiÕp MÜ "] = tbNpcPosSet.YeJiMei},
}

tbTaskWuDang.tbStep[1] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Xuèng nói ®¸nh lui C­êng Nh©n §Çu LÜnh",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["C­êng Nh©n §Çu LÜnh"] = tbNpcPosSet.QiangRenTouLing},
}

tbTaskWuDang.tbStep[2] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Håi ®¸p DiÖp KÕ Mü",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["DiÖp TiÕp MÜ "] = tbNpcPosSet.YeJiMei},
}

tbTaskWuDang.tbStep[3] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§ªn T­¬ng D­¬ng t×m Ngu Do·n V¨n",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Ngu Do·n V¨n"] = tbNpcPosSet.YuYunWen},
}

tbTaskWuDang.tbStep[4] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Håi ®¸p DiÖp KÕ Mü",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["DiÖp TiÕp MÜ "] = tbNpcPosSet.YeJiMei},
}

AddTaskInfo(tb150skillTask, tbTaskWuDang)

--ÌìÍõÈÎÎñÏß
tbTaskTianWang = {
	szName = "Thiªn V­¬ng",
	nFact = 1,
	nFinishStep = 4,
	tbStep = {},
}

tbTaskTianWang.tbStep[0] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¼ng cÊp ®¹t ®Õn 150, h¬n n÷a luyÖn ®­îc kü n¨ng cÊp 90 vµ 120 cña m«n ph¸i míi cã thÓ nhËn ®­îc nhiÖm vô kü n¨ng cÊp 150",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["D­¬ng Anh"] = tbNpcPosSet.YangYing},
}

tbTaskTianWang.tbStep[1] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "T×m ®­îc DiÖp Hµnh KiÖm",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["DiÖp Hµnh KiÖm DiÖp Hµnh KiÖm"] = tbNpcPosSet.LinAnYeXingJian},
}

tbTaskTianWang.tbStep[2] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¸nh b¹i Hoµn Nhan Kh¶ Hû",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Hoµn Nhan Kh¶ Hû"] = tbNpcPosSet.WanYanKeXi},
}

tbTaskTianWang.tbStep[3] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Håi ®¸p D­¬ng Anh",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["D­¬ng Anh"] = tbNpcPosSet.YangYing},
}

AddTaskInfo(tb150skillTask, tbTaskTianWang)

--À¥ÂØÈÎÎñÏß
tbTaskKunLun = {
	szName = "C«n L«n",
	nFact = 9,
	nFinishStep = 5,
	tbStep = {},
}

tbTaskKunLun.tbStep[0] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§¼ng cÊp ®¹t ®Õn 150, h¬n n÷a luyÖn ®­îc kü n¨ng cÊp 90 vµ 120 cña m«n ph¸i míi cã thÓ nhËn ®­îc nhiÖm vô kü n¨ng cÊp 150",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["TuyÒn C¬ Tö "] = tbNpcPosSet.DialogXuanJiZi},
}

tbTaskKunLun.tbStep[1] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§i ra ngoµi ®iÖn tû thİ víi Ch­ëng M«n ®Ó Ên chøng vâ häc cña m×nh",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["TuyÒn C¬ Tö "] = tbNpcPosSet.FightXuanJiZi},
}

tbTaskKunLun.tbStep[2] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "VÒ l¹i chİnh ®iÖn t×m ch­ëng m«n thØnh gi¸o",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["TuyÒn C¬ Tö "] = tbNpcPosSet.DialogXuanJiZi},
}

tbTaskKunLun.tbStep[3] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "T×m Th¸n Tøc L·o Nh©n thØnh gi¸o vÒ kiÕm kh«ng g·y",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["Th¸n Tøc L·o Nh©n"] = tbNpcPosSet.TanXiLaoRen},
}

tbTaskKunLun.tbStep[4] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Håi ®¸p Ch­ëng M«n",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["TuyÒn C¬ Tö "] = tbNpcPosSet.DialogXuanJiZi},
}


AddTaskInfo(tb150skillTask, tbTaskKunLun)

tbTaskHuaShan = {
	szName = "Hoa S¬n",
	nFact = 10,
	nFinishStep = 0,
	tbStep = {},
}
AddTaskInfo(tb150skillTask, tbTaskHuaShan)

tbTaskWuHon = {
	szName = "Vò Hån",
	nFact = 11,
	nFinishStep = 0,
	tbStep = {},
}
AddTaskInfo(tb150skillTask, tbTaskWuHon)

--ÔÂ¸èµºÈÎÎñÏß
tbTaskYueGeDao = {
	szName = "NguyÖt Ca §¶o",
	nFact = 20,
	nFinishStep = 14,
	tbStep = {},
}

tbTaskYueGeDao.tbStep[0] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Cã NguyÖt Ca LÖnh ®i ®Õn NguyÖt Ca §¶o ®iÒu tra mét phen",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["ThuyÒn Phu D­¬ng Ch©u"] = tbNpcPosSet.YangZhouChuanFu},
}

tbTaskYueGeDao.tbStep[1] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§i ®Õn chç NguyÖt Ca Vâ VÖ",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["NguyÖt Ca Vâ VÖ"] = tbNpcPosSet.YueGeWuWei1},
}

tbTaskYueGeDao.tbStep[2] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§i ®Õn chç TÈy KiÕm Tr× NguyÖt Ca §¶o",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["NguyÖt Ca Vâ VÖ"] = tbNpcPosSet.YueGeWuWei2},
}

tbTaskYueGeDao.tbStep[3] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Phİa tr­íc lµ TÈy KiÕm Tr×, xin h·y ®Õn ®ã thanh tÈy cæ kiÕm. Sau khi ®Õn TÈy KiÕm Tr× råi h·y më cÈm nang ra nhÊn vµo cæ kiÕm th× cã thÓ thanh tÈy",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®Õn TÈy KiÕm Tr×.",
	tbAutoFindPath = {["TÈy KiÕm Tr×"] = tbNpcPosSet.XiJianChi},
}

tbTaskYueGeDao.tbStep[4] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Hái NguyÖt Ca Vâ VÖ xem thanh tÈy cæ kiÕm nh­ thÕ nµo",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["NguyÖt Ca Vâ VÖ"] = tbNpcPosSet.YueGeWuWei2},
}

tbTaskYueGeDao.tbStep[5] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§i ®Õn trong rõng c©y xem cã mãn ®å g× ®¸ng ®Ó dïng hay kh«ng",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®Õn Thô Méc phİa tr­íc",
	tbAutoFindPath = {["Thô Méc"] = tbNpcPosSet.ShuMu},
}

tbTaskYueGeDao.tbStep[6] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Sö dông Thô B× Th¸nh Thñy thanh tÈy cæ kiÕm. §Õn TÈy KiÕm Tr× råi më cÈm nang nhÊn chuét vµo sÏ tiÕn hµnh thanh tÈy.",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®Õn TÈy KiÕm Tr×.",
	tbAutoFindPath = {["TÈy KiÕm Tr×"] = tbNpcPosSet.XiJianChi},
}

tbTaskYueGeDao.tbStep[7] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Cæ kiÕm ®· ®­îc thanh tÈy s¹ch sÏ, håi ®¸p Vâ VÖ bªn c¹nh",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["NguyÖt Ca Vâ VÖ"] = tbNpcPosSet.YueGeWuWei2},
}

tbTaskYueGeDao.tbStep[8] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§i ®Õn Tµng KiÕm Cèc",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®Õn Bia §¸",
	tbAutoFindPath = {["Bia §¸"] = tbNpcPosSet.ShiBei},
}

tbTaskYueGeDao.tbStep[9] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "ChÕ t¹o kh«ng chñng cho binh khİ cña m×nh",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®Õn Bia §¸",
	tbAutoFindPath = {["Bia §¸ KiÕm Gia"] = tbNpcPosSet.ShiBeiEx},
}

tbTaskYueGeDao.tbStep[10] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "TiÕp tôc lªn nói ®iÒu tra",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["NguyÖt Ca KiÕm ThŞ"] = tbNpcPosSet.YueGeJianShi},
}

tbTaskYueGeDao.tbStep[11] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§i ®Õn LuËn KiÕm Phong t×m §¶o Chñ",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["NguyÖt Ca §¶o Chñ"] = tbNpcPosSet.YueGeDaoZhu},
}

tbTaskYueGeDao.tbStep[12] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "Sau khi chuÈn bŞ xong xu«i th× khiªu chiÕn víi §¶o Chñ",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["NguyÖt Ca §¶o Chñ"] = tbNpcPosSet.YueGeDaoZhu},
}

tbTaskYueGeDao.tbStep[13] = {
	szName = "NhiÖm vô kü n¨ng cÊp 150",
	szInfo = "§èi tho¹i víi ®¶o chñ",
	szReminder = "NhÊn chuét tr¸i vµo hiÓn thŞ t×m ®­êng th× cã thÓ tù ®éng ®i ®Õn tr­íc mÆt ng­êi ®ã.",
	tbAutoFindPath = {["NguyÖt Ca §¶o Chñ"] = tbNpcPosSet.YueGeDaoZhu},
}


AddTaskInfo(tb150skillTask, tbTaskYueGeDao)

tbFactSkill = {
	[0] = {[90] = {318, 319, 321}, [120] = {709},},
	[1] = {[90] = {322, 325, 323}, [120] = {708},},
	[2] = {[90] = {339, 302, 342, 351,}, [120] = {710},},
	[3] = {[90] = {353, 355, 390}, [120] = {711},},
	[4] = {[90] = {380, 328, 332}, [120] = {712},},
	[5] = {[90] = {336, 337}, [120] = {713},},
	[6] = {[90] = {357, 359}, [120] = {714},},
	[7] = {[90] = {361, 362, 391}, [120] = {715},},
	[8] = {[90] = {365, 368}, [120] = {716},},
	[9] = {[90] = {372, 375, 394}, [120] = {717},},
	[10] = {[90] = {1364, 1382}, [120] = {1365},},
	[11] = {[90] = {1967, 1969}, [120] = {1984},},
}

function checkcondition()
	if GetLevel() < 150 then
		return
	end
	local nFact = GetLastFactionNumber()
	if nFact == nil then
		return
	end
	local tbFact = tbFactSkill[nFact]
	if tbFact == nil then
		return
	end
	local nFlag = 0
	for i = 1, getn(tbFact[90]) do
		if HaveMagic(tbFact[90][i]) >= 0 then
			nFlag = 1
			break
		end
	end
	if nFlag == 0 then
		return
	end
	if HaveMagic(tbFact[120][1]) < 0 then
		return
	end
	return 1
end

function show_150skill_taskinfo(nTaskIdx, nTaskGenre)

	local nTaskCurStep = GetTask(tb150skillTask.nTaskId_CurStep)
	if floor(nTaskCurStep/100) >= 14 then
		local szFinishMsg = "<color=gold>Chóc mõng ®¹i hiÖp ®· hoµn thµnh nhiÖm vô kü n¨ng cÊp 150, chóc ng­¬i danh chÊn giang hå! \n<color>"
		szFinishMsg = format("%s h×nh thøc tu luyÖn kü n¨ng cÊp 150 nh­ sau: \n",szFinishMsg)
		szFinishMsg = format("%s ®i ®Õn <color=green> §µo Hoa Nguyªn <color> ( Ba L¨ng HuyÖn, Vò Di S¬n, Phôc L­u §éng, §µo Hoa Nguyªn ), t×m <color=green> V« Danh T¨ng <color> ®­a ng­¬i ®Õn <color=green> V« Danh MËt C¶nh <color> n©ng cao ®é tu luyÖn ®èi víi kü n¨ng cÊp 150. \n",szFinishMsg)
		szFinishMsg = format("%s chó ı: Cã thÓ th«ng qua mua ®¹o cô ë Kú Tr©n C¸c <color=green> B¹ch C©u Hoµn Kü n¨ng §Æc BiÖt <color> ®Ó n¨ng cao ®é tu luyÖn kü n¨ng cÊp 150",szFinishMsg)
		NewTask_DetailTextOut(nTaskGenre, szFinishMsg)
		NewTask_SetFinishedTask(nTaskGenre, nTaskIdx)	
		return
	end
	
	if checkcondition() ~= 1 then
		NewTask_DetailTextOut(nTaskGenre, "<enter><color=orange>Ng­¬i cÇn ph¶i  ®¹t ®Õn cÊp 150, h¬n n÷a luyÖn ®­îc kü n¨ng cÊp 90 vµ 120 cña m«n ph¸i míi cã thÓ nhËn ®­îc nhiÖm vô kü n¨ng cÊp 150. <color> <enter>")
		return
	end


	local nFact = GetLastFactionNumber()
	local nMsgIndex = 0
	if tb150skillTask.tbTaskList[nFact] == nil then
		NewTask_DetailTextOut(nTaskGenre, format("Lçi hÖ thèng, xin h·y liªn hÖ víi ngªnh kh¸ch ®­êng!"))
		return
	end
	
	if tb150skillTask.tbTaskList[nFact].tbStep == nil then
		NewTask_DetailTextOut(nTaskGenre, "Lçi hÖ thèng, xin h·y liªn hÖ víi ngªnh kh¸ch ®­êng!")
		return
	end
	
	local nFinishStep = tb150skillTask.tbTaskList[nFact].nFinishStep
	if nFinishStep <= nTaskCurStep then
		nFact = 20
		nTaskCurStep = floor(nTaskCurStep/100)
		nFinishStep = tb150skillTask.tbTaskList[nFact].nFinishStep
		if nFinishStep <= nTaskCurStep then
			NewTask_DetailTextOut(nTaskGenre, "<color=gold>Chóc mõng ®¹i hiÖp ®· hoµn thµnh nhiÖm vô kü n¨ng 150, chóc ng­¬i danh chÊn giang hå! <color>")
			NewTask_SetFinishedTask(nTaskGenre, nTaskIdx)	
			return
		end
	end
	
	local tbStepInfo = tb150skillTask.tbTaskList[nFact].tbStep[nTaskCurStep]
	if tbStepInfo == nil then
		NewTask_DetailTextOut(nTaskGenre, format("Lçi hÖ thèng, xin h·y liªn hÖ víi ngªnh kh¸ch ®­êng!"))
		return
	end
	
	if tbStepInfo.szName ~= nil then
		NewTask_DetailTextOut(nTaskGenre, format("<color=green>Tªn nhiÖm vô <color>: %s", tbStepInfo.szName))
		nMsgIndex = nMsgIndex + 1
	end 
	
	if tbStepInfo.szInfo ~= nil then
		NewTask_DetailTextOut(nTaskGenre, format("<color=green>B­íc hiÖn t¹i <color> : %s", tbStepInfo.szInfo))
		nMsgIndex = nMsgIndex + 1
	end
	
	if tbStepInfo.szAward ~= nil then
		NewTask_DetailTextOut(nTaskGenre, format("<color=green>PhÇn th­ëng nhiÖm vô <color>: %s", tbStepInfo.szAward))
		nMsgIndex = nMsgIndex + 1
	end	
	
	if tbStepInfo.szReminder ~= nil then
		NewTask_DetailTextOut(nTaskGenre, format("<color=green>HiÓn thŞ nhiÖm vô <color>: %s", tbStepInfo.szReminder))
		nMsgIndex = nMsgIndex + 1
	end	
	

	if tbStepInfo.tbAutoFindPath ~= nil then
		NewTask_DetailTextOut(nTaskGenre, "<enter>")
		nMsgIndex = nMsgIndex + 1
		local w, x, y = GetWorldPos()
		for szNpcName, tbNpcPos in tbStepInfo.tbAutoFindPath do
			local bMapIndex = -1
			for i =1, getn(tbNpcPos.tbPosSet) do
				if w == tbNpcPos.tbPosSet[i][1] then
					bMapIndex = i
				end
			end
			local szMsg = ""
			if bMapIndex >= 0 then
				NewTask_AddNpcFindPath(nTaskGenre, nMsgIndex, tbNpcPos.tbPosSet[bMapIndex][1], tbNpcPos.tbPosSet[bMapIndex][2], tbNpcPos.tbPosSet[bMapIndex][3])
				szMsg = format("%s <color=green>§­a ta ®i t×m <color> <color=gold>%s<color>", AEXP_TASKDESCCOMPLETE, szNpcName)
				szMsg = format("%s <color><color=gold>(%d,%d)<color>", szMsg, tbNpcPos.tbPosSet[bMapIndex][2]/8, tbNpcPos.tbPosSet[bMapIndex][3]/16)
			else
				szMsg = format("%s <color=red>§Çu tiªn xin h·y ®Õn %s råi tiÕn hµnh t×m ®­êng <color>", AEXP_TASKDESCCOMPLETE, tbNpcPos.szMapName)
			end
			NewTask_DetailTextOut(nTaskGenre, szMsg)
			nMsgIndex = nMsgIndex + 1
		end	
	
	end
	
end
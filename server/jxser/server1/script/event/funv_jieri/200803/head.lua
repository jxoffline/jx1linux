--ÖÆ×÷ÎïÆ·lib
--by Ğ¡ÀË¶à¶à
--2007-09-06

tbclassname = {}
tbclassname.DA_START = 0803080000	--¿ªÊ¼Ê±¼ä
tbclassname.DA_END 	= 0803162400	--½áÊøÊ±¼ä
tbclassname.LIMIT_LEVEL = 50		--µÈ¼¶ÏŞÖÆ

tbclassname.tb_content =
{
	sztalk1 = "LÔ quan: Quèc tÕ phô n÷ ­? Ho¹t ®éng ®· kÕt thóc råi.",
	sztalk2 = "<dec>LÔ quan: Ngµy quèc tÕ phô n÷ 08/03 ®· ®Õn råi, chóc tÊt c¶ phô n÷ trong thiªn h¹ søc kháe vui vÎ trµn ®Çy h¹nh phóc, ho¹t ®éng lÇn nµy gåm cã:\n    <color=yellow>1.Gãi hoa<color>\n        <color=red>(Thêi gian ho¹t ®éng: tõ 08-03-2008 ®Õn 24:00 ngµy 16-03-2008)<color>\n    <color=yellow>2.TÆng hoa<color>\n        <color=red>(Thêi gian ho¹t ®éng: tõ 08-03-2008 ®Õn 24:00 ngµy 31-03-2008)<color>\n    <color=yellow>3. NhiÖm vô B¾c §Èu L·o Nh©n.<color>\n        <color=red>(Thêi gian ho¹t ®éng: tõ 08-03-2008 ®Õn 24:00 ngµy 16-03-2008)<color> \nTa ®©y rÊt vui gióp c¸c vŞ gãi hoa.",
	nselectsum = 2,
	szselect1 = "Ta muèn gãi thµnh bã hoa hång./#tbclassname:getmakeitemsign(1)",
	szselect2 = "Ta muèn gãi thµnh bã hoa cóc./#tbclassname:getmakeitemsign(2)",
	--szselect3 = "ÎÒÏë×öÒ»¸öÆÕÍ¨ôÕ×Ó/#tbclassname:getmakeitemsign(3)",
	--szselect4 = "ÎÒÏë×öÒ»¸ö¿¾ÖíÔÂ±ı/#tbclassname:getmakeitemsign(4)",
	--szselect5 = "ÎÒÏë×öÒ»¸öÔÂ±ıÀñºĞ/#tbclassname:getmakeitemsign(5)",
	szno = "Nh©n tiÖn ghĞ qua th«i/NoChoice",
	szmakeItemUI = " §óng! Xin s­ phô træ tµi!/#tbclassname:makeItemUI(%d)",
	szlevel = "ThËt ®¸ng tiÕc, ®¼ng cÊp kh«ng ®ñ 50, kh«ng thÓ tham gia ho¹t ®éng nµy.",
	szmoney = "ThËt ®¸ng tiÕc, ng©n l­îng mang theo kh«ng ®ñ.",
	szpay = "Xin lçi, b¹n vÉn ch­a n¹p thÎ, kh«ng thÓ gãi hoa.",
	szremake = "Trë l¹i/main",
	szitemfree="Kh«ng ®ñ chç trèng, h·y s¾p xÕp l¹i hµnh trang.",
}

--ÖÆ×÷ĞèÒª²ÄÁÏ
tbclassname.tb_Mareial =
{
	select1 = {
		{G=6,D=1,P=1681,szname="Bã hoa hång",num=1,nMoney=100000},
		{G=6,D=1,P=1679,szname="Cµnh hoa hång",num=10},
		},
	select2 = {
		{G=6,D=1,P=1682,szname="Bã hoa cóc",num=1,nMoney=50000},
		{G=6,D=1,P=1680,szname="Cµnh hoa cóc",num=10},
		},
}

function tbclassname:funmsg(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		local szmsg = format("Chóc mõng b¹n ®· nhËn ®­îc %d <color=yellow>%s<color>.",
							 tbtemp[1].num,
							 tbtemp[1].szname)
		return szmsg
end

function tbclassname:funtalkmake(nsign)
	local sztalkmake = tbclassname:funtalkmareial(nsign)
	sztalkmake = format("%s, b¹n muèn lµm kh«ng?",sztalkmake)
	return sztalkmake
end

function tbclassname:funtalkmlimit(nsign)
		local sztalkmake = tbclassname:funtalkmareial(nsign)
		sztalkmake = format("%s thiÕu kh«ng thÓ lµm. H×nh nh­ nguyªn liÖu lµm b¸nh ch­ng kh«ng ®ñ.",sztalkmake)
		return sztalkmake
end

function tbclassname:funtalkmareial(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		for ni,nitem in tbtemp do
			if ni ==1 then
					sztalkmake = format("LÔ quan: Muèn gãi %d<color=red>%s<color>, cÇn ",
							 	tbtemp[1].num,
							 	tbtemp[1].szname)
			else
				  sztalkmake = format("%s%d <color=red>%s<color>,",
						  	sztalkmake,
						  	tbtemp[ni].num,
						  	tbtemp[ni].szname)
			end
		end
		if tbtemp[1].nMoney > 0 then
					sztalkmake = format("%s<color=red>%d<color>,",
							sztalkmake,
							tbtemp[1].nMoney)
		end
		return sztalkmake
end

function tbclassname:check_event_date()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ( ( ndate > tbclassname.DA_START ) and ( ndate < tbclassname.DA_END ) ) then
		return 1
	end
	return 0
end

function tbclassname:check_level()		--ÅĞ¶ÏµÈ¼¶
	if GetLevel() < tbclassname.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function tbclassname:check_money(nsign)		--ÅĞ¶ÏÇ®
	szselect = tbclassname:getTaskItemName(nsign)
	if GetCash() < tbclassname.tb_Mareial[szselect][1].nMoney then
		return 0
	end
	return 1
end

function tbclassname:check_pay()		--ÅĞ¶Ï³äÖµÓÃ»§
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function tbclassname:pack(...)
	return arg
end

function tbclassname:getTaskItemName(nsign)		--»ñµÃtbÀà±ğÃû
	return format("select%s",nsign)
end

function tbclassname:checkFreeCount(ncount) --ÅĞ¶ÏÉíÉÏÊ£Óà¸ñÊı
	if CalcFreeItemCellCount() < ncount then
		return 0
	end
	return 1
end
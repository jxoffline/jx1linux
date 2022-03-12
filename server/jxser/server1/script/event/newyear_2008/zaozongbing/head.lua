--ÖÆ×÷ÎïÆ·lib
--by Ð¡ÀË¶à¶à
--2007-09-06
newyear2008_makezongzi = {}
tbclassname = newyear2008_makezongzi
tbclassname.TITLE = "Lµm b¸nh ch­ng"
tbclassname.DA_START = 0802020000	--¿ªÊ¼Ê±¼ä
tbclassname.DA_END 	= 0803022400	--½áÊøÊ±¼ä
tbclassname.LIMIT_LEVEL = 50		--µÈ¼¶ÏÞÖÆ

--ÔÂ±ýÖÆ×÷ÐèÒª²ÄÁÏ
tbclassname.tb_Mareial =
{
	select1 = {
		{G=6,D=1,P=1662,szname="B¸nh ch­ng th­îng h¹ng",num=1,nMoney=0},
		{G=6,D=1,P=1653,szname="L¸ b¸nh",num=4},
		{G=6,D=1,P=1654,szname="G¹o nÕp",num=3},
		{G=6,D=1,P=1655,szname="§Ëu xanh",num=2},
		{G=6,D=1,P=1656,szname="ThÞt heo ",num=1},
		{G=6,D=1,P=1660,szname="BÝ quyÕt lµm b¸nh ch­ng th­îng h¹ng",num=1},
		},
	select2 = {
		{G=6,D=1,P=1663,szname="B¸nh ch­ng h¶o h¹ng",num=1,nMoney=0},
		{G=6,D=1,P=1653,szname="L¸ b¸nh",num=4},
		{G=6,D=1,P=1654,szname="G¹o nÕp",num=3},
		{G=6,D=1,P=1655,szname="§Ëu xanh",num=2},
		{G=6,D=1,P=1656,szname="ThÞt heo ",num=1},
		{G=6,D=1,P=1661,szname="BÝ quyÕt lµm b¸nh ch­ng h¶o h¹ng",num=1}
		},
	select3 = {
		{G=6,D=1,P=1664,szname="B¸nh ch­ng th­êng",num=1,nMoney=20000},
		{G=6,D=1,P=1653,szname="L¸ b¸nh",num=4},
		{G=6,D=1,P=1654,szname="G¹o nÕp",num=3},
		{G=6,D=1,P=1655,szname="§Ëu xanh",num=2},
		{G=6,D=1,P=1656,szname="ThÞt heo ",num=1},
		},
--	select4 = {
--		{G=6,D=1,P=1513,szname="¿¾ÖíÔÂ±ý",num=1,nMoney=200000},
--		{G=6,D=1,P=1503,szname="·Û°ü",num=4},
--		{G=6,D=1,P=1504,szname="ÌÇ°ü",num=4},
--		{G=6,D=1,P=1505,szname="¼¦µ°°ü",num=4},
--		{G=6,D=1,P=1509,szname="ÖíÈâ°ü",num=1},
--		},
--	select5 = {
--		{G=6,D=1,P=1514,szname="ÔÂ±ýÀñºÐ",num=1,nMoney=300000},
--		{G=6,D=1,P=1510,szname="ÂÌ¶¹ÔÂ±ý",num=1},
--		{G=6,D=1,P=1511,szname="Á«×ÓÔÂ±ý",num=1},
--		{G=6,D=1,P=1512,szname="¿¾¼¦ÔÂ±ý",num=1},
--		{G=6,D=1,P=1513,szname="¿¾ÖíÔÂ±ý",num=1},
--		},		
}

tbclassname.tb_content =
{
	sztalk1 = "Thî b¸nh: §ang r¶nh, d¹o nµy sau ta kh«ng cã viÖc g× lµm nhØ!",
	sztalk2 = "Thî b¸nh: Thêi gian qua thËt nhanh, chíp m¾t ®· ®Õn tÕt råi, tay nghÒ lµm b¸nh ch­ng cña ta vÉn næi tiÕng x­a nay. Mçi n¨m ®Òu kh«ng Ýt ng­êi ®Õn nhê ta lµm giïm, vÞ kh¸ch quan nµy ch¼ng hay muèn lµm lo¹i nµo?",
	nselectsum = 3,
	szselect1 = format("Ta muèn lµm 1 c¸i %s/#tbclassname:getmakeitemsign(1)",tbclassname.tb_Mareial.select1[1].szname),
	szselect2 = format("Ta muèn lµm 1 c¸i %s/#tbclassname:getmakeitemsign(2)",tbclassname.tb_Mareial.select2[1].szname),
	szselect3 = format("Ta muèn lµm 1 c¸i %s/#tbclassname:getmakeitemsign(3)",tbclassname.tb_Mareial.select3[1].szname),
	szno = "Nh©n tiÖn ghÐ qua th«i/NoChoice",
	szmakeItemUI = "§óng! Xin l·o bèi træ tµi!/#tbclassname:makeItemUI(%d)",
	szlevel = "ThËt ®¸ng tiÕc, ®¼ng cÊp kh«ng ®ñ 50, kh«ng thÓ tham gia ho¹t ®éng nµy.",
	szmoney = "ThËt ®¸ng tiÕc, ng©n l­îng mang theo kh«ng ®ñ.",
	szpay = "Xin lçi, tµi kho¶n cña b¹n ch­a n¹p thÎ, kh«ng thÓ th­ëng thøc vµ chÕ t¹o b¸nh ch­ng th¬m ngon.",
	szremake = "Trë l¹i/main",
	szitemfree="Kh«ng ®ñ chç trèng, h·y s¾p xÕp l¹i hµnh trang."
	
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
					sztalkmake = format("Thî b¸nh: Muèn lµm %d c¸i <color=red>%s<color>, cÇn ",
							 	tbtemp[1].num,
							 	tbtemp[1].szname)
			else
				  sztalkmake = format("%s%d c¸i <color=red>%s<color>, ",
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

function tbclassname:check_level()		--ÅÐ¶ÏµÈ¼¶
	if GetLevel() < tbclassname.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function tbclassname:check_money(nsign)		--ÅÐ¶ÏÇ®
	szselect = tbclassname:getTaskItemName(nsign)
	if GetCash() < tbclassname.tb_Mareial[szselect][1].nMoney then
		return 0
	end
	return 1
end

function tbclassname:check_pay()		--ÅÐ¶Ï³äÖµÓÃ»§
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function tbclassname:pack(...)
	return arg
end

function tbclassname:getTaskItemName(nsign)		--»ñµÃtbÀà±ðÃû
	return format("select%s",nsign)
end

function tbclassname:checkFreeCount(ncount) --ÅÐ¶ÏÉíÉÏÊ£Óà¸ñÊý
	if CalcFreeItemCellCount() < ncount then
		return 0
	end
	return 1
end
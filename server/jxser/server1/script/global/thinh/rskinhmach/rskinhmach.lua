-- Program reset kinh mach -- Thinh Nguyen
Include("\\script\\global\\meridian\\meridian.lua")

function main()
	kinhmach()
end

--------------------------------------------------Kinh mach ------------------------------------------
function kinhmach()
	local szTitle = "Xin chµo <color=red>"..GetName().."<color> ! §¹i hiÖp muèn sö dông chøc n¨ng g×?"
	local tbOpt={}
	tinsert(tbOpt, "§æi HuyÕt Long §»ng/doi_HLD")
	tinsert(tbOpt, "Reset kinh m¹ch/reset_kinhmach_dialog")
	tinsert(tbOpt, "NhËn max kinh m¹ch/nhanmax_kinhmach")
	tinsert(tbOpt, "NhËn kinh m¹ch cÊp 4/nhan_kinhmach_4")
	tinsert(tbOpt, "Phôc håi chiªu hç trî sau tÈy tñy/restore_skillkinhmach")
	tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")			
	Say(szTitle, getn(tbOpt), tbOpt)
end

function doi_HLD()
	local szTitle = "§¹i hiÖp muèn ®æi HuyÕt Long §»ng ®Ó xung <color=yellow>huyÖt thø mÊy<color>?"
	local tbOpt={}
	for i = 5, 10 do
		tinsert(tbOpt, format("HuyÖt thø %d/#give_HLD(%d)", i, i))
	end
	tinsert(tbOpt, "Trang sau/doi_HLD2")
	tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")			
	Say(szTitle, getn(tbOpt), tbOpt)
end

function doi_HLD2()
	local szTitle = "§¹i hiÖp muèn ®æi HuyÕt Long §»ng ®Ó xung <color=yellow>huyÖt thø mÊy<color>?"
	local tbOpt={}
	for i = 11, 16 do
		tinsert(tbOpt, format("HuyÖt thø %d/#give_HLD(%d)", i, i))
	end
	tinsert(tbOpt, "Trang tr­íc/doi_HLD")
	tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")			
	Say(szTitle, getn(tbOpt), tbOpt)
end

function give_HLD(nLevel)
	local szTitle = "§Ó xung <color=yellow>huyÖt thø "..nLevel.."<color>, <color=green>mét §¹i Hé M¹ch §¬n<color> ®æi ®­îc <color=yellow>mét HuyÕt Long §»ng<color>, ®¹i hiÖp muèn ®æi bao nhiªu viªn?"
	local tbOpt={}
	tinsert(tbOpt, "10 viªn/#buy_HLD("..nLevel..",10)")
	tinsert(tbOpt, "30 viªn/#buy_HLD("..nLevel..",30)")
	tinsert(tbOpt, "50 viªn/#buy_HLD("..nLevel..",50)")
	tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")			
	Say(szTitle, getn(tbOpt), tbOpt)
end

local tbHLD = 
{
	[5] = {szName = "HuyÕt Long §»ng cÊp 4", tbProp = {6, 1, 30289,4}, nCount = 10}, --Item cÊp 4
	[6] = {szName = "HuyÕt Long §»ng cÊp 5", tbProp = {6, 1, 30289,5}, nCount = 10}, --Item cÊp 5
	[7] = {szName = "HuyÕt Long §»ng cÊp 6", tbProp = {6, 1, 30289,6}, nCount = 10}, --Item cÊp 6
	[8] = {szName = "HuyÕt Long §»ng cÊp 2", tbProp = {6, 1, 3328,2}, nCount = 10},
	[9] = {szName = "HuyÕt Long §»ng cÊp 8", tbProp = {6, 1, 30289,8}, nCount = 10}, --Item cÊp 8
	[10] = {szName = "HuyÕt Long §»ng cÊp 9", tbProp = {6, 1, 30289,9}, nCount = 10},--Item cÊp 9
	[11] = {szName = "HuyÕt Long §»ng cÊp 5", tbProp = {6, 1, 3328,5}, nCount = 10},
	[12] = {szName = "HuyÕt Long §»ng cÊp 6", tbProp = {6, 1, 3328,6}, nCount = 10},
	[13] = {szName = "HuyÕt Long §»ng cÊp 12", tbProp = {6, 1, 30289,12}, nCount = 10},--Item cÊp 12
	[14] = {szName = "HuyÕt Long §»ng cÊp 8", tbProp = {6, 1, 3328,8}, nCount = 10},
	[15] = {szName = "HuyÕt Long §»ng 14", tbProp = {6, 1, 30289,14}, nCount = 10},--Item cÊp 14
	[16] = {szName = "HuyÕt Long §»ng cÊp 10", tbProp = {6, 1, 3328,10}, nCount = 10},
}

function buy_HLD(nLevel, num)
	Msg2Player("Level cÇn mua lµ "..nLevel)
	if CalcItemCount(3, 6, 1, 4418, -1) < num then
		Talk(1, "", format("Ng­¬i kh«ng cã ®ñ <color=yellow>%d §¹i Hé M¹ch §¬n.", num))
	else
		local tbItem = %tbHLD[nLevel]
		AddStackItem(num, 6, 1, tbItem.tbProp[3], tbItem.tbProp[4], 0, 0, 0)
		Msg2Player(format("§æi ®­îc <color=yellow>%d viªn %s<color>.", num, tbItem.szName))
		ConsumeItem(3, num, 6, 1, 4418, -1)
	end
	
end

function restore_skillkinhmach()
	if (HaveMagic(1993) == 0) then 
		if (GetMagicPoint()>=1) then
			AddMagicPoint(-1)
			AddMagic(1993, 1) 
			Msg2Player("§· kh«i phôc <color=yellow>Kinh m¹ch s¬ cÊp.")
		else
			Talk(1, "", "CÇn Ýt nhÊt 1 ®iÓm kü n¨ng ®Ó t¨ng chiªu hç trî.")
			return 
		end
	else
		Talk(1, "", "Ng­¬i kh«ng cã g× cÇn hç trî thªm c¶.")
	end
	if (HaveMagic(1994) == 0) then 
		if (GetMagicPoint()>=1) then
			AddMagicPoint(-1)
			AddMagic(1994, 1) 
			Msg2Player("§· kh«i phôc <color=yellow>Kinh m¹ch trung cÊp.")
		else
			Talk(1, "", "CÇn Ýt nhÊt 1 ®iÓm kü n¨ng ®Ó t¨ng chiªu hç trî.")
			return 
		end 
	end
end

function nhan_kinhmach_4()
	for i= 1, 8 do 
			SetTask(4000+i, 4) -- 8 ®­êng kinh m¹ch ë cÊp 4
	end
	SetUpSkillIDAndLevel()
	Talk(1, "KickOutSelf", "Ng­¬i nhËn ®­îc 8 ®­êng kinh m¹ch cÊp 4.")
end

function max_kinhmach()
	local nTotal = 0
	for i= 4001, 4008 do 
		nTotal = nTotal + GetTask(i)
	end
	if nTotal == 8*16 then
		return 1;
	else
		return 0;
	end
end

function reset_kinhmach_dialog()
	local szTitle = "Muèn trïng luyÖn kinh m¹ch cÇn ph¶i max kinh m¹ch hiÖn thêi.\n"
	szTitle = szTitle.."Ngoµi ra ph¶i tiªu hao <color=yellow>100 §¹i hé m¹ch ®¬n vµ 50 000 ®iÓm Ch©n nguyªn.<color>\n"
	szTitle = szTitle.."§¹i hé m¹ch ®¬n cã thÓ t×m ®­îc khi tiªu diÖt <color=yellow>KÎ trém ch©n nguyªn<color> trèn t¹i <color=yellow>Ba L¨ng HuyÖn, 180, 213.<color>\n"
	local tbOpt={}
	tinsert(tbOpt, "Ta muèn t×m hiÓu thªm./info_rskinhmach")
	tinsert(tbOpt, "Ta ®ång ý tiÕn hµnh trïng luyÖn./reset_kinhmach")
	tinsert(tbOpt, "Ta sÏ t×m «ng sau./thongbao_nhiemvu_kinhmach")	
	Say(szTitle, getn(tbOpt), tbOpt)
end

function thongbao_nhiemvu_kinhmach()
	Msg2Player("KÎ trém ch©n nguyªn ®ang trèn t¹i <color=yellow>Ba L¨ng HuyÖn, 180, 213.<color>")
	Talk(1, "", "H·y tiªu diÖt nh÷ng kÎ trém ch©n nguyªn t¹i <color=yellow>Ba L¨ng HuyÖn, 180, 213.<color>.")
end

function info_rskinhmach()
	local szTitle = "Trïng luyÖn kinh m¹ch lÇn 1 sÏ së h÷u <color=yellow>Kinh m¹ch s¬ cÊp<color>, b¶o l­u 40\% tuyÖt kÜ ®· häc.\n"
	szTitle = szTitle.."Trïng luyÖn kinh m¹ch lÇn 2 sÏ së h÷u <color=yellow>Kinh m¹ch trung cÊp<color>, b¶o l­u 50\% tuyÖt kÜ ®· häc.\n"
	szTitle = szTitle.."Sau khi trïng luyÖn, nhËn ®­îc 8 ®­êng kinh m¹ch ë <color=yellow>cÊp 4/16.<color>\n"
	local tbOpt={}
	tinsert(tbOpt, "Quay l¹i./reset_kinhmach_dialog")
	tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")	
	Say(szTitle, getn(tbOpt), tbOpt)
end

function reset_kinhmach()
	if max_kinhmach() == 0 then
		Talk(1, "", "Kinh m¹ch hiÖn t¹i cña ng­¬i vÉn ch­a max, ch­a thÓ trïng luyÖn kinh m¹ch.")
	else
		local nCN = 50000
		local nDHMD = 100
		if GetTask(4000) < nCN or CalcItemCount(3, 6, 1, 4418, -1) < nDHMD then
			Talk(1, "", format("Ng­¬i kh«ng cã ®ñ %d Ch©n Nguyªn vµ %d §¹i Hé M¹ch §¬n.", nCN, nDHMD))
		else
			ConsumeItem(3, nDHMD, 6, 1, 4418, -1)
			SetTask(4000, GetTask(4000) - nCN)
			rskinhmach_nhanskill()
		end
	end
end

function rskinhmach_nhanskill()
	for i= 1, 8 do 
			SetTask(4000+i, 4) -- 8 ®­êng kinh m¹ch ë cÊp 4
	end
	SetUpSkillIDAndLevel()
	if HaveMagic(1993) >= 0 then
		AddMagic(1994,1)
		Talk(1, "KickOutSelf", "Ng­¬i ®· trïng luyÖn toµn bé kinh m¹ch, lÜnh héi ®­îc Kinh m¹ch trung cÊp.")
	else
		AddMagic(1993,1)
		Talk(1, "KickOutSelf", "Ng­¬i ®· trïng luyÖn toµn bé kinh m¹ch, lÜnh héi ®­îc Kinh m¹ch s¬ cÊp.")
	end
end

function nhanmax_kinhmach()
	if (HaveMagic(1993) >= 0) or (HaveMagic(1994) >= 0) then
		Talk(1, "", "Tr×nh ®é cña ng­¬i ®· cao råi, ®õng ¨n gian n÷a.")
	else
		local szTitle = "§Ó nhËn max kinh m¹ch cÇn tiªu hao 60 000 Ch©n Nguyªn vµ 30 000 Hé M¹ch §¬n? Ng­¬i cã ch¾c kh«ng?"
		local tbOpt={}
		tinsert(tbOpt, "Ta ch¾c ch¾n/nhanmax_kinhmach_sure")
		tinsert(tbOpt, "Th«i./no")			
		Say(szTitle, getn(tbOpt), tbOpt)
	end
end

function nhanmax_kinhmach_sure()
	local nCN = 60000
	local nHMD = 30000
	if GetTask(4000) < nCN or CalcItemCount(3, 6, 1, 3203, -1) < nHMD then
		Talk(1, "", format("Ng­¬i kh«ng cã ®ñ %d Ch©n Nguyªn vµ %d Hé M¹ch §¬n.", nCN, nHMD))
	else
		ConsumeItem(3, nHMD, 6, 1, 3203, -1)
		SetTask(4000, GetTask(4000) - nCN)
		set_max_kinhmach()
	end
end

function set_max_kinhmach()
	for i= 1, 8 do 
			SetTask(4000+i, 16)
	end
	SetUpSkillIDAndLevel()
	Talk(1, "KickOutSelf", "Ng­¬i ®· nhËn ®­îc 8 ®­êng kinh m¹ch max.")
end
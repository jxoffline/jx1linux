--ÖÐÇï½Ú2007 ÔÂ±ýÀñºÐ
--by Ð¡ÀË¶à¶à
--2007-09-07

Include("\\script\\event\\zhongqiu2007\\head.lua")

function mainzhongqiu2007_entry()
	Describe("LÔ Quan: V©n Du vµ Tiªn Vò lµ hai bøc danh häa vèn ®­îc cÊt gi÷ t¹i hoµng cung, do chiÕn tranh liªn miªn nªn bÞ vì thµnh nhiÒu m¶nh vµ thÊt l¹c kh¾p n¬i. Nghe nãi <color=yellow>Hoa viªn ngo¹i t¹i L©m An (169/194)<color> vµ <color=yellow>Qu¸ch viªn ngo¹i thµnh T­¬ng D­¬ng (198/208) <color>®ang cÊt c«ng t×m kiÕm 2 bøc tranh nµy, ai cã thÓ gióp hä t×m ®­îc hai bøc tranh nµy sÏ nhËn ®­îc phÇn th­ëng xøng ®¸ng. Trung Thu s¾p ®Õn råi, trong hoµng cung còng cÇn lµm nhiÒu b¸nh Trung Thu. Tõ <color=red>22-09-2007<color> ®Õn <color=red>24h00 ngµy 31-10-2007<color>, mçi hép b¸nh ®Òu cã x¸c suÊt nhËn ®­îc <color=red>m¶nh tranh V©n Du<color> hoÆc <color=red>m¶nh tranh Tiªn Vò<color>, ®¹i hiÖp muèn ®æi g×?",2,"§©y lµ hép b¸nh Trung Thu, xin h·y nhËn lÊy./zhongqiu2007_getlihe","Ta sÏ quay l¹i sau!/NoChoice")
end

function zhongqiu2007_getlihe()
	if check_level() == 0 then
		Say(tb_content["szlevel"],0)
		return 1
	end
	if check_pay() == 0 then
		Say(tb_content["szpay"],0)
		return 1
	end
	if CalcEquiproomItemCount(6,1,1514,-1) < 1 then
		Say("LÔ Quan: §¹i hiÖp kh«ng mang theo hép b¸nh Trung Thu, cã ph¶i ®· ®Ó quªn trong r­¬ng råi kh«ng?",0)
		return 1
	end
	if CalcFreeItemCellCount() < 4 then
		Say("LÔ Quan: Hµnh trang kh«ng ®ñ chç trèng, h·y s¾p xÕp l¹i hµnh trang.",0)
		return 1
	end

	local ncurexp = GetTask(TSK_ZHONGQIU2007_LIHE)
	local nexp = 8000000
	if ncurexp >= NZHONGQIU2007_MAX then
		Msg2Player("§iÓm kinh nghiÖm nhËn ®­îc ®· v­ît giíi h¹n.")
		return 1
	else
		if(ncurexp + nexp) >= NZHONGQIU2007_LIHE_MAX then
			nexp = NZHONGQIU2007_LIHE_MAX - ncurexp
		end
		SetTask(TSK_ZHONGQIU2007_LIHE,(ncurexp+nexp))
		AddOwnExp(nexp)
		Msg2Player(format("NhËn ®­îc <color=yellow>%s<color> ®iÓm kinh nghiÖm",nexp))
		WriteLog(format("[zhongqiu2007_lihe]\t Date:%s\t Account:%s\t Name:%s\t GetExp:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nexp));
	end
	ConsumeEquiproomItem(1,6,1,1514,-1)
	local nrate = random(1,tb_Mareial_LIHE[1]);
	local nsum = 0
	for nkey,nitem in tb_Mareial_LIHE[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial_LIHE[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local nidx = AddItem(g,d,p,1,0,0)
				Msg2Player(format("B¹n nhËn ®­îc 1 <color=yellow>%s<color>",GetItemName(nidx)))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
				return 0
			end
	end
end

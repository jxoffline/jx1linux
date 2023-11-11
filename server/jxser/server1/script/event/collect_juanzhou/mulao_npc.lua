
Include("\\script\\lib\\pay.lua");	--³äÖµµÄÅĞ¶Ï

function main()
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate >= 70314 and nDate <= 70321) then
		Say("L·o phu ®ang thu thËp c¸c m¶nh mËt ®å thÇn bİ, nÕu c¸c vŞ cã thÓ gióp ta t×m, l·o phu nhÊt ®Şnh sÏ tr¶ c«ng hËu hÜ", 3,
					"§æi10 mËt ®å thÇn bİ lÊy R­¬ng b¹c/sure2takeboxaward",
					"§æi 10 mËt ®å thÇn bİ vµ Kim th¹ch lÊy R­¬ng vµng/sure2takeboxaward",
					"Ta cßn viÖc kh¸c ph¶i lµm/OnCancel");
	else
		Say("NÕu cã thÓ thu thËp ®­îc m¶nh b¶n ®å thÇn bİ, sÏ ph¸t hiÖn ra thªm nhiÒu ®­îc kho tµng bİ Èn",  0);
	end;
end;

function sure2takeboxaward(nSel)
	local nboxtype = nSel;
	local nmylevel = GetLevel();
	if (nmylevel < 50 or IsCharged() ~= 1) then
		Say("ThËt ng¹i qu¸! ChØ cã ng­êi ch¬i <color=yellow>cÊp tõ 50 trë lªn<color> ®· n¹p thÎ míi cã thÓ tham gia ho¹t ®éng nµy.", 0);
		return
	end;
	
	local njuanzhou = CalcEquiproomItemCount(6,1,196,-1);
	if (njuanzhou < 10) then
		Say("T×m ®ñ 10 tÊm mËt ®å thÇn bİ råi quay l¹i t×m L·o phu nhĞ!", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 6) then
		Say("Xin s¾p xÕp l¹i hµnh trang tr­íc ®·!", 0);
		return
	end;
	--¾íÖá¹»ÁË£¬¿´ÒªÊ²Ã´±¦Ïä
	if (nboxtype == 1) then	--»Æ½ğ
		if (CalcEquiproomItemCount(6,1,1376,-1) >= 1) then
			ConsumeEquiproomItem(1,6,1,1376,-1);
			ConsumeEquiproomItem(10, 6, 1, 196, -1)	--É¾³ıµş¼ÓµÄÉñÃØ¾íÖácount¸ö
			AddItem(6,1,1377,1,0,0);
			Msg2Player("NhËn ®­îc <color=yellow>R­¬ng vµng");
			WriteLog(format("[Ho¹t ®éng thu thËp m¶nh mËt ®å thÇn bİ] \t %s\t Tªn:%s\t Account: %s\t nhËn ®­îc mét r­¬ng vµng",
														GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
		else
			Say("Kh«ng cã Kim th¹ch chØ cã thÓ ®æi lÊy R­¬ng b¹c, ®ång ı chø?", 2, 
						"§æi10 mËt ®å thÇn bİ lÊy R­¬ng b¹c/sure2takeboxaward", 
						"§Ó ta s¾p l¹i hµnh trang ®·/OnCancel");
			return
		end;
	else										--°×Òø
		ConsumeEquiproomItem(10, 6, 1, 196, -1)	--É¾³ıµş¼ÓµÄÉñÃØ¾íÖácount¸ö
		AddItem(6,1,1378,1,0,0);
		Msg2Player("NhËn ®­îc <color=yellow>R­¬ng b¹c");
		WriteLog(format("[Ho¹t ®éng thu thËp m¶nh mËt ®å thÇn bİ]\t %s\t Name: %s\t Account: %s\t nhËn ®­îc 1 R­¬ng b¹c",
														GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
	end;
	Say("VÊt v¶ qu¸! §©y lµ chót lßng thµnh cña l·o phu, xin h·y nhËn lÊy!", 0);
end;

function OnCancel()
end;
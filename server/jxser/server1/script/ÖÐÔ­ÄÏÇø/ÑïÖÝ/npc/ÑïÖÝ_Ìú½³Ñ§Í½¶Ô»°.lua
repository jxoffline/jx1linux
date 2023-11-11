--ÖĞÔ­ÄÏÇø ÑïÖİ¸® Ìú½³Ñ§Í½¶Ô»°
Include("\\script\\global\\fantasygoldequip\\fantasygoldequip_npc.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbOption = {"<dec><npc>Mét ngµy lµm trß suèt ®êi lµm trß.S­ phô nãi råi,«ng Êy kh«ng cã con trai,100 n¨m sau c¸i tiÖm rÌn nµy sÏ lµ cña ta"}
	if IS_FANTASY_OPEN == 1 then
		tinsert(tbOption, "T×m hiÓu th«ng tin trang bŞ HuyÒn Kim/fantasygoldequip_entry")
	end
	tinsert(tbOption, "Ta chØ ®Õn ch¬i/Cancel")

	CreateTaskSay(tbOption);
end

function fantasygoldequip_entry()

	local tbOption = {
		"<dec><npc>§· bao nhiªu n¨m råi,kh«ng ngê ®Õn tõ ngµy ta tho¸t khái ®¶o NguyÖt Ca ®· mai danh Èn tİch ®Õn nay nh­ng ng­¬i vÉn t×m ®­îc ta,ng­¬i cã ı g×?",
		"N©ng cÊp HuyÒn Kim hoÆc HuyÒn Kim Chi Tinh/fantasygold_upgrade",
		"Ta t×m ®­îc HuyÒn Kim Chi Tinh råi,xin chÕ t¹o trang bŞ HuyÒn Kim cho ta/gen_fantasygoldequip",
		"Ta t×m ®­îc HuyÒn Kim råi,xin n©ng cÊp trang bŞ HuyÒn Kim cho ta/upgrade_fantasygoldequip",
		"Xin th¸o trang bŞ HuyÒn Kim cho ta/split_fantasygoldequip",
		"Nguån gèc trang bŞ HuyÒn Kim/fantasygoldequip_history",
		"Ta chØ ®Õn ch¬i/calcel",
	};
	CreateTaskSay(tbOption);
end

function gen_fantasygoldequip()
	local tbOption = {
		"<dec><npc>Cã thÓ t×m ®­îc HuyÒn Kim Chi Tinh,thËt kh«ng dÔ dµng.L¹i t×m ®­îc ë chç ta vËy ta sÏ thö mét lÇn",
		"Ta muèn biÕt thuéc tİnh cña trang bŞ HuyÒn Kim sau khi chÕ t¹o/newgold_to_fantasygold_preview",
		"Xin chÕ t¹o trang bŞ HuyÒn Kim cho ta/newgold_to_fantasygold",
		"Ta chØ ®Õn ch¬i/cancel",
	};
	CreateTaskSay(tbOption);
end

function upgrade_fantasygoldequip()
	local tbOption = {
		"<dec><npc>Cã thÓ t×m ®­îc sè l­îng lín HuyÒn Kim,thËt kh«ng dÔ dµng.L¹i t×m ®­îc ë chç ta vËy ta sÏ thö mét lÇn",
		"Ta muèn biÕt thuéc tİnh cña trang bŞ HuyÒn Kim sau khi n©ng cÊp/fantasygoldequip_upgrade_preview",
		"Xin n©ng cÊp trang bŞ HuyÒn Kim cho ta/fantasygoldequip_upgrade",
		"Ta chØ ®Õn ch¬i/cancel",
	};
	CreateTaskSay(tbOption);
end

function split_fantasygoldequip()
	local tbOption = {
		"<dec><npc>Sau khi th¸o bá trang bŞ HuyÒn Kim th× sÏ c¨n cø theo tr¹ng th¸i khãa mµ më thêi gian khãa t­¬ng ®­¬ng.Trang bŞ HuyÒn Kim còng sÏ vÒ tr¹ng th¸i +0 vµ sÏ tr¶ mét sè nguyªn liÖu HuyÒn Kim.Cã cÇn ta gióp kh«ng?",
		"H·y gióp ta th¸o bá trang bŞ HuyÒn Kim/split_fantasygoldequip_configm",
		"Ta kh«ng th¸o bá n÷a/cancel",
	};
	CreateTaskSay(tbOption);
end

function fantasygoldequip_history()
	local tbOption = {
		"<dec><npc>Cha ta lµ thî rÌn binh nhÊt trªn ®¶o NguyÖt Ca,kh«ng muèn ®êi ®êi kiÕp kiÕp ph¶i lµm n« trªn ®¶o nªn ®· nghÜ tr¨m c¸ch cho ta rêi khái ®¶o vµ truyÒn bİ kİp rÌn l¹i cho ta.Ta mai danh Èn tİnh ®Õn nay chØ muèn lµm mét ng­êi b×nh th­êng nh­ng ng­¬i vÉn t×m ®Õn ®­îc nÕu kh«ng gióp ng­¬i ta nghÜ ng­¬i sÏ kh«ng ®Ó yªn nh­ vËy",
		"Xin h·y gióp ta,ta sÏ kh«ng tiÕt lé bİ mËt nµy/fantasygoldequip_entry",
		"Mét ®øa häc trß nhá d¸m lõa dèi ta/cancel",
	};
	CreateTaskSay(tbOption);
end


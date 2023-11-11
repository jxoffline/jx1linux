Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

TB_JiangHuXingBaoDian = {
		[32] = {
			szTitleMsg = "<dec>§· tr·i qua biÕt bao nhiªu ©n o¸n giang hå, ng­¬i cã ph¶i lµ ®· cã mét ®¸m huynh ®Ö tû muéi ®ång cam céng khæ? Ng­¬i cã muèn l·nh ®¹o hä, cïng nhau t¹o ra mét m«n vâ c«ng V¹n ThÕ BÊt DiÖt, c­íp ®o¹t quyÒn së h÷u b¶y thµnh tr×, ®Ó cho hä cã thÓ cïng nhau h­ëng vinh hoa phó quı. VËy th× h·y lËp ra bang héi riªng cho m×nh, viÕt vµo ®ã c¸c ©n o¸n t×nh thï, nhi n÷ t×nh tr­êng, c­íp thuyÒn, ®o¹t thµnh, c­íp boss~",
			tbOpt = {
				[1] = {"Thµnh lËp bang héi", 33},
				[2] = {"Khu vùc bang héi", 34},
				[3] = {"kÕt cÊu tæ chøc", 35},
				[4] = {"quü cña bang héi", 36},
				[5] = {"lîi nhuËn cña bang héi", 37},
				[6] = {"Liªn minh bang héi", 38},
				[7] = {"Môc tiªu bang héi hµng tuÇn", 39},
				[8] = {"bang héi gi¶i t¸n", 40}
			},
		},
		[33] = { szTitleMsg = "<dec>Sau khi héi ®ñ c¸c ®iÒu kiÖn bªn d­íi, ng­¬i cã thÓ ®Õn Hoa S¬n (293.218) t×m Tèng Kim ch­ëng m«n nh©n ®Ó thµnh lËp bang héi.<enter>1.Gamer kh«ng thuéc bang héi, m«n ph¸i nµo, hiÖn lªn ch÷ ®á.§¼ng cÊp trïng sinh 2 150 trë lªn<enter>3.gi¸ trŞ thanh väng 450 trë lªn, thanh väng cã thÓ nhËn ®­îc th«ng qua lµm nhiÖm vô, bao gåm nhiÖm vô t©n thñ <enter>4 tû lÖ thèng kª 30 trë lªn <enter>5. chiÕn lîi phÈm Tèng Kim ®¹i thµnh:Nh¹c V­¬ng KiÕm (§iÓm tİch luü tèng Kim cã thÓ dïng ®Ó ®æi Nh¹c V­¬ng hån th¹ch t¹i Qu©n Nhu Quan, 100 Nh¹c V­¬ng Hån Th¹ch cã thÓ ®æi ®­îc 1 thanh Nh¹c V­¬ng KiÕm; cã thÓ mua trùc tiÕp Nh¹c V­¬ng KiÕm lÔ bao t¹i Kú Tr©n C¸t më ra ®Ó nhËn).<enter>6.TiÒn:100 v¹n l­îng",tbOpt = {{"Trë vÒ", 32},},},
		[34] = { szTitleMsg = "<dec>Ng­¬i cã thÓ tíi chç tÕ r­îu cña thÊt ®¹i thµnh thŞ sö dông d¹o cô'Thanh ®ång ®Ønh' ®Ó thiÕt lËp mét tÊm b¶n ®å ®éc lËp cña bang héi, ®èi víi b¶y thµnh thŞ kh¸c nhau th× b¶n ®å sÏ kh¸c nhau",tbOpt = {{"Trë vÒ", 32},},},
		[35] = { szTitleMsg = "<dec>ng­¬i cã thÓ ra lÖnh cho nhiÒu nhÊt lµ 7 tr­ëng l·o, nhiÒu nhÊt 56 ®éi tr­ëng, ®èi víi c¸c hÖ ph¸i kh¸c nhau cã thÓ ®æi nhiÒu nhÊt 56 tªn, mçi tªn dµi nhÊt lµ 4 ch÷ h¸n",tbOpt = {{"Trë vÒ", 32},},},
		[36] = { szTitleMsg = "<dec>Quü bang héi lµ mét hÖ thèng chung, dïng ®Ó cÊt gi÷ tµi s¶n chung cña bang héi",tbOpt = {{"Trë vÒ", 32},},},
		[37] = { szTitleMsg = "<dec>Ng­¬i cã thÓ th«ng qua ph­¬ng thøc tiÒn th­ëng ®Ó ph©n chia quü cho c¸c thµnh viªn bang héi, cã thÓ th«ng qua giao diÖn tiÒn th­ëng ph©n chia ph¸t th­ëng cho 3 cÊp bËc kh¸c nhau cña bang héi lµ tr­ëng l·o, ®éi tr­ëng vµ bang chóng",tbOpt = {{"Trë vÒ", 32},},},
		[38] = { szTitleMsg = "<dec>Ng­¬i còng cã thÓ liªn kÕt víi c¸c bang héi kh¸c lËp thµnh liªn minh bang héi, trong mçi bang héi liªn minh cÇn ph¶i cã mét bang héi minh chñ, cã İt nhÊt mét bang héi thµnh viªn, vµ kh«ng v­ît qu¸ 7 bang héi thµnh viªn",tbOpt = {{"Trë vÒ", 32},},},
		[39] = { szTitleMsg = "<dec>Do hÖ thèng chän ngÉu nhiªn mét trong c¸c tİnh n¨ng Tèng Kim, D· TÈu, V­ît AØ,…ChØ cã bang héi míi hoµn thµnh nhiÖm vô nµy.C¸c thµnh viªn bang héi ®Òu cã thÓ nhËn ®­îc nh÷ng lîi İch phong phó, bang chñ cßn cã thÓ nhËn ®­îc lÖnh bµi BOSS",tbOpt = {{"Trë vÒ", 32},},},
		[40] = { szTitleMsg = "<dec>Khi bang héi ng­¬i kh«ng ®ñ 16 ng­êi th× sÏ tiÕn vµo kú kh¶o nghiÖm, nÕu nh­ sau 3 ngµysè thµnh viªn kh«ng ®ñ 16 ng­êi th× bang héi sÏ gi¶i t¸n. H·y t¹o t×nh ®oµn kÕt gi÷a c¸c anh em trong bang",tbOpt = {{"Trë vÒ", 32},},},
	};
	
function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>VŞ thiÕu hiÖp nµy cã muèn gia nhËp bang héi kh«ng?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	
	tbDailog:AddOptEntry("Xem tin tøc hç trî bang héi", TongHelp);
	tbDailog:AddOptEntry("Më giao diÖn chiªu mé bang héi", NeedOpenTongZhaoMu);
	
	tbDailog:Show()
end

function jianghuxing_showdiag(nidx, nbackidx)
	local tb_dailog = {};
	
	if (not TB_JiangHuXingBaoDian[nidx].szTitleMsg) then
		print("Error!!There Is No Titlemsg!!");
		return
	end
	
	tb_dailog[1] = TB_JiangHuXingBaoDian[nidx].szTitleMsg;
	
	if (TB_JiangHuXingBaoDian[nidx].tbOpt) then
		for nkey, szopp in TB_JiangHuXingBaoDian[nidx].tbOpt do
			tinsert(tb_dailog, format("%s/#jianghuxing_showdiag(%d)", szopp[1], szopp[2]));
		end
	end
	
	tinsert(tb_dailog, "KÕt thóc ®èi tho¹i/OnCancel");
	
	CreateTaskSay(tb_dailog);
end

function OnCancel()
end

function NeedOpenTongZhaoMu()
	OpenTongZhaoMu()
end

function TongHelp()
	jianghuxing_showdiag(32)
end

IncludeLib("RELAYLADDER")

Include("\\script\\lib\\awardtemplet.lua");
tbDenggaoItemAward =
{
	[1]		= {szName = "Tói thøc ¨n",		tbProp = {3, 6, 1, 2018, -1},	nScore = 10},
	[2]		= {szName = "B×nh n­íc", 		tbProp = {3, 6, 1, 2019, -1},	nScore = 30},
	[3]		= {szName = "Tói vËt dông c¸ nh©n", 	tbProp = {3, 6, 1, 2016, -1},	nScore = 260},
	[4]		= {szName = "Tói Y TÕ", 		tbProp = {3, 6, 1, 2017, -1},	nScore = 60},
};

tbDenggaoScore =
{
	[1]	= {500, 	2000000,	"Xin chóc mõng! B¹n ®· ®¹t ®Õn ®é cao 500m, con ®­êng phÝa tr­íc sÏ rÊt cheo leo vµ hiÓm trë, h·y cè lªn nhÐ!"},
	[2]	= {1000, 	3000000,	"Xin chóc mõng! B¹n ®· ®¹t ®Õn ®é cao 1000m, con ®­êng phÝa tr­íc sÏ rÊt cheo leo vµ hiÓm trë, h·y cè lªn nhÐ!"},
	[3]	= {1500, 	5000000,	"Xin chóc mõng! B¹n ®· ®¹t ®Õn ®é cao 1500m, con ®­êng phÝa tr­íc sÏ rÊt cheo leo vµ hiÓm trë, h·y cè lªn nhÐ!"},
	[4]	= {2000, 	10000000,	"Xin chóc mõng! B¹n ®· ®¹t ®Õn ®é cao 2000m, con ®­êng phÝa tr­íc sÏ rÊt cheo leo vµ hiÓm trë, h·y cè lªn nhÐ!"},
	[5]	= {2200, 	15000000,	"MÆt trêi ®· ®øng bãng, h·y dõng ch©n 1 l¸t. Tõ ®©y trë ®i, chóng ta sÏ ph¶i v­ît qua rÊt nhiÒu ngän nói cao h¬n"},
	[6]	= {2800, 	20000000,	"Trêi ®· tèi råi, h·y dùng lÒu ®Ó nghÜ ng¬i, ®ªm nay chóng ta sÏ cïng ®èt löa vµ ca h¸t!"},
	[7]	= {2900, 	20000000,	"Ch¾c h¼n søc kháe cña b¹n ®· håi phôc sau 1 ®ªm ngon giÊc. Cßn chÇn chê g× n÷a, h·y t¨ng tèc thËt nhanh ®Ó cïng lªn ®Ønh Fansipan nµo"},
	[8]	= {3000, 	20000000,	"Cè g¾ng lªn nµo. Chóng ta ®· nh×n thÊy ®Ønh Fansipan råi!"},
	[9]	= {3143, 	30000000,	"Chóc mõng! B¹n ®· chinh phôc ®Ønh FanXiPan råi!"},
};

tbTop10Award	=
{
	[1]	=
	{
		[1]	= {szName = "Thiªn S¬n TuyÕt Liªn", tbProp = {6, 1, 1431, 1, 0, 0}}, 
		[2]	= {szName = "HuyÒn Ch©n §¬n",	tbProp = {6, 1, 1678, 1, 0, 0}, tbParam = {1500000000}},
		[3]	= {szName = "ThÇn bÝ kho¸ng th¹ch", tbProp = {6, 1, 398, 1, 0, 0}},
	},
	[2]	=
	{
		[1]	= {szName = "Thiªn S¬n TuyÕt Liªn", tbProp = {6, 1, 1431, 1, 0, 0}}, 
		[2]	= {szName = "HuyÒn Ch©n §¬n",	tbProp = {6, 1, 1678, 1, 0, 0}, tbParam = {1500000000}},
	},
	[3]	=
	{
		[1]	= {szName = "Thiªn S¬n TuyÕt Liªn", tbProp = {6, 1, 1431, 1, 0, 0}},
		[3]	= {szName = "ThÇn bÝ kho¸ng th¹ch", tbProp = {6, 1, 398, 1, 0, 0}},
	},
	[4]	= {szName = "Thiªn S¬n TuyÕt Liªn", tbProp = {6, 1, 1431, 1, 0, 0}},
	[5]	= {szName = "Thiªn S¬n TuyÕt Liªn", tbProp = {6, 1, 1431, 1, 0, 0}},
	[6]	= {szName = "Thiªn S¬n TuyÕt Liªn", tbProp = {6, 1, 1431, 1, 0, 0}},
	[7]	= {szName = "Thiªn S¬n TuyÕt Liªn", tbProp = {6, 1, 1431, 1, 0, 0}},
	[8]	= {szName = "Thiªn S¬n TuyÕt Liªn", tbProp = {6, 1, 1431, 1, 0, 0}},
	[9]	= {szName = "Thiªn S¬n TuyÕt Liªn", tbProp = {6, 1, 1431, 1, 0, 0}},
	[10]= {szName = "Thiªn S¬n TuyÕt Liªn", tbProp = {6, 1, 1431, 1, 0, 0}},
};

function item_exchange_score()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("§¹i hiÖp vÉn ch­a ®ñ cÊp 50 hoÆc vÉn ch­a nép thÎ, v× vËy kh«ng thÓ tham gia ho¹t ®éng", 0);
		return
	end
	local ndate = tonumber(GetLocalDate("%m%d"));
	if (GetTask(jf0904_TSK_denggao_ndate) ~= ndate) then
		SetTask(jf0904_TSK_denggao_ndate, ndate);
		SetTask(jf0904_TSK_denggao_curscore, 0);
	end
	tbDialog = {};
	for i = 1, getn(tbDenggaoItemAward) do
		tinsert(tbDialog, format("%s/#useitem(%d)", tbDenggaoItemAward[i].szName, i));
	end
	tinsert(tbDialog, getn(tbDialog)+1, "Ta chØ tiÖn ®­êng ®Õn ch¬i./OnCancel");
	Say("Xin mêi chän vËt phÈm muèn ®æi", getn(tbDialog), unpack(tbDialog));
end

function useitem(nIdx)
	local nCount = CalcItemCount(unpack(tbDenggaoItemAward[nIdx].tbProp));	-- ±³°üÖÐµÄµ±Ç°ÎïÆ·ÊýÁ¿
	
	if (nCount == 0) then
		Say(format("Trong hµnh trang kh«ng cã %s!", tbDenggaoItemAward[nIdx].szName), 0);
		return
	end
	
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_totscore, 3143);
		Say("§iÓm tÝch lòy cña ®¹i hiÖp ®· ®Õn giíi h¹n cao nhÊt, h·y ®æi phÇn th­ëng tr­íc ®i ®·.", 0);
		return
	end
	
	local nCurScore = GetTask(jf0904_TSK_denggao_curscore);
	if (nCurScore + tbDenggaoItemAward[nIdx].nScore > 500) then
		Say(format("Mçi ng­êi mçi ngµy chØ ®­îc  500 ®iÓm tÝch lòy tõ ho¹t ®éng, h«m nay ®· thu ®­îc %d ®iÓm, kh«ng thÓ sö dông thªm %s", nCurScore, tbDenggaoItemAward[nIdx].szName));
		return
	end
	
	if (floor((500 - nCurScore)/tbDenggaoItemAward[nIdx].nScore) < nCount) then
		nCount = floor((500 - nCurScore) / tbDenggaoItemAward[nIdx].nScore);
	end
	SetTaskTemp(114, nIdx);
	AskClientForNumber("exchangeitem", 0, nCount, "NhËp sè cÇn ®æi")
end

function exchangeitem (nCount)
	local nIdx = GetTaskTemp(114);
	local tbProp = tbDenggaoItemAward[nIdx].tbProp;
	
	local n_Count 	= CalcItemCount(unpack(tbProp));	-- ±³°üÖÐµÄµ±Ç°ÎïÆ·ÊýÁ¿
	local nCurScore	= GetTask(jf0904_TSK_denggao_curscore);
	if (floor((500 - nCurScore)/tbDenggaoItemAward[nIdx].nScore) < n_Count) then
		n_Count = floor((500 - nCurScore) / tbDenggaoItemAward[nIdx].nScore);
	end
	if (nCount > n_Count) then
		Msg2Player("NhËp sè sai!", 0);
		return
	end
	
	local bP = ConsumeItem(tbProp[1], nCount, tbProp[2], tbProp[3], tbProp[4], tbProp[5]); --  ·µ»Ø1¿Û³ý³É¹¦£¬·µ»Ø0Ê§°Ü£¬nCountÎªÖ¸¶¨¿Û³ýµÄÊýÁ¿
	if (bP <= 0) then
		print(format("Trõ %s thÊt b¹i!", tbDenggaoItemAward[nIdx].szName));
		return
	end
	
	local nAddedScore = nCount * tbDenggaoItemAward[nIdx].nScore;
	SetTask(jf0904_TSK_denggao_curscore, GetTask(jf0904_TSK_denggao_curscore) + nAddedScore);	-- Ã¿ÌìµÄ»ý·ÖÒª¼Ó¸öµ±Ç°µÄ·ÖÊý
	Say(format("§æi thµnh c«ng %d %s, ®iÓm tÝch lòy h«m nay lµ %d.", nCount, tbDenggaoItemAward[nIdx].szName, GetTask(jf0904_TSK_denggao_curscore)), 0);
	SetTask(jf0904_TSK_denggao_totscore, GetTask(jf0904_TSK_denggao_totscore) + nAddedScore);
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_totscore, 3143);
		Say("§iÓm tÝch lòy ®· ®¹t ®Õn giíi h¹n cao nhÊt, tr­íc tiªn h·y ®æi ®iÓm thµnh phÇn th­ëng ®i ®·.", 0);
	end
end

function view_score()
	Say(format("§iÓm tÝch lòy hiÖn thêi lµ %d, ®¹i hiÖp cã muèn ®æi phÇn th­ëng kh«ng?", GetTask(jf0904_TSK_denggao_totscore)), 2, "Muèn/turn_score_2_exp", "Ta chØ hái qua cho biÕt/OnCancel");
end

function turn_score_2_exp()
	if (GetTask(jf0904_TSK_denggao_totscore) < tbDenggaoScore[GetTask(jf0904_TSK_denggao_nidx)][1]) then
		Say("HiÖn t¹i ®¹i hiÖp kh«ng thÓ ®æi thµnh phÇn th­ëng ®­îc.", 0);
		return
	end
	
	for i = GetTask(jf0904_TSK_denggao_nidx), getn(tbDenggaoScore) do
		if (GetTask(jf0904_TSK_denggao_totscore) >= tbDenggaoScore[i][1]) then
			Say(tbDenggaoScore[i][3], 0);
			if (tbDenggaoScore[i][2] + GetTask(jf0904_TSK_denggao_totexp) > 500000000)then
				AddOwnExp(500000000 - GetTask(jf0904_TSK_denggao_totexp))
				SetTask(jf0904_TSK_denggao_totexp, 500000000);
			else
				AddOwnExp(tbDenggaoScore[i][2]);
				SetTask(jf0904_TSK_denggao_totexp, GetTask(jf0904_TSK_denggao_totexp) + tbDenggaoScore[i][2]);	
			end
		else
			SetTask(jf0904_TSK_denggao_nidx, i);
			break;
		end
	end
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_nidx, 1);
		SetTask(jf0904_TSK_denggao_totscore, 0);
		SetTask(jf0904_TSK_denggao_gettoptimes, GetTask(jf0904_TSK_denggao_gettoptimes)+1);
		if (GetTask(jf0904_TSK_denggao_gettoptimes) == 1) then
			Ladder_NewLadder(10262, GetName(), 3143, 0);
		end
	end
end

function view_top10_player()
	tbRoleName = {};
	for i = 1, 10 do
		RoleName = Ladder_GetLadderInfo(10262, i);
		if (RoleName == "" and i == 1) then
			Say("B¶ng xÕp h¹ng t¹m thêi ch­a cã th«ng tin!", 0);
			return
		end
		tinsert(tbRoleName, getn(tbRoleName)+1, "h¹ng thø "..i.."Thø h¹ng: \t"..RoleName.."/OnCancel");
	end
	tinsert(tbRoleName, getn(tbRoleName)+1, "Ta chØ ®Õn xem!/OnCancel");
	Say("B¶ng xÕp h¹ng:", getn(tbRoleName), unpack(tbRoleName));
end

function get_award()
	if CalcFreeItemCellCount() < 3 then
		Say("§Ó b¶o ®¶m an toµn cho vËt phÈm, xin mêi ®Ó hµnh trang cßn thõa 3 « trèng", 0);
		return
	end
	local nrank = 0;
	for i = 1, 10 do
		RoleName = Ladder_GetLadderInfo(10262, i);
		if (RoleName == GetName()) then
			nrank = i;
			break;
		end
	end
	if (nrank <= 0 or nrank > 10) then
		Say("§¹i hiÖp vÉn ch­a vµo b¶ng xÕp h¹ng nªn kh«ng thÓ nhËn th­ëng ®­îc", 0);
		return
	end
	if(GetTask(jf0904_TSK_denggao_getaward) == 0) then
		tbAwardTemplet:GiveAwardByList(tbTop10Award[nrank], "NhËn th­ëng top 10 chinh phôc ®Ønh FanXiPan");
		Say(format("Chóc mõng ®¹i hiÖp lµ ng­êi thø %d chinh phôc ®Ønh FanXiPan!  §©y lµ phÇn th­ëng cña ng­¬i xin h·y nhËn lÊy!", nrank),0);
		AddGlobalNews(format("Chóc mõng %s lµ ng­êi thø %d chinh phôc ®Ønh FanXiPan!", GetName(), nrank));
		SetTask(jf0904_TSK_denggao_getaward, 1);
	else
		Say("Ng­¬i ®· nhËn phÇn th­ëng nµy råi", 0);
	end
end

function about_denggao()
	Say("LÔ Quan: Ho¹t ®éng chinh phôc FanXiPan diÔn ra tõ 28-04-2009 ®Õn 24:00 31-05-2009. Trong thêi gian ho¹t ®éng, c¸c vÞ ®¹i hiÖp cã thÓ ®Õn Hoµng Liªn L·o L·o (390/317) ®¨ng ký chinh phôc ®Ønh FanXiPan.", 0);
end
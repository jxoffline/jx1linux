-- Ñ×µÛÍ¼ÌÚËéÆ¬
-- by Ğ¡ÀË¶à¶à
-- 2008.02.25
-- ÎÒ..
-- ÕıÔÚ³¢ÊÔ×Å..
-- Ñ°ÕÒ×ÅÊôÓÚÎÒµÄÌìµØ..

Include("\\script\\lib\\composeclass.lua");

function YDBZ_tradeYandiTuTeng()
	local nCount = CalcEquiproomItemCount(6,1,1685,-1);
	local tbarytalk = {
		format("<npc>Gom ®ñ 9 m¶nh råi ®­a ta, ta sÏ gióp ng­¬i ghĞp thµnh 1 ®å ®»ng to¸i phiÕn. Ng­¬i muèn ghĞp b©y giê?\nHµnh trang cã <color=yellow>%s<color> ®å ®»ng to¸i phiÕn",nCount),
		"Ta muèn ®æi Viªm §Õ ®å ®»ng/YDBZ_SureDoTrade",
		"Ta chØ ghĞ ngang/NoChoice",
	}
	CreateTaskSay(tbarytalk);
end

function YDBZ_SureDoTrade()
	local tbarytalk = {
		format("<npc>Gom ®ñ 9 m¶nh råi ®­a cho ta, ta sÏ gióp ng­¬i ghĞp thµnh 1 Viªm §Õ ®å ®»ng. Ng­¬i x¸c nhËn muèn ghĞp?",nCount),
		"§óng råi, ®a t¹ c« n­¬ng/YDBZ_DoTrade",
		"Ta chØ ghĞ ngang/NoChoice",
	}
	CreateTaskSay(tbarytalk);	
end
function YDBZ_DoTrade()
	local nCount = CalcEquiproomItemCount(6,1,1685,-1);
	if nCount < 9 then
		Say("Trªn hµnh trang kh«ng ®ñ 9 ®å ®»ng to¸i phiÕn!!!",0);
		return 0;
	end
	ConsumeEquiproomItem(9,6,1,1685,-1);
	AddItem(6,1,1606,1,0,0);
	Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc 1<color=yellow> Viªm §Õ ®å ®»ng<color>");
end

function YDBZ_tradeYandiLingQi()
	
	local tbarytalk = {
		"<dec>Xin h·y chän c¸ch ®æi:",
		"2 Viªm §Õ ®å ®»ng/#YDBZ_SureDoTradeLingQi(1)",
		"2 Viªm §Õ ®å ®»ng + 1 xu/#YDBZ_SureDoTradeLingQi(2)",
		"Ta chØ ghĞ ngang/NoChoice",
	}
	CreateTaskSay(tbarytalk);
end

function YDBZ_SureDoTradeLingQi(n_sel)
	local tbFormula = {
			[1] = {
						tbMaterial = {{tbProp = {6,1,1606, -1}, szName = "Viªm §Õ §å §»ng", nCount = 2}},
						tbProduct = {tbProp = {6,1,2532,1,0,0}, szName = "Viªm §Õ LÖnh Kú"},
			},
			[2] = {
						tbMaterial = {
							{tbProp = {6,1,1606, -1}, szName = "Viªm §Õ §å §»ng", nCount = 2},
							{tbProp = {4,417,1, -1}, szName = "TiÒn ®ång", nCount = 1},
						},
						tbProduct = {tbProp = {6,1,2532,1,0,0}, szName = "Viªm §Õ LÖnh Kú"},
			},
	};
	
	--Èç¹ûÊäÈëÎª¿Õ£¬Ê¹ÓÃÄ¬ÈÏÖµ
	local szLogTitle	= "yandi_tradeLingQi";
	
	local tbMaterial	= tbFormula[n_sel].tbMaterial
	local tbProduct		= tbFormula[n_sel].tbProduct
	
	local nComposeCount = 1
	
	local nFreeItemCellLimit = 1
	
	if CalcFreeItemCellCount() < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m an toµn tµi s¶n, xin h·y ®¶m b¶o hµnh trang cßn thõa %d « trèng.", nFreeItemCellLimit))
		return 0
	end
	
	if tbComposeClass:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = tbFormula.szFailMsg or "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if tbComposeClass:ConsumeMaterial(tbMaterial, nComposeCount, szLogTitle) ~= 1 then
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	local n_ran = random(100);
	if (n_sel == 1 and n_ran > 60) then
		Msg2Player("ChÕ t¹o thÊt b¹i ®ång thêi mÊt nguyªn liÖu chÕ t¹o.");
		return
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, szLogTitle, nComposeCount)
	end
	
end


function YDBZ_tradeXuanYuanLing()
	local n_count = CalcItemCount(3, 6, 1, 2532, -1);
	if (n_count >= 100) then
		ConsumeItem(3, 100, 6,1,2532, -1);
		tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2351,1,0,0}, szName = "HuyÒn Viªn LÖnh"}, "yandi_tradeXuanyuan");
	else
		CreateTaskSay({format("<dec>%s cÇn: <enter>%s", "§æi HuyÒn Viªn lÖnh" ,format("%d %s", 100, "Viªm §Õ LÖnh Kú")), "Ta biÕt råi!/NoChoice"});
	end
end

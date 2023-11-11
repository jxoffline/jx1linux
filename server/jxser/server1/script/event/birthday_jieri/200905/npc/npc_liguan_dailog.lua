-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - ĞÛ°ÔÌìÏÂÀñ¹ÙNPC¶Ô»°
-- ÎÄ¼şÃû¡¡£ºnpc_dailog.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-05-20 18:30:39

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\compose_jinnang.lua");
Include("\\script\\task\\system\\task_string.lua");

tbZhuHe = 
{
	[1] = 
	{
		szComposeTitle =  "§æi",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "Hïng", tbProp = {6,1,2062,1}},
			{szName = "B¸", tbProp = {6,1,2063,1}},
			{szName = "Thiªn", tbProp = {6,1,2064,1}},
			{szName = "H¹", tbProp = {6,1,2065,1}},
			{szName = "§ång Cæ", tbProp = {6,1,2067,1}},
		},
		tbProduct = 
		{szName = "T©n B¶n Cæ", tbProp = {6,1,2068,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
	
	[2] = 
	{
		szComposeTitle =  "§æi",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "Hïng", tbProp = {6,1,2062,1}},
			{szName = "B¸", tbProp = {6,1,2063,1}},
			{szName = "Thiªn", tbProp = {6,1,2064,1}},
			{szName = "H¹", tbProp = {6,1,2065,1}},
			{szName = "Hoµng Kú", tbProp = {6,1,2066,1}},
		},
		tbProduct = 
		{szName = "T©n B¶n Kú", tbProp = {6,1,2069,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
}


tbBirthday0905.tbZhuHe = tbComposeListForJinNang:new("tbBirthday0905_Compose", tbZhuHe)
tbXinwu =
{
	[1] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "Hïng T©m KiÕm", tbProp = {6, 1, 2070, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="50 v¹n EXP (1 Hïng T©m KiÕm)",
			[1]	= {nExp = 500000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 500000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 500000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[2] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "B¸ V­¬ng Th­¬ng", tbProp = {6, 1, 2071, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="200 v¹n EXP (1 B¸ V­¬ng Th­¬ng)",
			[1]	= {nExp = 2000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 2000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 2000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[3] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "Thiªn Tµn §ao", tbProp = {6, 1, 2072, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="200 v¹n EXP (1 Thiªn Tµn §ao)",
			[1]	= {nExp = 2000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 2000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 2000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[4] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "H¹ NhËt Cung", tbProp = {6, 1, 2073, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="300 v¹n EXP (1 H¹ NhËt Cung)",
			[1]	= {nExp = 3000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 3000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 3000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0
			else
				return 1
			end
			
		end
	},
	[5] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "Hïng T©m KiÕm", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B¸ V­¬ng Th­¬ng", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			
		},
		tbProduct = 
		{
			szName="800 v¹n EXP (5 Hïng T©m KiÕm + 2 B¸ V­¬ng Th­¬ng)",
			[1]	= {nExp = 8000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 8000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 8000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[6] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "Hïng T©m KiÕm", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B¸ V­¬ng Th­¬ng", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "Thiªn Tµn §ao", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
		},
		tbProduct = 
		{
			szName="1200 v¹n EXP (5 Hïng T©m KiÕm + 2 B¸ V­¬ng Th­¬ng + 1 Thiªn Tµn §ao)",
			[1]	= {nExp = 12000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 12000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 12000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[7] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "Hïng T©m KiÕm", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B¸ V­¬ng Th­¬ng", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "Thiªn Tµn §ao", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
			[4]	= {szName = "H¹ NhËt Cung", tbProp = {6, 1, 2073, 1, 0, 0}, nCount = 1},
			
		},
		tbProduct = 
		{
			szName="2000 v¹n EXP (5 Hïng T©m KiÕm+2 B¸ V­¬ng Th­¬ng+1 Thiªn Tµn §ao+1 H¹ NhËt Cung)",
			[1]	= {nExp = 20000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 20000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 20000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},	
}

function tbBirthday0905:OnDailogMain2(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbZhuHe then
--		
--	end

	local szTitle = format("Ho¹t ®éng “Chµo mõng phiªn b¶n míi” diÔn ra tõ %s ®Õn %s. Ng­¬i muèn t×m hiÓu ho¹t ®éng nµo?", "19/06/2009", "19/07/2009");
	
	local tbSay = self.tbZhuHe:MakeOptByProductName("T¹i h¹ muèn ®æi", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel")
	CreateTaskSay(tbSay)
end

tbBirthday0905.tbXinwu = tbComposeListForJinNang:new("tbBirthday0905_Compose_chuangguan", tbXinwu)
function tbBirthday0905:OnDailogMain3(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbXinwu then
--		
--	end

	local szTitle = "Ho¹t ®éng “Tİn vËt khai m«n” diÔn ra tõ ngµy 19/06/2009 ®Õn 24:00 19/07/2009.Trong thêi gian nµy c¸c vŞ ®¹i hiÖp cã thÓ thu thËp c¸c tİn vËt “Hïng T©m KiÕm”, “B¸ V­¬ng Th­¬ng”, “Thiªn Tµn §ao”, “H¹ NhËt Cung” tõ c¸c ho¹t ®éng v­ît ¶i, tİn sø.Dïng c¸c tİn vËt nµy ®Ó ®æi lÊy nhiÒu phÇn th­ëng hÊp dÉn.";
	
	local tbSay = self.tbXinwu:MakeOptByProductName("", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel")
	CreateTaskSay(tbSay)
end

function tbBirthday0905:GetJinnang()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ng­¬i ch­a ®ñ ®iÒu kiÖn ®Ó nhËn vËt phÈm nµy")
		return
	end
	
	if self.tbTask:if_taked_jinnang() ~= 0 then
		Say("LÔ Quan"..":".."Ta nhí kh«ng nhÇm th× ng­¬i ®· nhËn råi?",1, "ThËt ng¹i qu¸! T¹i h¹ quªn mÊt./OnCancel")
		return 
	end
	local tbItem = {szName="CÈm nang sù kiÖn", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.tbTask.item_expiredtime1, tbParam = {self.tbTask.item_expiredtime1, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by Birthday0905")
	self.tbTask:set_task(self.tbTask.tsk_jinnangsj,1);
end


function tbBirthday0905:OnDailogMain4()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");
	end
	local tbSay = {};
	local szTitle = format("Ho¹t ®éng {{s¨n b¾t nhİm bĞo ph×}} diÔn ra tõ %s  ®Õn %s. Trong thêi gian nµy ®¹i hiÖp ®¸nh {{Nhİm bĞo ph×}} sÏ cã thÓ nhËn ®­îc nhiÒu phÇn th­ëng hÊp dÉn. {{Nhİm bĞo ph×}} xuÊt hiÖn ë 7 §¹i thµnh thŞ vµ 8 T©n thñ th«n. Mçi ngµy ®¹i hiÖp chØ cã thÓ s¨n tèi ®a 20 {{Nhİm bĞo ph×}}.", "19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel")
	CreateTaskSay(tbSay);
end


function tbBirthday0905:OnDailogMain5()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");
	end
	local tbSay = {};
	local szTitle = format("Ho¹t ®éng {{hç trî t©n thñ}} diÔn ra tõ %s ®Õn %s. Trong thêi gian nµy c¸c vŞ ®¹i hiÖp cã cÊp ®é trong kho¶ng tõ 1-79 cã thÓ t¹i 8 t©n thñ th«n ë NPC {{ChiÕn T©m t«n gi¶}} gÇn LÔ Quan nhËn {{Hç trî t©n thñ}} vµ tham gia ho¹t ®éng {{Hç trî t©n thñ}}. Tham gia ho¹t ®éng hç trî t©n thñ th× c¸c vŞ ®¹i hiÖp sÏ gÆp nhiÒu thuËn lîi khi hµnh hiÖp  trªn giang hå.", "19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel")
	CreateTaskSay(tbSay);
end


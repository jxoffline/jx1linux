-- ¡∂ΩªÓ∂Ø Npc∂‘ª∞
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

-- Npc∂‘ª∞
function tbRefiningIron:NpcTalk()
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	local tbTaskSay = {"<dec><npc>Trong thÍi gian hoπt ÆÈng, c∏c vﬁ Æπi hi÷p c„ th” Æ’n Æ©y n©ng c p th–p tinh luy÷n. Th–p tinh luy÷n c p th p c„ th” th´ng qua c∏c hoπt ÆÈng phong l®ng ÆÈ vµ ∏o chi’n s‹ nhÀn Æ≠Óc, ho∆c c„ th” mua vÀt ph»m nµy tπi K˙ Tr©n C∏c. Gh–p 2 th–p c p th p c„ th” nhÀn Æ≠Óc 1 th–p tinh luy÷n c p cao h¨n",};
	
	for i = 2,9 do
		tinsert(tbTaskSay, format("Ta muËn luy÷n th–p tinh luy÷n c p %d/#tbRefiningIron:UpdataIron(%d)", i, i));
	end
	
	tinsert(tbTaskSay, "HÒy b· /Cancel");
	CreateTaskSay(tbTaskSay);
end

-- …˝º∂Ã˙
function tbRefiningIron:UpdataIron(nLevel)
	
	-- Œ¥æŸ––
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	-- Bug
	if nLevel <= 1 or nLevel > 10 then
		return
	end	
	
	-- ±≥∞¸ø’º‰
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"Xin h∑y sæp x’p lπi hµnh trang!",  "ß≠Óc rÂi./Cancel",});
		return 
	end	
		
	-- ‘≠¡œ≤ª◊„
	if CalcItemCount(3, 6, 1, 2293, nLevel - 1) < 2 then
		CreateTaskSay({format("<dec><npc>Xin h∑y chu»n bﬁ 2 th–p tinh luy÷n c p %d!",nLevel - 1),  "ß≠Óc rÂi./Cancel",});
		return
	end
	
	-- ø€≥˝ ß∞‹
	if ConsumeItem(3, 2, 6, 1, 2293, nLevel - 1) ~= 1 then
		Msg2Player("Kh u trı th–p tinh luy÷n th t bπi");
		return
	end
	
	-- ∫œ≥… ß∞‹
	if random(1, 100) > self.tbUpdataRate[nLevel] then
		local tbAwardItem = 
		{
			szName="Th–p Tinh Luy÷n", 
			tbProp={6,1, 2293, nLevel - 1,0,0},
			nCount = 1,
			nExpiredTime=self.nCloseDate,
		};
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Th–p tinh luy÷n gÈp th t bπi, tr∂ lπi th–p tinh luy÷n.");
		CreateTaskSay({"<dec><npc>ThÀt Æ∏ng ti’c, luy÷n th–p Æ∑ th t bπi! Ta ngh‹ l«n sau sœ thµnh c´ng Æ„!",  "ß≠Óc rÂi./Cancel",});
		return	
	end
	
	-- ∫œ≥…≥…π¶
	local tbAwardItem = 
	{
		szName="Th–p Tinh Luy÷n", 
		tbProp={6,1, 2293, nLevel,0,0},
		nCount = 1,
		nExpiredTime=self.nCloseDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "Gh–p th–p tinh luy÷n");
	
	-- ∏ﬂ∆∑÷ Ã· æ
	if nLevel >= 7 then
		local szmsg = format("ChÛc mıng cao thÒ %s Æ∑ nhÀn Æ≠Óc th–p tinh luy÷n c p %d. Hi v‰ng ng≠¨i sœ c„ nhi“u may mæn h¨n n˜a!", GetName(), nLevel);
		local _, nTongId = GetTongName(); 
		if nTongId ~= 0 then
			Msg2Tong(nTongId, szmsg);
		end
		Msg2SubWorld(szmsg);
	end
	
end
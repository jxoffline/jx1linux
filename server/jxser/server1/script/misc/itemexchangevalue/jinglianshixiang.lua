Include("\\script\\lib\\composeex.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

STONG_TAKEOUT_LIMIT = 46000

function BaoxiangCompose(nItemIdx)
	local nCount = GetItemMagicLevel(nItemIdx, 1);
	local tbSay = {};
	tbSay[1] = format("HiÖn t¹i hån th¹ch chøa: <color=green>%d<color> tinh lùc", nCount);
	if(nBind == 0) then
		tbSay[1] = tbSay[1] .. format("HiÖn t¹i c¸c h¹ cã thÓ rót ®­îc <color=green>%d<color> tinh lùc tõ h«n th¹ch", max(nCount-STONG_TAKEOUT_LIMIT, 0));
	end
	
	tinsert(tbSay, format("Chøa %s/#PutIn('%s', %d)","Tinh lùc","Tinh lùc", nItemIdx));
--	if (nBind == 0 and max(nCount-STONG_TAKEOUT_LIMIT, 0) > 0) then
--		tinsert(tbSay, format("ÎüÈ¡%s/#TakeOut('%s', %d)","¾«Á¦","¾«Á¦", nItemIdx));
--	end
	
	tinsert(tbSay, "§Ó ta suy nghÜ kü l¹i xem/OnExit");
	CreateTaskSay(tbSay);
	return 1;
end

function PutIn(szItem, nItemIdx)
	local tbItemList = 
	{
		["Tinh lùc"] =  
		{
			tbFormula = 
			{
				
				szComposeTitle = format("Hån th¹ch \t chøa %s", "Tinh lùc"),
				szFailMsg = "Tinh lùc cña c¸c h¹ kh«ng ®ñ!",
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0,
				tbMaterial = 
				{
					{
						szName = "Tinh lùc", 
						pGetCount = function () 
										return GetEnergy() 
									end, 
						nCount = 1,
						pConsume = function (self, nConsumeCount)
										return ReduceEnergy(nConsumeCount)
								   end,
					},
				},
				nItemIndex = 0,
				pProductFun =  function (self, nCount)
								if (self.nItemIndex ~= nil and type(self.nItemIndex) == "number" and self.nItemIndex > 0) then
									local nBind = GetItemBindState(self.nItemIndex);
									local nCurCount = GetItemMagicLevel(self.nItemIndex, 1);
									nCurCount = nCurCount + nCount;
									SetItemMagicLevel(self.nItemIndex, 1, nCurCount);
									SyncItem(self.nItemIndex)
									SetItemBindState(self.nItemIndex, nBind)
								end
							end
				
			},
		},
	}
	
	local tbItem = tbItemList[szItem];
	if (tbItem) then
		tbItem.tbFormula.nItemIndex = nItemIdx;
		tbItem.tbFormula.tbMaterial[1].nItemIndex = nItemIdx;
		local tbComPos = tbActivityCompose:new(tbItem.tbFormula, format("Hån th¹ch chøa [%s]", szItem));
		tbComPos:ComposeDailog(1);
	end
end

function TakeOut(szItem, nItemIdx)
	local tbItemList = 
	{
		["Tinh lùc"] =  
		{
			tbFormula = 
			{
				
				szComposeTitle = format("Hån th¹ch\tRót %s", "Tinh lùc"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0,
				tbMaterial = 
				{
					{
						szName = "Sè l­îng tinh lùc cã thÓ rót", 
						pGetCount = function (self) 
										if (self.nItemIndex ~= nil and type(self.nItemIndex) == "number" and self.nItemIndex > 0) then
											local nBind = GetItemBindState(self.nItemIndex);
											if (nBind == 0) then
												return max(GetItemMagicLevel(self.nItemIndex, 1) - STONG_TAKEOUT_LIMIT,0);
											end
										end
										return 0;
									end, 
						nCount = 1,
						pConsume = function (self, nConsumeCount)
										if ((GetEnergy()+nConsumeCount)>2000000000) then
											Talk(1, "", "TrÞ tinh lùc ®· v­ît qua giíi h¹n, kh«ng thÓ rót ®­îc tinh lùc n÷a");
											return nil;
										end
										if (self.nItemIndex ~= nil and type(self.nItemIndex) == "number" and self.nItemIndex > 0 and AddEnergy(nConsumeCount) == 1) then
											local nBind = GetItemBindState(self.nItemIndex);
											local nCurCount = GetItemMagicLevel(self.nItemIndex, 1);
											nCurCount = nCurCount - nConsumeCount;
											SetItemMagicLevel(self.nItemIndex, 1, nCurCount);
											SyncItem(self.nItemIndex)
											SetItemBindState(self.nItemIndex, nBind)
											return 1;
										end
										return nil;
								   end,
					},
				},
				nItemIndex = 0,
				pProductFun =  function (self, nCount)
							
						end
				
			},
		},
	}
	
	local tbItem = tbItemList[szItem];
	if (tbItem) then
		tbItem.tbFormula.nItemIndex = nItemIdx;
		tbItem.tbFormula.tbMaterial[1].nItemIndex = nItemIdx;
		local tbComPos = tbActivityCompose:new(tbItem.tbFormula, format("Tõ hån th¹ch rót ®­îc [%s]", szItem));
		tbComPos:ComposeDailog(1);
	end
end

function OnExit()

end

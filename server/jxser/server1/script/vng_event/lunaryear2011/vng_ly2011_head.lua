if not tbVNG_LY2011 then
	tbVNG_LY2011={}
end

tbVNG_LY2011.nStartDay = 20110120
tbVNG_LY2011.nEndDay = 20110220
tbVNG_LY2011.nItemExpiredTime = 20110220

function tbVNG_LY2011:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	return 1;
end

function tbVNG_LY2011:addNpc()
	if self:isActive() ~= 1 then
		return
	end
	local tbNpcList =
		{
			--baker = 
				{
					strName = "Thî b¸nh ViÖt Hµ",  
					nID = 205,
					strScript = "\\script\\vng_event\\LunarYear2011\\npc\\baker.lua",
					tbPos = 
						{
							{520,1564,3255},  
							{520,1637,3263},
							{523,1631,3263},   
							{522,1631,3263},
							{525,1631,3263},
							{524,1631,3263},
							{521,1631,3263},
							{526,1631,3263},
							{523,1566,3257},
							{522,1565,3257},
							{525,1565,3257},
							{524,1565,3257},
							{521,1565,3257},
							{526,1565,3257},
						}
				},
			--factionTransport =
				{
					strName = "TruyÒn tèng m«n ph¸i",  
					nID = 195,
					strScript = "\\script\\vng_event\\LunarYear2011\\npc\\factiontransport.lua",
					tbPos = 
						{
							{121,1967,4483},
							{20,3539,6203},
							{99,1618,3186},
							{174,1622,3213},
							{100,1639,3140},
							{101,1684,3141},
							{153,1649,3200},
							{53,1631,3178},
						}
				},
			--MaiTree = 
				{
					strName = "C©y Mai",  
					nID = 1334,
					strScript = "\\script\\vng_event\\LunarYear2011\\npc\\maitree.lua",
					tbPos = 
						{
							{11,3139,5063},
							{1,1595,3199},
							{176,1435,3281},
							{162,1621,3182},
							{80,1767,3030},
							{78,1580,3224},
							{37,1748,3077},
						}
				},	
			--cardShop = 
				{
					strName = "¤ng l·o b¸n thiÖp",  
					nID = 389,
					strScript = "\\script\\vng_event\\LunarYear2011\\npc\\cardshop.lua",
					tbPos = 
						{
							{176,1444,3267},
						}
				},
			--Lares = 
				{
					strName = "¤ng T¸o",  
					nID = 391,
					strScript = "\\script\\vng_event\\LunarYear2011\\npc\\lares.lua",
					tbPos = 
						{
							{520,1593,3200},
							{523,1597,3205},
							{522,1597,3205},
							{525,1597,3205},
							{524,1597,3205},
							{521,1597,3205},
							{526,1597,3205},
						}
				},						
		}
	for i = 1, getn(tbNpcList) do
		local npcTemp = tbNpcList[i]
		for j = 1, getn(npcTemp.tbPos) do
			local nMapId = SubWorldID2Idx(npcTemp.tbPos[j][1])
			local nNpcIdx = AddNpc(npcTemp.nID, 1, nMapId, npcTemp.tbPos[j][2]*32, npcTemp.tbPos[j][3]*32, 1, npcTemp.strName)
			SetNpcScript(nNpcIdx, npcTemp.strScript)
		end
	end		
end
--kiem tra dieu kien su dung vat pham
function tbVNG_LY2011:checkCondition()	
	if(GetExtPoint(0) >= 1) then		
		if ST_GetTransLifeCount() > 0 or GetLevel() >= 50 then
			return 1		
		end
	end
	return 0
end
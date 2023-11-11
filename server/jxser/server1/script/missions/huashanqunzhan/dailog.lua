-- »ªÉ½ÀÞÌ¨¶Ô»°
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\huashanqunzhan\\high_grade\\ready\\readyclass.lua")
Include("\\script\\missions\\huashanqunzhan\\mid_grade\\ready\\readyclass.lua")
Include("\\script\\lib\\awardtemplet.lua")
function huashanqunzhan_SignUpMain(nStep)
	local tbSay = nil
	local nPlayerLevel = GetLevel()
	
	local tbReadyMission = nil
	if nPlayerLevel < 50 then
		tbReadyMission = nil
	elseif nPlayerLevel < 120 then
		tbReadyMission = huashanqunzhan_tbReady_M
	else
		tbReadyMission = huashanqunzhan_tbReady_H
	end
	
	local nState = tbReadyMission and tbReadyMission:CheckMathState() or nil
	if nStep == 1 then
		if nState == 1 then
			tbSay = 
			{
				format("<dec><npc>%s ®· b¾t ®Çu b¸o danh, phÝ b¸o danh lµ 10 v¹n l­îng, ®¹i hiÖp cã ®ång ý kh«ng?",tbReadyMission.tbRef.szMatchName),
				 "B¸o danh tham gia/#huashanqunzhan_SignUpMain(2)",
			}
		elseif nState == 0 or nState == -1 then
			local tbWorld = 
			{
				{"-","-","-"},
				{"Ngµy", "Sè trËn", "Thêi gian"},
				{"-","-","-"},
				{"Thø 2 ®Õn thø 6", "2", "10:00 - 10:45"},
				{"","", "22:00 - 22:45"},
				{"-","-","-"},
				{"","","10:00 - 10:45"},
				{"Thø 7 vµ Chñ nhËt", "3", "15:00 - 15:45"},
				{"","","22:00 - 22:45"},
				{"-","-","-"},
			}
			local szMsg = nState == 0 and "TrËn ®Êu vÉn ch­a b¾t ®Çu." or "TrËn ®Êu ®ang ®­îc tiÕn hµnh."
			tbSay = 
			{
				"<dec><npc>"..szMsg.."Thêi gian thi ®Êu nh­ sau:<enter>"..huashanqunzhan_drawtable(tbWorld),
			}
		elseif nState == -2 then
			local tbMacthMission	= tbReadyMission.tbRef
			
			local szWinerName		= tbMacthMission:GetMissionS(tbMacthMission.tbMissionS.WINER_INDEX)
			local szMsg				= (szWinerName and szWinerName ~= "")  and format("Ng­êi chiÕn th¾ng: <color=yellow>%s<color>", szWinerName) or "TrËn nµy kh«ng cã Ng­êi chiÕn th¾ng"
			
			tbSay = 
			{
				format("<dec><npc>TrËn %s ®· ph©n th¾ng b¹i, %s", tbMacthMission.szMatchName, szMsg),
				
			}
		elseif nState == nil then
			tbSay = 
			{
				"<dec><npc>Ng­êi ch¬i cÊp trªn 50 ®· n¹p thÎ míi cã thÓ tham gia Hoa S¬n §¹i ChiÕn. CÊp tõ 50 ®Õn 119 cã thÓ tham gia Hoa S¬n §¹i ChiÕn trung cÊp; cÊp 120 trë lªn cã thÓ tham gia Hoa S¬n §¹i ChiÕn cao cÊp. Ng­¬i ch­a ®ñ ®¼ng cÊp ®Ó tham gia.",
			}
		end		
	elseif nStep == 2 then
		if GetCash() < tbReadyMission.nMoney then
			return Say(format("PhÝ b¸o danh lµ %d l­îng, ng©n l­îng trªn ng­êi kh«ng ®ñ.", tbReadyMission.nMoney), 0)
		end
		
		
		if tbReadyMission == nil then
			return Say("§¼ng cÊp ch­a ®ñ 50, kh«ng thÓ tham gia b¸o danh.", 0)
		else
			return huashanqunzhan_SignUpStep(tbReadyMission)
		end
	end
	
	if  huashanqunzhan_CheckGetAward(tbReadyMission.tbRef) then
		tinsert(tbSay,2,"PhÇn th­ëng cho ng­êi chiÕn th¾ng./huashanqunzhan_GetAward")
	end
	
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel")
	CreateTaskSay(tbSay)
end


function huashanqunzhan_SignUpStep(tbMission)
	local nState = tbMission:CheckMathState()
	if nState == 1 then
		tbMission:GotoReadyPlace()
	elseif nState == 0 then
		Say("TrËn ®Êu vÉn ch­a b¾t ®Çu.", 0)
	elseif nState == -1 then
		Say("TrËn ®Êu ®ang tiÕn hµnh, xin ®îi ®Õn trËn sau.", 0)
	elseif nState == -2 then
		
		local tbMacthMission	= tbMission.tbRef
		local szWinerName		= tbMacthMission:GetMissionS(tbMacthMission.tbMissionS.WINER_INDEX)
		local szMsg				= szWinerName and format("Ng­êi chiÕn th¾ng: <color=yellow>%s<color>", szWinerName) or "TrËn nµy kh«ng cã Ng­êi chiÕn th¾ng"
		local tbSay = 
		{
			format("<dec><npc>TrËn %s ®· ph©n th¾ng b¹i, %s", tbMacthMission.szMatchName, szMsg),
			"KÕt thóc ®èi tho¹i/OnCancel"
		}
		CreateTaskSay(tbSay)
	end
	
end

function huashanqunzhan_GetAward()
	if CalcFreeItemCellCount() < 20 then
		return Say("Tói hµnh trang ®· ®Çy, h·y dän dÑp hµnh trang ®Ó b¶o ®¶m an toµn cho vËt phÈm.",0)
	end
	local tbAward = 
	{
		{szName="Lam Thñy Tinh", tbProp={4, 238, 1, 1, 0, 0}, nCount = 2},
		{szName="Lôc Thñy Tinh", tbProp={4, 240, 1, 1, 0, 0}, nCount = 2},
		{szName="Tö Thñy Tinh", tbProp={4, 239, 1, 1, 0, 0}, nCount = 2},
		{szName="Tinh Hång B¶o Th¹ch", tbProp={4, 353, 1, 1, 0, 0}, nCount = 12},
		{szName="Vâ L©m MËt TÞch", tbProp={6, 1, 26, 1, 0, 0}},
		{szName="TÈy Tñy Kinh", tbProp={6, 1, 22, 1, 0, 0}},
	}
	local nCount = GetTask(huashanqunzhan.TSK_Winer)
	
	tinsert(tbAward, { nJxb = 90000 * nCount})
	
	tbAwardTemplet:GiveAwardByList(tbAward, "L«i §µi Hoa S¬n §¹i ChiÕn")
	SetTask(huashanqunzhan.TSK_Winer, 0)
end


function huashanqunzhan_CheckGetAward(tbMission)
	local nState = tbMission:GetMissionState()
	local nPlayerMathId = GetTask(tbMission.TSK_MatchId)
	local nMathId = tbMission:GetMissionV(tbMission.tbMissionV.MATCH_ID)
	if nPlayerMathId == nMathId and nState == 2 and GetTask(tbMission.TSK_Winer) > 0 then
		
		return 1
	end
	return nil
end

function OnCancel()
	
end




function huashanqunzhan_drawtable(tbWord)
	local nLen = 0
	local str = ""
	for _, tb2 in tbWord do
		for _, sz in tb2 do
			if sz and nLen < strlen(sz) then
				nLen = strlen(sz)
			end
		end
	end
	for _, tb2 in tbWord do
		local str_space
		for j, sz in tb2 do
			if sz ~= "-" or ( sz == "-" and j==1 )then
				str = str.."|"
			else
				str = str.."-"
			end
			 str_space = sz == "-" and "-" or " "
			str = str..strfill_center(sz,nLen, str_space)
		end
		str = str.."|"
	
		str = str.."<enter>"
	end
	return str
end

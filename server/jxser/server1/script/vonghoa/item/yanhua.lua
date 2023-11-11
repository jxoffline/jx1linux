Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")

 tbData = {}
  tbAwardEXPQuocKhanh=
 {
 	{nExp_tl=250000, nRate = 29},
 	{nExp_tl=300000, nRate = 31},
 	{nExp_tl=350000, nRate = 40},
 };
  tbAwardEXPDocLap=
 {
 	{nExp_tl=500000, nRate = 29},
 	{nExp_tl=550000, nRate = 31},
 	{nExp_tl=600000, nRate = 40},
 };

  tbAwardItemDocLap=
  {
  	{szName = "HuyÒn Viªn LÖnh", tbProp = {6, 1, 2351, 1, 0, 0}, nCount = 1, nRate = 0.2},	
  	{szName = "Th­¬ng Lang LÖnh", tbProp = {6, 1, 2352, 1, 0, 0}, nCount = 1, nRate = 0.5},	
  	{szName = "V©n Léc LÖnh", tbProp = {6, 1, 2353, 1, 0, 0}, nCount = 1, nRate = 1},	
  	{szName = "Thanh C©u LÖnh", tbProp = {6, 1, 2369, 1, 0, 0}, nCount = 1, nRate = 1},	
  	{szName = "Hçn Nguyªn Linh Lé", tbProp = {6, 1, 2312, 1, 0, 0}, nCount = 1, nRate = 15},	
  	{szName = "HuyÒn Thiªn CÈm Nang", tbProp = {6, 1, 2355, 1, 0, 0}, nCount = 1, nRate = 10},	
  	{szName = "ThÇn N«ng Ch©n §¬n", tbProp = {6, 1, 2113, 1, 0, 0}, nCount = 1, nRate = 3},	
  	{szName = "NÕn B¸t Tr©n Phóc NguyÖt", tbProp = {6, 1, 1817, 1, 0, 0}, nCount = 1, nRate = 10},	
  	{szName = "Khiªu ChiÕn LÔ Bao", tbProp = {6, 1, 2006, 1, 0, 0}, nCount = 1, nRate = 7},	
  	{szName = "B¸ch Niªn Tr©n Lé", tbProp = {6, 1, 2266, 1, 0, 0}, nCount = 1, nRate = 12},	
  	{szName = "Long HuyÕt Hoµn", tbProp = {6, 1, 2117, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "Thiªn Long LÖnh", tbProp = {6, 1, 2256, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "B¹ch Cèt LÖnh", tbProp = {6, 1, 2255, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "H¶i Long Ch©u", tbProp = {6, 1, 2115, 1, 0, 0}, nCount = 1, nRate = 3.3},	
  	{szName = "Tiªn Th¶o Lé (®Æc biÖt)", tbProp = {6, 1, 1181, 1, 0, 0}, nCount = 1, nRate =5 },	
  	{szName = "ThÝ LuyÖn ThiÕp", tbProp = {6, 1, 2317, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "Qu¶ Huy Hoµng (cao cÊp)", tbProp = {6, 1, 906, 1, 0, 0}, nCount = 1, nRate = 10,nExpiredTime = 10080},	
  	{szName = "B¸ch Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2269, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "Thiªn Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2270, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "V¹n Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2271, 1, 0, 0}, nCount = 1, nRate = 1},	
  };
 
 function tbRandom(tbAward)
 	local nRanVar =random(1,100);
	local num = 0; row = 0
	for row=1,getn(tbAward) do
		num = num + tbAward[row].nRate;
		if nRanVar <= num then
			return row
		end
	end
 end
 
function Create_main(nItemIndex)
	SetTask(Task_IsCurUse_VongHoa,1)
	local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
	local nPosX, nPosY, nMapIndex = GetPos()
	local nNpcIndex = AddNpcEx(1575, 1, 5, nMapIndex, nPosX, nPosY, 1, " ", 0)
	SetTask(Task_NPC_InDex,nNpcIndex)
	tbData[nNpcIndex] = {szPlayerName = GetName(), nCount = 0, nP = parttype};
	local nTimerId = AddTimer(18*10, "OnTime", nNpcIndex)
	SetTask(Task_TimerId, nTimerId)
end

function CalcDistance(nx1, ny1, nx2, ny2)
	return ( (nx1-nx2)^2 + (ny1-ny2)^2 )
end;

function OnTime(nNpcIndex, nTimerId)

	local tbData = tbData[nNpcIndex]

	if not tbData then
		if nNpcIndex > 0 then
			DelNpc(nNpcIndex)
		end
		return 0,0
	end
	
	
	
	tbData.nCount = tbData.nCount + 1
	--Msg2Player("B¹n nhËn ®­îc kinh nghiÖm lÇn thø "..tbData.nCount)
	
	local nPlayerIndex = SearchPlayer(tbData.szPlayerName)
	
	if nPlayerIndex > 0 then
		
		local nNpcX, nNpcY, nNpcMapIndex = GetNpcPos(nNpcIndex)
		local nX, nY, nMapIndex = lib:DoFunByPlayer(nPlayerIndex, GetPos)
		
		if CalcDistance(nX/32, nY/32, nNpcX/32, nNpcY/32) <= 144 then
			if (tbData.nP == 30033) then
				local nValue = tbRandom(tbAwardEXPQuocKhanh)
				if (nValue==nil) then
					nValue = 1
				end
				local nTaskBeUse = lib:DoFunByPlayer(nPlayerIndex, GetTask,Task_BeUse_VongHoa)
				local nTotalEXP = nTaskBeUse + tbAwardEXPQuocKhanh[nValue].nExp_tl/10000
				lib:DoFunByPlayer(nPlayerIndex, SetTask,Task_BeUse_VongHoa , nTotalEXP)
				--SetTask(Task_BeUse_VongHoa, GetTask(Task_BeUse_VongHoa) + tbAwardEXPQuocKhanh[nValue].nExp_tl/10000)
				lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardEXPQuocKhanh[nValue] , "NhËn EXP sö dông vßng hoa quèc kh¸nh")
			end
			if (tbData.nP == 30034) then
				local nValue = tbRandom(tbAwardEXPDocLap)
				if (nValue==nil) then
					nValue = 1
				end
				local nTaskBeUse = lib:DoFunByPlayer(nPlayerIndex, GetTask,Task_BeUse_VongHoa)
				local nTotalEXP = nTaskBeUse + tbAwardEXPDocLap[nValue].nExp_tl/10000
				lib:DoFunByPlayer(nPlayerIndex, SetTask,Task_BeUse_VongHoa , nTotalEXP)
				--SetTask(Task_BeUse_VongHoa, GetTask(Task_BeUse_VongHoa) +  tbAwardEXPDocLap[nValue].nExp_tl/10000)
				lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardEXPDocLap[nValue] , "NhËn EXP sö dông vßng hoa ®éc lËp")
			end
		end
	end
	
	if tbData.nCount >= 12 then
		lib:DoFunByPlayer(nPlayerIndex, SetTask,Task_IsCurUse_VongHoa , 0)
		if nNpcIndex > 0 then
			SetTask(Task_NPC_InDex,0)
			DelNpc(nNpcIndex)
			
			if (tbData.nP == 30034) then
				lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardItemDocLap , "nhËn th­ëng Item sö dông vßng hoa ®éc lËp")
			end
			lib:DoFunByPlayer(nPlayerIndex, Msg2Player,"Thêi gian sö dông vßng hoa kÕt thóc !")
		end
		return 0,0
	else
		return 18*10, nNpcIndex
	end
	
end
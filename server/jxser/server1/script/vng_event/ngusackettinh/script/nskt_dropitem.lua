Include("\\script\\vng_event\\ngusackettinh\\head.lua")
tb_NSKT_DropItem = {}

function tb_NSKT_DropItem:onNPCDeath(nNpcIndex)
	if(tbNSKT_head:isActive() ~= 1) then
		return 0
	end
	
	--boss sat thu cap 90	
	if(NpcFunLib:CheckKillerdBoss(90, nNpcIndex) == 1)then
--		local tbNSKTList = tbNSKT_head:randomKT(12)
--			if(getn(tbNSKTList) > 0)then
--				for i = 1, getn(tbNSKTList) do
--					PlayerFunLib:GetItem({tbProp=tbNSKTList[i],nExpiredTime=tbNSKT_head.nEndDay,}, 1, "Event Ngò s¾c kÕt tinh_S¸t thñ cÊp 90" )
--				end
--			end
		local tbNSKTList = tbNSKT_head:getRandomKT(12)
			if(getn(tbNSKTList) ~= 3) then
				return 0;
			end
			for i = 1, getn(tbNSKTList) do
				if(tbNSKTList[i].nCount > 0)then
					PlayerFunLib:GetItem({tbProp = {6,1, tbNSKTList[i].nID, 1, 0, 0}, nExpiredTime = tbNSKT_head.nEndDay,}, tbNSKTList[i].nCount, "Event Ngò s¾c kÕt tinh_S¸t thñ cÊp 90" )
				end
			end
		return 1;	
	end	
	
	local szMapIDList1 = "321,322,336,124,152,875"; --rot ket tinh moc
	local szMapIDList2 = "225,226,227,144,93,75,340";--danh quai rot ket tinh hoa
	
	if (NpcFunLib:CheckInMap(szMapIDList1, nNpcIndex) == 1) then
		NpcFunLib:DropSingleItem({tbProp={6, 1, 30070, 1, 0, 0},nExpiredTime=20110110, }, 1, "5", nNpcIndex)
		return 1;
	end
	
	if (NpcFunLib:CheckInMap(szMapIDList2, nNpcIndex) == 1) then
		NpcFunLib:DropSingleItem({tbProp={6, 1, 30072, 1, 0, 0},nExpiredTime=20110110, }, 1, "5", nNpcIndex)
		return 1;
	end
	
	--thuy tac dau linh
	if (NpcFunLib:CheckBoatBoss(nNpcIndex) == 1) then
--			local tbNSKTList = tbNSKT_head:randomKT(10)
--			if(getn(tbNSKTList) > 0)then
--				for i = 1, getn(tbNSKTList) do
--					tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, {tbProp=tbNSKTList[i], nExpiredTime=tbNSKT_head.nEndDay,}, "Thñy tÆc ®Çu lÜnh r¬i ë ho¹t ®éng ngò s¾c tinh th¹ch", 1)
--				end
--			end
			local tbNSKTList = tbNSKT_head:getRandomKT(10)
			if(getn(tbNSKTList) ~= 3) then
				return 0;
			end
			for i = 1, getn(tbNSKTList) do
				if(tbNSKTList[i].nCount > 0)then
					tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, {tbProp = {6,1, tbNSKTList[i].nID, 1, 0, 0}, nExpiredTime=tbNSKT_head.nEndDay,}, "Thñy tÆc ®Çu lÜnh r¬i ë ho¹t ®éng ngò s¾c tinh th¹ch", tbNSKTList[i].nCount)
				end
			end
		return 1;
	end	
end
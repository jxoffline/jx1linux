Include("\\script\\tagnewplayer\\func_check.lua");
function BonusEveryDay()
	if (CheckObject() < 1) then
		Talk(1, "", "Xin h·y kiÓm tra l¹i ®iÒu kiÖn tham gia.");
		return
	end
	if (CheckDayOfWeek() == 1) then
			local szTongName , nTongID = GetTongName()
			if (nTongID < 1) then
				Say("<#> Ng­¬i ch­a gia nhËp bang héi. SÏ kh«ng nhËn ®­îc mét sè phÇn th­ëng cã liªn quan tíi bang héi", 2,
				"Ta muèn nhËn/GetBonusFirstWeek",
				"Hñy bá /Cancel")
			else
				GetBonusFirstWeek()
			end
	end
	if (CheckDayOfWeek() == 2) then
			local szTongName , nTongID = GetTongName()
			if (nTongID < 1) then
				Say("<#> Ng­¬i ch­a gia nhËp bang héi. SÏ kh«ng nhËn ®­îc mét sè phÇn th­ëng cã liªn quan tíi bang héi", 2,
				"Ta muèn nhËn/GetBonusEndWeek",
				"Hñy bá /Cancel")
			else
				GetBonusEndWeek()
			end
	end
	
end
function GetBonusFirstWeek()
	local nHour = tonumber(date("%H%M"))
	if (nHour >= 0 and nHour <=1400 ) then
		if (CheckCondition2GetBonusFirstWeek14()~= 1) then
			return
		end
		SetTask(Task_Total_BonusFirstWeek14,GetTask(Task_Total_BonusFirstWeek14) + 1)
		SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetBonusFirstWeek14, 1)
		--Add bonus 3 Tien Thao lo
		for i=1,3 do
			local itemindx = AddItem(6,1,71,1,0,0)
			nExpiredTime = OneDayTime * 3
			ITEM_SetExpiredTime(itemindx, nExpiredTime);
			SetItemBindState(itemindx, -2);
			SyncItem(itemindx)
			local strItem = GetItemName(itemindx)
			Msg2Player("B¹n nhËn ®­îc "..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
		end
		--Add bonus Bach cot lenh
			local ndx = AddItem(6,1,2255,1,0,0)
			nExpiredTime = OneDayTime * 3
			ITEM_SetExpiredTime(ndx, nExpiredTime);
			SetItemBindState(ndx, -2)
			SyncItem(ndx);
			local strItem = GetItemName(ndx)
			Msg2Player("B¹n nhËn ®­îc "..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
		-- Add bonus Hai long chau
			local nindx = AddItem(6,1,2115,1,0,0)
			nExpiredTime = OneDayTime * 3
			ITEM_SetExpiredTime(nindx, nExpiredTime);
			SetItemBindState(nindx, -2);
			SyncItem(nindx)
			local strItem = GetItemName(nindx)
			Msg2Player("B¹n nhËn ®­îc "..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
		-- Add 50 van luong
			Earn(500000)
			Msg2Player("B¹n nhËn ®­îc 50 v¹n l­îng");
			WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc 50 v¹n l­îng")
		--Add random 3 loai BCH
			AddRandomBCH()
		
	end
	if (nHour > 1400 and nHour <=2400 ) then
			if (CheckCondition2GetBonusFirstWeek24()~= 1) then
				return
			end
			SetTask(Task_Total_BonusFirstWeek24,GetTask(Task_Total_BonusFirstWeek24) + 1)
			SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetBonusFirstWeek24, 1)
			-- add 10 lenh bai bang hoi ngau nhien
			for i=1,10 do
				AddLenhBaiBH()
			end
			-- add item long huyet hoan
			local nindx = AddItem(6,1,2117,1,0,0)
			nExpiredTime = OneDayTime * 3
			ITEM_SetExpiredTime(nindx, nExpiredTime);
			SetItemBindState(nindx, -2);
			SyncItem(nindx)
			local strItem = GetItemName(nindx)
			Msg2Player("B¹n nhËn ®­îc "..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
			-- Add 2000 diem cong hien BH
			local szTongName , nTongID = GetTongName()
			if (nTongID ~= 0) then
				AddContribution(2000)
				Msg2Player("B¹n nhËn ®­îc 2000 ®iÓm cèng hiÕn bang héi");
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc 2000 ®iÓm cèng hiÕn bang héi")
			end
			
			--Add thien long lenh
			local ndx = AddItem(6,1,2256,1,0,0)
			nExpiredTime = OneDayTime * 3
			ITEM_SetExpiredTime(ndx, nExpiredTime);
			SetItemBindState(ndx, -2);
			SyncItem(ndx)
			local strItem = GetItemName(ndx)
			Msg2Player("B¹n nhËn ®­îc "..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
			-- add 10 item moc nhan
			for i=1,10 do
				local ndx = AddItem(6,1,1085,1,0,0)
				nExpiredTime = OneDayTime * 3
				ITEM_SetExpiredTime(ndx, nExpiredTime);
				SetItemBindState(ndx, -2);
				SyncItem(ndx)
				local strItem = GetItemName(ndx)
				Msg2Player("B¹n nhËn ®­îc "..strItem)
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
			end
		
	end--end of 24h
end

function GetBonusEndWeek()
		local nHour = tonumber(date("%H%M"))
		if (nHour >= 0 and nHour <=1400 ) then
				if (CheckCondition2GetBonusEndWeek14()~= 1) then
					return
				end
				SetTask(Task_Total_BonusEndWeek14,GetTask(Task_Total_BonusEndWeek14) + 1)
				SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetBonusEndWeek14, 1)
				-- add random 3 loai BCH
				AddRandomBCH()
				--Add 100 van luong
				Earn(1000000)
				Msg2Player("§¹i hiÖp nhËn ®­îc 100 v¹n l­îng")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc 100 v¹n l­îng")
				--Add 3 qua huy hoang
				for i=1,3 do
					local ndx = AddItem(6,1,906,1,0,0)
					nExpiredTime = OneDayTime * 3
					ITEM_SetExpiredTime(ndx, nExpiredTime);
					SetItemBindState(ndx, -2);
					SyncItem(ndx)
					local strItem = GetItemName(ndx)
					Msg2Player("B¹n nhËn ®­îc "..strItem)
					WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
				end
				-- Add random tran lo
				AddRandomNTL()
				-- Add 5 tien thao lo
				for i=1,5 do
					local ndx = AddItem(6,1,71,1,0,0)
					nExpiredTime = OneDayTime * 3
					ITEM_SetExpiredTime(ndx, nExpiredTime);
					SetItemBindState(ndx, -2);
					SyncItem(ndx)
					local strItem = GetItemName(ndx)
					Msg2Player("B¹n nhËn ®­îc "..strItem)
					WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
				end
				--Add 2 item Bach cot lenh
				for i=1,2 do
					local ndx = AddItem(6,1,2255,1,0,0)
					nExpiredTime = OneDayTime * 3
					ITEM_SetExpiredTime(ndx, nExpiredTime);
					SetItemBindState(ndx, -2);
					SyncItem(ndx)
					local strItem = GetItemName(ndx)
					Msg2Player("B¹n nhËn ®­îc "..strItem)
					WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
				end
				--Add 2 item Hai long chau
				for i=1,2 do
					local ndx = AddItem(6,1,2115,1,0,0)
					nExpiredTime = OneDayTime * 3
					ITEM_SetExpiredTime(ndx, nExpiredTime);
					SetItemBindState(ndx, -2);
					SyncItem(ndx)
					local strItem = GetItemName(ndx)
					Msg2Player("B¹n nhËn ®­îc "..strItem)
					WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
				end	
		end--end of 14h
		
		if (nHour > 1400 and nHour <=2400 ) then
				if (CheckCondition2GetBonusEndWeek24()~= 1) then
					return
				end
				SetTask(Task_Total_BonusEndWeek24,GetTask(Task_Total_BonusEndWeek24) + 1)
				SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetBonusEndWeek24, 1)
				--add 20 lenh bai nhiem vu ngau nhien
				for i=1,20 do
					AddLenhBaiBH()
				end
				-- add 1 mat na nguyen soai
					local ndx = AddItem(0,11,447,1,0,0)
					nExpiredTime = OneDayTime * 3
					ITEM_SetExpiredTime(ndx, nExpiredTime);
					SetItemBindState(ndx, -2);
					SyncItem(ndx)
					local strItem = GetItemName(ndx)
					Msg2Player("B¹n nhËn ®­îc "..strItem)
					WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
					-- add 2 item long huyet hoan
					for i=1,2 do
						local nindx = AddItem(6,1,2117,1,0,0)
						nExpiredTime = OneDayTime * 3
						ITEM_SetExpiredTime(nindx, nExpiredTime);
						SetItemBindState(nindx, -2);
						SyncItem(nindx)
						local strItem = GetItemName(nindx)
						Msg2Player("B¹n nhËn ®­îc "..strItem)
						WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
					end
					-- add 5000 diem cong hien BH
						local szTongName , nTongID = GetTongName()
						if (nTongID ~= 0) then
							AddContribution(5000)
							Msg2Player("B¹n nhËn ®­îc 5000 ®iÓm cèng hiÕn bang héi");
							WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc 5000 ®iÓm cèng hiÕn bang héi")
						end
					-- Add 2 item thien long lenh
					for i=1,2 do
						local ndx = AddItem(6,1,2256,1,0,0)
						nExpiredTime = OneDayTime * 3
						ITEM_SetExpiredTime(ndx, nExpiredTime);
						SetItemBindState(ndx, -2);
						SyncItem(ndx)
						local strItem = GetItemName(ndx)
						Msg2Player("B¹n nhËn ®­îc "..strItem)
						WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
					end
				-- add 20 moc nhan
					for i=1,15 do
						local ndx = AddItem(6,1,1085,1,0,0)
						SetSpecItemParam(ndx, 2, 9)
						nExpiredTime = OneDayTime * 3
						ITEM_SetExpiredTime(ndx, nExpiredTime);
						SetItemBindState(ndx, -2);
						SyncItem(ndx)
						local strItem = GetItemName(ndx)
						Msg2Player("B¹n nhËn ®­îc "..strItem)
						WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
					end
				-- add random 3 loai BCH KN
					AddRandomBCHKN()	
		end -- end of 24h
	
end

function AddRandomBCH()
	tbItemBCH=
	{
		{nId=74},
		{nId=130},
		{nId=1157}
	};
	
	local nVarandom = random(1,getn(tbItemBCH))
	local nVar = tbItemBCH[nVarandom].nId
	local itemindx = AddItem(6,1,nVar,1,0,0)
	nExpiredTime = OneDayTime * 3
	ITEM_SetExpiredTime(itemindx, nExpiredTime);
	SetItemBindState(itemindx, -2);
	SyncItem(itemindx)
	local strItem = GetItemName(itemindx)
	Msg2Player("B¹n nhËn ®­îc "..strItem)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
end

function AddRandomBCHKN()
	tbItemBCHKN=
	{
		{nId=1372},
		{nId=977},
		{nId=1182}
	};
	
	local nVarandom = random(1,getn(tbItemBCHKN))
	local nVar = tbItemBCHKN[nVarandom].nId
	local itemindx = AddItem(6,1,nVar,1,0,0)
	nExpiredTime = OneDayTime * 3
	ITEM_SetExpiredTime(itemindx, nExpiredTime);
	SetItemBindState(itemindx, -2);
	SyncItem(itemindx)
	local strItem = GetItemName(itemindx)
	Msg2Player("B¹n nhËn ®­îc "..strItem)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
end

function AddRandomNTL()
	tbItemNTL=
	{
		{nId=2266},
		{nId=2267},
		{nId=2268}
	};
	
	local nVarandom = random(1,getn(tbItemNTL))
	local nVar = tbItemNTL[nVarandom].nId
	local itemindx = AddItem(6,1,nVar,1,0,0)
	nExpiredTime = OneDayTime * 3
	ITEM_SetExpiredTime(itemindx, nExpiredTime);
	SetItemBindState(itemindx, -2);
	SyncItem(itemindx)
	local strItem = GetItemName(itemindx)
	Msg2Player("B¹n nhËn ®­îc "..strItem)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Daily nhËn ®­îc "..strItem)
end



IncludeLib("TONG")
Include("\\script\\tong\\addtongnpc.lua")
Include("\\script\\tong\\workshop\\tongcolltask.lua")
if (GetProductRegion() == "cn_ib") then
	Include("\\script\\tong\\map\\map_management.lua");
end;


function main()
	if (GetProductRegion() == "cn_ib") then
		tongmap_entrance(1)
		return
	end;
	--µØÍ¼½ûÖÆÈÓ³ö
	if (GetMapType(SubWorld) == 1)then
		local nTongID = GetMapParam(SubWorld, 0)
		if (nTongID ~= 0)then
			local _,b = GetTongName()
			if (b ~= nTongID and TONG_GetTongMapBan(nTongID) == 1)then
				local pos = GetMapEnterPos(SubWorldIdx2MapCopy(SubWorld))
				SetPos(pos.x, pos.y)
				if (GetTask(TASK_LP_COUNT) > 0) then
					Say("CÊm ®Þa bang héi, kh«ng ®­îc b­íc vµo! NÕu cã nhiÖm vô lÖnh bµi xin h·y t×m xa phu bang héi ®èi tho¹i.", 0)
				else
					Say("CÊm ®Þa bang héi, kh«ng ®­îc lÖnh kh«ng ®­îc phÐp b­íc vµo!", 0)
				end;
			end
		end
	end
end

-- ×÷µØÍ¼ÓÐÐ§ÆÚ¼°µØÍ¼½ûÖÆµÈÅÐ¶Ï²Ù×÷
function tongmap_entrance(bNoExpireWarning)
	if (GetMapType(SubWorld) == 1) then
		local _,nMyTongID = GetTongName()
		local nMapTongID = GetMapParam(SubWorld, 0)
		if (nMapTongID ~= 0) then
			local nEnterForbidden = 0;
			local nTongMapExpireState = tongmap_check_expire(nMapTongID);
			if (nTongMapExpireState == 2) then
				nEnterForbidden = 1;
				Say("Khu vùc bang héi ®· qu¸ thêi h¹n sö dông!", 0);
			elseif (nTongMapExpireState == 1 and nMyTongID == nMapTongID and bNoExpireWarning ~= 1) then
				Msg2Player("Khu vùc bang héi cña quý bang ®· s¾p ®Õn kú h¹n <color=yellow>"..tongmap_get_expire_date(nMapTongID).."<color>!");
			elseif (nMyTongID ~= nMapTongID and TONG_GetTongMapBan(nMapTongID) == 1) then
				nEnterForbidden = 1;
				if (GetTask(TASK_LP_COUNT) > 0) then
					Say("CÊm ®Þa bang héi, kh«ng ®­îc b­íc vµo! NÕu cã nhiÖm vô lÖnh bµi xin h·y t×m xa phu bang héi ®èi tho¹i.", 0)
				else
					Say("CÊm ®Þa bang héi, kh«ng ®­îc lÖnh kh«ng ®­îc phÐp b­íc vµo!", 0)
				end
			end
			if (nEnterForbidden == 1) then
				local nTongMapTemplate = TONG_GetTongMapTemplate(nMapTongID);
				local tTongMapEnterPos = GetMapEnterPos(nTongMapTemplate);
				SetFightState(0);
				SetPos(tTongMapEnterPos.x, tTongMapEnterPos.y);
			end
		end
	end
end
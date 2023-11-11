Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\systemconfig.lua")
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");

--tinhpn 20100805: VLMC
Include("\\script\\bonusvlmc\\head.lua");
Include("\\script\\vonghoa\\item\\head.lua");

LOGINMSG_EXTPOINTID	= 7;
LOGINMSG_BITL			= 1;
LOGINMSG_BITH			= 4;
TB_LOGINMSG_BYBIT = {
[1]	= "Tµi kho¶n cña b¹n ®ang ®­îc ®¨ng ký sè giÊy tê míi. B¹n h·y ®¨ng nhËp b»ng mËt m· 2 vµo https://acc.volam.com.vn ®Ó biÕt th«ng tin chi tiÕt",
[2]	= "Tµi kho¶n cña b¹n ®ang ®­îc ®¨ng ký email míi. B¹n h·y ®¨ng nhËp b»ng mËt m· 2 vµo https://acc.volam.com.vn ®Ó biÕt th«ng tin chi tiÕt",
[3]	= "Tµi kho¶n cña b¹n ch­a ®¨ng ký sè giÊy tê tïy th©n. B¹n h·y ®¨ng nhËp b»ng mËt m· 2 vµo https://acc.volam.com.vn ®Ó biÕt th«ng tin chi tiÕt",
[4]	= "Tµi kho¶n cña b¹n ch­a ®¨ng ký email. B¹n h·y ®¨ng nhËp b»ng mËt m· 2 vµo https://acc.volam.com.vn ®Ó biÕt th«ng tin chi tiÕt",
};

function extpoint_loginmsg()
	do
		return
	end
--	if (not SYSCFG_EXTPOINTID7_LOGINMSG) then
--		return
--	end;
--	
--	-- Ö»ÓÐÔ½ÄÏ°æ±¾²ÅÓÐ´Ë¹¦ÄÜ
--	if (SYSCFG_PRODUCT_REGION_ID ~= DEF_PRODUCT_REGION_VN) then
--		return
--	end
--	SetTask(Task_IsCurUse_VongHoa,0)--set task su dung vong hoa	
--	local nExtP = GetExtPoint(LOGINMSG_EXTPOINTID);
--	if (nExtP ~= 0) then
--		for i = LOGINMSG_BITL, LOGINMSG_BITH do
--			if (GetBit(nExtP, i) == 1 and TB_LOGINMSG_BYBIT[i]) then
--				Msg2Player(TB_LOGINMSG_BYBIT[i])
--			end;
--		end;
--	end;
--	
--	local nDate = tonumber(date("%Y%m%d"))
--	if nDate >=20091201 then
--		if GetTask(2657) == 0 then
--			for i=2629,2635 do
--				SetTask(i,0)
--			end	
--			SetTask(2657,1)
--		end
--	end
--	
--	if IsIPBonus() == 1 and CheckIPBonus() == 1 then
--		IpBonus_Close()
--		IpBonus_Start()
--	else
--		if GetSkillState(451) > 0 and GetTask(TSK_Active_x2EXP) ~= 1 then
--			--Msg2Player("TinhPN: " .. TSK_Active_x2EXP)
--			RemoveSkillState(451)
--		end
--	end;
end;

if login_add then login_add(extpoint_loginmsg, 2) end

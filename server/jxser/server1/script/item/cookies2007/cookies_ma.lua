Include("\\script\\event\\cookies2007\\head.lua");

function main(nItemIdx)
	if (checkcookies2007Date(20070424) ~= 1) then
		Say("Nguyªn liÖu nµy ®· ®Ó qu¸ h¹n sö dông. Kh«ng thÓ dïng ®Ó lµm b¸nh n÷a.", 0);
		return 0;
	end;
	
	local nteam = GetTeamSize();
	if (nteam ~= 2) then
		Say("Bao nguyªn liÖu lµm b¸nh: ChØ cã tæ ®éi nam n÷ míi cã thÓ cïng nhau lµm b¸nh.", 0);
		return 1;
	end;
	
	local nw1, nx1, ny1 = GetWorldPos();
	local nb = 0;
	for i = 1, getn(TB_XINNIANLIHUA_AREA) do
		if (nw1 == TB_XINNIANLIHUA_AREA[i]) then
			nb = 1;
			break
		end;
	end;
	if (nb == 0) then
		Msg2Player("ChØ cã thÓ lµm b¸nh trong ph¹m vi t¹i 7 ®¹i thµnh thÞ, 8 t©n thñ th«n vµ 4 khu vùc phong c¶nh.");
		return 1;
	end;
	
	--local nMaster = GetNpcParam(nNpcIdx, PRM_PAN_PLAYID);
	
	local oldPlayer = PlayerIndex;
	local bM = 0;
	local bS = 0;
	local sztreename = "";
	local szname1 = "";
	local szname2 = "";
	for i= 1, nteam do
		local npidx = GetTeamMember(i);
		PlayerIndex = npidx;
		
		if (i == 1) then
			bS = GetSex();
			szname1 = GetName();
		elseif (bS ~= GetSex()) then
			bS = 2;		--Á½¸öÈËÐÔ±ð²»Í¬
			szname2 = GetName();
		end;
		
	end;
	PlayerIndex = oldPlayer;
	if (bS ~= 2) then
		Say("ChØ cã tæ ®éi nam n÷ míi cã thÓ sö dung nguyªn liÖu nµy ®Ó lµm b¸nh.", 0);
		return 1;
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local oldPlayer = PlayerIndex;
	for i= 1, nteam do
		local npidx = GetTeamMember(i);
		PlayerIndex = npidx;
		if GetTask(TSK_33_COOKIES_DATE) == nil or GetTask(TSK_33_COOKIES_DATE) == 0 then
			SetTask(TSK_33_COOKIES_DATE,nDate);
			SetTask(TSK_33_COOKIES_COUNT,0);
		end
		
		if (tonumber(GetTask(TSK_33_COOKIES_DATE)) == nDate and tonumber(GetTask(TSK_33_COOKIES_COUNT)) >= 8) then
			PlayerIndex = oldPlayer;
			Say("B¹n ®· qu¸ mÖt råi, mai míi cã thÓ tiÕp tôc lµm b¸nh. Mçi ngµy chØ ®ñ søc lµm tèi ®a 8 lÇn.",0);
			return 1;
		end
		
		if tonumber(GetTask(TSK_33_COOKIES_DATE)) ~= nDate and tonumber(GetTask(TSK_33_COOKIES_COUNT)) >= 8 then
			SetTask(TSK_33_COOKIES_COUNT,0);
		end
		
		if (checkcookies2007Limit() ~= 1) then
			PlayerIndex = oldPlayer;
			Say("ThËt ng¹i qu¸, chØ cã ng­êi ch¬i <color=yellow>cÊp trªn 50 ®· n¹p thÎ<color> míi cã thÓ sö dông bao nguyªn liÖu lµm b¸nh, mét trong hai vÞ hiÖp kh¸ch ch­a ®¸p øng ®ñ ®iÒu kiÖn nµy råi.", 0);
			return 1;
		end;
	end
	PlayerIndex = oldPlayer;
	local oldPlayer = PlayerIndex;
	for i= 1, nteam do
		local npidx = GetTeamMember(i);
		PlayerIndex = npidx;
		local ncount = tonumber(GetTask(TSK_33_COOKIES_COUNT));
		ncount = ncount + 1;
		SetTask(TSK_33_COOKIES_COUNT,ncount);
		if ncount >=8 then
			SetTask(TSK_33_COOKIES_DATE,nDate);
		end
	end
	PlayerIndex = oldPlayer;
	
	sztreename = format("BÕp löa - %s vµ %s", szname1, szname2);
	local _, nx, ny = GetWorldPos();
	local nNpcIdx = AddNpc(TB_PAN_NPCID[1], 1, SubWorld, (nx-1)*32, (ny-1)*32, 1, sztreename);
	if (nNpcIdx > 0) then
		local nNameId = FileName2Id(GetName());
		SetNpcParam(nNpcIdx, PRM_PAN_PLAYID, nNameId);
		SetNpcParam(nNpcIdx, PRM_PAN_EVENT, SetByte(GetNpcParam(nNpcIdx,PRM_PAN_EVENT), 3,1));
		SetNpcScript(nNpcIdx, "\\script\\event\\cookies2007\\pan.lua");
		SetNpcTimer(nNpcIdx, 18*30);
	else
		return 1;
	end;
end;
Include("\\script\\event\\valentine2007\\head.lua");

function main(nItemIdx)
	if (checkValentine2007Date(20070223) ~= 1) then
		Say("H¹t hoa hång nµy do ®Ó qu¸ l©u nªn ®· bÞ kh« hÐo.", 0);
		return 0;
	end;
	
	if (checkValentine2007Limit() ~= 1) then
		Say("ThËt ng¹i qu¸, chØ cã ng­êi ch¬i cÊp trªn 80 <color=yellow>®· n¹p thÎ<color> míi cã thÓ sö dông h¹t hoa hång.", 0);
		return 1;
	end;
	
	local nteam = GetTeamSize();
	if (nteam ~= 2) then
		Say("H¹t hoa hång: ChØ cã tæ ®éi 2 ng­êi nam n÷ míi cã thÓ vun trång hoa hång.", 0);
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
		Msg2Player("Hoa hång chØ cã thÓ mäc t¹i c¸c thµnh thÞ, t©n thñ th«n vµ 4 khu vùc phong c¶nh.");
		return 1;
	end;
	
	--local nMaster = GetNpcParam(nNpcIdx, PRM_ROSETREE_PLAYID);
	
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
		Say("H¹t hoa hång: ChØ cã tæ ®éi 2 ng­êi nam n÷ míi cã thÓ vun trång hoa hång.", 0);
		return 1;
	end;
	
	sztreename = format("Hoa hång - %s vµ %s", szname1, szname2);
	local _, nx, ny = GetWorldPos();
	local nNpcIdx = AddNpc(TB_ROSETREE_NPCID[1], 1, SubWorld, (nx-1)*32, (ny-1)*32, 1, sztreename);
	if (nNpcIdx > 0) then
		local nNameId = FileName2Id(GetName());
		SetNpcParam(nNpcIdx, PRM_ROSETREE_PLAYID, nNameId);
		SetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT), 3,1));
		SetNpcScript(nNpcIdx, "\\script\\event\\valentine2007\\rose_tree.lua");
		SetNpcTimer(nNpcIdx, 18*30);
	else
		return 1;
	end;
end;
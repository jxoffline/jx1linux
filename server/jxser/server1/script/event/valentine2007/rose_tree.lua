Include("\\script\\event\\valentine2007\\head.lua");

function isRoseMaster(nNpcIdx, ntask)
	local nteam = GetTeamSize();
	if (nteam ~= 2) then
	
		return 0;
	end;
	
	local nMaster = GetNpcParam(nNpcIdx, PRM_ROSETREE_PLAYID);
	if (nMaster < 0) then
		nMaster = nMaster + 4294967296;	-- id+2^32
	end;
	
	local oldPlayer = PlayerIndex;
	local bM = 0;
	local bS = 0;
	for i= 1, nteam do
		local npidx = GetTeamMember(i);
		PlayerIndex = npidx;
		
		if (FileName2Id(GetName()) == nMaster) then
			bM = 1;		--ÆäÖÐÒ»¸öÊÇÖÖÎÒµÄÈË
		end;
		
		if (i == 1) then
			bS = GetSex();
		elseif (bS ~= GetSex()) then
			bS = 2;		--Á½¸öÈËÐÔ±ð²»Í¬
		end;
	end;
	PlayerIndex = oldPlayer;
	
	if (bM ~= 1 or bS ~= 2) then
		return 0;
	end;
	
	return 1;
end;

function main()	--¶Ô»°Èë¿Ú
	local nNpcIdx = GetLastDiagNpc();
	
	if (isRoseMaster(nNpcIdx) == 1) then
		local nparam2 = GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT);
		local nevent,nstate,nphase,task = GetByte(nparam2, 1),GetByte(nparam2, 2),GetByte(nparam2, 3),GetByte(nparam2, 4);
		
		if (nphase == 4) then		--²É»¨µÄ½×¶Î
			local nCurTime = GetCurServerTime();
			local nmyTime = GetNpcParam(nNpcIdx, PRM_ROSETREE_TIME);
			if (nmyTime > nCurTime) then
				Msg2Player("§ang h¸i hoa hång, xin ®îi trong gi©y l¸t!");
				return 0;
			end;
--			if (GetSkillState(765) == 1) then		--ÕýÔÚ²É»¨×´Ì¬
--				Msg2Player("ÕýÔÚ²ÉÕªÃµ¹åÖÐ£¬ÇëÉÔµÈ£¡");
--			else																--²»ÊÇ²É»¨×´Ì¬
				local nparam4 = GetNpcParam(nNpcIdx, PRM_ROSETREE_POINT)
				local pure, norm, bud = getRoseTreeCount(nNpcIdx);
				if (nparam4 > 0 and nmyTime == 0) then
					
					local szmsg = "";
					if (pure > 0) then
						szmsg = format("<color=yellow>%d ®ãa<color> hoa hång ®á ®Æc biÖt",pure);
					end;
					if (norm > 0) then
						szmsg = format("<color=yellow>%d ®ãa<color> hoa hång ®á b×nh th­êng %s",norm, szmsg);
					end;
					if (bud > 0) then
						szmsg = format("<color=yellow>%d ®ãa<color> hoa hång ®á chím në %s",bud, szmsg);
					end;
					
					szmsg = format(DEC_ROSETREE_EVENT[5], szmsg);
					Say(szmsg, 2, "H¸i hoa hång/#sure2pickrose("..nNpcIdx..")", "L¸t n÷a quay l¹i /OnCancel");
				elseif (nmyTime <= nCurTime) then
					local nItem = 0;
					if (pure > 0) then
						pure = pure - 1;
						SetNpcParam(nNpcIdx, PRM_ROSETREE_POINT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_POINT),1,pure));
						nItem = AddItem(unpack(TB_ROSETREE_ROSEPROP[1]));
					elseif (norm > 0) then
						norm = norm - 1;
						SetNpcParam(nNpcIdx, PRM_ROSETREE_POINT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_POINT),2,norm));
						nItem = AddItem(unpack(TB_ROSETREE_ROSEPROP[2]));
					elseif (bud > 0) then
						bud = bud - 1;
						SetNpcParam(nNpcIdx, PRM_ROSETREE_POINT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_POINT),3,bud));
						nItem = AddItem(unpack(TB_ROSETREE_ROSEPROP[3]));
					else
						Talk(1, "", DEC_ROSETREE_OTHER[random(getn(DEC_ROSETREE_OTHER))]);
						
						return 0;
					end;
					
					Msg2Player("B¹n cã ®­îc mét ®ãa hång"..GetItemName(nItem));
					SetNpcParam(nNpcIdx, PRM_ROSETREE_TIME, 0);
				end;
--			end;
			
		else									--³É³¤½×¶Î
			if (task >= 1 and task <= 4) then		--ÓÐÒ»¸öÈÎÎñ
				if (nstate == 0) then	--»¹Ã»½Ó
					Say(DEC_ROSETREE_EVENT[task], 1, "Ta biÕt råi/#sure2rosetaketask("..nNpcIdx..")");
				elseif (nstate == 1) then	--½ÓÁË£¬Ã»×ö
					local szOpp = format("%s/#sure2rosedotask(%d)",DEC_ROSETREE_STASK[task], nNpcIdx);
					Say("", 2, szOpp, "H·y ®îi mét chót/OnCancel");
				elseif (nstate == 2) then	--×öÍêÁË
					Talk(1, "", DEC_ROSETREE_OTHER[random(getn(DEC_ROSETREE_OTHER))]);
				end;
			else								--Ã»ÓÐ¸öÈÎÎñ
				Talk(1, "", DEC_ROSETREE_OTHER[random(getn(DEC_ROSETREE_OTHER))]);
			end;
		end;
	else
		Talk(1, "", DEC_ROSETREE_OTHER[random(getn(DEC_ROSETREE_OTHER))]);
	end;
end;

function sure2pickrose(nNpcIdx)
	if (isRoseMaster(nNpcIdx) ~= 1) then
		return 0;
	end;
	local nparam4 = GetNpcParam(nNpcIdx, PRM_ROSETREE_POINT);
	if (nparam4 > 0) then
		--AddSkillState(765, 1, 1, 3*18);--SkillState(509)
		SetNpcParam(nNpcIdx, PRM_ROSETREE_TIME, GetCurServerTime()+3);
		Msg2Player("§îi 3 gi©y sau míi cã thÓ h¸i hoa hång");
	else
		Talk(1, "", DEC_ROSETREE_OTHER[random(getn(DEC_ROSETREE_OTHER))]);
		Msg2Player("TÊt c¶ hoa hång ®· ®­îc h¸i hÕt");
	end;
end;

function sure2rosetaketask(nNpcIdx)
	if (isRoseMaster(nNpcIdx) ~= 1) then
		return 0;
	end;
	local nparam2 = GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT);
	local _,nstate,_,task = GetByte(nparam2, 1),GetByte(nparam2, 2),GetByte(nparam2, 3),GetByte(nparam2, 4);
	if (task >= 1 and task <= 4 and nstate == 0) then
		SetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT), 2, 1));
		AddNpcSkillState(nNpcIdx, 662, 1,1, 0);	--Çå Ì¾ºÅ
		AddNpcSkillState(nNpcIdx, 765, 1,1, 30*18);	--¼Ó ÎÊºÅ
		SetNpcParam(nNpcIdx, PRM_ROSETREE_TIME, GetCurServerTime()+TB_ROSETREE_TASKTIME[task]);
		Msg2Player(format("§îi %s gi©y sau míi cã thÓ %s.", TB_ROSETREE_TASKTIME[task], DEC_ROSETREE_STASK[task]));
	end;
end;

function sure2rosedotask(nNpcIdx)
	if (isRoseMaster(nNpcIdx) ~= 1) then
		return 0;
	end;
	local nparam2 = GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT);
	local nparam3 = GetNpcParam(nNpcIdx, PRM_ROSETREE_TIME);
	local _,nstate,_,task = GetByte(nparam2, 1),GetByte(nparam2, 2),GetByte(nparam2, 3),GetByte(nparam2, 4);
	if (task >= 1 and task <= 4 and nstate == 1) then
		local nsex = mod(task, 2);
		if ((GetSex() == nsex and task >= 1 and task <= 2) or (task>=3 and task <= 4)) then
			calcrosetreepoint(nNpcIdx, abs(nparam3-GetCurServerTime()));
			SetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT), 2, 0));
			SetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT), 4, 0));
			SetNpcParam(nNpcIdx, PRM_ROSETREE_TIME, 0);
			AddNpcSkillState(nNpcIdx, 765,1, 1, 0);	--Çå ÎÊºÅ
			Msg2Player("Xin ®a t¹"..DEC_ROSETREE_STASK[task]);
		elseif (GetSex() ~= nsex) then
			local szmsg = format("ChØ cã %s míi cã thÓ %s ®­îc.", DEC_ROSETREE_SZSEX[nsex], DEC_ROSETREE_STASK[task]);
			Say(szmsg, 0);
		end;
	end;
end;

function calcrosetreepoint(nNpcIdx, nvalue)
	local npoint = 0;
	if (nvalue <= 1) then
		npoint = 10;
	elseif (nvalue == 2 or nvalue == 3) then
		npoint = 8;
	elseif (nvalue == 4 or nvalue == 5) then
		npoint = 7;
	elseif (nvalue >= 6 and nvalue <= 8) then
		npoint = 6;
	else
		npoint = 5;
	end;
	local ncurpoint = GetNpcParam(nNpcIdx, PRM_ROSETREE_POINT);
	Msg2Team("§iÓm sè lÇn nµy"..npoint);
	Msg2Team("Tæng ®iÓm nhËn ®­îc"..(ncurpoint+npoint));
	SetNpcParam(nNpcIdx, PRM_ROSETREE_POINT, ncurpoint + npoint);
end;

--Npc¶¨Ê±Æ÷
function OnTimer(nNpcIdx, nTimeOut)
	
	if (nTimeOut == nil or nTimeOut > 0) then
		DelNpc(nNpcIdx)
		return 0;
	end;

	local nparam1 = GetNpcParam(nNpcIdx, PRM_ROSETREE_PLAYID);
	if (nparam1 < 0) then
		nparam1 = nparam1 + 4294967296;	-- id+2^32
	end;
	local nparam2 = GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT);
	local nevent = GetByte(nparam2, 1);
	local nstate = GetByte(nparam2, 2);
	local nphase = GetByte(nparam2, 3);
	local npoint = GetNpcParam(nNpcIdx, PRM_ROSETREE_POINT);
	
	if (nphase == 4) then
		DelNpc(nNpcIdx);
	else
		nevent = nevent + 1;--ÈÎÎñ¼ÆÊý
		SetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT), 1, nevent));
		
		if (nevent == 10) then	--±äÉíÊ±¼ä
		
			nevent = 0;
			nphase = nphase + 1;
			nstate = 0;
			local nx, ny = GetNpcPos(nNpcIdx);	--Ãµ¹åÊ÷×ø±ê
			local szname = GetNpcName(nNpcIdx);			--Ãµ¹åÊ÷µÄÃû×Ö
			DelNpc(nNpcIdx);										--É¾µô¸ÃÃµ¹åÊ÷
																					--´´½¨Ò»¸ö³É³¤ºóµÄÃµ¹åÊ÷
			local nIdx = AddNpc(TB_ROSETREE_NPCID[nphase], 1, SubWorld, nx, ny, 1, szname);
			
				--¸´ÖÆÔ­À´Ê÷µÄÐÅÏ¢
			SetNpcScript(nIdx, "\\script\\event\\valentine2007\\rose_tree.lua");
			SetNpcParam(nIdx, PRM_ROSETREE_PLAYID, nparam1);
			SetNpcParam(nIdx, PRM_ROSETREE_EVENT, SetByte(GetNpcParam(nIdx, PRM_ROSETREE_EVENT), 3, nphase));
			SetNpcParam(nIdx, PRM_ROSETREE_POINT, npoint);
			SetNpcParam(nIdx, PRM_ROSETREE_TIME, 0);
			if (nphase ~= 4) then
				SetNpcTimer(nIdx, 30*18);	--¿ªÆôÏÂÒ»¸ö¶¨Ê±Æ÷
			else
				initRoseTreeCount(nIdx, npoint);
				SetNpcTimer(nIdx, 30*60*18);	--¿ªÆôÏÂÒ»¸ö¶¨Ê±Æ÷
			end;
		else									--³É³¤Ê±¼ä
		
			local process = mod(nevent, 3);
			local task = 0;
			
			if (process == 1) then		--¿ªÆôÒ»¸öÈÎÎñ
				startRoseTreeTask(nNpcIdx, nphase);
			elseif (process == 2) then		--¿ªÆôÒ»¸öÈÎÎñ
				if (nstate == 0) then
					endRoseTreeTask(nNpcIdx);
				end;
			elseif (process == 0) then	--½áÊøÒ»¸öÈÎÎñ
				endRoseTreeTask(nNpcIdx);
			end;
			SetNpcTimer(nNpcIdx, 30*18);	--¿ªÆôÏÂÒ»¸ö¶¨Ê±Æ÷
		end;
	end;
end;


function initRoseTreeCount(nidx, npoint)
	local bud = 9;
	local norm = 0;
	local pure = 0;
	
	for i = npoint, 0, -5 do
		if (bud > 0) then
		
		end;
	end;
	while (bud > 0 and npoint > 0) do
		npoint = npoint - 5;
		bud = bud - 1;
		norm = norm + 1;
	end;
	
	while (norm > 0 and npoint > 0) do
		npoint = npoint - 5;
		norm = norm - 1;
		pure = pure + 1;
	end;
	---phase <= 3 then time; byte:pure=1;norm=2;bud =3;
	
	SetNpcParam(nidx, PRM_ROSETREE_POINT, 0);
	SetNpcParam(nidx, PRM_ROSETREE_POINT, SetByte(GetNpcParam(nidx, PRM_ROSETREE_POINT), 1, pure));
	SetNpcParam(nidx, PRM_ROSETREE_POINT, SetByte(GetNpcParam(nidx, PRM_ROSETREE_POINT), 2, norm));
	SetNpcParam(nidx, PRM_ROSETREE_POINT, SetByte(GetNpcParam(nidx, PRM_ROSETREE_POINT), 3, bud));
end;

function getRoseTreeCount(nidx)
	local nparam4 = GetNpcParam(nidx, PRM_ROSETREE_POINT)
	return GetByte(nparam4, 1),GetByte(nparam4, 2),GetByte(nparam4, 3)
end;

function startRoseTreeTask(nNpcIdx, nphase)
	local task = random(1, TB_ROSETREE_TASK[nphase]);	--Ëæ»úÒ»¸öÈÎÎñ
	SetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT), 4, task));	--´¥·¢ÈÎÎñ
	AddNpcSkillState(nNpcIdx, 662,1, 1, 30*18);	--ÏÔÊ¾ÈÎÎñ×´Ì¬
	
end;

function endRoseTreeTask(nNpcIdx)
	AddNpcSkillState(nNpcIdx, 662,1, 1, 0);	--ÇåµôÏÔÊ¾×´Ì¬
	AddNpcSkillState(nNpcIdx, 765,1, 1, 0);	--ÇåµôÏÔÊ¾×´Ì¬
	SetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT), 2, 0));
	SetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT), 4, 0));
	SetNpcParam(nNpcIdx, PRM_ROSETREE_TIME, 0);
	
end;

function OnCancel()
end;

function OnTimeOut(nNpcIdx, nTimeOut)
	
	DelNpc(nNpcIdx)
end

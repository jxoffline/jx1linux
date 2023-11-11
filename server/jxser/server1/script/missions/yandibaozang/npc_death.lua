-- Ñ×µÛ±¦²Ø
-- by Ð¡ÀË¶à¶à
-- 2007.10.24
-- ÎÒ..
-- ÕýÔÚ³¢ÊÔ×Å..
-- Ñ°ÕÒ×ÅÊôÓÚÎÒµÄÌìµØ..
Include("\\script\\missions\\yandibaozang\\npc.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\saizi.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\yandibaozang\\doubleexp.lua")
Include("\\script\\misc\\eventsys\\type\\func.lua")
--Phong V©n LÖnh Bµi tæ ®éi hæ trî t©n thñ - Modified By DinhHQ - 20110916
Include("\\script\\activitysys\\config\\1005\\partysupport.lua")

function YDBZ_award(index,ntype,nplayindex)
	local x, y, world = GetNpcPos(index);
	for x1,y1 in YDBZ_tbaward_item[ntype] do
		for i=1,y1[2] do
			local p = random(1,100)
			if p <= y1[1] then
				if y1[4] == 0 then
					DropItem(world, x, y, -1, y1[3][1], y1[3][2], y1[3][3], y1[3][4], y1[3][5], y1[3][6], 0, 0, 0, 0, 0, 0);
				elseif y1[4] == 1 then
						local idx= 0
						local pidx,nj
						
						local oldplayer = PlayerIndex
						PlayerIndex = nplayindex
						YDBZ_DiceDice(y1[3][1],y1[3][2],y1[3][3],20,y1[6])
						PlayerIndex = oldplayer	
				end
			end
		end
	end
end

function YDBZ_fun_award_byCount(nCount, szMsg)
	nCount = nCount or 0
	if nCount <= 0 then
		return 
	end
	local tbAward = {}
	tbAward[1] = YDBZ_tbaward_item_ex[1]
	
	szMsg = szMsg or ""
	local szLogTitle = format("%s award",szMsg)
	tbAwardTemplet:Give(tbAward, nCount, {"YDBZ", szLogTitle})
end

-- 2011.03.23 ´³Ò»¹Ø»ñµÃ1Ñ×µÛ±¦Ïä
function YDBZ_fun_award_ydmibao(camp, nnpcway)
	--Phong V©n LÖnh Bµi tæ ®éi hæ trî t©n thñ - Modified By DinhHQ - 20110916
	local tbAllPlayers = {}
	
	local idx= 0
	local nCount = 1
	local pidx,nj, nTeamSize = GetTeamSize()
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
		if (pidx > 0 and nCount >= 1) then
			local sMsg = format("V­ît qua ¶i thø %d",nnpcway)
			G_ACTIVITY:OnMessage("YDBZguoguan", pidx, nnpcway);
			EventSys:GetType("YanDiBaoZang"):OnPlayerEvent("OnPass", pidx, nnpcway)
			-- Cø qua ¶i 2,4,6,8,10 sÏ nhËn ®­îc 1 B¶o r­¬ng viªm ®Õ - Modified - by AnhHH 20110724
			if (mod(nnpcway,2) == 0) then
				CallPlayerFunction(pidx,YDBZ_fun_award_byCount, nCount, sMsg)
			end
			
			--Phong V©n LÖnh Bµi tæ ®éi hæ trî t©n thñ - Modified By DinhHQ - 20110916
			tbAllPlayers[getn(tbAllPlayers) + 1] = pidx
			
		end
		if (idx == 0) then
			break
		end
	end
	
	--Phong V©n LÖnh Bµi tæ ®éi hæ trî t©n thñ - Modified By DinhHQ - 20110916
	tbPVLB_PtSpprt:YDBZAward(nnpcway, tbAllPlayers)
end

function YDBZ_fun_award_exp(camp,ns)
	local idx= 0
	local pidx,nj
	local oldplayer = PlayerIndex
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
		if (pidx > 0) then
				PlayerIndex = pidx
				if ns == 1 then
					local nexp = YDBZ_AWARD_EXP
					local szdstr = ""
					if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
						 nexp = YDBZ_AWARD_EXP * 2 
						 szdstr = "<color=yellow>[Viªm §Õ LÖnh cã hiÖu lùc]<color>"
					end
					nexp = YDBZ_checkdoubleexp(nexp)
					AddOwnExp(nexp)
					Msg2Player(format("%s chóc mõng v­ît ¶i thø nhÊt, thu ®­îc <color=yellow>%s<color> kinh nghiÖm",szdstr,nexp))
				elseif ns == 2 then
					local nexp = YDBZ_Faninl_AWARD_EXP
					local szdstr = ""
					if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
						 nexp = YDBZ_Faninl_AWARD_EXP * 2 
						 szdstr = "<color=yellow>[Viªm §Õ LÖnh cã hiÖu lùc]<color>"
					end
					nexp = YDBZ_checkdoubleexp(nexp)
					AddOwnExp(nexp)
					Msg2Player(format("%s chóc mõng tæ ®éi ®· giÕt thµnh c«ng 1 boss cã né khÝ, thu ®­îc <color=yellow>%s<color> kinh nghiÖm",szdstr,nexp))					
				end
		end
		if (idx == 0) then
			break;
		end;
	end
	PlayerIndex = oldplayer
end
--ÅÅÐÐ°ñ
function YDBZ_savepaihang(camp)
	
	local teamname = GetMissionS(camp)
	local nstate = GetMissionV(YDBZ_VARV_STATE)
	local laddertime = YDBZ_LIMIT_FINISH - ( ((nstate-4)* YDBZ_LIMIT_BOARDTIME) + floor(GetMSRestTime(YDBZ_MISSION_MATCH,YDBZ_TIMER_MATCH)/18) )
	local bfind = 0
	--print("ÅÅÐÐ°ñ:"..laddertime.." state:"..nstate.."relast:"..GetMSRestTime(YDBZ_MISSION_MATCH,YDBZ_TIMER_MATCH))
	local nteamsum = GetMissionV(YDBZ_TEAM_SUM)
	if nteamsum < 3 then
		return laddertime
	end
	if (laddertime > YDBZ_LIMIT_FINISH or laddertime < 0) then
		return laddertime
	end
	for i = 1, 10 do 
		name , value = Ladder_GetLadderInfo(YDBZ_PAIHANG_ID, i)
		if (name  == teamname) then
			bfind = 1
			if ( laddertime > value) then
				Ladder_NewLadder(YDBZ_PAIHANG_ID, teamname, laddertime,1)
				break
			end
		end
	end
	
	if (bfind == 0) then
		Ladder_NewLadder(YDBZ_PAIHANG_ID, teamname, laddertime, 1)
	end
	return laddertime
end

-- todo
-- ½«40¸öÑ×µÛÃØ±¦Ëæ»ú·ÖÅä£¬·¢¸ø¶ÓÎéÀïµÄÈË
function YDBZ_award_finalboss_ex(camp, nTotalCount)
	local nNum = {}
	local nSize = GetMSPlayerCount(YDBZ_MISSION_MATCH, camp)
	for i = 1, nSize do
		nNum[i] = 1
	end
	
	for i = nSize + 1, nTotalCount do                     
		local p = random(1,nSize)
		nNum[p] = nNum[p] + 1
	end
	print("Nh©n Sè ®éi ngò =" .. nSize)
	local idx, pidx
	for nj = 1, nSize do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx, camp );
		if (pidx > 0 and nNum[nj] >= 1) then
			local szMsg = format("V­ît qua ¶i cuèi cïng")
			print(format("pidx = %d, nNum[nj] = %d", pidx, nNum[nj]))
			CallPlayerFunction(pidx,YDBZ_fun_award_byCount, nNum[nj], szMsg)
		end
		if (idx == 0) then
			break
		end
	end
	
end

function YDBZ_award_finalboss(camp)
	local idx= 0
	local pidx,nj
	local nplaynum = 0
	
	-- GiÕt Boss cuèi tÝnh n¨ng viªm ®Õ - Modified - by DinhHQ 20120314
	local tbAward = YDBZ_tbaward_item[4]
	local szLogTitle = "GietBossCuoiTinhNangViemDe"
	local oldplayer = PlayerIndex
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
		if (pidx > 0) then
			PlayerIndex = pidx
			tbAwardTemplet:Give(tbAward, 1, {"YDBZ", szLogTitle})
			nexp = YDBZ_checkdoubleexp(20e6)
			AddOwnExp(nexp)
			Msg2Player(format("<color=yellow>Chóc mõng hoµn thµnh v­ît ¶i viªm ®Õ, thu ®­îc <color>%s kinh nghiÖm<color=yellow>.<color>",nexp))
		end
		if (idx == 0) then
			break;
		end;
	end
	PlayerIndex = oldplayer
--	local oldplayer = PlayerIndex
--	for nj = 1, 10 do
--		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
--		if (pidx > 0) then
--				PlayerIndex = pidx
--				nplaynum = nplaynum + 1
--				--AddOwnExp(YDBZ_AWARD_EXP)
--				local tbawarditem = {}
--				local y = YDBZ_tbaward_item[4]
--				local nitem = 0
--				for nx,ny in y do 
--					local ncount = 0
--					for i=1,ny[2] do
--						local p = random(1,100)
--						if p <= ny[1] then
--							nitem = nitem + 1
--							local ndoubel = 1
--							if ny[6] == 1 then 
--								if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
--									ndoubel = 2 
--								end
--							end
--							for nx =1 ,ndoubel do
--								local nidx = AddItem(ny[3][1], ny[3][2], ny[3][3], ny[3][4], ny[3][5], ny[3][6]);
--								YDBZ_sdl_writeLog("V­ît ¶i b¶o tµng viªm ®Õ",format("Lóc v­ît ¶i thu ®­îc 1 %s",GetItemName(nidx)))
--							end
--							ncount = ncount + ndoubel
--							--tbawarditem[nx]={}
--							--tbawarditem[nx][1] = ny[5]
--						end
--					end
--					if ncount > 0 then
--						tbawarditem[nitem] = {}
--						tbawarditem[nitem][1] = ny[5]
--						tbawarditem[nitem][2] = ncount
--					end
--					
--				end
--				local szstr = ", <color=yellow> thu ®­îc <color>"
--				for nx,ny in tbawarditem do
--					szstr = szstr .. ny[2] .."c¸i"..ny[1]
--					if nx ~= getn(tbawarditem) then
--						szstr = szstr .."<color=yellow>, <color>" 
--					end
--				end
--				local nexp = YDBZ_KILLLASTBOSS_EXP
--				local szdstr = ""
--				if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
--							nexp = YDBZ_KILLLASTBOSS_EXP * 2 
--							szdstr = "<color=yellow>[Viªm §Õ LÖnh cã hiÖu lùc]<color>"
--				end
		--		nexp = YDBZ_checkdoubleexp(nexp)
--				AddOwnExp(nexp)
--				Msg2Player(format("%s<color=yellow>chóc mõng hoµn thµnh v­ît ¶i viªm ®Õ, thu ®­îc <color>%s kinh nghiÖm %s<color=yellow>.<color>",szdstr,nexp,szstr))
--				Msg2Player(format("Chóc mõng c¸c vÞ ®¹i hiÖp v­ît ¶i Viªm §Õ thµnh c«ng, <color=yellow>30 gi©y<color> sau sÏ ®Èy ra khái b¶n ®å b¶o tµng."))
--		end
--		if (idx == 0) then
--			break;
--		end;
--	end
	SetMissionV(YDBZ_STATE_SIGN,4)
	local pname = GetMissionS(camp)
	local nmapid = SubWorldIdx2ID(SubWorld)
	broadcast(format("Chóc mõng tæ ®éi %s ®· v­ît ¶i viªm ®Õ thµnh c«ng, thu ®­îc phÇn th­ëng v« cïng quý gi¸.",pname))
	local ntime = YDBZ_savepaihang(camp)
	--print(pname,nplaynum,nmapid,camp,ntime)
	local szstr = format("[V­ît ¶i b¶o tµng viªm ®Õ] thêi gian %s, chiÕn ®éi %s cßn l¹i sè ng­êi %s, sè hiÖu b¶n ®å %s, trËn doanh lµ %s giÕt BOSS cuèi, d­ thêi gian %s gi©y",GetLocalDate("%y-%m-%d %H:%M:%S"),pname,nplaynum,nmapid,camp,ntime) 
	WriteLog(szstr)
--	PlayerIndex = oldplayer
	StopMissionTimer(YDBZ_MISSION_MATCH, YDBZ_TIMER_MATCH);	
	StartMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE,YDBZ_TIME_WAIT_STATE3 * 18)
	--
	--CloseMission(YDBZ_MISSION_MATCH)
end
--1	1 -10 AÐ¡¹ØÐ¡Boss
--1 11-20 BÐ¡¹ØÐ¡Boss
--1 21-30 CÐ¡¹ØÐ¡Boss
--1 40		 Õù¶áµØ10¸öboss
--1 50		 ×îÖÕ´óboss
--2 1-10		 A¸÷Ð¡¹ØÐ¡¹Ö
--2 11-20		 B¸÷Ð¡¹ØÐ¡¹Ö
--2 21-30		 C¸÷Ð¡¹ØÐ¡¹Ö
function OnDeath(index)
	local oldworld = SubWorld
	local x, y,world = GetNpcPos(index);
	SubWorld = world
	local nband = GetNpcParam(index,1)
	local nband2 = GetNpcParam(index,2)
	--print("mon npc dead! param:"..nband)
	--print("mon npc dead! param2:"..nband2)
	local npccount = 0
	if nband == 0 then												--Ð¡¹Ö
		local nteam = floor((nband2-1)/10)+1		--¶ÓÎé
		local npctype = nband2 - 10*(nteam-1)		--ÃÅÅÉ
		local npcallsum = 0
		--print(nteam,npctype,YDBZ_NPC_ATTRIDX_COUNT,world,YDBZ_NPC_COUNT[nteam])
		npcallsum = YDBZ_map_npc[npctype][1][YDBZ_NPC_ATTRIDX_COUNT]

		local npccount = GetMissionV(YDBZ_NPC_COUNT[nteam])
		local npcway = GetMissionV(YDBZ_NPC_WAY[nteam])

		--print(npcallsum,npccount,nteam)
		if npccount + 1 == npcallsum then
			SetMissionV(YDBZ_NPC_COUNT[nteam],0)
			local file = YDBZ_map_posfiles[1][nteam][npcway+1]
			YDBZ_add_npc(file,nteam,npcway+1,2)
			if npcway + 1 == 3 or npcway + 1 == 6 then
				YDBZ_add_npc(file,nteam,npcway+1,21)
				SetMissionV(YDBZ_NPC_COUNT[nteam],2)
			else
				SetMissionV(YDBZ_NPC_COUNT[nteam],1)
			end
		else
			SetMissionV(YDBZ_NPC_COUNT[nteam],(npccount + 1))
		end

	elseif nband >= 1 and nband <= 30 then	--Ç°10Ð¡¹ØµÄboss¹Ö		
			local nteam = (floor((nband-1)/10))+1					--¶ÓÎé
			local npcway = nband - 10*(nteam-1)			--¹Ø
			
			local nCount = GetMissionV(YDBZ_NPC_COUNT[nteam])
			if nCount == 1 then
				SetMissionV(YDBZ_NPC_COUNT[nteam], 0)
				SetMissionV(YDBZ_NPC_WAY[nteam],npcway)
			if npcway == 10 then
				if GetMissionV(YDNZ_STATE_SIGN) ~= 0 then
					Msg2MSAll(YDBZ_MISSION_MATCH,"§· b­íc vßa giai ®o¹n tranh ®o¹t, cöa ¶i ®· ®ãng.")
					return 
					end
				end
			--print("teams:"..nteam.." way:"..npcway)
			local mapfile = YDBZ_mapfile_trap[nteam][4].."trap"..npcway..".txt"
			YDBZ_bt_clearzhangai(mapfile)
			YDBZ_fun_award_exp(nteam,1)
			
			YDBZ_fun_award_ydmibao(nteam,npcway)	-- 2011.03.23 Ñ×µÛµ÷Õû
			YDBZ_award(index,2,PlayerIndex)
			local teamname = GetMissionS(YDBZ_TEAM_NAME[nteam])
			local szstr = format("<color=yellow>%s<color>®· thµnh c«ng v­ît ¶i <color=yellow>thø %s<color>.",teamname,npcway)
			if npcway == 10 then
				szstr = szstr .. "TiÕn vµo n¬i s©u nhÊt cña s¬n ®éng."	
				else				
					local file = YDBZ_map_posfiles[1][nteam][npcway+1]
					YDBZ_add_npc(file,nteam,npcway+1,1)
				end
				Msg2MSAll(YDBZ_MISSION_MATCH,szstr)
			else
				YDBZ_fun_award_exp(nteam,1)
				YDBZ_award(index,2,PlayerIndex)
				SetMissionV(YDBZ_NPC_COUNT[nteam], nCount-1) 
			end
			
	elseif nband == 40 then							--Õù¶áµØ10¸öboss
			npccount = GetMissionV(YDBZ_NPC_BOSS_COUNT)
			local nteam = GetCurCamp()
			SetMissionV(YDBZ_NPC_BOSS_COUNT,npccount-1)
			YDBZ_award(index,3,PlayerIndex)
			YDBZ_fun_award_exp(nteam,2)
			if npccount-1 == 0 then
				Msg2MSAll(YDBZ_MISSION_MATCH,"V­ît ¶i b¶o tµng viªm ®Õ ®· tiÕn vµo <color=yellow>giai ®o¹n tranh ®o¹t<color>, <color=yellow>10 gi©y<color> sau sÏ triÖu gäi tÊt c¶ thµnh viªn trong tæ ®éi vµo b¶n ®å tranh ®o¹t, chØ cßn <color=yellow>1 tæ ®éi<color> míi cã thÓ triÖu gäi BOSS cuèi.")
				SetMissionV(YDBZ_STATE_SIGN,1)
				for i=1,3 do 
					local trapfile = YDBZ_mapfile_trap[i][4].."trap10.txt"
					YDBZ_bt_addZhangai(trapfile)
				end
				StartMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE,YDBZ_TIME_WAIT_STATE1*18)
			end

	elseif nband == 50 then							--×îÖÕ´óboss
			--local oldplayer = PlayerIndex 
			--PlayerIndex = index
			nteam = GetCurCamp()
			--print(nteam)
			YDBZ_award_finalboss(nteam)
			-- §ãng phÇn th­ëng Viªm §Õ B¶o R­¬ng khi kÕt thóc  Viªm §Õ- Modified - by AnhHH 20110726
		--	YDBZ_award_finalboss_ex(nteam, 40)	-- É±ËÀ×îÖÕboss£¬ÁìÈ¡±¦Ïä½±Àø£¬Ëæ»ú·ÖÅä40Ñ×µÛÃØ±¦
			G_ACTIVITY:OnMessage("YDBZ_KillMaxBoss", YDBZ_MISSION_MATCH, nteam);
		--	PlayerIndex = oldplayer
	end
	SubWorld = oldworld
end


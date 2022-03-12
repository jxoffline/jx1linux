----------------------------------------------------------------
--FileName:	npcdeath.lua
--Creater:	firefox
--Date:		2005-09-01
--Comment:	周末活动：卫国战争之烽火连城
--			功能：NPC死亡脚本
-----------------------------------------------------------------
--rank = 1, 2, 3, 4, 5
Include("\\script\\missions\\citydefence\\head.lua")
function OnDeath( nNpcIndex )
	local state = GetMissionV(MS_STATE) ;
	if (state ~= 2) then
		return
	end;
	
	--如果是死于其它Npc则不统计排行
	if (PlayerIndex == nil or PlayerIndex == 0) then
		return
	end;
	
	if ( rank <= 3 and rank > 0  ) then
		if ( GetMissionV( MS_BOSS4_DOWN ) ~= 1 ) then
			if ( GetMissionV( MS_1RSTNPC_TCNT + rank - 1 ) ~= 0 ) then
				SetMissionV( MS_1RSTNPC_TCNT + rank - 1, GetMissionV( MS_1RSTNPC_TCNT + rank - 1 ) - 1 )
				SetMissionV( MS_1RSTNPC_CCNT + rank - 1, GetMissionV( MS_1RSTNPC_CCNT + rank - 1 ) + 1 )
				SetMissionV( MS_TLCOUNT_COMMON, GetMissionV( MS_TLCOUNT_COMMON ) + 1 )
			end
			if ( GetMissionV( MS_TLCOUNT_COMMON ) == ( FIRE_1RSTNPC_COUNT + FIRE_2CNDNPC_COUNT + FIRE_3RDNPC_COUNT ) ) then
				cd_callboss4down()
				SetMissionV(MS_1RSTNPC_CCNT, 0)
				SetMissionV(MS_1RSTNPC_CCNT + 1, 0)
				SetMissionV(MS_1RSTNPC_CCNT + 2, 0)
				SetMissionV(MS_1RSTNPC_TCNT, 0)
				SetMissionV(MS_1RSTNPC_TCNT + 1, 0)
				SetMissionV(MS_1RSTNPC_TCNT + 2, 0)
			end
		end
	elseif ( rank == 4 ) then
		if ( GetMissionV( MS_BOSS5_DOWN ) ~= 1 ) then
			if ( GetMissionV( MS_4THNPC_TCNT ) ~= 0 ) then
				SetMissionV( MS_4THNPC_TCNT, GetMissionV( MS_4THNPC_TCNT ) - 1 )
			end
			if ( GetMissionV( MS_4THNPC_TCNT ) == 0 ) then
				cd_callboss5down()
				SetMissionV( MS_4THNPC_TCNT, 0 )
			end
		end
	elseif ( rank == 5 ) then
		SetMissionV( MS_5THNPC_TCNT, GetMissionV( MS_5THNPC_TCNT ) - 1 )
		if ( GetMissionV( MS_5THNPC_TCNT ) <= 0 ) then
			SetMissionV( MS_CITYDEFENCE, 1 )
			CloseMission( MISSIONID )
		end
	end
	
end

function cd_callboss5down()
	local npcfile = GetMissionS( MS_S_SRNPCFILE );
	local filehigh = GetTabFileHeight( npcfile )
	if ( filehigh <= 0 or filehigh == nil ) then
		print("commonfile error ")
		return
	end
	local citycamp = GetMissionV( MS_CITYCAMP )
	local npccamp = 1
	local npcname = "Qu﹏ T鑞g"
	if ( citycamp == 1 ) then
		npccamp = 2
		npcname = "Qu﹏ Kim"
	end
	cd_addgoldennpc(npcfile, tbTNPC_SOLDIER[npccamp][5], tbSOLDIER_LEVEL[5], npcname..tbSOLDIER_NAME[5], 1, npccamp, tbFILE_NPCDEATH[5])
	cd_writelog(date("%m%d%H%M ")..format(" call yuanshuai = %d", filehigh))

	SetMissionV( MS_BOSS5_DOWN, 1 )
	Msg2MSAll( MISSIONID, npcname..tbSOLDIER_NAME[5].." xu蕋 hi謓" )
end



function cd_callboss4down()
	local npcfile = GetMissionS( MS_S_JRNPCFILE );
	local filehigh = GetTabFileHeight( npcfile )
	if ( filehigh <= 0 or filehigh == nil ) then
		print("commonfile error ")
		return
	end
	local citycamp = GetMissionV( MS_CITYCAMP )
	local npccamp = 1
	local npcname = "Qu﹏ T鑞g"
	if ( citycamp == 1 ) then
		npccamp = 2
		npcname = "Qu﹏ Kim"
	end
	local npcid = tbTNPC_SOLDIER[npccamp][4]
	cd_addfightnpc(npcfile, 1, filehigh, npcid, tbSOLDIER_LEVEL[4], npcname..tbSOLDIER_NAME[4], 1, npccamp, tbFILE_NPCDEATH[4], 1)
	cd_writelog(date("%m%d%H%M ")..format(" call zhujiang = %d", filehigh))

	SetMissionV( MS_BOSS4_DOWN, 1 )
	Msg2MSAll( MISSIONID, npcname..tbSOLDIER_NAME[4].." xu蕋 hi謓" )
end

function cd_addgoldennpc(npcfile, npcid, npclevel, npcname, boss, npccamp, deathscript)
	local posx = 0;
	local posy = 0;
	local npcindex = 0;
	local tbNpcpos = {};
	local filehigh = GetTabFileHeight(npcfile);
	for i = 1, filehigh do
		tbNpcpos[i] = i;
	end
	for i = 1, filehigh do
		rannum = random(filehigh - 1);
		temp = tbNpcpos[i];
		tbNpcpos[i] = tbNpcpos[rannum];
		tbNpcpos[rannum] = temp;
	end
	for i = 1, filehigh do
		posx = GetTabFileData( npcfile, tbNpcpos[i] + 1, 1 );
		posy = GetTabFileData( npcfile, tbNpcpos[i] + 1, 2 );
		series = floor((i - 1) / 2);
		npcindex = AddNpcEx( (npcid + i - 1), npclevel, series, SubWorld, posx, posy, 1, npcname, boss );
		if( npcindex > 0 ) then
			--SetNpcCurCamp( npcindex, npccamp )
			SetNpcDeathScript( npcindex, deathscript )
		end
	end
end
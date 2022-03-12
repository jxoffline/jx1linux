----------------------------------------------------------------
--FileName:	smalltimer.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	ÖÜÄ©»î¶¯£ºÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³Ç
--			¹¦ÄÜ£º¼ÆÊ±Æ÷£¬Ã¿20Ãë´¥·¢
--				
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\head.lua")
function OnTimer()
	local t = GetMissionV( MS_SMALL_TIME ) + 1
	SetMissionV( MS_SMALL_TIME, t )
	
	local citycamp = GetMissionV( MS_CITYCAMP )
	local cityname = GetMissionS(MS_S_CD_NAME)
	
	if ( t == RUNGAME_TIME ) then	--¿ªÕ½Ê±¼äµ½£¬ÌáÊ¾ÊØ³Ç¿ªÊ¼£¬²¢Ë¢µÚÒ»Åú¹Ö
		RunMission(MISSIONID)
		AddGlobalNews("ChiÕn tranh vÖ quèc ®· b¾t ®Çu, "..tbDEFENCE_ANNOUNCE[citycamp])
		Msg2MSAll( MISSIONID, "<color=yellow>Qu©n ®Þch ®· b¾t ®Çu c«ng thµnh, v× ®Ó b¶o vÖ thµnh chóng ta c¸c T­íng sÜ h·y x«ng lªn!" )
		cd_writelog(cityname.."B¾t ®Çu.\tsè ng­êi\t"..GetMSPlayerCount(MISSIONID, 0))
		cd_buildfightnpc()
		return
	end
	
	if ( t > RUNGAME_TIME ) then
		local RestTime = (TOTAL_TIME - t * SMALL_TIME) / FRAME2TIME
		local RestMin, RestSec = GetMinAndSec(RestTime);

		if ( mod( t, 9 ) == 0 ) then
			cd_sendmsg2msall()		--Ã¿¸ô10·ÖÖÓ£¬ÌáÊ¾µ±Ç°XXÀàÐÍ¹Ö£¬»¹ÓÐ¶àÉÙÒªÉ±
		end
		if ( mod(t, 15) == 0 ) then
			cd_callnpc()			--Ã¿¸ô10·ÖÖÓ£¬¸ù¾ÝÇ°10·ÖÖÓµÄ±»É±ËÀµÄÆÕÍ¨¹ÖÊýÁ¿£¬ÔÙË¢ÐÂÒ»´Î
		end
		if ( mod(t, 60) == 0 and RestMin ~= 0) then
			cd_sendmsg2global()
		end
		if ( t < LASTREPORT_TIME ) then	--Ã¿¸ô5·ÖÖÓÌáÊ¾½áÊøÊ±¼ä£¬×îºó5·ÖÖÓÃ¿·ÖÖÓÌáÊ¾Ò»´Î
			if ( mod( t, 15 ) == 0 ) then
				Msg2MSAll( MISSIONID, "Thêi gian kÕt thóc thñ thµnh cßn<color=yellow>"..RestMin.."phót" )
			end
		else
			if ( mod( t, 3 ) == 0 ) then
				Msg2MSAll( MISSIONID, "Thêi gian kÕt thóc thñ thµnh cßn<color=yellow>"..RestMin.."phót" )
			end
		end
	else
		if ( mod( t, 18 ) == 0 ) then	--±¨ÃûÊ±¼äÖÐ£¬Ã»6·ÖÖÓÌáÊ¾±¨Ãû½áÊøÊ±¼ä£¬²¢·¢¹ö¶¯ÏûÏ¢
			RestTime = (RUNGAME_TIME - t) * SMALL_TIME / FRAME2TIME;
			RestMin, RestSec = GetMinAndSec(RestTime);
			if ( RestMin > 0 ) then
				Msg2MSAll( MISSIONID, "Thêi gian b¸o danh cßn l¹i lµ:<color=yellow>"..RestMin.."phót" )
				AddGlobalNews("Cuéc chiÕn ®· b¾t ®Çu nhËn b¸o danh, cã muèn tham gia kh«ng?"..tbDEFENCE_ANNOUNCE[citycamp].."Thêi gian khai chiÕn cßn"..RestMin.."phót")
			end
		end
	end
end

function cd_callnpc()
	local tempnpc_1 = GetMissionV( MS_1RSTNPC_CCNT )
	local tempnpc_2 = GetMissionV( MS_2CNDNPC_CCNT )
	local tempnpc_3 = GetMissionV( MS_3RDNPC_CCNT )
--	local tempnpc_4 = GetMissionV( MS_4THNPC_CCNT )
--	local tempnpc_5 = GetMissionV( MS_5THNPC_CCNT )

	local tempnpc_total = tempnpc_1 + tempnpc_2 + tempnpc_3;
	if ( tempnpc_total <= 0 ) then
		return
	end
	
	local commonfile = GetMissionS( MS_S_CMNPCFILE );
	local commonxypos = {};
	local tbpos = {}
	local count = 0;
	local filehigh = GetTabFileHeight( commonfile )
	
	while ( count < tempnpc_total ) do	--Ëæ»úÑ¡Ôñ×ø±ê±íµÄÄ³Ð©²»ÖØ¸´µÄÐÐ£¬×÷ÎªnpcµÄÖØÉúµã
		rannum = random( filehigh )
		flag, tbpos = cd_insertcell( tbpos, rannum )
		if ( flag == 1 ) then
			count = count + 1
		end
	end
	
	cd_addcommonnpc( tempnpc_1, tempnpc_2, tempnpc_3, tbpos, commonfile )
	cd_writelog(date("%m%d%H%M ")..format("call xiaoxiao = %d, call duizhang = %d, call xianfeng = %d",tempnpc_1, tempnpc_2, tempnpc_3))
	SetMissionV( MS_1RSTNPC_CCNT, 0 )	--Ë¢Íê¹Öºó£¬ÖØÐÂ¼ÆÊý
	SetMissionV( MS_2CNDNPC_CCNT, 0 )
	SetMissionV( MS_3RDNPC_CCNT, 0 )
end

function cd_addcommonnpc( npccount_1, npccount_2, npccount_3, tbxypos, npcfile )
	local count = 0
	local citycamp = GetMissionV( MS_CITYCAMP )
	local npccamp = 1
	local npcname = "Qu©n Tèng"
	if ( citycamp == 1 ) then
		npccamp = 2
		npcname = "Qu©n Kim"
	end
	
	if ( npccount_1 > 0 ) then
		cd_addfightnpc(npcfile, 1, npccount_1, tbTNPC_SOLDIER[npccamp][1], tbSOLDIER_LEVEL[1], npcname..tbSOLDIER_NAME[1], 0, npccamp, tbFILE_NPCDEATH[1])
	end
	if ( npccount_2 > 0 ) then
		cd_addfightnpc(npcfile, (npccount_1 + 1), (npccount_1 + npccount_2), tbTNPC_SOLDIER[npccamp][2], tbSOLDIER_LEVEL[2], npcname..tbSOLDIER_NAME[2], 2, npccamp, tbFILE_NPCDEATH[2])
	end
	if ( npccount_3 > 0 ) then
		cd_addfightnpc(npcfile, (npccount_1 + npccount_2 + 1), (npccount_1 + npccount_2 + npccount_3), tbTNPC_SOLDIER[npccamp][3], tbSOLDIER_LEVEL[3], npcname..tbSOLDIER_NAME[3], 1, npccamp, tbFILE_NPCDEATH[3])
	end
end


function cd_insertcell( tbnum, cell )
	local flag = 0
	
	if( getn( tbnum ) == 0 ) then
		tbnum[ 1 ] = cell
		return 1, tbnum
	end
	
	for i = 1, getn( tbnum ) do
		if ( tbnum[i] == cell ) then
			flag = -1
			break
		end
	end
	
	if ( flag ~= -1 ) then
		tbnum[ getn( tbnum ) + 1 ] = cell
		return 1, tbnum
	end
	return 0, tbnum
end


function cd_sendmsg2msall()
	local restnpc_1 = GetMissionV( MS_1RSTNPC_TCNT )
	local restnpc_2 = GetMissionV( MS_2CNDNPC_TCNT )
	local restnpc_3 = GetMissionV( MS_3RDNPC_TCNT )
	local restnpc_4 = GetMissionV( MS_4THNPC_TCNT )
	local restnpc_5 = GetMissionV( MS_5THNPC_TCNT )
	
	local szMsg = "ChiÕn b¸o thñ thµnh:";
	Msg2MSAll(MISSIONID, "viÖn binh tham gia thñ thµnh lóc tr­íc gåm<color=yellow>"..GetMSPlayerCount(MISSIONID, 0).." ng­êi")
	if ( restnpc_1 ~= 0 ) then
		Msg2MSAll( MISSIONID, szMsg.."cÇn h¹ thñ thªm<color=yellow>"..tbSOLDIER_NAME[1].." "..restnpc_1.."<color> ng­êi" )
	end
	if ( restnpc_2 ~= 0 ) then
		Msg2MSAll( MISSIONID, szMsg.."cÇn h¹ thñ thªm<color=yellow>"..tbSOLDIER_NAME[2].." "..restnpc_2.."<color> ng­êi" )
	end
	if ( restnpc_3 ~= 0 ) then
		Msg2MSAll( MISSIONID, szMsg.."cÇn h¹ thñ thªm<color=yellow>"..tbSOLDIER_NAME[3].." "..restnpc_3.."<color> ng­êi" )
	end
	
	if ( restnpc_1 == 0 and restnpc_2 == 0 and restnpc_3 == 0 ) then
		if ( restnpc_4 ~= 0 ) then
			Msg2MSAll( MISSIONID, szMsg.."cÇn h¹ thñ thªm<color=yellow>"..tbSOLDIER_NAME[4].." "..restnpc_4.."<color> ng­êi" )
		else
			Msg2MSAll( MISSIONID, szMsg.."cÇn h¹ thñ thªm<color=yellow>"..tbSOLDIER_NAME[5].." "..restnpc_5.."<color> ng­êi" )
		end
	end
	cd_writelog(date("%m%d%H%M\t")..format("cßn l¹i %s %d\t%s %d\t%s %d\t%s %d\t%s %d",tbSOLDIER_NAME[1],restnpc_1,tbSOLDIER_NAME[2],restnpc_2,tbSOLDIER_NAME[3],restnpc_3,tbSOLDIER_NAME[4],restnpc_4,tbSOLDIER_NAME[5],restnpc_5))
end

function cd_sendmsg2global()
	local szMsg = "VÖ quèc Phong Háa liªn thµnh"..GetMissionS(MS_S_CD_NAME).."ChiÕn tranh ®ang trong giai ®o¹n ¸c liÖt."..tbDEFENCE_ANNOUNCE[GetMissionV(MS_CITYCAMP)]
	AddGlobalNews(szMsg)
end
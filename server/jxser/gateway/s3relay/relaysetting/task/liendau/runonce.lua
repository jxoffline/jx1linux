-- Ìá½»´ËÎÄ¼þÇÐ¼ÇÍ¬Ê±Ìá½»TaskLit.ini£¡£¡£¡

RUNONCE_NAME	= "Xãa ®éi chiÕn ®Êu v« dông"

function TaskShedule()
	-- ÉèÖÃ·½°¸Ãû³Æ
	TaskName(RUNONCE_NAME)
	-- Ö»Ö´ÐÐÒ»´Î
	TaskInterval( 244000 )
	-- ÉèÖÃ´¥·¢´ÎÊý£¬0±íÊ¾ÎÞÏÞ´ÎÊý
	TaskCountLimit(1)
	-- Êä³öÆô¶¯ÏûÏ¢
end

function TaskContent()
	if (tonumber(date("%Y%m%d")) > 20060228) then
		OutputMsg("["..RUNONCE_NAME.."] NhiÖm vô ®· qu¸ h¹n, nªn kh«ng thÓ chÊp hµnh.")
		return
	end
	
	for n_lgtype = 2, 4 do
		local n_count	= 0
		local n_lid		= LG_GetFirstLeague(n_lgtype)
		while (n_lid ~= 0) do 
			local str_lgname = LG_GetLeagueInfo(n_lid)
			n_lid = LG_GetNextLeague(n_lgtype, n_lid)
			LG_ApplyRemoveLeague(n_lgtype, str_lgname)
			n_count	= n_count + 1
		end
		OutputMsg("Xãa ®éi chiÕn ®Êu, lo¹i h×nh:"..n_lgtype..". Sè l­îng:"..n_count)
	end

	OutputMsg("®· hoµn thµnh nhiÖm vô ["..RUNONCE_NAME.."]!")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end

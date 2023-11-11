Include("\\script\\missions\\leaguematch\\head.lua")
Include("\\script\\lib\\pay.lua")
function main(nItemIndex)
	local nCount = 48
	
	if GetGlbValue(GLB_WLLS_PHASE) == 1 then
		Talk(1, "", "Thêi gian liªn ®Êu nghØ kh«ng thÓ sö dông ®¹o cô nµy")
		return 1
	end
	
	if GetLevel() < 120 or IsCharged() ~= 1  then
		Talk(1, "", "CÊp 120 vµ ®· nép thÎ míi cã thÓ sö dông")
		return 1
	end
	
	
	
	
	local nLeagueId = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (FALSE(nLeagueId)) then
		Talk(1, "", "§¹i hiÖp vÉn ch­a gia nhËp chiÕn ®éi.")
		return 1
	end
	local szLeagueName = LG_GetLeagueInfo( nLeagueId ) 
	
	 LG_GetMemberInfo(nLeagueId, 0)
	
	if LG_GetLeagueTask(nLeagueId, WLLS_LGTASK_TOTAL) < nCount then
		Talk(1, "", "ChØ hoµn thµnh 48 trËn liªn ®Êu míi cã thÓ sö dông.")
		return 1
	end
	
	if LG_GetLeagueTask(nLeagueId, WLLS_LGTASK_USE_LingQi_COUNT) >= 18 then
		
		Talk(1, "", format("Mçi ®ît th× ®Êu chØ cã thÓ sö dông %d ®¹o cô nµy", 18))
		return 1
	end
	
	if LG_GetMemberTask(WLLS_LGTYPE, szLeagueName,  GetName(), WLLS_LGMTASK_JOB) ~= 1 then
		
		Talk(1, "", "ChØ cã liªn ®Êu ®éi tr­ëng míi sö dông ®­îc.")
		return 1	
	end
	
	
	
	
	LG_ApplyAppendLeagueTask(WLLS_LGTYPE, szLeagueName, WLLS_LGTASK_USE_LingQi_COUNT, 1)
	Talk(1, "", format("§¹i hiÖp ®· sö dông HuyÕt ChiÕn LÖnh Kú, hiÖn t¹i c¸c h¹ cã thÓ tham gia thªm  %d trËn", 4))
end
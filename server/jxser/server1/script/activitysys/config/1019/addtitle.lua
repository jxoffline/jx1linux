Include("\\script\\global\\titlefuncs.lua");
IncludeLib("TITLE")
tbTittle_Hungbinh_Luudanh = tbTittle_Hungbinh_Luudanh or {}
tbTittle_Hungbinh_Luudanh.nTittleID = 3007
tbTittle_Hungbinh_Luudanh.nTittleExpiredTime = 30*24*60
function tbTittle_Hungbinh_Luudanh:Add_Tittle()
	local nTittleID = tbTittle_Hungbinh_Luudanh.nTittleID
	local nTittleExpiredTime = tbTittle_Hungbinh_Luudanh.nTittleExpiredTime
	local nServerTime = GetCurServerTime()+ nTittleExpiredTime*60
	local nDate	= FormatTime2Number(nServerTime)
	local nDay	= floor(mod(nDate,1000000) / 10000)
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	
	 SetTask(TASK_ACTIVE_TITLE, nTittleID)
	Title_AddTitle(nTittleID, 2, nTime)
	Title_ActiveTitle(nTittleID)
	AddSkillState(1500, 1, 2, nTime, 1)
 	local str_title = Title_GetTitleName(nTittleID)		
	Msg2Player(format("Chóc mõng b¹n ®· nhËn ®­îc danh hiÖu <color=yellow>%s<color>", str_title))
end	


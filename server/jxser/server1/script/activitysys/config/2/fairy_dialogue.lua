Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\config\\2\\extend.lua")

function main()
	local nNpcIndex = GetLastDiagNpc() 
	local dwNpcIndex = GetNpcId(nNpcIndex)
	local szTitle = "Xin chµo! Gi¸ng Sinh vui vÎ nhÐ!"
	local tbOpt = 
	{
		{"NhËn l·nh phÇn th­ëng", pActivity.GetFairyAward, {pActivity,nNpcIndex}},
		{"KÕt thóc ®èi tho¹i"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function OnTimer(nNpcIndex, nTimeOut)
	local szNpcName = GetNpcName(nNpcIndex)
	if szNpcName == "Tinh Linh" then
		DelNpc(nNpcIndex)
		%tbFairyInfo.nNpcIndex = nil
	end
end
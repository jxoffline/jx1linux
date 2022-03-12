Include("\\script\\event\\other\\shensuanzi\\class.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main()
	tbShenSuanZi:DailogMain()
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end
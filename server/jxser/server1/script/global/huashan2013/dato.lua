--Edit by  Youtube PGaming--
IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
function main ()	
	if (GetTask(169) == 22) then
	OnClick()
	

	end	
end

local _GetFruit = function(nItemIndex)
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3946,0,0,0}, nBindState=-2}, "test", 1);
	SetTask(169,23)	
end

local _OnBreak = function()
	Msg2Player("Qu¸ tr×nh thu thËp bÞ gi¸n ®o¹n.")
end

function OnClick()
tbProgressBar:OpenByConfig(6, %_GetFruit,{nItemIdx}, %_OnBreak)
end


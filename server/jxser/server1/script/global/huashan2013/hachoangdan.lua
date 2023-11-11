-- Edit  by Youtube PGaming--
IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
function main ()	
	if (GetTask(69) == 11) then
	OnClick()
	elseif (GetTask(69) == 12) then
Msg2Player("§· thu thËp ®ñ méc liÖu, kh«ng cÇn thu thËp thªm n÷a.")
	elseif (GetTask(69) > 09) and (GetTask(69) < 12) then
	Msg2Player("§¸nh b¹i thñ hé H¾c DiÖp Linh HÇu míi chÆt ®­îc c©y.") 
	end	
end

local _GetFruit = function(nItemIndex)
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3957,0,0,0}, nBindState=-2}, "test", 1);
	Msg2Player("§¹i hiÖp ®· thu thËp ®ñ Hång Méc.") 
	AddNote("NhËn ®­îc 1 bã Hång Méc.") 
	AddNote("§¹i hiÖp ®· thu thËp ®ñ Hång Méc.") 
	SetTask(69,12)	
end

local _OnBreak = function()
	Msg2Player("Qu¸ tr×nh thu thËp bŞ gi¸n ®o¹n.")
end

function OnClick()
tbProgressBar:OpenByConfig(6, %_GetFruit,{nItemIdx}, %_OnBreak)
end


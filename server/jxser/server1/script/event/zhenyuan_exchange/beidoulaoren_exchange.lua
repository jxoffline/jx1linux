Include("\\script\\event\\\zhenyuan_exchange\\zhenyuan_head.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

local nLevel = 200
local szPrompt_level = format("Ch­a ®¹t ®Õn %d cÊp xin h·y ®Õn ThÇn BÝ Th­¬ng Nh©n ë L©m An ®Ó ®æi Ch©n Nguyªn.", nLevel)

function zhenyuan_exchange()
	if GetLevel()>= %nLevel then
		local nAvailExp = GetExp() + 0.5 * GetLevelExp(GetLevel(), ST_GetTransLifeCount())
		g_AskClientNumberEx(1, %nMaxNum, "Xin h·y nhËp vµo sè l­îng muèn ®æi", {Zhenyuan_award, {nAvailExp}})
	else
		Msg2Player(%szPrompt_level) 
	end
end 

--pEventType:Reg("B¾c §Èu L·o Nh©n", "§iÓm kinh nghiÖm ®æi Ch©n Nguyªn", zhenyuan_exchange)


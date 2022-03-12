Include("\\script\\event\\\zhenyuan_exchange\\zhenyuan_head.lua")--ÕæÔª¶Ò»»
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

function zhenyuan_exchange()
	local nAvailExp = GetExp()
	g_AskClientNumberEx(1, %nMaxNum, "Xin h·y nhËp vµo sè l­îng muèn ®æi", {Zhenyuan_award, {nAvailExp}})
end 

--pEventType:Reg("ThÇn BÝ Th­¬ng Nh©n", "§iÓm kinh nghiÖm ®æi Ch©n Nguyªn", zhenyuan_exchange)

--¡Ω∫˛«¯ ∞Õ¡Íœÿ ‘”ªıµÍ¿œ∞Â∂‘ª∞°°ÃÏÕı40º∂»ŒŒÒ
-- Update: Dan_Deng(2003-08-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function main(sel)
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx)
	local tbDailog = DailogClass:new(szNpcName)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog.szTitleMsg = "<npc>Tr≠Ìc Æ©y ta lµ ng≠Íi b∏n hµng rong, t›ch c„p Æ≠Óc ›t vËn, mÎ ti÷m tπp h„a nh· nµy"
	if (GetTask(3) == 40*256+50) and (GetTask(14) == 5) and (HaveItem(148) == 0) then 		--ÃÏÕı∞Ô40º∂»ŒŒÒ
		tbDailog:AddOptEntry("C„ b∏n hπt sen kh´ng?", lotus)
	end
	tbDailog:AddOptEntry("Giao dﬁch", yes)
	tbDailog:AddOptEntry("Kh´ng giao dﬁch", no)
	tbDailog:Show()
end

function lotus()
	Say("Hπt sen ch›nh lµ Æ∆c s∂n cÒa bÊn ti÷m, d‹ nhi™n lµ c„, chÿ c„ 500 l≠Óng th´i", 2, "Mua/yes1", "Kh´ng mua/no")
end;

function yes1()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(148)
		Msg2Player("Mua Æ≠Óc hπt sen")
--		SetTask(14, 3)	
		AddNote("Mua Æ≠Óc hπt sen tπi ti÷m tπp h„a Ba L®ng huy÷n ")
	else
		Say("C„ ÆÒ ti“n rÂi h∑y Æ’n mua Æi, h∑y xem nh˜ng m„n hµng kh∏c tr≠Ìc Æi.", 2, "Giao dﬁch/yes", "Kh´ng giao dﬁch/no")
	end
end;

function yes()
Sale(38);  			
end;

function no()
end;

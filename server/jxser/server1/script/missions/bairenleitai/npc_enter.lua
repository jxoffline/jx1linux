-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æ´óÂ½°æ - 
-- ÎÄ¼şÃû¡¡£ºnpc_enter.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2011-05-03 16:50:24

-- ======================================================
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\log.lua")

function bairen_dialog()
	
	local tbOpt = {};
	tinsert(tbOpt, {"Ta muèn vµo L«i §µi Hoµng Thµnh T­", onEnterHunbredArena});
	tinsert(tbOpt, {"VÒ L«i §µi Hoµng Thµnh T­", onHelpHunbredArena})
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i", oncancel})
	CreateNewSayEx("<npc>L«i §µi Hoµng Thµnh T­ lµ ®Ó cho nh÷ng cao thñ trªn giang hå cã mét c¬ héi vang danh cña m×nh trong thiªn h¹. Nªu nh­ lµm L«i Chñ liªn tiÕp ®¸nh b¹i nh÷ng ng­êi khiªu chiÕn, sÏ vang danh thiªn h¹, thËm chİ cã thÓ trùc tiÕp ®I vµo Hoµng Thµnh, v× n­íc mµ b¸o ®Òn ¬n.", tbOpt)
end

function onEnterHunbredArena()
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\bairenleitai\\hundred_arena.lua", "HundredArena:NpcEnter")	
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhBachNhanLoiDai")
end

function onHelpHunbredArena()
	local tbOpt = {};
	tinsert(tbOpt, {"Ta muèn vµo L«i §µi Hoµng Thµnh T­", onEnterHunbredArena});
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i", oncancel});
	
	CreateNewSayEx("<npc>L«i §µi Hoµng Thµnh T­ {{sÏ ®­îc më mçi ngµy vµo lóc 12:00 ®Õn 0:00 sÏ kÕt thóc }}. <enter> L«i §µi Hoµng Thµnh T­ t¹m thêi thiÕt kÕ 5 l«i ®µi, trong ®ã {{L«i §µi 1 }} lµ L«i §µi Chñ, chØ cã giµnh th¾ng lîi ë L«i §µi nµy míi cã thÓ ®­îc nh©n sü vâ l©m c«ng nhËn."
		.."Mçi lÇn lªn ®µi lµ {{3 phót }}, nÕu nh­ trong kho¶ng thêi gian nµy hai bªn bÊt ph©n th¾ng b¹i, lóc ®ã {{sÏ lÊy ng­êi chŞu s¸t th­¬ng İt h¬n }} lµm l«i chñ, vµ tiÕp nhËn khiªu chiÕn tiÕp tôc cña c¸c cao thñ kh¸c."
		.."NÕu kh«ng cã cao thñ nµo d¸m khiªu chiÕn víi L«i Chñ, Hoµng thµnh T­ sÏ ph¸i ra cao thñ cña thËp ®¹i m«n ph¸i lªn ®µi khiªu chiÕn, L«i Chñ cÇn ph¶i trong vßng {{ 3 phót }} ®¸no b¹i, nÕu kh«ng sÏ bŞ tİnh lµ b¹i trËn"
		.."<enter>Chó ı: cÇn ph¶i sö dông khinh c«ng nh¶y lªn l«i ®µi tû vâ.",
		tbOpt);
end

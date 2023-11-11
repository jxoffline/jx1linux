Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")

local tbEnterNpc = 
{
		szName = "Quan nh¾c nhë Hoµng Thµnh T­",
		nNpcId = 1747,
		nLevel = 95,
		nMapId = 176,
		szPosPath = "\\settings\\maps\\chrismas\\enternpc.txt",
		szScriptPath = "\\script\\missions\\zhaojingling\\enternpc.lua",
}

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>§Ó huÊn luyÖn nh÷ng ®ai néi cao thñ míi , ®Ó n©ng cao chÝ sü giang hå, Hoµng Thµnh T­ ta ®©y chiªu mé Hßa KiÖt kh¾p n¬i. NÕu nh­ ng­¬i cã ý ®Þnh b¸o hiÕu cho triÒu ®×nh, h·y tham gia b¸o danh ho¹t ®éng. Häc thµnh v¨n vâ nghÖ, gióp cho §Õ V­¬ng Gia. C¸c h¹ vâ nghÖ ®Çy m×nh, b¶o kiÕm m«ng trÇn."
	tbDailog:AddOptEntry("Hoµng Thµnh T­ huÊn luyÖn cung", xunlianying)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog:Show()
end

function xunlianying()
	local tbOpt = {}
	tinsert(tbOpt, {"HuÊn luyÖn Méc Nh©n", zhaojingling})
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i", oncancel})
	CreateNewSayEx("<npc>HuÊn LuyÖn Cung nµy lµ dïng c¸c lo¹i ho¹t ®éng ®Ó huÊn luyÖn c¸c lo¹i n¨ng lùc cña ng­¬i, vµ sÏ trë thµnh mét trong nh÷ng ®¹i néi cao thñ, vµ nhËn ®­îc ban th­ëng cña triÒu ®×nh.", tbOpt)	
end

function zhaojingling()
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\zhaojingling\\enterdialog.lua", "dialogmain")
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhTruyTimMocNhan")
end

function addenternpc()
	if (TabFile_Load(%tbEnterNpc.szPosPath, %tbEnterNpc.szPosPath) == 0) then
		print("Load TabFile Error!"..%tbEnterNpc.szPosPath)
		return 0
	end
	%tbEnterNpc.nPosX = TabFile_GetCell(%tbEnterNpc.szPosPath, 2, "POSX")
	%tbEnterNpc.nPosY = TabFile_GetCell(%tbEnterNpc.szPosPath, 2, "POSY")
	
	basemission_CallNpc(%tbEnterNpc)
end

-- function initialize()
-- 	addenternpc()
-- 	DynamicExecute("\\script\\missions\\zhaojingling\\prepare\\preparegame.lua", "PrepareGame:Start")
-- end

-- AutoFunctions:Add(initialize)


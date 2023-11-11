Include("\\vng_script\\activitysys\\config\\1031\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1031\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1031\\awardlist.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

if not tbHoaDang then
	tbHoaDang = {}
end
tbHoaDang.tbHoaDangPos = {
	{336,1271,3106},
	{336,1288,3124},
	{336,1298,3108},
	{336,1272,3070},
	{336,1260,3046},
	{336,1262,3017},
	{336,1262,2984},
	{336,1305,2977},
	{336,1366,3009},
	{336,1369,3064},
	{336,1382,3104},
	{336,1407,3151},
	{336,1454,3161},
	{336,1518,3012},
	{336,1534,2908},
	{336,1550,2848},
	{336,1489,2881},
	{336,1498,2928},
	{336,1495,2980},
	{336,1506,3031},
	{336,1463,3107},
	{336,1441,3067},
	{336,1429,3019},
	{336,1452,2975},
	{336,1388,2965},
	{336,1341,2977},
	{336,1276,2992},
	{336,1299,3036},
	{336,1265,3071},
	{336,1247,3032},
}
tbHoaDang.HoaDangID = 1077
tbHoaDang.MapHoaDang = 336
tbHoaDang.HoaDangScript = "\\vng_script\\activitysys\\config\\1031\\hoadang.lua"


local _ThuThapHoaDang = function(nNpcIndex, dwNpcId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		print("Tha Hoa dang that bai, kiem tra lai")
		return 0
	end
	if PlayerFunLib:CheckTaskDaily(%TSK_DAILY_THAHOADANG,%MAX_COUNT_THAHOADANG,"Mçi ngµy chØ th¶ ®­îc 5 ®Ìn Hoa §¨ng","<") then
		PlayerFunLib:AddTaskDaily(%TSK_DAILY_THAHOADANG, 1)
		tbAwardTemplet:Give(tbAward_ThaHoaDang,1,{EVENT_LOG_TITLE,"ThaHoaDang_Nhanthuong"})
		--print("Tha Hoa dang ThanhCong nhan thuong")
		DelNpc(nNpcIndex)
	end
end

local _OnBreak = function()
end

function main()	
	local nNpcIndex = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIndex)
	local nFaction = GetLastFactionNumber()
	if nFaction < 0 then
		Talk(1,"","H·y gia nhËp m«n ph¸i tr­íc, míi tham gia ®­îc ho¹t ®éng nµy.")
		return 
	end
	local nFightState = GetFightState()
	if nFightState ~= 1 then
		Talk(1,"","Tr¹ng th¸i phi chiÕn ®Êu kh«ng thÓ th¶ Hoa §¨ng.")
		return 
	end
	SetPKFlag(1)
	Msg2Player(format("<color=pink>Chó ý: tr¹ng th¸i chiÕn ®Êu ®· s½n sµng<color>"))
	tbProgressBar:OpenByConfig(19, %_ThuThapHoaDang, {nNpcIndex,dwNpcId}, %_OnBreak)
end

function tbHoaDang:AddHoaDang()	
	for i=1,getn(self.tbHoaDangPos) do
		local tbInfo = self.tbHoaDangPos[i]		
		local nNpcIndex=AddNpcEx(1077,0,1,SubWorldID2Idx(336),tbInfo[2]*32,tbInfo[3]*32,1," Hoa §¨ng ",0)
		if (nNpcIndex > 0) then
			SetNpcScript(nNpcIndex, "\\vng_script\\activitysys\\config\\1031\\hoadang.lua")		
			SetNpcTimer(nNpcIndex, 10*60*18) --10ph					
		end		
	end
	local str = "§Ìn Hoa §¨ng ®· xuÊt hiÖn t¹i Phong L¨ng §é, h·y nhanh ch©n ®Õn tham gia lÔ héi Th¶ ®Ìn Hoa §¨ng. "
	AddGlobalNews(str)
end
function OnTimer(nNpcIndex, nTimeOut) 
	if nNpcIndex then 
		--print("het gio xoa hoa dang")
		DelNpc(nNpcIndex)	
	end
end




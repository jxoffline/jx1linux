IL("TITLE");
IncludeLib("ITEM");
IncludeLib("TIMER");
IncludeLib("FILESYS");
IncludeLib("SETTING");
IncludeLib("TASKSYS")
IncludeLib("PARTNER");
IncludeLib("BATTLE");
IncludeLib("RELAYLADDER")
IncludeLib("TONG")
IncludeLib("LEAGUE")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua")
Include("\\script\\global\\titlefuncs.lua")
Include( "\\script\\lib\\string.lua" );
Include( "\\script\\item\\item_header.lua" );

Include( "\\script\\global\\\\quanlygame\\lib.lua" );

TITLEDIALOG = "Tªn nh©n vËt: <color=green>%s<color>\n".."Tªn tµi kho¶n: <color=green>%s<color>\n".."Täa ®é: <color=green>%d, %d/%d<color>"

function main()
	dofile("script/global/quanlygame/quanlygame.lua")
	dofile("script/global/quanlygame/lib.lua")
	local szTitle = "Ng­¬i muèn g× ?"
	local tbOption = {
		{"LÊy ®å Hoµng Kim",QuanLyGame.LayTrangBi},
		{"DÞch ChuyÓn §Õn Boss S¸t Thñ",QuanLyGame.DichChuyenDenBossSatThu},
		{"Gäi boss TiÓu",Call_Small_Boss},
		{"Quay L¹i",no}
	};
	CreateNewSayEx(szTitle,tbOption)
	return 1;
end
function QuanLyGame:LayTrangBi()
	local szTitle = "B¹n muèn lÊy g×"
	local tbOption = {};
	if not self then
		self = 1
	end
	local nLine = 12
	local tb = QuanLyGame.tbTrangBiHoangKim
	local nCount = getn(tb);
	for key, val in tb do
		tinsert(tbOption, { key, QuanLyGame.LayTrangBiConfirm , {self, val}});
	end
	--if (self > 1) then
	--	local self = self - nLine
	--	tinsert(tbOption, {"Trang tr­íc", QuanLyGame.LayTrangBi, {self}});
	--end
	--if (self + nLine < nCount) then
	--	local self = self + nLine
	--	tinsert(tbOption, {"Trang sau", QuanLyGame.LayTrangBi, {self}});
	--end
	tinsert(tbOption, {"Quay L¹i",main})
	CreateNewSayEx(szTitle,tbOption)
end
function QuanLyGame:LayTrangBiConfirm(tb)
	local szTitle = "B¹n muèn lÊy g×"
	local tbOption = {};
	for key, val in tb do
		if type(key) == "number" then
			tbAwardTemplet:GiveAwardByList(tb);
			return
		else
			tinsert(tbOption, { key, QuanLyGame.LayTrangBiConfirm , {self, val}});
		end
	end
	tinsert(tbOption, {"Quay L¹i",main})
	CreateNewSayEx(szTitle,tbOption)
end

function QuanLyGame:DichChuyenDenBossSatThu(tb)
	local szTitle = "Ng­¬i muèn ®i ®©u"
	local tbOption = {};
	if not self then
		local self = 1
		local tb = QuanLyGame.tbToaDoSatThu
		for key, val in tb do
			tinsert(tbOption, { key, QuanLyGame.DichChuyenDenBossSatThu , {self, val}});
		end
	end
	local nLine = 12
	if self ~= nil then
		local nCount = getn(tb);
		if nCount > (self + nLine) then 
			nLineCount = self + nLine
		else
			nLineCount = nCount
		end
		for i = self, nLineCount do
			tinsert(tbOption, { tb[i][4], QuanLyGame.DichChuyenDenBossSatThuConfirm , {self, tb[i]}});
		end
		if (self > 1) then
			local self = self - nLine
			tinsert(tbOption, {"Trang tr­íc", QuanLyGame.DichChuyenDenBossSatThu, {self, tb}});
		end
		if (self + nLine < nCount) then
			local self = self + nLine
			tinsert(tbOption, {"Trang sau", QuanLyGame.DichChuyenDenBossSatThu, {self, tb}});
		end
	end
	tinsert(tbOption, {"Quay L¹i",main})
	CreateNewSayEx(szTitle,tbOption)
end

function QuanLyGame:DichChuyenDenBossSatThuConfirm(tb)
	local nW, nX, nY, szBossName, szMapName = unpack(tb)
	NewWorld(nW, nX, nY)
	SetFightState(1);
	Msg2Player("H·y ngåi yªn, chóng ta ®i ®Õn <color=Green>"..szMapName.."<color> ®Ó tiªu diÖt <color=Yellow>"..szBossName.."<color> nµo!");
end


function QuanLyGame:MakeDefine()
    self.tbFacNames             = {}
    self.tbFacChNames           = {}
    self.tbFacShortName         = {}
    self.tbCamps                = {}
    self.tbRankIds              = {}
    self.tbSeriess              = {}
    self.tbFacTaskIds           = {}
    self.tbTaskId_90Skills      = {}
    self.tbTaskId_137s          = {}
    self.tbValue_137s           = {}
    self.tb150TaskSteps         = {}
    self.tbJinjieSkillIDs       = {}
    self.tbFacMapIds            = {}
    self.tbJoinMsgs             = {}
    self.tbSkills               = {}
    self.tbItemInfos            = {}
    self.tbFacName2TaskId       = {}
    self.tbFacName2RankId       = {}
    self.tbFacName2FacId        = {}
    self.tbFacChName2FacId      = {}
    self.tbFacMapPos            = {}
    self.tb90Skills             = {}
    self.tb120Skills            = {}
    self.tb150Skills            = {}
    self.tbVipMaskIndexs        = {}
    self.tbVipWuXingYins        = {}
    for _, tbFactionInfo in self.tbMonPhai do
        self.tbFacNames[tbFactionInfo.nFacNumb]             = tbFactionInfo.szFacName
        self.tbFacChNames[tbFactionInfo.nFacNumb]           = tbFactionInfo.szFacChName
        self.tbFacShortName[tbFactionInfo.nFacNumb]         = tbFactionInfo.szFacShortName
        self.tbCamps[tbFactionInfo.nFacNumb]                = tbFactionInfo.nCamp
        self.tbRankIds[tbFactionInfo.nFacNumb]              = tbFactionInfo.nRankId
        self.tbSeriess[tbFactionInfo.nFacNumb]              = tbFactionInfo.nSeries
        self.tbFacTaskIds[tbFactionInfo.nFacNumb]           = tbFactionInfo.nTaskId_Fact
        self.tbTaskId_90Skills[tbFactionInfo.nFacNumb]      = tbFactionInfo.nTaskId_90Skill
        self.tbTaskId_137s[tbFactionInfo.nFacNumb]          = tbFactionInfo.nTaskId_137
        self.tbValue_137s[tbFactionInfo.nFacNumb]           = tbFactionInfo.nValue_137
        self.tb150TaskSteps[tbFactionInfo.nFacNumb]         = tbFactionInfo.n150TaskStep
        self.tbJinjieSkillIDs[tbFactionInfo.nFacNumb]       = tbFactionInfo.nJinjieSkillID
        self.tbFacMapIds[tbFactionInfo.nFacNumb]            = tbFactionInfo.nFactionMapId
        self.tbJoinMsgs[tbFactionInfo.nFacNumb]             = tbFactionInfo.szMsg

        self.tbSkills[tbFactionInfo.nFacNumb]               = tbFactionInfo.tbSkillID

        self.tbItemInfos[tbFactionInfo.nFacNumb]            = tbFactionInfo.tbItemInfo

        self.tbFacName2TaskId[tbFactionInfo.szFacName]      = tbFactionInfo.nTaskId_Fact
        self.tbFacName2RankId[tbFactionInfo.szFacName]      = tbFactionInfo.nRankId
        self.tbFacName2FacId[tbFactionInfo.szFacName]       = tbFactionInfo.nFacNumb
        self.tbFacChName2FacId[tbFactionInfo.szFacChName]   = tbFactionInfo.nFacNumb

        self.tbFacMapPos[tbFactionInfo.nFacNumb]            = {tbFactionInfo.nFactionMapId, tbFactionInfo.tbFactionMapPos[1], tbFactionInfo.tbFactionMapPos[2]}

        self.tb90Skills[tbFactionInfo.nFacNumb]             = {}
        for _,tbSkillInfo in tbFactionInfo.tbSkillID[90] do
            tinsert(self.tb90Skills[tbFactionInfo.nFacNumb], tbSkillInfo[1])
        end
        self.tb120Skills[tbFactionInfo.nFacNumb]            = {}
        for _,tbSkillInfo in tbFactionInfo.tbSkillID[120] do
            tinsert(self.tb120Skills[tbFactionInfo.nFacNumb], tbSkillInfo[1])
        end
        self.tb150Skills[tbFactionInfo.nFacNumb]            = {}
        for _,tbSkillInfo in tbFactionInfo.tbSkillID[150] do
            tinsert(self.tb150Skills[tbFactionInfo.nFacNumb], tbSkillInfo[1])
        end

        -- self.tbVipMaskIndexs[tbFactionInfo.nFacNumb]        = tbFactionInfo.tbItemInfo.tbVipMaskIndex
        -- self.tbVipWuXingYins[tbFactionInfo.nFacNumb]        = tbFactionInfo.tbItemInfo.tbVipWuXingYin
    end
end

QuanLyGame:MakeDefine()

function FacName2Id(szFacName)
    for key, value in QuanLyGame.tbMonPhai do
        if value.szFacChName == szFacName then
            return key
        end
    end

    return -1;
end

function AddFacSkill(nFacId, nLv)
    if nFacId < 0 or nFacId >= QuanLyGame.nMaxFac then
        return
    end
    if not QuanLyGame.tbSkills[nFacId][nLv] then
        return
    end

    for _,tbSkillInfo in QuanLyGame.tbSkills[nFacId][nLv] do
        local nSkillId = 0
        local nSkillLv = 0
        if type(tbSkillInfo) == "table" then
            nSkillId = tbSkillInfo[1]
            nSkillLv = tbSkillInfo[2]
        elseif type(tbSkillInfo) == "number" then
            nSkillId = tbSkillInfo
            nSkillLv = 0
        end
        if HaveMagic(nSkillId) == -1 then
            AddMagic(nSkillId,nSkillLv)
            AddSkillEvent(nFacId, nLv, nSkillId, nSkillLv)
        end
    end
	DynamicExecute("\\script\\misc\\eventsys\\eventsys.lua", "EventSys:OnPlayerEvent", "OnLearnSkill", PlayerIndex, nLv)
end
--------------Custom delskill-----------------------------------
function DelFacSkill(nFacId, nLv)
    if nFacId < 0 or nFacId >= QuanLyGame.nMaxFac then
        return
    end
    if not QuanLyGame.tbSkills[nFacId][nLv] then
        return
    end
    for _,tbSkillInfo in QuanLyGame.tbSkills[nFacId][nLv] do
        local nSkillId = 0
        if type(tbSkillInfo) == "table" then
            nSkillId = tbSkillInfo[1]
        elseif type(tbSkillInfo) == "number" then
            nSkillId = tbSkillInfo
        end
        if HaveMagic(nSkillId) ~= -1 then
            DelMagic(nSkillId)
        end
    end
end
-------------------------------------------------------------------

function AddSkillEvent(nFacId, nLv, nSkillId, nSkillLv)
    if nLv == 90 then
        WriteLog("Player Get 90 Skill. szAccount = %s, szName = %s, nFacId = %d, nLv = %d, nSkillId = %d, nSkillLv = %d")
    end
end
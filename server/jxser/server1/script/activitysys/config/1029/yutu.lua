Include("\\script\\activitysys\\config\\1029\\variables.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("TASKSYS")

function pActivity:ShowQuest(nQuestId, nNpcIndex, nNpcId)
	if GetNpcId(nNpcIndex) ~= nNpcId then
		Talk(1, "", "VŞ hiÖp sÜ nµy ®· chËm mét b­íc råi, Thá Tiªn ®· biÕn mÊt råi.")
		return
	end
	
	local tbYuTu = self.tbYuTu
	if GetNpcParam(nNpcIndex, tbYuTu.Param_Finish) ~= 0 then
		local dlg = tbYuTu.tbTooLate
		CreateNewSayEx(dlg.szTitle, dlg.tbOpt)
		return
	end
	
	local quest = tbYuTu.Question[nQuestId]
	if not quest then
		print("nQuestId Error", nQuestId)
		%tbLog:PlayerActionLog(pActivity.EVENT_LOG_TITLE, "nQuestId Error")
		return
	end
	
	local tbOpt ={}
	local Candidate = quest.Candidate
	for i = 1, getn(Candidate) do
		tinsert(tbOpt, {Candidate[i], self.Answer, {self, quest.nAnswer, i, nNpcIndex, nNpcId}})
	end
	tinsert(tbOpt, {""})
	
	CreateNewSayEx(quest.szQuestion, tbOpt)
	tbLog:PlayerActionLog(self.EVENT_LOG_TITLE, "Yuxianziduihua")
end

function pActivity:Answer(nRightAnswer, nAnswer, nNpcIndex, nNpcId)
	if GetNpcId(nNpcIndex) ~= nNpcId then
		Talk(1, "", "VŞ hiÖp sÜ nµy ®· chËm mét b­íc råi, Thá Tiªn ®· biÕn mÊt råi.")
		return
	end
	
	local tbYuTu = self.tbYuTu
	if GetNpcParam(nNpcIndex, tbYuTu.Param_Finish) ~= 0 then
		local dlg = tbYuTu.tbTooLate
		CreateNewSayEx(dlg.szTitle, dlg.tbOpt)
		return
	end
	
	if nAnswer ~= nRightAnswer then
		local dlg = tbYuTu.tbWrongAnswer
		CreateNewSayEx(dlg.szTitle, dlg.tbOpt)
		return
	end
	
	local _, _, nMapIndex = GetNpcPos(nNpcIndex)
	SetNpcParam(nNpcIndex, tbYuTu.Param_Finish, 1)
	DelNpc(nNpcIndex)

	ChangeOwnFeature(1, 3600*18, 1124)
	PlayerFunLib:GetItem(self.AWARD["YuTuAward"], 1, self.EVENT_LOG_TITLE, "AnswerYuTu")
	tbLog:PlayerActionLog(self.EVENT_LOG_TITLE, "Lingqvxianzikuizeng")
	Talk(1, "", "HiÖp sÜ bŞ Thá Tiªn biÕn thµnh mét chó thá, thêi gian 1h.")
end

function OnTimer(nNpcIndex)
	SetNpcParam(nNpcIndex, pActivity.tbYuTu.Param_Finish, 1)
	DelNpc(nNpcIndex)
end

function main()
	local nNpcIndex = GetLastDiagNpc()
	
	if PlayerFunLib:CheckLevel(pActivity.MIN_LEVEL,"HiÖp sÜ vÉn ch­a chİnh thøc ra nhËp giang hå, ra nhËp m«n ph¸i xong råi ®Õn t×m ta nhĞ.",">=") ~= 1 then
		return
	end
	
	if PlayerFunLib:CheckCamp(0, "HiÖp sÜ vÉn ch­a chİnh thøc ra nhËp giang hå, ra nhËp m«n ph¸i xong råi ®Õn t×m ta nhĞ.", "~=") ~= 1 then
		return
	end
	
	local tbYuTu = pActivity.tbYuTu
	if GetNpcParam(nNpcIndex, tbYuTu.Param_Finish) ~= 0 then
		local dlg = Activity.tbYuTu.tbTooLate
		CreateNewSayEx(dlg.szTitle, dlg.tbOpt)
		return
	end
	
	local nRand = random(1, getn(tbYuTu.Question))
	local tbOpt = {
		{"Ta muèn tr¶ lêi ", pActivity.ShowQuest, {pActivity, nRand, nNpcIndex, GetNpcId(nNpcIndex)}},
		{"Ta chØ ®i ngang qua th«i …"},
	}
	
	CreateNewSayEx("<npc> ¸, bŞ ng­¬i ph¸t hiÖn råi? §­îc th«i, tr¶ lêi ®óng mét c©u hái, sÏ nhËn ®­îc phÇn th­ëng.", tbOpt)
end

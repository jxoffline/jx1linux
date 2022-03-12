Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local szTitle = "<npc>Cã cÇn mua thuèc kh«ng?"
	local tbOpt = {}
	tinsert(tbOpt, {"Giao dÞch", yes})
	tinsert(tbOpt, {"Kh«ng giao dÞch"})
	CreateNewSayEx(szTitle, tbOpt)
end;


function yes()
	Sale(12)
end;


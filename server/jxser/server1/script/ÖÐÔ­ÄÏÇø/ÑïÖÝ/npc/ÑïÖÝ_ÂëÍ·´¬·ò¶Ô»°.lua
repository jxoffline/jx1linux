--ÖÐÔ­ÄÏÇø ÑïÖÝ¸® ÂëÍ·´¬·ò¶Ô»°
--suyu
--200306015

CurWharf = 6;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
---------------------------------------------------------------
function main(sel)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>D­¬ng Ch©u chóng ta cã mét con suèi, nhiÒu s«ng, nhiÒu cÇu, nhiÒu thuyÒn. Nh÷ng ng­êi giµu cã th× sÏ ®ãn thuyÒn ®i du ngo¹n D­¬ng Ch©u, dùa vµo c¸c thuyÒn phu cña chóng ta"
	tbDailog:AddOptEntry("Ngåi thuyÒn", WharfFun)
	tbDailog:AddOptEntry("Kh«ng ngåi", OnCancel)
	if GetLevel() >= 50 then
		tbDailog:AddOptEntry("§i §µo Hoa §¶o (2) [ "..AEXP_TICKET.." l­îng]", go_thd)
	end
	tbDailog:AddOptEntry("Khëi ®éng nhiÖm vô 15x ®i NguyÖt Ca §¶o", start_task_15)
	-- G_TASK:OnMessage("NguyÖt Ca §¶o", tbDailog, "DialogWithNpc")
	if check_showdialog_condition() then
		tbDailog:AddOptEntry("§­a ta ®Õn NguyÖt Ca §¶o", goto_yuegedao)
	end
	tbDailog:Show()
end;

function start_task_15()
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
		[10]=1,
		[11]=1,
	}
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or nFact > 11 then
		Talk(1, "", "CÇn ph¶i gia nhËp ph¸i tr­íc.")
		return
	elseif CalcItemCount(3, 6, 1, 2908, -1) >= 1 then
		Msg2Player("Ng­¬i ®· cã NguyÖt Ca LÖnh råi.")
		return
	else
		SetTask(2885, tbFactStepList[nFact])
		tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2908,1,0,0}, nBindState=-2}, "test", 1)
		Msg2Player("NhËn ®­îc <color=yellow>NguyÖt Ca LÖnh.") 
	end
end

function check_showdialog_condition()
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
		[10]=1,
		[11]=1,
	}
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or nFact > 11 then
		return
	end
	local nFactStep = mod(GetTask(2885), 100)
	if nFactStep >= tbFactStepList[nFact] then
		return 1
	end
	return
end

function goto_yuegedao()
	if CalcItemCount(3, 6, 1, 2908, -1) <= 0 then
		Msg2Player("Ng­¬i kh«ng cã <color=yellow>NguyÖt Ca LÖnh")
		return
	end
	local task15xvalue = GetTask(2885)
	if task15xvalue < 100 then
		SetTask(2885, task15xvalue + 100)
		Msg2Player("B¾t ®Çu nhiÖm vô ®i <color=yellow>NguyÖt Ca ®¶o")
	end
	NewWorld(968, 1436, 3179)
end
---------------------------------------------------------------
function  OnCancel()

   Say("Kh«ng cã tiÒn ngåi thuyÒn th× ng­¬i ®i bé vËy! ",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(236);
	-- if (nRet == 1) then
	--	Msg2Player("´¬·ò£º×î½üÈ¥ÌÒ»¨µºµÄÈË¿ÉÕæ¶à¡£ºÃ°É£¬Äã×øºÃà¶£¡")
	if (nRet == -1) then
		Talk(1,"","PhÝ ®i thuyÒn ®Õn §µo Hoa §¶o "..AEXP_TICKET.."L­îng, ng­¬i cã ®ñ kh«ng? ")
	end
end
---------------------------------------------------------------

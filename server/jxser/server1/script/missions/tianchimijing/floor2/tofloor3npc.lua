Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")
--Bonus award - Modified By DinhHQ - 20120405
Include("\\script\\missions\\tianchimijing\\vnextaward.lua")
function main()
		local nNpcIndex = GetLastDiagNpc()
		local szNpcName = GetNpcName(nNpcIndex)
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc> TiÓu hiÖp kh«ng ngê ng­¬i l¹i cã thÓ v­ît ®­îc ®Õn n¬i nµy, ®©y lµ tÇng 2 cña Thiªn Tr× MËt C¶nh, ta cã thÓ gióp ng­¬i ®i vµo MËt C¶nh tÇng 3, cã ®iÒu ng­¬i ph¶i cÈn thËn nhÐ, MËt C¶nh tÇng 3 v« cïng nguy hiÓm."
		G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
		tinsert(tbDailog, {"Giíi thiÖu quy t¾c ®i vµo Thiªn Tr× MËt C¶nh tÇng 3", Realize})
		tinsert(tbDailog, {"Ta muèn ®i Thiªn Tr× MËt C¶nh tÇng 3", ToFloor3})
		----Bonus award - Modified By DinhHQ - 20120405		
		tinsert(tbDailog, {"Ta muèn nhËn phÇn th­ëng v­ît qua tÇng 2", tbVnExtAward.ToFloor3GetAward, {tbVnExtAward}})
		tinsert(tbDailog, {"Thiªn Tr× MËt C¶nh ®¸ng sî qu¸, ta muèn rêi khái Thiªn Tr× MËt C¶nh", LeaveMijing})
		tinsert(tbDailog, {"KÕt thóc ®èi tho¹i"})
		CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function Realize()
	local tbOpt = {}
	local szTitle = ""
	szTitle = "<#><npc> Bªn trong MËt C¶nh tÇng 3 cÊt giÊu rÊt nhiÒu kho b¸u, tiÓu hiÖp ng­¬i tèt nhÊt nªn t×m vµi ng­êi cïng tæ ®éi víi ng­¬i ®i vµo MËt C¶nh tÇng 3, bªn trong MËt C¶nh tÇng 3 cã 10 gian MËt Phßng, ta cã thÓ ®­a ng­¬i vµo mét gian MËt Phßng tïy ý, nÕu ng­¬i ®ang ë trong tr¹ng th¸i tæ ®éi, ta sÏ ®­a ng­¬i vµ tæ ®éi cña ng­¬i cïng nhau vµo 1 trong nh÷ng MËt Phßng ®ã. Trong MËt Phßng kh«ng cho phÐp më <CÈm Nang Håi Thiªn T¸i T¹o> vµ nh÷ng lo¹i tói thuèc kh¸c, hiÖu qu¶ ®Æc biÖt cña Tiªn Th¶o Lé vµ nh÷ng ®¹o cô t¨ng kinh nghiÖm còng v« hiÖu."
	tinsert(tbOpt, {"Trë vÒ", main})
  CreateNewSayEx(szTitle, tbOpt)
end

function ToFloor3()
	local nTeamSize = GetTeamSize()
	if (nTeamSize ~= 0 ) then
		if (IsCaptain() ~= 1) then
			Msg2Player("Ng­¬i kh«ng ph¶i ®éi tr­ëng")
			return 0
		else 
			local szMsg = ""
			local _, _, nMapId = GetPos()
			local bInSameMap = 1
			for i = 1, nTeamSize do
				local nPlayerIndex = GetTeamMember(i);
				local _, _, nTempMapId = DynamicExecuteByPlayer(nPlayerIndex, "", "GetPos")
				local szName = DynamicExecuteByPlayer(nPlayerIndex, "", "GetName")
				if nTempMapId ~= nMapId then
					szMsg = format("%s\n%sthµnh viªn trong ®éi kh«ng ë gÇn, kh«ng thÓ ®i vµo Thiªn Tr× MËt C¶nh tÇng 3", szMsg, szName)
					bInSameMap = 0
				end
			end
			if bInSameMap == 0 then
				Msg2Player(szMsg)
				return 0
			end
		end
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\tianchimijing\\floor3\\gamefloor3.lua", "GameFloor3:WantEnterMap")
end

function LeaveMijing()
	local szPosPath = "\\settings\\maps\\tianchimijing\\common\\exit.txt"
	local nMapId = 934
	if GetTeamSize() >= 1 then
		LeaveTeam()
	end
	Game:MoveTo(nMapId, szPosPath)
end


Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>¸c Lang Bang lµ mét ®¸m c­êng ®¹o trong ¸c Lang Cèc, do ®ã míi cã tªn lµ ¸c Lang Cèc. Bän ng­êi nµy chuyªn ®i lµm h¹i d©n lµnh, lµm « uÕ thanh danh cña nh÷ng ng­êi trong giang hå, rÊt nhiÒu anh hïng h¶o hín ®Òu muèn trõ h¹i nã. Nh­ng mµ nghe ®ån r»ng ®¸m ng­êi cña ¸c Lang Bang nµy ®ang n¾m gi÷ chiªu thøc thÊt truyÒn ®· l©u cña chèn vâ l©m ®ã lµ Hé ThÓ ThÇn C«ng, nh÷ng lo¹i binh khÝ ®ao kiÕm b×nh th­êng ®Òu kh«ng thÓ ®· th­¬ng ®­îc nã. 30 n¨m tr­íc cã mét ®¹i hiÖp giang hå kú tµi ®· ph¸t minh ra ®­îc “ Cµn Kh«n TÝch LÞch §¬n”, nghe nãi Cµn Kh«n TÝch LÞch §¬n cã uy lùc v« song, nÕu ®¹i hiÖp cã thÓ t×m ®­îc “Cµn Kh«n TÝch LÞch §¬n”. th× ta nghÜ r»ng sÏ dÔ dµng mµ ®èi phã víi Hé ThÓ ThÇn C«ng cña ®¸m ng­êi ¸c Lang Bang nµy, ®Ó tr¶ l¹i cho b¸ t¸nh ®¹i Tèng cuéc sèng yªn b×nh."
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"Ta muèn rêi khái ®©y!", GoToWaiMian})
	tinsert(tbDailog, {"§îi mét l¸t"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function GoToWaiMian()
	local tbMapList = {{11,3183,5180}, {1,1651,3279}, {37,1704,3222}, {176,1695,3294}, 
											{162,1697,3277}, {78,1596,3379}, {80,1718,3201},}
	local nOutPosId = random(1, getn(tbMapList))
	local tbPos = tbMapList[nOutPosId]
 	NewWorld(tbPos[1], tbPos[2], tbPos[3]) 	
end

Include("\\script\\misc\\daiyitoushi\\toushi_head.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_feature\\getskills.lua")

if not tbGMCommand then tbGMCommand = {} end

TB_FACTION_SKILL_150 = 
{
	shaolin =
	{
		{"ThiÕu L©m QuyÒn", 1055},
		{"C«n ThiÕu L©m", 1056},
		{"ThiÕu L©m ®ao", 1057},	
	},
	tianwang =
	{
		{"Chïy Thiªn V­¬ng", 1058},	
		{"Th­¬ng Thiªn V­¬ng", 1059},	
		{"§ao Thiªn V­¬ng", 1060},	
	},
	wudu =
	{	
		{"Ngò §éc ch­ëng",1066},
		{"Ngò §éc ®ao", 1067},	
	},
	tangmen =
	{
		{"§­êng M«n phi ®ao", 1069},
		{"§­êng M«n ná", 1070},	
		{"§­êng M«n tiªu", 1071},
		{"§­êng M«n H·m TÜnh", 1110},
	},
	emei =
	{
		{"Nga Mi kiÕm", 1061},	
		{"Nga Mi ch­ëng", 1062},	
		{"Nga My Buff", 1114},
	},
	cuiyan =
	{
		{"Thóy Yªn ®ao", 1063},	
		{"Thóy  Yªn néi", 1065},	
	},
	gaibang =	
	{
		{"C¸i Bang ch­ëng", 1073},
		{"C¸i Bang c«n", 1074},	
	},
	tianren =	
	{
		{"Thiªn NhÉn chiÕn", 1075},	
		{"Thiªn NhÉn ma", 1076},	
	},
	wudang =
	{
		{"Vâ §ang khÝ", 1078},	
		{"Vâ §ang kiÕm", 1079},	
	},
	kunlun =
	{
		{"§ao C«n L«n", 1080},	
		{"KiÕm C«n L«n", 1081},	
	},
	huashan =
	{
		{"Hoa S¬n KiÕm", 1369},	
		{"Hoa S¬n KhÝ", 1384},	
	}
}

function tbGMCommand:ShowDialogSkill150()
	local tbOpt = {}
	local szTitle = "Xin hái ®¹i hiÖp t×m ta cã viÖc g×?"
	tinsert(tbOpt, "NhËn skill 1x - 12x /#tbGMCommand:GiveAwardSkill2()")
	tinsert(tbOpt, "NhËn skill 150 /#tbGMCommand:GiveAwardSkill()")	
	tinsert(tbOpt, "Hñy Skill 150 /#tbGMCommand:reDuceSkill()")
	tinsert(tbOpt,"Tho¸t/#tbGMCommand:Cancel()")
	Say(szTitle,getn(tbOpt),tbOpt)
end
 
 function tbGMCommand:GiveAwardSkill2()
 	local nFaction = GetLastFactionNumber()
  	if nFaction < 0 then
  		Talk("", 1, "§¹i hiÖp vÉn ch­a nhËp ph¸i kh«ng thÓ nhËn kü n¨ng nµy.")
  		return
  	end
  	ST_LevelUp(200 -  GetLevel())
  	local tbSkill = TB_DAIYITOUSHI_FACTS[nFaction + 1].tbSkillID
  	if not tbSkill then
  		Talk("", 1, "Häc kü n¨ng thÊt b¹i, vui lßng liªn hÖ nhµ ph¸t hµnh ®Ó ®­îc hæ trî")
  		return
  	end
  	
  	for key, val in tbSkill do
	  	if key ~= 150 and key ~= "150" then	
	  		--print("==key "..key)
	  		for i = 1, getn(val) do
	  			if type(val[i]) == "table" then
	  				--print("val "..val[i][1])
	  				AddMagic(val[i][1], 20)
	  			elseif key < 90 then
	  				--print("val "..val[i])
	  				AddMagic(val[i], 20)
	  			elseif key >=  90 then
	  				--print("val "..val[i])
	  				AddMagic(val[i], 20)
	  			end
	  			--AddMagic(val[i], 20)	  			
	  		end
	  	end	 	
  	end
  	Msg2Player("NhËn skill m«n ph¸i thµnh c«ng")
  	
  	local szFaction = GetFaction()
  	%SetAllTasks(szFaction)
  	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)--xuÊt s­ ch÷ ®á
 end
 
 function tbGMCommand:GiveAwardSkill()
 	if (GetLastFactionNumber() == -1) then
		Talk(1,"","§¹i hiÖp ch­a gia nhËp m«n ph¸i")
		return 
	end
	if (ST_GetTransLifeCount() < 2 ) then
		Talk(1,"","§¹i hiÖp ph¶i trïng sinh lÇn 2 míi ®­îc nhËn skill 150")
		return
	end
	if (PlayerFunLib:CheckLevel(150,"default",">=") ~= 1) then
		return
	end
 	--AskClientForNumber("GiveAwardSkill150",1,25,"NhËp cÊp ®é skill 150  tõ 1 ®Õn 25")
 	GiveAwardSkill150(21)
 end
 
function GiveAwardSkill150(nCount)
	if (nCount <= 0 or nCount > 25) then
		return
	end
	local szFaction = GetLastAddFaction()
	local tbFactionSkill = TB_FACTION_SKILL_150[szFaction]
	if (getn(tbFactionSkill) > 0) then
		for i = 1, getn(tbFactionSkill) do
			AddMagic(tbFactionSkill[i][2], nCount)
		end
	end
	Msg2Player("NhËn skill 150 m«n ph¸i thµnh c«ng")
  	
end

function tbGMCommand:reDuceSkill()
 	local  nRet = 0
 	local szFaction = GetLastAddFaction()
	local tbFactionSkill = TB_FACTION_SKILL_150[szFaction]
	if (getn(tbFactionSkill) > 0) then
		for i = 1, getn(tbFactionSkill) do
			if(HaveMagic(tbFactionSkill[i][2])) then
				DelMagic(tbFactionSkill[i][2])
			end
		end
	else
		Msg2Player("§¹i hiÖp Kh«ng cã skill 150")
	end
	UpdateSkill()
	if nRet == 1 then 	Msg2Player("§· hñy thµnh c«ng Skill 150") 	end
 end

